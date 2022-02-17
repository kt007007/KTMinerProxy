#!/bin/bash
VERSION="0.0.497"
TAR_URL="https://github.com/kt007007/KTMinerProxy-Linux/blob/master/KT-v${VERSION}-LINUX.tar.gz"
SUPERVISOR_PATH="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/supervisord.conf"
SUPERVISOR_D_PATH="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/ktproxy.conf"
KT_PATH="/root/kt_proxy"
KT_TAR_NAME="KT-v${VERSION}-LINUX.tar.gz"
EXEC_NAME="ktproxy_v${VERSION}_linux"
SUPERVISOR_CONFIG="/root/kt_proxy/supervisord.conf"

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

        message "安装epel"
        $cmd install epel-release
    fi
else
    echo "软件不支持此系统"
fi

message "VERSION-${VERSION}"

install() {
    uninstall
    
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
    
    message "安装supervisor"
    $cmd install supervisor -y 1>/dev/null
    filterResult $? "安装supervisor"
    
    message "创建目录"
    mkdir /root/kt_proxy 1>/dev/null
    chmod 777 /root/kt_proxy 1>/dev/null
    filterResult $? "创建目录"
    
    message "拉取文件"
    cd ${KT_PATH}
    wget -P $KT_PATH $TAR_URL --no-check-certificate 1>/dev/null
    filterResult $? "拉取文件"
    chmod 777 "${KT_PATH}/${KT_TAR_NAME}" 1>/dev/null
    
    message "解压文件"
    tar -xf "${KT_PATH}/${KT_TAR_NAME}" -C "${KT_PATH}" 1>/dev/null
    filterResult $? "解压文件"
    chmod 777 "${KT_PATH}/${EXEC_NAME}" 1>/dev/null
    rm "${KT_PATH}/${KT_TAR_NAME}"
    if [ -f "${KT_PATH}/defend.sh" ];then
    	rm ${KT_PATH}/defend.sh
    fi

    message "拉取文件"
    wget -P $KT_PATH $SUPERVISOR_PATH --no-check-certificate 1>/dev/null
    filterResult $? "拉取supervisord.conf"
    wget -P $KT_PATH $SUPERVISOR_D_PATH --no-check-certificate 1>/dev/null
    filterResult $? "拉取ktproxy.conf"
    chmod 777 ${KT_PATH}/ktproxy.conf
    chmod 777 ${KT_PATH}/supervisord.conf
    
    message "创建log"
    
    touch $KT_PATH/stderr.log
    touch $KT_PATH/stdout.log

    message "启动中..."
    
    supervisorctl -c $SUPERVISOR_CONFIG update
    sleep 1
    supervisorctl -c $SUPERVISOR_CONFIG start ktproxy
    sleep 3
    supervisorctl -c $SUPERVISOR_CONFIG status
    echo "启动成功, web默认访问端口为6001，默认账号admin, 默认密码admin123"
}

uninstall() {    
    message "处理旧版本"

    stop

    message "卸载supervisor"
    $uncmd supervisor -y
    filterResult $? "卸载supervisor" 1
    
    if screen -list | grep -q "KTProxy"; then
        screen -X -S KTProxy quit
    fi
    
    rm -rf $KT_PATH 1>/dev/null
    filterResult $? "卸载" 1
    
}

update() {
    install
}

start() {
    echo "启动服务"
    supervisorctl -c $SUPERVISOR_CONFIG start ktproxy
}

stop() {
    echo "停止服务"
    supervisorctl -c $SUPERVISOR_CONFIG stop ktproxy
}

restart() {
    echo "重启服务"
    supervisorctl -c $SUPERVISOR_CONFIG stop ktproxy
    supervisorctl -c $SUPERVISOR_CONFIG start ktproxy
}

status() {
    supervisorctl -c $SUPERVISOR_CONFIG status
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
    elif [ $1 == '-status' ];then
        status
    elif [ $1 == '-cn' ];then
        TAR_URL="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy-Linux@${VERSION}/KT-v${VERSION}-LINUX.tar.gz"
        SUPERVISOR_PATH="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@${VERSION}/supervisord.conf"
SUPERVISOR_D_PATH="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@${VERSION}/ktproxy.conf"
        install
    fi
else
    install
fi
