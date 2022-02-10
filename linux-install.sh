#!/bin/bash

if [[ $(id -u) != 0 ]];
then
        echo "请使用ROOT权限安装, 请输入[sudo -i]切换之root用户后再次执行安装程序。"
        exit 1
fi

cmd="apt-get"

if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]];
then
    if [[ $(command -v yum) ]]; 
    then
        cmd="yum"
    fi
else
    echo "软件不支持此系统"
fi

install() {
    $cmd update -y
    $cmd install curl wget -y
    $cmd install python-setuptools
    $cmd install supervisor

    mkdir /root/kt_proxy
    chmod 777 /root/kt_proxy

    wget https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@latest/Linux/ktproxy-linux.tar.gz -O /root/kt_proxy/ktproxy-linux.tar.gz --no-check-certificate
    tar -zxvf /root/kt_proxy/kt-proxy.tar.gz -C /root/kt_proxy/
    rm /root/kt_proxy/kt-proxy.tar.gz
    supervisord -c /root/kt_proxy/supervisor/supervisord.conf
    supervisorctl status
}

install