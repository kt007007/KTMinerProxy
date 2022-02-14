#!/bin/bash

if [[ $(id -u) != 0 ]];
then
        echo "请使用ROOT权限安装, 请切换至root用户后再次执行安装程序。"
        exit 1
fi


VERSION="0.0.2"
EXE_URL="https://github.com/kt007007/KTMinerProxy/blob/main/Linux-64/ktproxy_${VERSION}_linux?raw=true"
SUPERVISORD_CONFIG_RUL="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/Linux-64/supervisor/supervisord.conf"
SUPERVISORD_INI_URL="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/Linux-64/supervisor/supervisord.d/kt_proxy.ini"

cmd="apt-get"
uncmd="apt-get -purge remove"

message() {
    echo "====================${1}"
    echo -e 
}

filterResult() {
    if [ $1 -eq 0 ]; then
        echo "【${2}】成功。"
    else
        echo "【${2}】失败。"
    fi

    echo -e
}

unistall() {
    echo "开始卸载KTPROXY"
    message "关闭SUPERVISORD进程"
    killall supervisord 1>/dev/null
    filterResult $? "关闭SUPERVISORD进程"
    sleep 3

    message "卸载SUPERVISORD"
    $uncmd supervisor -y 1>/dev/null
    filterResult $? "卸载SUPERVISORD"

    message "删除目录"
    rm -rf /root/kt_proxy 1>/dev/null
    filterResult $? "删除目录"

    echo "卸载完成"
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

update() {
    message "关闭supervisord进程"
    killall supervisord 1>/dev/null
    filterResult $?  "关闭supervisord进程"
    sleep 3

    message "拉取文件"
    wget $EXE_URL -O /root/kt_proxy/ktproxy --no-check-certificate 1>/dev/null
    chmod 777 /root/kt_proxy/ktproxy 1>/dev/null
    wget $SUPERVISORD_CONFIG_RUL -O /root/kt_proxy/supervisor/supervisord.conf 1>/dev/null
    wget $SUPERVISORD_INI_URL -O /root/kt_proxy/supervisor/supervisord.d/kt_proxy.ini 1>/dev/null
    filterResult $?  "拉取文件"

    message "配置启动supervisord"
    supervisord -c /root/kt_proxy/supervisor/supervisord.conf 1>/dev/null
    filterResult $?  "配置启动supervisord"

    supervisorctl -c /root/kt_proxy/supervisor/supervisord.conf status
}

install() {
    echo "开始安装"
    
    if [ $cmd == 'yum' ];then
	message "禁用centos防火墙"	
	systemctl stop firewalld
        filterResult $? "禁用centos防火墙"

        message "停止防火墙centos开机启动"
	systemctl disable firewalld
        filterResult $? "停止防火墙centos开机启动"
    fi

    message "开始更新软件源, 这个过程可能需要几分钟到十几分钟不等，如果太久没有完成，请更换国内源"
    $cmd update -y
    filterResult $? "更新软件源"

     filterResult $?  "安装CURL WGET "
    $cmd install curl wget -y 1>/dev/null
    filterResult $?  "安装CURL WGET"

    message "安装python-setuptools"
    $cmd install python-setuptools -y 1>/dev/null
    filterResult $?  "安装python-setuptools"

    message "安装supervisor"
    $cmd install supervisor -y 1>/dev/null
    filterResult $?  "安装supervisor"

    message "创建目录"
    mkdir /root/kt_proxy 1>/dev/null
    mkdir /root/kt_proxy/supervisor 1>/dev/null
    mkdir /root/kt_proxy/supervisor/supervisord.d 1>/dev/null
    chmod 777 /root/kt_proxy 1>/dev/null
    filterResult $?  "创建目录"

    message "拉取文件"
    wget $EXE_URL -O /root/kt_proxy/ktproxy --no-check-certificate 1>/dev/null
    chmod 777 /root/kt_proxy/ktproxy 1>/dev/null
    wget $SUPERVISORD_CONFIG_RUL -O /root/kt_proxy/supervisor/supervisord.conf 1>/dev/null
    wget $SUPERVISORD_INI_URL -O /root/kt_proxy/supervisor/supervisord.d/kt_proxy.ini 1>/dev/null
    filterResult $?  "拉取文件"

    message "关闭supervisord进程"
    killall supervisord 1>/dev/null
    filterResult $?  "关闭supervisord进程"
    sleep 3
    
    message "配置启动supervisord"
    supervisord -c /root/kt_proxy/supervisor/supervisord.conf 1>/dev/null
    filterResult $?  "配置启动supervisord"

    supervisorctl -c /root/kt_proxy/supervisor/supervisord.conf status
}

if [ $1 ] && [ $1 == '-uninstall' ];then
    unistall
else if [ $1 ] && [ $1 == '-update' ]; then
    update
else
    install
fi

