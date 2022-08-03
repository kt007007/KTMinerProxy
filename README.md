<div id="top"></div>

<!-- PROJECT LOGO -->
<div align="center">

<img src="https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/image/logo-1.png" alt="Logo" width="200" height="200">

<br>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<h3>
    Telegram：<a href="https://t.me/+VK7ZOlKvcLljYjQ1">https://t.me/+VK7ZOlKvcLljYjQ1</a>
</h3>

</div>
<!-- <h1></h1> -->
<!-- <h2>简介</h2> -->
<h1>KTMinerProxy</h1>
<p>:zap: 原创正版，功能强大，性能强劲。支持无损BTC ETC ETH LTC ERG CFX RVN SERO XMR CKB BEAM ALPH KASPA等多个币种抽水，不爆内存，体验拉满，4000台无压力不崩溃，精确到单台设备的24小时数据统计、自定义隧道推送工具等强大功能...</p>

<p align="center">
    <img src="./image/tiny.png" alt="Logo">
  </p>

<h2>Linux一键工具箱</h2>
<p>root用户直接执行以下命令, 根据提示选择对应功能即可。</p>

```
bash <(curl -s -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh)
```

<h2>免责声明</h2>
<p>法律不支持的地区此程序无法使用，请自觉遵守当地相关政策，使用此软件造成的法律问题，一概与软件作者无关。</p>

# 导航

<ol>
<li>
    <a href="#uplog">更新日志</a>
</li>
<li>
    <a href="#gn">功能</a>
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
        <li>
            <a href="#_kenc">本地加密客户端KENC</a>
        </li>
    </ul>
</li>
<li>
    <a href="#about">常见问题</a>
    <ul>
        <li>
            <a href="#q15">内存相关</a>
        </li>
        <li>
            <a href="#q0">进程守护</a>
        </li>
        <li>
            <a href="#q1">默认账号密码</a>
        </li>
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
            <a href="#q5">修改密码</a>
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
        <li>
            <a href="#q9">WEB访问长时间卡在LOADING界面。</a>
        </li>
        <li>
            <a href="#q11">IP黑名单</a>
        </li>
        <li>
            <a href="#q12">ETH、ETC芯片机</a>
        </li>
        <li>
            <a href="#q18">芯动A11系列相关问题</a>
        </li>
        <li>
            <a href="#q13">本地算力修改</a>
        </li>
        <li>
            <a href="#q14">迁移</a>
        </li>
        <li>
            <a href="#q10">开发费用及算力损失问题</a>
        </li>
        <li>
            <a href="#q16">观察者链接</a>
        </li>
        <li>
            <a href="#q17">算力跑不够的常见原因</a>
        </li>
    </ul>
</li>
<li><a href="#about">免责声明</a></li>
<li><a href="#about">联系我们</a></li>
</ol>

<span id="gn"></span>
### 核心功能

- 全币种无损抽水
- 先进的内存管理机制, 单机最高8000台稳定运行至今
- 精确到单台设备的24小时数据统计分析
- TLS/SSL/KENC加密
- 配套的本地端加密工具
- 预置各币种矿池（随时更新）
- 软防cc
- 多钱包配置
- 替换指定钱包
- 统一钱包
- 矿池模式
- 快捷导入到出所有配置
- 修改矿池内本地算力
- IP黑名单
- 自定义RSA加密密钥
- 自定义证书
- 自定义配置
- 掉线提醒
- 矿池官网一样的观察者地址
- 超低的手续费

### 已支持抽水的币种（如需增加新币种, 请在电报内联系管理员, 通常一天之内就可以完成）

- BTC
- ETC
- ETH
- LTC
- ERG
- CFX
- RVN
- SERO
- XMR
- CKB
- BEAM
- ALPH
- KASPA
- ...

<span id="uplog"></span>
# 更新日志

