#!/bin/bash
# Author: KT007007
# github: https://github.com/kt007007

VERSION="2.8.2"

DOWNLOAD_HOST="https://github.com/kt007007/KTMinerProxy/raw/main/Linux-64"

DOWNLOAD_STANDBY="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/Linux-64"

PATH_KT="/root/ktmproxy"

PATH_EXEC="ktproxy"

PATH_CACHE="/root/ktmproxy/.cache"

PATH_LICENSE="/root/ktmproxy/license"

PATH_CONFIG="/root/ktmproxy/.env"

PATH_NOHUP="/root/ktmproxy/nohup.out"
PATH_ERR="/root/ktmproxy/err.log"


PATH_TURN_ON="/etc/profile.d"
PATH_TURN_ON_SH="/etc/profile.d/ktm.sh"

ISSUE() {
    echo "1.0.0"
    echo "1.1.0"
    echo "1.1.1"
    echo "1.1.2"
    echo "1.1.3"
    echo "1.1.4"
    echo "1.1.5"
    echo "2.0.0"
    echo "2.0.1"
    echo "2.1.0"
    echo "2.1.1"
    echo "2.2.0"
    echo "2.2.1"
    echo "2.2.2"
    echo "2.2.3"
    echo "2.2.4"
    echo "2.2.5"
    echo "2.2.6"
    echo "2.2.7"
    echo "2.3.0"
    echo "2.3.1"
    echo "2.3.2"
    echo "2.3.3"
    echo "2.4.0"
    echo "2.4.1"
    echo "2.4.2"
    echo "2.4.3"
    echo "2.5.0"
    echo "2.5.1"
    echo "2.5.2"
    echo "2.5.3"
    echo "2.5.4"
    echo "2.5.5"
    echo "2.5.6"
    echo "2.5.7"
    echo "2.5.8"
    echo "2.5.9"
    echo "2.6.0"
    echo "2.6.1"
    echo "2.6.2"
    echo "2.6.3"
    echo "2.6.4"
    echo "2.6.5"
    echo "2.6.6"
    echo "2.6.7"
    echo "2.6.8"
    echo "2.6.9"
    echo "2.7.0"
    echo "2.7.1"
    echo "2.7.2"
    echo "2.7.3"
    echo "2.7.4"
    echo "2.7.5"
    echo "2.7.6"
    echo "2.7.7"
    echo "2.7.8"
    echo "2.7.9"
}

