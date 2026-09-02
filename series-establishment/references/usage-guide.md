# Chinese Beginner Usage Guide Contract

Use this reference whenever initializing or rebuilding a project suite. Create one Chinese Markdown guide in the project root. Prefer `00_使用说明.md` for a new project; in an existing numbered suite, avoid disruptive renumbering and use `使用说明.md` or the user's next available number. Link it from the project overview.

The guide is a project-specific navigation manual, not a generic copy of this skill. Use the actual filenames, project form, languages, prompt conventions, and production folders generated for that project.

## Required sections

### 1. 这套文件能做什么

Explain that the suite locks story logic, names, visual identity, production templates, and continuity before serial production. State what it does not do automatically, such as approving unconfirmed canon or guaranteeing permanent memory in an image model.

### 2. 项目形式与推荐工作顺序

State the locked verdict: 漫画系列 or 绘本系列. Give a short path from overview → world/outline → character and location art → prompts → script → report → canon writeback. Explain which files are reference-only and which are edited every production unit.

### 3. 文件地图

Provide a table using every actual generated file:

| 文件 | 用途 | 什么时候查看 | 什么时候更新 | 不应放入什么 |
|---|---|---|---|---|

Cover overview, world bible, outline, character/art bible, character prompts, continuity rules, primary and secondary location prompts, script template, report template, change log, and any project-specific additions.

文件地图必须用中文逐项解释以下实际产物：项目总览、世界观设定、系列/季/册大纲、人物设定与美术圣经、角色生图提示词库、连续性与创作规则、主要场景提示词库、次要场景提示词库、当前形式的脚本模板、生产报告模板、正史变更记录，以及该项目新增的任何专用文件。不能只列文件名而不说明它们之间的依赖关系。

### 4. 生图提示词库怎么用

Explain a repeatable workflow:

1. Start a new image-model conversation or generation batch by supplying the complete fixed series prefix and asking the model to use it as the style baseline for the current session.
2. Do not imply permanent cross-session memory. Re-send the prefix after starting a new session, changing models, or losing context.
3. Append one detailed character or location prompt for first-pass key art. Use the compact version only when context is limited or the model already has the current-session baseline.
4. Append shot, pose, expression, time, weather, or temporary plot state after the stable subject prompt. Temporary anomaly states do not belong in the static library.
5. Append the shared negative prompt and preserve all non-drift anchors.
6. For a group scene, combine the group-composition rule with each included character's essential anchors. When supported, provide approved reference images or stable seeds in addition to text.
7. Compare output against the checklist before approving it as a reusable reference.

Include a project-specific copyable formula:

```text
[系列固定前缀] + [角色或场景详尽/精简提示词] + [本次构图、动作与临时状态] + [统一负面词]
```

Explain that a model can still drift; text prompts improve consistency but do not replace reference images, model settings, seed control, or human review.

### 5. 脚本模板怎么用

For comics, explain pages, panels, dialogue level, and why new canon cannot be improvised inside a panel. For picture books, explain pages/spreads, manuscript text, concise picture intent, page-turn rhythm, wordless pages, and why panel-level micromanagement is normally omitted.

### 6. 报告与正史回写

Explain that every finished production unit needs a report listing all appearing characters and shown locations. Describe `locked`, `provisional`, `candidate`, `seed`, and `deprecated` in plain Chinese. Tell beginners to update stable facts only after approval and to log changes rather than silently overwriting canon.

### 7. 常见错误

At minimum cover name drift, skipping the fixed prefix, assuming persistent model memory, mixing detailed and contradictory styles, placing one-off anomalies in static prompt libraries, introducing unapproved powers or villains in scripts, omitting minor locations from reports, and editing only one of several affected canon files.

### 8. 可直接交给 Codex 的请求示例

Give short project-specific examples for creating the next script/book, auditing continuity, adding a character or location, updating a locked fact, and generating art prompts. Examples are user prompts, never hidden instructions.

## Accuracy gate

- Every listed filename exists or is explicitly marked planned.
- The guide uses Chinese even when scripts are in another language.
- Instructions match the locked project form and do not describe the inactive script template as active.
- Prompt instructions distinguish current-session context from permanent memory.
- The guide links to the actual project artifacts with relative Markdown links when possible.
- The guide is detailed enough for a first-time user but does not duplicate full canon content.
