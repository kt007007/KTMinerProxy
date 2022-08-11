#!/bin/bash
# Author: KT007007
# github: https://github.com/kt007007

DOWNLOAD_HOST=""

AMD64_HOST="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/KENC/kenc_linux_amd64"

ARM64_HOST="https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/KENC/kenc_linux_arm64"

PATH_KENC="/root/kenc"

PATH_EXEC="kenc"

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

[ $(id -u) != "0" ] && { colorEcho ${RED} "请使用root用户执行此脚本."; exit 1; }

installapp() {
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
}

echo "-------------------------------------------------------"
colorEcho ${GREEN} "欢迎使用KTMinerProxy安装工具, 请输入操作号继续。"

echo ""
echo "1、安装KENC(amd64)"
echo "2、安装KENC(arm64)"
echo "3、卸载KENC"
echo ""
colorEcho ${YELLOW} "如果在此之前是手动安装的程序，请自己手动退出程序后再执行此脚本，否则容易发生冲突，所有操作尽量通过此脚本完成。"
echo "-------------------------------------------------------"

read -p "$(echo -e "请选择[1-3]：")" choose

case $choose in
1)
    $DOWNLOAD_HOST=$AMD64_HOST
    installapp "amd64"
    ;;
2)
    $DOWNLOAD_HOST=$ARM64_HOST
    installapp "arm64"
    ;;
3)
    update
    ;;
*)
    echo "输入了错误的指令, 请重新输入。"
    ;;
esac