colorEcho(){
    COLOR=$1
    echo -e "\033[${COLOR}${@:2}\033[0m"
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

getConfig() {
    value=$(sed -n 's/^[[:space:]]*'$1'[[:space:]]*=[[:space:]]*\(.*[^[:space:]]\)\([[:space:]]*\)$/\1/p' $PATH_CONFIG)
    echo $value
}

setConfig() {
    if [ ! -f "$PATH_CONFIG" ]; then
        echo "未发现环境变量配置文件, 创建.env"
        
        touch $PATH_CONFIG

        chmod -R 777 $PATH_CONFIG

        echo "KT_START_PORT=16777" >> $PATH_CONFIG
    fi

    TARGET_VALUE="$1=$2"

    line=$(sed -n '/'$1'/=' ${PATH_CONFIG})

    sed -i "${line} a $TARGET_VALUE" $PATH_CONFIG

    sed  -i  "$line d" $PATH_CONFIG

    colorEcho ${GREEN} "$1已修改为$2"
}

#检查是否为Root
[ $(id -u) != "0" ] && { colorEcho ${RED} "请使用root用户执行此脚本."; exit 1; }

PACKAGE_MANAGER="apt-get"
PACKAGE_PURGE="apt-get purge"

#######color code########
RED="31m"
GREEN="32m"
YELLOW="33m"
BLUE="36m"
FUCHSIA="35m"

if [[ `command -v apt-get` ]];then
    PACKAGE_MANAGER='apt-get'
elif [[ `command -v dnf` ]];then
    PACKAGE_MANAGER='dnf'
elif [[ `command -v yum` ]];then
    PACKAGE_MANAGER='yum'
    PACKAGE_PURGE="yum remove"
else
    colorEcho $RED "不支持的操作系统."
    exit 1
fi

checkProcess() {
    COUNT=$(ps -ef |grep $1 |grep -v "grep" |wc -l)

    if [ $COUNT -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

clearlog() {
    echo "清理日志"
    rm $PATH_NOHUP > /dev/null 2>&1
    rm $PATH_ERR > /dev/null 2>&1
    echo "清理完成"
}

stop() {
    colorEcho $BLUE "终止KTMinerProxy进程"
    killall ktproxy
    sleep 1
}

uninstall() {    
    stop

    rm -rf ${PATH_KT}

    turn_off

    colorEcho $GREEN "卸载完成"
}

start() {
    colorEcho $BLUE "启动程序..."
    checkProcess "ktproxy"
    if [ $? -eq 1 ]; then
        colorEcho ${RED} "程序已经启动，请不要重复启动。"
        return
    else
        # 要先cd进去 否则nohup日志会产生在当前路径
        cd $PATH_KT
        filterResult $? "打开目录"

        clearlog

        nohup "${PATH_KT}/${PATH_EXEC}" 2>err.log &
        # nohup "${PATH_KT}/${PATH_EXEC}" >/dev/null 2>log &
        filterResult $? "启动程序"

        # getConfig "KT_START_PORT"
        port=$(getConfig "KT_START_PORT")

        colorEcho $GREEN "|----------------------------------------------------------------|"
        colorEcho $GREEN "程序启动成功, WEB访问端口${port}, 默认账号admin, 默认密码admin123。"
        colorEcho $GREEN "如果您是默认密码及默认端口, 请及时在网页设置中修改账号密码及web访问端口。"
        colorEcho $GREEN "|----------------------------------------------------------------|"
    fi
}

update() {
    turn_off

    installapp 2.8.2
}

turn_on() {
    
    if [ ! -f "$PATH_TURN_ON_SH" ];then

        touch $PATH_TURN_ON_SH

        chmod 777 -R $PATH_KT
        chmod 777 -R $PATH_TURN_ON

        echo 'COUNT=$(ps -ef |grep '$PATH_EXEC' |grep -v "grep" |wc -l)' >> $PATH_TURN_ON_SH

        echo 'if [ $COUNT -eq 0 ] && [ $(id -u) -eq 0 ]; then' >> $PATH_TURN_ON_SH
        echo "  cd ${PATH_KT}" >> $PATH_TURN_ON_SH
        echo "  nohup "${PATH_KT}/${PATH_EXEC}" 2>err.log &" >> $PATH_TURN_ON_SH
        echo '  echo "KTProxy已启动"' >> $PATH_TURN_ON_SH
        echo 'else' >> $PATH_TURN_ON_SH
        echo '  if [ $COUNT -ne 0 ]; then' >> $PATH_TURN_ON_SH
        echo '      echo "KTProxy已启动, 无需重复启动"' >> $PATH_TURN_ON_SH
        echo '  elif [ $(id -u) -ne 0 ]; then' >> $PATH_TURN_ON_SH
        echo '      echo "使用ROOT用户登录才能启动KTPROXY"' >> $PATH_TURN_ON_SH
        echo '  fi' >> $PATH_TURN_ON_SH
        echo 'fi' >> $PATH_TURN_ON_SH

        echo "已设置开机启动"
    else
        echo "已设置开机启动, 无需重复设置"
    fi
}

turn_off() {
    rm $PATH_TURN_ON_SH
    echo "已关闭开机启动"
}

installapp() {
    if [ -n "$1" ]; then
        VERSION="$1"
    fi
    
    colorEcho ${GREEN} "开始安装KTPROXY-V-${VERSION}"

    if [[ `command -v yum` ]];then
        colorEcho ${BLUE} "关闭防火墙"
        systemctl stop firewalld.service 1>/dev/null
        systemctl disable firewalld.service 1>/dev/null
    fi

    colorEcho $BLUE "请选择下载线路1或2"
    read -p "$(echo -e "请选择[1-2]：")" choose
    case $choose in
    2)
        echo "已选择备用线路"
        DOWNLOAD_HOST=$DOWNLOAD_STANDBY
    ;;
    esac
    

    colorEcho $BLUE "是否更新LINUX软件源？如果您的LINUX更新过可输入2跳过并继续安装，如果您不了解用途直接输入1。"
    read -p "$(echo -e "请选择[1-2]：")" choose
    case $choose in
    1)
        colorEcho ${BLUE} "开始更新软件源..."
        $PACKAGE_MANAGER update -y
    ;;
    esac
    
    if [[ ! `command -v curl` ]];then 
        echo "尚未安装CURL, 开始安装"
        $PACKAGE_MANAGER install curl
    fi

    if [[ ! `command -v wget` ]];then
        echo "尚未安装wget, 开始安装"
        $PACKAGE_MANAGER install wget
    fi

    if [[ ! `command -v killall` ]];then
        echo "尚未安装killall, 开始安装"
        $PACKAGE_MANAGER install psmisc
    fi

    if [[ ! `command -v killall` ]];then
        colorEcho ${RED} "安装killall失败！！！！请手动安装psmisc后再执行安装程序。"
        return
    fi

    checkProcess "ktproxy"
    if [ $? -eq 1 ]; then
        colorEcho ${RED} "发现正在运行的KTMinerProxy, 需要停止才可继续安装。"
        colorEcho ${YELLOW} "输入1停止正在运行的KTMinerProxy并且继续安装, 输入2取消安装。"

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
    
    if [[ ! -d $PATH_KT ]];then
        mkdir $PATH_KT
        chmod 777 -R $PATH_KT
    else
        colorEcho $YELLOW "目录已存在, 无需重复创建, 继续执行安装。"
    fi

    if [[ ! -d $PATH_NOHUP ]];then
        touch $PATH_NOHUP
        touch $PATH_ERR

        chmod 777 -R $PATH_NOHUP
        chmod 777 -R $PATH_ERR
    fi

    if [[ ! -f $PATH_CONFIG ]];then
        setConfig KT_START_PORT $((RANDOM%65535+1))
    fi

    colorEcho $BLUE "拉取程序"
    # wget -P $PATH_KT "${DOWNLOAD_HOST}/${ORIGIN_EXEC}" -O "${PATH_KT}/${PATH_EXEC}" 1>/dev/null
    wget -P $PATH_KT "${DOWNLOAD_HOST}/ktproxy_v${VERSION}_linux" -O "${PATH_KT}/${PATH_EXEC}" 1>/dev/null

    filterResult $? "拉取程序 ktproxy_v${VERSION}_linux"

    chmod 777 -R "${PATH_KT}/${PATH_EXEC}"

    turn_on

    change_limit

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

check_limit() {
    echo "当前系统连接数：" 
    ulimit -n
}

check_hub() {
    # cd $PATH_KT
    colorEcho ${YELLOW} "按住CTRL+C后台运行"
    tail -f /root/ktmproxy/nohup.out
}

check_err() {
    colorEcho ${YELLOW} "按住CTRL+C后台运行"
    tail -f /root/ktmproxy/err.log
}

install_target() {
    echo "输入已发布的版本来进行安装："
    echo ""
    ISSUE
    echo ""
    read -p "$(echo -e "请输入版本号：")" choose

    installapp $choose
}

restart() {
    stop

    start
}

set_port() {
    read -p "$(echo -e "请输入要设置的端口号：")" choose

    setConfig KT_START_PORT $choose

    stop

    start
}

resetpass() {
    stop

    rm -rf $PATH_LICENSE

    start

    echo "重置密码完成, 已修改为默认账号密码 admin admin123"
}

lookport() {
    port=$(getConfig "KT_START_PORT")

    colorEcho $GREEN "当前WEB访问端口${port}"
}

echo "-------------------------------------------------------"
colorEcho ${GREEN} "欢迎使用KTMinerProxy安装工具, 请输入操作号继续。"

echo ""
echo "1、安装"
echo "2、更新"
echo "3、还是更新"
echo "4、启动"
echo "5、重启"
echo "6、停止"
echo "7、修改启动端口"
echo "8、解除linux系统连接数限制(需要重启服务器生效)"
echo "9、查看当前系统连接数限制"
echo "10、设置开机启动"
echo "11、关闭开机启动"
echo "12、查看程序运行状态"
echo "13、查看程序错误日志"
echo "14、安装指定版本（通常不需要这个选项来安装）"
echo "15、清理日志文件"
echo "16、查看当前WEB服务端口"
echo "17、卸载"
echo "18、重置密码"
echo ""
colorEcho ${YELLOW} "如果在此之前是手动安装的程序，请自己手动退出程序后再执行此脚本，否则容易发生冲突，所有操作尽量通过此脚本完成。"
echo "-------------------------------------------------------"

read -p "$(echo -e "请选择[1-18]：")" choose

case $choose in
1)
    installapp 2.8.2
    ;;
2)
    update
    ;;
3)
    update
    ;;
4)
    start
    ;;
5)
    restart
    ;;
6)
    stop
    ;;
7)
    set_port
    ;;
8)
    change_limit
    ;;
9)
    check_limit
    ;;
10)
    turn_on
    ;;
11)
    turn_off
    ;;
12)
    check_hub
    ;;
13)
    check_err
    ;;
14)
    install_target
    ;;
15)
    clearlog
    ;;
16)
    lookport
    ;;
17)
    uninstall
    ;;
18)
    resetpass
    ;;
*)
    echo "输入了错误的指令, 请重新输入。"
    ;;
esac