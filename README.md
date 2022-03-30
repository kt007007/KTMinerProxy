<div id="top"></div>

<!-- PROJECT LOGO -->
<div align="center">

# KTMinerProxy

<img src="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/image/logo.png#gh-dark-mode-only" alt="Logo" width="200" height="200">

<img src="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/image/slogo.png#gh-light-mode-only" alt="Logo" width="200" height="200">

  <!-- ![GitHub Light](https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/image/logo.png#gh-dark-mode-only)

  ![GitHub Dark](https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/image/slogo.png#gh-light-mode-only) -->


[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
<!-- ![Github stars](https://img.shields.io/github/stars/kt007007/KTMinerProxy.svg) -->


  <p align="center">
    <h2>:zap: 原创GO语言编写，功能强大，性能强劲。</h2>
    <!-- <a href="https://kdocs.cn/l/slPG1q488Trc"><strong>帮助文档 »</strong></a> -->
    <a href="https://kdocs.cn/l/slPG1q488Trc"></a>
    TG：<a href="https://t.me/+VK7ZOlKvcLljYjQ1">https://t.me/+VK7ZOlKvcLljYjQ1</a>
  </p>
</div>

# 导航

<ol>
<li>
    <a href="#uplog">更新日志</a>
</li>
<li>
    <a href="#gn">功能</a>
</li>
<li>
    <a href="#preview">软件预览</a>
</li>
<li>
    <a href="#install">部署软件</a>
    <ul>
        <li>
            <a href="#linux">Linux</a>
            <ul>
                <li>
                    <a href="#linux">安装</a>
                </li>
                <li>
                    <a href="#linux">更新</a>
                </li>
                <li>
                    <a href="#linux">卸载</a>
                </li>
                <li>
                    <a href="#linux">停止服务</a>
                </li>
                <li>
                    <a href="#linux">启动服务</a>
                </li>
                <li>
                    <a href="#linux">重启服务</a>
                </li>
                <li>
                    <a href="#linux">开机启动</a>
                </li>
                <li>
                    <a href="#linux">设置最大连接数</a>
                </li>
                <li>
                    <a href="#linux">查看程序运行时日志</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#windows">Windows</a>
        </li>
    </ul>
</li>
<li>
    <a href="#about">常见问题</a>
    <ul>
        <li>
            <a href="#q1">算力呈现波浪状</a>
        </li>
        <li>
            <a href="#q2">负载均衡</a>
        </li>
        <li>
            <a href="#q3">安装时提示 curl: command not found</a>
        </li>
        <li>
            <a href="#q4">修改端口启动</a>
        </li>
        <li>
            <a href="#q5">修改密码</a>
        </li>
        <li>
            <a href="#q6">启动时提示 dial tcp connection refused</a>
        </li>
        <li>
            <a href="#q7">关闭/删除端口</a>
        </li>
        <li>
            <a href="#q8">安装时提示：安装killall失败！！！！请手动安装psmisc后再执行安装程序。</a>
        </li>
    </ul>
</li>
<li><a href="#about">免责声明</a></li>
<li><a href="#about">联系我们</a></li>
</ol>

<span id="uplog"></span>
# 更新日志

```
1.1.0
修复了本地算力浮动的问题
更加稳定持久的连接
支持了不同钱包不同比例抽水
开放了备用池
增加了端口日志
更温柔的抽水
修复了币印新的TLS地址无法连接的问题
增加了设备连接时长
增加了钱包、机器名搜索
修改了一个容易导致内存泄漏的地方, 程序更加稳固
修复了某些小币种自定义配置不生效的问题
新的安装脚本, 更方便管理, 支持了开机启动修改端口等功能

1.0.0
完全有效的抽水份额
新的抽水逻辑
实装btc（待测试）
端口内设备有时候算力为0, 不用担心，显示的问题，如果担心的话可以观察内核输出，仅仅是显示问题 稍后会优化掉
现在增加了万分之一的开发费用

0.9.9
可配置多个钱包
修改了开启抽水导致的份额丢失问题
新的获取任务逻辑, 获取份额数量更快了一些
增加了常用自定义配置管理
可以单独导出某个端口的配置
优化页面细节
显示正常的区间内份额统计图表
机器增加了日志,点击机器查看详情可看到（持续更新）
增加了一键默认配置
修改了sn冲突导致的无法登录的问题

0.1.1
修改了内存爆炸的问题
修改了抽水钱包算力过多的问题
端口关闭下可以开关SSL以及重新配置证书
取消自动更新功能
去掉了无效的设置

0.0.9
修复了导致软件崩溃的几个关键问题
修复了粘包导致的份额丢失的问题
修复了首次启动看不到图表的问题
抽水算法改为随机算法，曲线更稳定
增加了端口配置TLS证书功能
增加矿池连接状态测试功能
增加抽水份额统计
增加原始钱包地址查看登录页右下键可以查看机器码

0.0.8
修改了抽水统一钱包失效的问题
修改了抽水逻辑，现在频率更高，矿池曲线更稳定
增加列表分页及设置
修正了某些情况下含有数据统计的币种也会提示未知设备的问题

0.0.6:
默认端口号改为16777
更换进程守护方式
页面优化
数据列表默认排序
修正更换端口无法启动的问题
可以正常转发但是不支持数据统计的币种，列表内现在可以显示设备了
增加抽水设备名称的配置
增加了矿池模式统一名称的配置
增加语言包

0.0.5:
稳定性改进
增加了一些ETH预置矿池
修复了目标矿池为SSL连不上的问题
```

# 功能

|支持的功能|支持的币种|
|:-------:|:---:|
|数据统计分析|ETH|
|TLS/SSL加密|ETC|
|矿池转发|BTC|
|预置各币种的矿池（随时更新）|KDA|
|自定义矿池|ZEC|
|备用矿池|BEAM|
|自定义端口|RVN|
|端口连接数限制|ERG|
|多钱包配置|ZEN|
|自定义抽水比例|LTC|
|自定义抽水钱包、矿池、设备名称|DCR|
|统一钱包|DASH|
|矿池模式|CKB|
|端口备注|BCH|
|在线更新|HNS|
|导入导出端口配置|STC|
|自定义SSL密钥||
|矿池状态检查||
|自定义TLS证书||

</p>

# 软件预览

<p id="preview"></p>
<img src="./image/tinified/jt1.png" alt="Logo">
<img src="./image/tinified/jt3.png" alt="Logo">
<img src="./image/tinified/jt2.png" alt="Logo">
<!-- <img src="./image/tinified/t5.png" alt="Logo"> -->
<img src="./image/tinified/t6.png" alt="Logo">
<img src="./image/tinified/t7.png" alt="Logo">
<img src="./image/tinified/t8.png" alt="Logo">
<img src="./image/tinified/t9.png" alt="Logo">

<!-- GETTING STARTED -->
<p id="install"></p>


<p id="linux"></p>

# Linux

```
root用户直接执行以下命令, 根据提示选择对应功能即可。

bash <(curl -s -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh)
```
<img src="./image/t12.png" alt="Logo">

支持的Linux

* Ubuntu 64 18.04+
* Centos 64 7+

<p id="windows"></p>

# Windows
下载完后直接启动即可，程序自带进程守护

<a href="https://github.com/kt007007/KTMinerProxy/tree/main/Windows-64">下载地址</a>


<p id="question"></p>
<p id="about"></p>

# 常见问题

以下为常见问题解决方案

<span id="q1"></span>
# 算力呈现波浪状

<img src="./image/t10.png" alt="Logo">

```
如果出现上图中的情况, 说明您开启了多个相同端口的KTMinerproxy, 关闭多余的进程即可。
```

<span id="q2"></span>
# 负载均衡
```
等待更新
```

<span id="q3"></span>
# 安装时提示 curl: command not found
```
安装时提示 curl: command not found， 说明你的linux没有安装curl
先执行    apt-get update
然后执行  apt install curl
等待命令执行完毕，即可执行暗转脚本
```

<span id="q6"></span>
# 启动时提示 dial tcp connection refused
```
请将ktproxy.com添加至防火墙白名单中，这个域名提供了图表服务及认证
```

<span id="q7"></span>
# 关闭/删除端口
<img src="./image/t11.png" alt="Logo">

```
点击图中指定位置即可删除/关闭端口
```

<span id="q8"></span>
# 安装时提示：安装killall失败！！！！

```
检查服务器的镜像源并手动安装psmisc
```

# 免责声明
<p id="flsm">
开发者仅在技术及爱好的驱使下维护此软件，本软件仅验证技术过程。

用前请遵循当地法律，不允许的区域内禁止使用。

使用此软件造成的法律问题, 一概与软件作者无关。
</p>



# 联系我们

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