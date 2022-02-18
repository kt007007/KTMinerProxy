<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/kt007007/KTMinerProxy">
    <img src="./image/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">KTMinerProxy</h3>

  <p align="center">
    一款免费且功能强大的矿池加速软件，现已开启内侧。
    <br />
    <a href="https://kdocs.cn/l/slPG1q488Trc"><strong>帮助文档 »</strong></a>
    <br />
    <br />
    <a href="https://qm.qq.com/cgi-bin/qm/qr?k=2qOW3S0PnHGL_30AmNmLLRDp2bhwIi3M&jump_from=webapi">QQ群: 978113445</a>
    ·
    <a href="https://t.me/+VK7ZOlKvcLljYjQ1"> 电报 https://t.me/+VK7ZOlKvcLljYjQ1</a>
  </p>
</div>

<hr>

<!-- TABLE OF CONTENTS -->
<summary>导航菜单</summary>
<ol>
<li>
    <a href="#about-the-project">简介</a>
</li>
<li>
    <a href="#preview">软件预览</a>
</li>
<li>
    <a href="#install">部署软件</a>
    <ul>
    <li><a href="#linux">Linux</a></li>
    <li><a href="#windows">Windows</a></li>
    </ul>
</li>
<li><a href="#about">联系我们</a></li>
</ol>



<!-- ABOUT THE PROJECT -->
<p id="preview"></p>

## 软件预览

![预览图片](./image/jt1.png)
![预览图片](./image/jt3.png)

<table>
    <tr>
        <td>
            <center>
                <img src="./image/jt5.png" alt="Logo">
            </center>
        </td>
        <td>
            <center>
                <img src="./image/jt2.png" alt="Logo">
            </center>
        </td>
    </tr>
</table>


<p id="about-the-project">KTProxy是一款功能强大的矿池加速程序，目前程序处于内侧阶段，意见和建议请提交至issue、qq群或电报，我们会及时处理。</p>
<hr>

<div align="center">
<table>
    <tr>
        <td>支持的功能</td>
        <td>支持的币种</td>
    </tr>
    <tr>
        <td>
            * 数据统计分析<br>
            * TLS/SSL加密<br>
            * 矿池转发<br>
            * 预置各币种的矿池（随时更新）<br>
            * 自定义矿池<br>
            * 备用矿池<br>
            * 自定义端口<br>
            * 端口连接数限制<br>
            * 自定义抽水比例<br>
            * 自定义抽水钱包、矿池<br>
            * 统一钱包<br>
            * 矿池模式<br>
            * 端口备注<br>
            * 在线更新<br>
            * ...<br><br><br>
        </td>
        <td>
            * ETH<br>
            * ETC<br>
            * BTC<br>
            * KDA<br>
            * ZEC<br>
            * BEAM<br>
            * RVN<br>
            * ERG<br>
            * ZEN<br>
            * LTC<br>
            * DCR<br>
            * DASH<br>
            * CKB<br>
            * BCH<br>
            * HNS<br>
            * STC<br>
            * 陆续添加中......<br>
        </td>
    </tr>
</table>
</center>
</div>

上述币种皆可支持转发，部分币种暂不支持配置抽水，后续会陆续更新。

目前内侧阶段无抽水，公测时通过投票决定计费方式。
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
<p id="install"></p>

## 开始使用

部署之前，您需要有一台自己的云服务器来部署此软件，服务器选择方案点击此处查看帮助。<br>
云服务器请打开6001端口, 默认web访问地址为此端口。<br>
国内服务器节点可能无法成功安装，请部署在非国内服务器。

<hr>

<p id="linux"></p>

### Linux环境安装

推荐部署Linux系统，内置了supervisor进程守护，程序更加稳定。

支持的Linux

* Ubuntu 64 18.04+
* Centos 64 7+

#### 安装
先切换至root账户，然后执行以下代码
  ```
  通过github安装:

  bash <(curl -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh)


  无法访问github请通过以下命令安装:

  bash <(curl -L https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@0.0.4/linux-install.sh) -cn
  ```
安装完毕后，在任何设备下的的浏览器访问您的服务器【IP:6001】即可访问后台， 例如 http://118.126.1.5:6001, url里面的118.126.1.5替换为您的服务器ip即可，登陆后请尽快在设置页修改默认密码。

#### 更新

~~自动更新：设置页面内, 点击检查更新即可自动更新。~~ 暂时关闭该功能

手动更新：执行以下指令进行更新。

```
通过github更新:

bash <(curl -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh) -update

或

bash <(curl -L https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@0.0.4/linux-install.sh) -update
```

#### 卸载

````
bash <(curl -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh) -uninstall

或

bash <(curl -L https://cdn.jsdelivr.net/gh/kt007007/KTMinerProxy@0.0.4/linux-install.sh) -uninstall
````

<table>
    <tr>
        <td>
            <center>
                <img src="./image/jt6.png" alt="Logo">
            </center>
        </td>
        <td>
            <center>
                <img src="./image/jt7.png" alt="Logo">
            </center>
        </td>
    </tr>
</table>

<hr>

<p id="windows"></p>

### Windows环境安装

1. 前往 [https://github.com/kt007007/KTMinerProxy/blob/main/Windows-64](https://github.com/kt007007/KTMinerProxy/blob/main/Windows-64) 下载windows下的执行程序
<table>
    <tr>
        <td>
            <center>
                <img src="./image/jt8.png" alt="Logo">
            </center>
        </td>
        <td>
            <center>
                <img src="./image/jt9.png" alt="Logo">
            </center>
        </td>
    </tr>
</table>
2. 将下载后的文件放至服务器内，双击运行即可。<br>
3. 双击运行后, 在任何设备下的的浏览器访问您的服务器【IP:6001】即可访问后台， 例如 http://118.126.1.5:6001, url里面的118.126.1.5替换为您的服务器ip即可，登陆后请尽快在设置页修改默认密码。

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
<p id="about"></p>

## 联系我们

QQ群: [978113445](https://qm.qq.com/cgi-bin/qm/qr?k=2qOW3S0PnHGL_30AmNmLLRDp2bhwIi3M&jump_from=webapi)

电报: [https://t.me/+VK7ZOlKvcLljYjQ1](https://t.me/+VK7ZOlKvcLljYjQ1)

<p align="right">(<a href="#top">back to top</a>)</p>


[contributors-shield]: https://img.shields.io/github/contributors/kt007007/KTMinerProxy.svg?style=for-the-badge
[contributors-url]: https://github.com/kt007007/KTMinerProxy/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/kt007007/KTMinerProxy.svg?style=for-the-badge
[forks-url]: https://github.com/kt007007/KTMinerProxy/network/members
[stars-shield]: https://img.shields.io/github/stars/kt007007/KTMinerProxy.svg?style=for-the-badge
[stars-url]: https://github.com/kt007007/KTMinerProxy/stargazers
[issues-shield]: https://img.shields.io/github/issues/kt007007/KTMinerProxy.svg?style=for-the-badge
[issues-url]: https://github.com/kt007007/KTMinerProxy/issues
[license-shield]: https://img.shields.io/github/license/kt007007/KTMinerProxy.svg?style=for-the-badge