```
2.7.7
修复了erg一些列的问题
优化了在线/离线设备数量显示

2.7.6
修复了kaspa高无效的问题

2.7.5
增加了纯转发端口, 功能类似nginx
增加了份额最后提交日期
优化了页面细节及主题

2.7.4
[重要更新] 修复了自定义证书会自动复原的BUG, 影响范围2.6.x-2.7.3

2.7.3
优化了新的布局和主题

2.7.2
增加了新的布局和主题

2.7.1
不同钱包相同名称的机器现在分开展示了
增加了KENC端口的自定义RSA密钥(此功能仅适用于自己制作客户端, 平时不要配置, 否则会导致kenc端口无法正常连接)

2.7.0
修复了KASPA无效过高的问题

2.6.9
增加了KASPA的抽水

2.6.8
修复了几个币种的自定义配置在创建端口时找不到的问题
修复了挖掘XMR时导致软件崩溃的一个问题
提升了程序稳定性

2.6.7
增加了XMR算力统计
增加了ERG算力统计
增加了RVN算力统计
增加了内核与证书不匹配的错误提示
优化了XMR的日志
修复了XMR多个设备合并的问题

2.6.6
修复了ALPH无效过高的问题
修复了一个可能导致ETC产生无效的地方
修改了添加端口时的部分币种介绍

2.6.5
kenc的推送地址改为加密地址，加密地址只有最新版本的kenc客户端支持, 如需此功能，需重新下载kenc客户端及2.6.5的KT客户端
优化了设备详细信息的日志
优化了登录界面

2.6.4
增加了ALPH的抽水

2.6.3
修复了BEAM抽水无效过高的问题

2.6.2
[重要更新] 
略微提升了ETH在某些池子的算力
降低了亚米设备在ETH端口的无效
增加了BEAM抽水

2.6.1
修复了ERG无效率偏高的问题
修复了RVN无效率偏高的问题

2.6.0
增加了CKB抽水
优化了端口日志的输出

2.5.9
修复了A11在某个池子下会断开的问题
增加了端口证书批量替换功能, 可在设置 - 证书管理内批量替换证书
修复了矩形图不显示同类下的子分类问题

2.5.8
增加了XMR的抽水

2.5.7
增加了端口统计的矩形视图, 看总量统计更方便些了
修复了某些小币种的算力统计

2.5.6
增加了LTC的抽水

2.5.5
增加SERO币种抽水
实装了所有支持小币种抽水的算力统计

2.5.4
修复了抽水钱包数量>1时, 算力分配不均衡的问题

2.5.3
增加了观察者链接, 编辑端口-高级设置即可打开此功能

2.5.2
修复了茉莉等芯片机连接ETH端口无法登录的问题
适当提升了一点点内存占用, 用来降低可能发生无效的概率

2.5.1
支持多个指定钱包替换至目标钱包
修复了ETC芯片机 A11及一些小币种无损模式下可能无法正常工作的bug

2.5.0
修复了2.4.X版本抽水过多的问题
增加了指定钱包地址替换功能
增加了设备名称正则表达式过滤设置
修复了某些情况下算力统计失效的情况
适当调低了三倍左右内存占用, 现在单台设备占用500kB内存

2.4.3
增加了CFX抽水
增加了ERG抽水
增加了RVN抽水
修复了某个可能导致ETC芯片机和ETH芯片机造成无效的地方

2.4.2
增加了对nicehash的支持

2.4.1
修复了ETC芯片机相关问题

2.4.0
更换了LOGO
修复了BTC抽水过少的问题
引入了ETC无损机制
支持了ETC芯片机
更新了BCH的逻辑
端口日志内增加了断开日志

2.3.3
完美版A11

2.3.2
增加了兼容模式, 一些币种或机型在工作一段时间后出现大量无效导致无法继续工作时可以尝试使用此模式
对BTC进行了优化, 无法抽水的BTC机型和矿池, 可以使用兼容模式来进行工作
对A11进行了优化, 如果是A11的机器, 端口请选择ETH芯片级及无损模式
更新了KENC, 所有使用KENC客户端的用户请下载最新KENC
开放了BTC统一钱包

2.3.1
设置里增加了KENC配置推送
修复了页面上一些显示的问题

2.3.0
BTC现在支持了所有矿池
BTC引入了无损机制
实装了BTC算力统计
BTC增加了动态难度抽水

2.2.7
修复了特殊情况下无损逻辑暂时失效的BUG
适当缩小了数据尺寸, 降低了3/1的内存占用

2.2.6
修复了一些内存相关的问题
修复了TEAMRED内核中途报错的问题
完善了无损的逻辑(需规模性测试)

2.2.5
修复了一些情况下动态难度调整失效的问题
修复了部分内核概率性掉线的问题
设备详情里增加了设备的IP显示

2.2.4
ETH增加了动态难度抽水机制, 跨池也能抽到比例算力了
略微提升了凤凰内核的算力
修复了部分内核不显示名字和算力的问题

2.2.3
增加了本地算力修改的功能

2.2.2
极大稳定了算力补偿机制，给你稳稳的幸福

2.2.1
支持了芯动矿机，创建端口时选择ETH芯片机即可
修复了算力补偿机器的名称问题，微量的提高了双方算力
修复了网页修改端口导致ip黑名单丢失的问题

2.2.0
大大降低了ETH的损耗
增加了难度统计

2.1.1
修复因为新的机制导致的大量算力丢失问题

2.1.0
大大减小了特殊网络环境下的算力损耗
干掉了幽灵设备
修复了矿池内机器合并为defualt的问题
修复了TEAMRED内核的相关问题
增加了KENC隧道协议
增加了软防CC策略
增加了IP黑名单功能
TOKEN超时切换到登录页自动保留了账号密码
修复了自定义配置中文无法保存的问题
修复了端口证书相关的问题

2.0.1
修复BTC抽水导致目标机器算力低下的问题

2.0.0
实装了BTC和BCH的抽水
自定义配置现在可以导入导出和跨平台保留了

1.1.5
修复了一些抽水问题

1.1.4
修复了抽水导致的断连bug

1.1.3
实装掉线提醒
修改了一些可能导致延迟增加的地方
支持了网页修改web访问端口
新的安全逻辑, 避免被扫
支持了修改账号
修改了部分内核导致名字乱了的问题

1.1.2
大幅提升程序稳定性

1.1.1
大幅提升程序稳定性
重新开放了小币种的转发

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

<!-- GETTING STARTED -->
<p id="install"></p>


<p id="linux"></p>

# Linux

```
root用户直接执行以下命令, 根据提示选择对应功能即可。

