#!/bin/bash
# Author: KT007007
# github: https://github.com/kt007007

DOWNLOAD_HOST=""

AMD64_HOST="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/KENC/kenc_linux_amd64"

ARM64_HOST="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/KENC/kenc_linux_arm64"

ARM386_HOST="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/KENC/kenc_arm386"

PATH_KENC="/root/kenc"

PATH_EXEC="kenc"

CUR_PATH=$(cd "$(dirname "$0")"; pwd)

TASK_COMMAND="nohup ${PATH_KENC}/${PATH_EXEC} &"

CRONTAB_TASK="@reboot ${TASK_COMMAND}"

CRONTAB_BAK_FILE="${CUR_PATH}/crontab_bak"

#######color code########
RED="31m"
GREEN="32m"
YELLOW="33m"
BLUE="36m"
FUCHSIA="35m"

colorEcho(){
    COLOR=$1
    echo -e "\033[${COLOR}${@:2}\033[0m"
}

checkProcess() {
    COUNT=$(ps -ef |grep $1 |grep -v "grep" |wc -l)
    if [ $COUNT -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

uninstall() {
    stop

    rm -rf ${PATH_KENC}

    turn_off

    colorEcho $GREEN "卸载完成"
}

filterResult() {
    if [ $1 -eq 0 ]; then
        echo ""
    else
        colorEcho ${RED} "【${2}】失败。"
	
        if [ ! $3 ];then
            colorEcho ${RED} "!!!!!!!!!!!!!!!ERROR!!!!!!!!!!!!!!!!"
            exit 1
        fi
    fi
    echo -e
}

turn_on() { 
    echo '设置开机启动...'
    crontab -l > ${CRONTAB_BAK_FILE} 2>/dev/null
    sed -i "/.*${TASK_COMMAND}/d" ${CRONTAB_BAK_FILE} 
    echo "${CRONTAB_TASK}" >> ${CRONTAB_BAK_FILE}
    crontab ${CRONTAB_BAK_FILE}
    
    echo '开机启动设置完毕'
}

turn_off() {
    echo 'Delete crontab task...'
    crontab -l > ${CRONTAB_BAK_FILE} 2>/dev/null
    sed -i "/.*${SCRIPT_NAME}/d" ${CRONTAB_BAK_FILE}
    crontab ${CRONTAB_BAK_FILE}
    
    echo 'Complete'
}

[ $(id -u) != "0" ] && { colorEcho ${RED} "请使用root用户执行此脚本."; exit 1; }

installapp() {
    checkProcess "kenc"
    if [ $? -eq 1 ]; then
        colorEcho ${RED} "发现正在运行的KENC, 需要停止才可继续安装。"
        colorEcho ${YELLOW} "输入1停止正在运行的KENC并且继续安装, 输入2取消安装。"

        read -p "$(echo -e "请选择[1-2]：")" choose
        case $choose in
        1)
            stop
            ;;
        2)
            echo "取消安装"
            return
            ;;
        *)
            echo "输入错误, 取消安装。"
            return
            ;;
        esac
    fi

    colorEcho $BLUE "创建目录"
    
    if [[ ! -d $PATH_KENC ]];then
        mkdir $PATH_KENC
        chmod 777 -R $PATH_KENC
    else
        colorEcho $YELLOW "目录已存在, 无需重复创建, 继续执行安装。"
    fi

    colorEcho $BLUE "拉取程序"

    wget -P $PATH_KENC "${DOWNLOAD_HOST}" -O "${PATH_KENC}/${PATH_EXEC}" 1>/dev/null

    filterResult $? "拉取程序 ${DOWNLOAD_HOST}"

    chmod 777 -R "${PATH_KENC}/${PATH_EXEC}"

    change_limit

    turn_on

    start
}

start() {
    colorEcho $BLUE "启动程序..."
    checkProcess "kenc"
    if [ $? -eq 1 ]; then
        colorEcho ${RED} "程序已经启动，请不要重复启动。"
        return
    else
        # 要先cd进去 否则nohup日志会产生在当前路径
        cd $PATH_KENC
        filterResult $? "打开目录"

        nohup "${PATH_KENC}/${PATH_EXEC}" &

        filterResult $? "启动程序"

        colorEcho $GREEN "|----------------------------------------------------------------|"
        colorEcho $GREEN "程序启动成功, WEB访问端口3101"
        colorEcho $GREEN "|----------------------------------------------------------------|"
    fi
}

stop() {
    colorEcho $GREEN "停止运行kenc"
    kill -9 $(pidof kenc)
}

restart() {
    stop

    sleep 1

    start
}

change_limit(){
    colorEcho $BLUE "修改系统最大连接数"

    changeLimit="n"

    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 65535" >>/etc/security/limits.conf
        echo "* soft nofile 65535" >>/etc/security/limits.conf
        changeLimit="y"
    fi

    if [ $(grep -c "root hard nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root hard nofile 65535" >>/etc/security/limits.conf
        echo "* hard nofile 65535" >>/etc/security/limits.conf
        changeLimit="y"
    fi

    if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/user.conf) -eq '0' ]; then
        echo "DefaultLimitNOFILE=65535" >>/etc/systemd/user.conf
        changeLimit="y"
    fi

    if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/system.conf) -eq '0' ]; then
        echo "DefaultLimitNOFILE=65535" >>/etc/systemd/system.conf
        changeLimit="y"
    fi

    if [[ "$changeLimit" = "y" ]]; then
        echo "连接数限制已修改为65535,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

echo "-------------------------------------------------------"
colorEcho ${GREEN} "欢迎使用KENC安装工具, 请输入操作号继续。"

echo ""
echo "1、安装KENC(amd64)"
echo "2、安装KENC(arm64)"
echo "3、安装KENC(386)"
echo "4、重启KENC"
echo "5、停止KENC"
echo "6、卸载KENC"
echo "7、设置开机启动"
echo "8、关闭开机启动"
echo ""
colorEcho ${YELLOW} "如果在此之前是手动安装的程序，请自己手动退出程序后再执行此脚本，否则容易发生冲突，所有操作尽量通过此脚本完成。"
echo "-------------------------------------------------------"

read -p "$(echo -e "请选择[1-3]：")" choose

case $choose in
1)
    DOWNLOAD_HOST=$AMD64_HOST
    installapp "amd64"
    ;;
2)
    DOWNLOAD_HOST=$ARM64_HOST
    installapp "arm64"
    ;;
3)
    DOWNLOAD_HOST=$ARM386_HOST
    installapp "386"
    ;;
4)
    restart
    ;;
5)
    stop
    ;;
6)
    uninstall
    ;;
7)
    turn_on
    ;;
8)
    turn_off
    ;;
*)
    echo "输入了错误的指令, 请重新输入。"
    ;;
esac