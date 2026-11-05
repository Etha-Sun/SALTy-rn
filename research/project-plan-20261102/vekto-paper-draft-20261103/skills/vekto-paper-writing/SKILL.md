---
name: vekto-paper-writing
description: Draft, translate, or revise Yuechun Sun's Vekto and related programming-languages research manuscripts, preserving terminology, technical scope, evidence strength, and LaTeX content. Apply the user's eight writing rules and PL figure/table conventions; not a license to run experiments or change claims during polishing.
---

# Vekto paper writing

Read the current conversation decisions, paper outline, exact source identities, and evidence boundaries before drafting. Use the available humanizer skill alongside this skill. The following user requirements take precedence over generic brevity rules, example prose, or one-claim-per-paragraph heuristics.

## 用户明确的八条写作要求

1. **沿用论文已有术语，不随意换词或造标签。** 方法、baseline、指标和操作保持一致。不要用新造的连字符短语包装解释，例如 `verifier-only RL ablation`、`better-constrained diagnostic context`；直接写 baseline 名称，说明建立了哪些事实、这些事实起什么作用。正规的技术术语和惯用连字符可以保留。
2. **概念在使用的位置就要能读懂。** 读者应能确定术语指什么、具体是什么意思。不能仅因为前面定义过，就省略必要的联系。优先解释实际操作：拆分什么、匹配什么、统计什么、优化什么。
3. **不用破折号压缩逻辑。** 不用 em dash、en dash、带空格的连字符或 LaTeX `---` 连接正文分句，即使参考写作样例用了也不例外。必要时拆成两个完整句子，明确主语、条件及逻辑关系。数学减号、数值范围、代码和规范术语保留。
4. **清晰优先于简短。** 必要的重复、定义、例子和适用范围都可以保留。不要强行把所有句子缩短，也不要用分号、修饰语堆叠或缩写标签替代原来的歧义。**不规定每段只能有一个 claim，也不规定每段最多几句话。**
5. **形成连贯的科学论证。** 面向“懂这个领域、但第一次接触本研究”的读者，交代问题、相关限制、设计选择及证据。不要为不同组件临时编造不同动机，也不要夸大前人局限来制造对比。Related Work 按有意义的差异及其后果组织。
6. **结论强度必须匹配证据。** 区分测量结果、案例观察、候选解释和已经证实的因果关系。重点检查 `because`、`therefore`、`thus`、`primarily due to`。总体提升不能写成所有数据集都提升；小数据集的百分比敏感，也不能解释某个方法具体为什么失败。已经成立的结果同样不必机械弱化。
7. **结果要解释科学含义，失败要解释具体机制。** 不只罗列分数，也不追加重复结果的口号。说明比较带来的实际结论、条件或限制。解释失败时指出具体任务、操作、条件或代码，不能用 `scope mismatch` 这类抽象标签代替分析。例子、执行状态和数值必须有来源，不能编造。
8. **只修改授权范围，保留技术内容。** 局部修改前阅读必要上下文；保留 LaTeX 命令、引用键、label、公式、数值和代码。技术不一致单独报告，不能当成润色悄悄改掉。分析或规划请求不授权修改论文；润色也不授权新增实验、承诺未来研究或删除实质主张。

## Programming-languages manuscript presentation

- Typeset code from editable source with syntax highlighting in the eventual LaTeX manuscript, using listings, minted, or an equivalent source-based environment. Never substitute screenshots for code. Preserve technical content and source provenance; put explanations in captions and reference line numbers where useful. Do not start LaTeX implementation when the user only asks to record this requirement.
- For a motivating example, connect visible SIMD architecture differences to actual semantic definitions, verification feedback, a feasible counterexample, a justified minimal repair, and verification of that repaired optimized source. Performance comparisons must use the same platform and identified versions. A claim that bounded verification missed a bug requires a same-version passing record and a specific explanation; bounded symbolic verification already covers all modeled values at each selected length and can itself produce counterexamples.

- Write connected manuscript prose, not project notes or a transcript. Keep task coordination and editorial decisions in a separate author note.
- Use LaTeX booktabs/longtable tables for detailed coverage, proof time, tokens, resource use and changes. Do not render tables with plotting software. Include editable table sources in deliveries.
- Put figure explanations, status and synthetic-data disclosures in captions. Inside figures retain only meaningful diagram labels, axes, legends and panel labels. No large slide titles, upper-left commentary, promotional text or dashboard styling.
- Use an available figure skill for vector export and actual render inspection. The user's caption requirements override any skill's promotional caption suggestions.
- Real experimental cells remain TBD until evidence exists. If explicitly authorized, fabricated data may appear only in clearly disclosed layout illustrations, with synthetic filenames/data and captions. Never use them to narrate empirical findings or classify real kernels.
- Preserve the distinction between partial correctness, termination, source-to-model correspondence, and ISA/compiler trust. Two implementations satisfying a permissive specification are not necessarily equivalent.
- Keep source A unchanged by default; source changes and specification strengthening require their own justification. A feasibility argument for a new precondition must cover legitimate original calls, not merely reject a counterexample.
- English and Chinese versions must agree on definitions, scope, result status and citations. Translation may restructure sentences without inventing evidence.

## Final checks

Read the draft for logical continuity and terminology, then check numerical provenance, theorem assumptions, captions, relative asset links and editable LaTeX tables. Search prose for dash-based clause joining and unsupported causal language. Compile table previews when a local TeX environment is available, inspect the rendered output, and report actual validation only.

Source: the user's eight explicit requirements and PL figure/table feedback, 2026-11-03. This is a writing skill, not evidence of project implementation or experimental completion.

