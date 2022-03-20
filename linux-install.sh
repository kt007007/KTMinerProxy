#!/bin/bash
# Author: KT007007
# github: https://github.com/kt007007

VERSION="1.0.0"

DOWNLAOD_URL="https://github.com/kt007007/KTMinerProxy/raw/main/Linux-64/ktproxy_v1.0.0_linux"

PATH_KT="/root/ktmproxy"

PATH_EXEC="ktproxy"

PATH_CACHE="/root/ktmproxy/.cache"

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

#检查是否为Root
[ $(id -u) != "0" ] && { colorEcho ${RED} "请使用root用户执行此脚本."; exit 1; }

PACKAGE_MANAGER="apt-get"
PACKAGE_PURGE="apt-get purge"


filterResult() {
    if [ $1 -eq 0 ]; then
        echo ""
    else
        colorEcho ${RED} "【${2}】失败。"
	
        if [ ! $3 ];then
            colorEcho ${RED} "!!!!!!!!!!!!!!!安装失败!!!!!!!!!!!!!!!!"
            exit 1
        fi
    fi
    echo -e
}

if [[ `command -v apt-get` ]];then
    PACKAGE_MANAGER='apt-get'
elif [[ `command -v dnf` ]];then
    PACKAGE_MANAGER='dnf'
elif [[ `command -v yum` ]];then
    PACKAGE_MANAGER='yum'
    PACKAGE_PURGE="yum remove"
    colorEcho ${BLUE} "关闭防火墙"
    systemctl stop firewalld.service 1>/dev/null
else
    colorEcho $RED "不支持的操作系统."
    exit 1
fi

install() {
    colorEcho ${GREEN} "开始安装KTPROXY-V-${VERSION}"

    colorEcho $BLUE "更新软件源."
    
    $PACKAGE_MANAGER update -y 1>/dev/null
    
    if [[ ! `command -v curl` ]];then
        $PACKAGE_MANAGER install curl -y 1>/dev/null
    fi

    if [[ ! `command -v wget` ]];then
        $cmd install wget -y 1>/dev/null
    fi

    colorEcho $BLUE "创建目录"
    
    if [[ ! -d $PATH_KT ]];then
        mkdir $PATH_KT
        chmod 777 $PATH_KT
    else
        colorEcho $YELLOW "目录已存在, 无需重复创建。"
    fi

    stop

    colorEcho $BLUE "拉取程序"
    wget -P $PATH_KT $DOWNLAOD_URL -O "${PATH_KT}/${PATH_EXEC}" 1>/dev/null
    filterResult $? "拉取程序"

    chmod 777 "${PATH_KT}/${PATH_EXEC}"

    change_limit

    start
}

change_limit(){
    colorEcho $BLUE "修改系统最大连接数"

    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

uninstall() {    
    colorEcho $BLUE "终止进程"
    killall ktproxy

    rm -rf ${PATH_KT}
    colorEcho $GREEN "卸载完成"
}

start() {
    cd $PATH_KT

    colorEcho $BLUE "启动程序..."
    # nohup "${PATH_KT}/${PATH_EXEC}" 2>err.log &
    nohup "${PATH_KT}/${PATH_EXEC}" >/dev/null 2>log &
    filterResult $? "启动程序"

    colorEcho $GREEN "程序启动成功, 默认WEB访问端口 16777, 默认账号admin, 默认密码admin123"
}

stop() {
    colorEcho $BLUE "终止进程"
    killall ktproxy
}

restart() {
    stop
    start
}

clear() {
    colorEcho $BLUE "清理数据"
    rm -rf ${PATH_CACHE}
}

if [ $1 ];then
    if [ $1 == "-uninstall" ];then
        uninstall
    elif [ $1 == '-update' ];then
        install
    elif [ $1 == '-restart' ];then
        restart
    elif [ $1 == '-stop' ];then
        stop
    elif [ $1 == '-start' ];then
        start
    elif [ $1 == '-clear' ];then
        clear
    elif [ $1 == '-changelimit'];then
        change_limit
    elif [ $1 == '-checklimit'];then
        check_limit
    fi
else
    install
fi
