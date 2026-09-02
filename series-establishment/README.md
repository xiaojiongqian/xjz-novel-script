# Series Establishment

用于漫画和绘本系列的前期立项：项目问诊、形式识别、世界观、大纲、人物美术、角色与场景提示词、连续性规则、脚本模板，以及中文项目使用说明。

## 从 GitHub 安装到 Codex

### 方法一：让 Codex 安装

把仓库链接交给 Codex，并发送：

```text
使用 $skill-installer，从我提供的 GitHub 仓库安装 series-establishment。
SKILL.md 位于仓库根目录，源路径为 .，安装名称为 series-establishment。
请安装到当前用户主目录下的 .agents/skills/series-establishment，供个人项目使用。
如果已有同名安装，先告诉我，不要覆盖。
```

这段请求需要同时提供实际 GitHub 仓库链接。下载公开仓库通常不需要 GitHub 登录；私有仓库需要访问权限。

### 方法二：手动安装

1. 在 GitHub 仓库选择 **Code → Download ZIP**，解压。
2. 找到直接包含 `SKILL.md` 的文件夹，将其命名为 `series-establishment`。
3. 将整个文件夹复制到个人技能目录，不能只复制 `SKILL.md`：
   - Windows：`%USERPROFILE%\.agents\skills\series-establishment\`
   - macOS / Linux：`~/.agents/skills/series-establishment/`
4. 安装后的入口必须是 `series-establishment/SKILL.md`，不要多套一层同名目录。未显示时重启 Codex。

[Codex 官方技能安装与加载说明](https://learn.chatgpt.com/docs/build-skills)

## 如何使用

在你的项目文件夹中打开 Codex，发送：

```text
使用 $series-establishment，根据这份企划进行项目问诊，识别漫画或绘本形式，
生成前期设定、提示词库、对应的脚本与报告模板，以及中文使用说明。
全部输出为 Markdown，保存在当前项目文件夹。不要直接创作整话或整册成稿。
```

正常使用不需要额外安装 Python、Node 或其他私人 skill。实际生成图片需要自己的生图工具；本 skill 负责提供提示词，不自带生图服务。

## 更新与卸载

- 更新：先将旧版移到技能目录之外备份，再安装新版，避免覆盖个人修改或产生同名副本。
- 卸载：仅移除个人技能目录中的 `series-establishment` 文件夹，不删除已创作的项目文件。若安装入口是链接，先确认它指向哪里。

## 文件与许可

- `SKILL.md`、`agents/`、`references/`：运行必需，请完整保留。
- [CHANGELOG.md](./CHANGELOG.md) 与 [VERSION](./VERSION)：版本说明。
- [LICENSE](./LICENSE)：允许他人下载、安装并用于自己的项目；具体范围见许可文本。

维护者将本目录直接同步为 GitHub 仓库根目录即可。GitHub 上传后的实际回下载需另行验证；本地检查不能保证网络或账户权限始终可用。
