<div align="center">

# KENC文档说明

</div>

<p id="kenc"></p>

### KENC是本地->远程KT隧道，局域网部署在一台设备上即可，可与远程KTMinerProxy通过KENC协议进行通信。

<a href="https://github.com/kt007007/KTMinerProxy/raw/main/KENC/windows.zip">点击下载WINDOWS客户端</a>

<a href="https://github.com/kt007007/KTMinerProxy/raw/main/KENC/kenc_v_linux">点击下载LINUX客户端</a>

### LINUX版一键安装
```
rm ./k-install.sh;wget https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@main/k-install.sh;chmod 777 ./k-install.sh;bash ./k-install.sh
```

### 使用环境
```
KTMinerproxy版本>=2.1.0
```

## 使用说明

### 1.远程ktminerproxy先配置一个KENC协议的端口

<img src="./../image/t14.png" alt="Logo" width="300">

### 2.在KT的设置页面找到KENC配置推送, 如下图
<img src="./../image/kenc.png" alt="Logo">

### 3. KENC客户端首次打开, 或点击右上角设置, 即可更改配置推送地址, 配置设置完毕后重启KENC客户端即可拉取最新配置。