bash <(curl -s -L https://raw.githubusercontent.com/kt007007/KTMinerProxy/main/linux-install.sh)
```
### 安装完成之后, 请立即修改登录账号、密码以及启动端口，防止被爆破。

<img src="./image/t12.png" alt="Logo">

支持的Linux

* Ubuntu 64 18.04+
* Centos 64 7+

<p id="windows"></p>

# Windows
下载完后直接启动即可，程序自带进程守护

<a href="https://github.com/kt007007/KTMinerProxy/tree/main/Windows-64">下载地址</a>

<span id="_kenc"></span>
# KENC
<p>
请前往<a href="https://github.com/kt007007/KTMinerProxy/tree/main/KENC">https://github.com/kt007007/KTMinerProxy/tree/main/KENC</a>自行下载
</p>
<p><a href="#kenc">KENC帮助文档</a></p>


<p id="question"></p>
<p id="about"></p>

# 常见问题

<span id="q0"></span>
## 进程守护
<p>程序自带了进程守护, 不要！不要！不要使用supervisor或相关工具维护进程，否则会导致进程重复开启。</p>

<span id="q1"></span>
## 算力呈现波浪状
<img src="./image/t10.png" alt="Logo"><br>
<p>如果出现上图中的情况, 说明您开启了多个相同端口的KTMinerproxy, 关闭多余的进程即可。</p>
<p>如果您进行了镜像拷贝，也会出现以上问题，先执行脚本停止程序的运行，然后删除掉/root/ktmproxy/license文件, 再执行启动即可</p>

<span id="q2"></span>
## 负载均衡
<p>...</p>

<span id="q3"></span>
## 安装时提示 curl: command not found
<p>安装时提示 curl: command not found， 说明你的linux没有安装curl</p>
<p>先执行    apt-get update</p>
<p>然后执行  apt install curl</p>
<p>等待命令执行完毕，即可执行安装脚本</p>

<span id="q4"></span>
## 修改端口启动
<p>执行安装脚本，选择修改端口启动，输入要修改的端口号即可。</p>

<span id="q5"></span>
## 修改密码
<p>安装完后请尽快前往设置页修改密码。</p>

<span id="q6"></span>
## 启动时提示 dial tcp connection refused
<p>请将ktproxy.com添加至防火墙白名单中，这个域名提供了图表服务及认证</p>

<span id="q7"></span>
## 关闭/删除端口
<img src="./image/t11.png" alt="Logo">
<p>点击图中指定位置即可删除/关闭端口</p>

<span id="q8"></span>
## 安装时提示：安装killall失败！！！！
<p>检查服务器的镜像源并手动安装psmisc</p>

<span id="q9"></span>
## WEB访问长时间卡在LOADING界面。
<p>安装或更新后，第一次访问web界面加载时间可能会有些长，如果很长时间没有进去，请更换chrome浏览器。</p>

<span id="q1"></span>
## 默认账号密码
<p>默认账号: admin</p>
<p>默认密码: admin123</p>

<span id="q10"></span>
## 开发费用及算力损耗
<p>开发费用恒定至千分之三</p>
<p></p>
<p>多种原因会造成算力损耗，检查以下项，不要什么屎盆子都往开发者头上扣</p>
<p></p>
<p>观察矿池内延迟份额的比例，如果延迟率高于百分1请ping服务器检查延迟</p>
<p></p>
<p>抽水的算力因池而异，如果两个池子难度不同，也会导致算力差异</p>

<span id="q11"></span>
## IP黑名单
<p></p>
<p> 前往设置页面, IP黑名单选项卡可主动加入IP黑名单</p>
<p></p>
<p><img src="./image/jt18.png"></p>
<p></p>

<span id="q12"></span>
## ETH、ETC芯片机
<p></p>
<p> 常见的如奶牛、茉莉、亚米等机型, 需要用ETH端口, 芯动系列或其他的机型请选择ETH(GetWork)端口</p>
<p> 如果设备无法正常接入，不同类型的端口可以交替着试一下。</p>
<p></p>

<span id="q18"></span>
## 芯动A11系列相关问题
<p></p>
<p> A11抽水矿池需要和目标矿池相同。</p>
<p> 如果同池还存在高无效的情况, 请降级或升级固件至a11_20211026_060307版本, mx需要降级或升级至 a11mx_20211220_124402版本。</p>
<p></p>

<span id="q13"></span>
## 本地算力修改
<p></p>
<p> 添加或编辑端口时, 在【高级】选项卡下可进行ETH、ETC的本地算力修改</p>
<p></p>

<span id="q14"></span>
## 服务迁移
<p></p>
<p> 无论使用任何方式迁移程序, 迁移之后请将新的目录下license文件删除, 然后重启程序</p>
<p></p>

<span id="q15"></span>
## 内存相关
<p></p>
<p> 目前单台设备内存占用峰值控制在1.5M, 处于长期观察调整阶段, 之后会根据实际情况调低占用, 请根据接入设备数</p>量来决定硬件配置
<p></p>

<span id="q16"></span>
## 观察者链接
<p></p>
<p> 打开 端口设置-高级设置 ， 找到观察者链接，打开并保存，端口详情页内左下角找即可找到观察者链接。</p>

<span id="q17"></span>
## 算力跑不够的常见原因
<p>如果测试下来24小时均值和设置的差距过大的话, 比如设置抽百分之1, 均值却少了很多, 有很多原因会导致这种情况发生，需要自己一步步排查。</p>
<p>通常检查本地是否中招，或是设备出现问题，例如中转里某些设备无效率很高，这种情况通常是卡出问题了, 找到到这种情况通常比较容易排查，在KT中找到高无效的设备，点开后看下日志里是否有很多POW相关的关键字，如果有的话那么就说明这台设备的硬件出问题了，导致无效引发算力偏低。</p>
<p>更常见的一种原因是本地中招，这个非常容易遇到但是不好排查，可以在KT里建立一个纯转发的端口，用纯转发的端口测试设备24小时均值，如果纯转发的端口24小时跑不够，那么大概率是本地中招，本地重新安装干净的系统解决。</p>

# 免责声明
<p id="flsm">
开发者仅在技术及爱好的驱使下维护此软件，本软件仅验证技术过程。

用前请遵循当地法律，不允许的区域内禁止使用。

使用此软件造成的法律问题, 一概与软件作者无关。
</p>


# 联系我们

<p>Telegram: <a href="https://t.me/+VK7ZOlKvcLljYjQ1">https://t.me/+VK7ZOlKvcLljYjQ1</a></p>
<p>Discord: <a href="https://discord.gg/NCsx4y8AR9">https://discord.gg/NCsx4y8AR9</a></p>

<p align="right">(<a href="#top">back to top</a>)</p>


[contributors-shield]: https://img.shields.io/github/contributors/kt007007/KTMinerProxy.svg?style=flat
[contributors-url]: https://github.com/kt007007/KTMinerProxy/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/kt007007/KTMinerProxy.svg?style=flat
[forks-url]: https://github.com/kt007007/KTMinerProxy/network/members
[stars-shield]: https://img.shields.io/github/stars/kt007007/KTMinerProxy.svg?style=flat
[stars-url]: https://github.com/kt007007/KTMinerProxy/stargazers
[issues-shield]: https://img.shields.io/github/issues/kt007007/KTMinerProxy.svg?style=flat
[issues-url]: https://github.com/kt007007/KTMinerProxy/issues
[license-shield]: https://img.shields.io/github/license/kt007007/KTMinerProxy.svg?style=flat