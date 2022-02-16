#!/bin/bash
VERSION="0.0.4"
TAR_URL="https://github.com/kt007007/KTMinerProxy-Linux/blob/master/KT-v${version}-LINUX.tar.gz?raw=true"
DEFEND_PATH="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/defend.sh"
KT_PATH="/root/kt_proxy"
KT_TAR_NAME="KT-v${VERSION}-LINUX.tar.gz"
EXEC_NAME="ktproxy_v${VERSION}_linux"

cmd="apt-get"
uncmd="apt-get purge"

message() {
    echo "====================${1}"
    echo -e 
}

filterResult() {
    if [ $1 -eq 0 ]; then
        echo "【${2}】成功。"
    else
        echo "【${2}】失败。"
	
        if [ ! $3 ];then
            echo "!!!!!!!!!!!!!!!安装失败!!!!!!!!!!!!!!!!"
            exit 1
        fi
    fi

    echo -e
}


if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]];
then
    if [[ $(command -v yum) ]]; 
    then
        cmd="yum"
	uncmd="yum remove"
    fi
else
    echo "软件不支持此系统"
fi

install() {
    disOldVersion
    
    if screen -list | grep -q "KTProxy"; then
        screen -X -S KTProxy quit
    fi
    
    message "开始安装"

    if [ $cmd == 'yum' ];then
	message "禁用centos防火墙"	
	systemctl stop firewalld
        filterResult $? "禁用centos防火墙" 1

        message "停止防火墙centos开机启动"
	systemctl disable firewalld
        filterResult $? "停止防火墙centos开机启动" 1
    fi
    
    message "开始更新软件源, 这个过程可能需要几分钟到十几分钟不等，如果太久没有完成，请更换国内源"
    $cmd update -y
    filterResult $? "更新软件源"

    message "安装CURL WGET "
    $cmd install curl wget -y 1>/dev/null
    filterResult $? "安装CURL WGET"

    message "安装python-setuptools"
    $cmd install python-setuptools -y 1>/dev/null
    filterResult $? "安装python-setuptools"
    
    message "安装SCREEN"
    $cmd install screen -y
    filterResult $? "安装SCREEN"
    
    message "创建目录"
    mkdir /root/kt_proxy 1>/dev/null
    chmod 777 /root/kt_proxy 1>/dev/null
    filterResult $? "创建目录"
    
    message "拉取文件"
    cd ${KT_PATH}
    wget -P $KT_PATH $TAR_URL --no-check-certificate 1>/dev/null
    chmod 777 "${KT_PATH}/${KT_TAR_NAME}" 1>/dev/null
    tar -zxvf "${KT_PATH}/${KT_TAR_NAME}" -C "${KT_PATH}" 1>/dev/null
    chmod 777 "${KT_PATH}/${EXEC_NAME}" 1>/dev/null
    rm "${KT_PATH}/${KT_TAR_NAME}"
    if [ -f "${KT_PATH}/defend.sh" ];then
    	rm ${KT_PATH}/defend.sh
    fi
    wget -P $KT_PATH $DEFEND_PATH --no-check-certificate 1>/dev/null
    chmod 777 ${KT_PATH}/defend.sh
    filterResult $? "拉取文件"
    
    echo "正在启动......"
    screen -dmS KTProxy
    sleep 0.2s
    screen -r KTProxy -p 0 -X stuff "cd /root/kt_proxy"
    screen -r KTProxy -p 0 -X stuff $'\n'
    screen -r KTProxy -p 0 -X stuff "/root/kt_proxy/defend.sh"
    screen -r KTProxy -p 0 -X stuff $'\n'
    sleep 1
    echo "启动成功, web默认访问端口为6001，默认账号admin, 默认密码admin123"
    echo "输入screen -r KTProxy查看程序输出"
}

uninstall() {
    screen -X -S KTProxy quit
    
    message "开始卸载"
    rm -rf $KT_PATH 1>/dev/null
    filterResult $? "卸载"
    
}

update() {
    install
}

start() {
    if screen -list | grep -q "KTProxy"; then
        echo "服务已启动，请不要重复启动"
        exit 1
    fi
    
    echo "正在启动......"
    screen -dmS KTProxy
    sleep 0.2s
    screen -r KTProxy -p 0 -X stuff "cd /root/kt_proxy"
    screen -r KTProxy -p 0 -X stuff $'\n'
    screen -r KTProxy -p 0 -X stuff "/root/kt_proxy/defend.sh"
    screen -r KTProxy -p 0 -X stuff $'\n'
    sleep 1
    echo "启动成功, web默认访问端口为6001，默认账号admin, 默认密码admin123"
    echo "输入screen -r KTProxy查看程序输出"
}

stop() {
    if screen -list | grep -q "KTProxy"; then
        screen -X -S KTProxy quit
    fi
    
    echo "已停止服务"
}

restart() {
    if screen -list | grep -q "KTProxy"; then
        screen -X -S KTProxy quit
    fi
    
    echo "正在启动......"
    screen -dmS KTProxy
    sleep 0.2s
    screen -r KTProxy -p 0 -X stuff "cd /root/kt_proxy"
    screen -r KTProxy -p 0 -X stuff $'\n'
    screen -r KTProxy -p 0 -X stuff "/root/kt_proxy/defend.sh"
    screen -r KTProxy -p 0 -X stuff $'\n'
    sleep 1
    
    echo "重启成功"
}

# 旧版本处理
disOldVersion() {
    message "处理旧版本"

    # 如果是存在superisor版本，删除对应的配置文件并禁止
    if [ -d "/root/kt_proxy" -a -d "/root/kt_proxy/supervisor" ];then
        echo "卸载旧版本"
        
    	message "关闭SUPERVISORD进程"
    	killall supervisord 1>/dev/null
    	filterResult $? "关闭SUPERVISORD进程" 1
    	sleep 3

    	message "卸载SUPERVISORD"
    	$uncmd supervisor -y 1>/dev/null
    	filterResult $? "卸载SUPERVISORD" 1

    	message "删除目录"
    	rm -rf /root/kt_proxy/supervisor 1>/dev/null
    	filterResult $? "删除目录" 1
    fi
    
    message "旧版本处理完毕"
}

if [ $1 ];then
    if [ $1 == "-uninstall" ];then
        uninstall
    elif [ $1 == '-update' ];then
        update
    elif [ $1 == '-restart' ];then
        restart
    elif [ $1 == '-stop' ];then
        stop
    elif [ $1 == '-start' ];then
        start
    elif [ $1 == '-cn' ];then
        TAR_URL="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy-Linux@latest/KT-v${VERSION}-LINUX.tar.gz"
        DEFEND_PATH="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@latest/defend.sh"
        install
    fi
else
    install
fi
