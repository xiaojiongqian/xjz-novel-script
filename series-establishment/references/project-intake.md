# Project Intake and Form Identification

Use this reference for initialize and rebuild work, or whenever the project form is not already locked. The goal is to discover consequential decisions without turning the start of a creative project into a long survey.

## Intake sequence

1. Inventory the user's words, attached proposals, existing files, folder conventions, and already confirmed facts.
2. Separate facts into `explicit`, `inferred`, `provisional`, and `missing but consequential`.
3. Determine the project form from evidence before asking about minor preferences.
4. Ask one compact batch of high-impact questions only for consequential gaps. Prefer three to seven questions; fewer is better when the brief is already strong.
5. Offer a recommended default with each difficult choice. If the user asks the skill to decide, use the default and label it provisional rather than blocking.
6. Present an intake result before deep generation so the user can see what was understood.

Do not ask for information already present in source material. Do not ask about distant sequel detail before the current production unit is stable.

## Form decision table

| Evidence | Comic series | Picture-book series |
|---|---|---|
| Basic unit | episode, chapter, issue, page, panel | book, volume, page, spread, page turn |
| Image grammar | multiple sequential panels, balloons, captions, panel action | one dominant page/spread composition, narration-image interplay, occasional spot vignette |
| Script need | page and panel breakdown | page/spread text plus concise illustration intent |
| Typical pacing language | panels per page, beats per scene | spreads, page turns, repeated refrain, reveal spread |
| Series cadence | episode-to-episode continuity | book-to-book continuity; each book often has its own emotional closure |

Use explicit user labeling as the strongest evidence. Production grammar is next. Marketing labels and filenames are weaker evidence.

Classify as `hybrid/undetermined` when the user requests both panel sequences and picture-book spreads as equal default grammars, or when sources contradict each other. Ask this decisive question: “最终交给画师的脚本，默认需要逐格说明，还是只需要逐页/跨页给出文字与画面意图？” The first answer indicates comics; the second indicates picture books. A picture book may contain occasional inset images without becoming a comic.

## Shared charter questions

Resolve these from evidence first, then ask only about gaps that change the result:

- working title and one-sentence premise;
- intended form and production unit;
- reader age, reading stage, and content boundaries;
- genre, tone, setting, theme, and forbidden elements;
- planned series length and current planning horizon;
- production language and display-name language;
- visual medium, reference images, target image models, and required aspect ratios;
- output folder, filename convention, existing artifacts, and source-of-truth hierarchy;
- decisions the user wants locked versus choices the skill may recommend.

## Comic-only intake

- pages per episode or chapter;
- approximate panels per page and allowed exceptions;
- dialogue reading level and script language;
- required panel fields, such as visual, dialogue, caption, and sound effect;
- serialization cadence and episode-report language;
- whether completed scripts are immutable during future canon changes.

## Picture-book-only intake

- books in the series and whether each book must stand alone emotionally;
- total pages or spreads per book, including or excluding cover, endpapers, title, and copyright pages;
- single-page versus double-page spread as the normal planning unit;
- total manuscript word budget and target words per spread;
- narration, dialogue, refrain, or wordless-page preferences;
- page-turn reveal rhythm and any mandatory quiet spreads;
- whether illustration notes should describe only essential story information or also composition;
- trim size, bleed, safe area, and print constraints when known.

Do not force comic concepts such as panel density, balloons, or per-panel camera instructions into a picture-book intake.

## Required intake result

Before generation, record:

```markdown
## Project Intake Result
- Mode: Initialize / Rebuild / Audit / Maintain
- Form verdict: Comic series / Picture-book series / Hybrid or undetermined
- Verdict evidence:
- Explicit requirements:
- Safe inferences:
- Provisional defaults:
- Blocking decisions, if any:
- Output and language conventions:
```

If no blocking decision remains, proceed. If a single missing answer would materially change the files or production template, ask it before writing those artifacts.

