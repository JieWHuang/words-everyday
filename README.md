# words-flashcard
[![platform](https://img.shields.io/badge/platform-markdown-blue.svg)](https://shields.io/) [![contributions](https://img.shields.io/badge/contributions-welcome-green.svg)](https://github.com/huangyz0918/words-flashcard) [![author](https://img.shields.io/badge/principal-huangyz0918-yellow.svg)](https://github.com/huangyz0918/words-flashcard)

每日背单词记忆卡片（GRE佛脚词汇）

<img src="https://i.loli.net/2018/05/10/5af3b02769994.png"/>

一个既可以满足快速刷完单词书，又可以满足每日在Github上面打卡成就感的小玩具 : )

欢迎查看签到表 --> [签到表 :book:](./days)

## Features ? (功能指南)

- 每日从仓库电子表格中选取一部分单词，自动写入每日的 `Markdown` 文件里（也就是在 `./days` 下创建一个新的文档用于放置今日的单词）。
- 自动将新的单词 `push` 到你的 Github 帐号下，可以直接将 Github 变成新的背单词工具，每天更新自定义数目 (默认30个) 新单词，每天坚持打卡，直到将整本单词书背完。

**待开发功能：**

- 复习功能，将之前几天背完的单词乱序按照一定记忆曲线重新 `push` 到每日单词计划中。

## How to Use  ? (使用指南)

- 在开始使用之前，请先确保你有一台配置好 `Git` 的电脑（服务器）。
- 将本项目 `fork` 到自己的 Github 账号下。
- 将自己的 **fork** 克隆 (`clone`) 到服务器主机上，配置好 Github，使其能够有权限推送。
- 配置好对应的依赖，可以使用repo中带的`requirement.txt` (懒得写版本号，大家就用`pur`凑合更新到最新版就好)。
- 运行脚本：`sudo sh deploy.sh`。

**设置每日自动推送**
- 输入:  `crontab -e`。
- 在文件末尾加入一行: `00 00 * * * /root/words-flashcard/deploy.sh` (路径根据`clone`位置决定)。
- `00 00`代表每日零点自动执行该脚本，可以自定义。
