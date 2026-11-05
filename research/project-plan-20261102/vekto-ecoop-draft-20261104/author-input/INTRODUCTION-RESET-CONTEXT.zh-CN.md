# Introduction 重写上下文

这是助手依据作者原话整理的工作摘要，不是作者原话，也不是系统已经执行上下文压缩的记录。原话见 `INTRODUCTION-PROMPT.zh-CN.md`。恢复工作时先读这两个文件，再读写作 skill 和样例 Introduction。

## 当前任务

重写英文 LaTeX Introduction，按照作者原来的九段逻辑。不要写 Abstract。允许略长，不设 760 词或 1.5 页上限。保存旧稿，编译检查，提供逐段中文译文与作者原文的对照。

## 作者叙述顺序，不能再擅自调整

1. 硬件专用化/加速的整体背景 → 发挥硬件性能需要大量 human effort。最新反馈要求第一段只讲任务难，不再加入 agent 进展。起笔不是泛泛的 numerical software，也不是硬件电路设计。
2. 从上段硬件专用化自然收束到现代 CPU 内的 SIMD/vector units → RVV 的技术价值和库支持需求 → 已有 NEON/AVX kernel 可作为迁移来源 → 架构差异 → C intrinsic 让程序员在 C 中使用向量指令。此段不展开 agent，不以 “We focus on ...” 代替过渡。
3. 上段的 intrinsic 编程接口为 agent 提供实现和优化平台 → 结合语义说明/硬件知识 → 正确性及评测漏洞 → 已有测试/形式化验证基础 → 我们要处理的完整 kernel 等价性。具体系统只在比较必要时展开，引用不能成为工具目录。
4. 为跨 ISA 验证建立语义的不同层次：机器指令/Sail/Islaris，IR/Alive2/Rake，C intrinsic 的 C 解释。保留作者要讨论不同路径的意图。
5. 根据 functional equivalence 目标说明为什么选择 C。不是宣称 ISA 层一定不可行，也不说 C 自动解决所有差异。强调源码、内存、循环与 intrinsic 语义直接连接和可审查性。
6. Vekto 方法：共享可复用 shim、共同输出规格、QCP 生成 VC、各自循环/内存证明、spec/impl/proof 分离。Agent 产生证明或调查反例，不能声称 QCP 总能找反例。
7. 专家对契约和验证反馈的审核；调用域证据支持加强 spec；真实差异促成有理由的目标端修复，重验并测性能。
8. 三用途：优化验证、跨 ISA 新 kernel 迁移、独立实现 cross-checking。迁移动机指具体库覆盖差异，不杜撰 HVX 为新 ISA。判断差异是否构成缺陷要看契约。
9. 实验：35 final optimized targets；5 AVX 操作向 RVV/HVX；XNNPACK；softmax 候选组合程序。按最终论文使用 “We evaluate / We verify” 等陈述方式，但所有缺失的实验结果和完成数必须显式标 TODO，不能虚构已完成结果。

## 前两次失败要记住的经验

- 不要把作者的“如何引入”误写成正文宣布研究范围。先构造上段到下段的因果或具体化联系。
- 不要为了变短把作者要保留的论证层次合并掉，尤其是“有哪些语义层次”和“为什么选 C”。
- 不要擅自把 agent 提到第二段。最新反馈将 agent 总体进展也移到 P3，P1 只讲难度，P2 建立 RVV 动机与 intrinsic 接口。
- 文献事实核查应纠正不准确主张，但不能重排成助手自己的另一套论文。引用支持论点，不逐个解说工具。
- 不把审计日志、未做什么的清单、聊天里的辩解塞进 Introduction。必要的保证范围保留一句，细节放方法或作者说明。
- 凝练指每句话承担论证作用，不指强行达到某个词数、短句数量或页数。
- Kernel 是可执行软件。此处作者要求从 hardware specialization 和 programming cost 切入，不意味着研究硬件电路的优化。

## 技术事实边界

- 当前 C-shim packages 是契约与语义模型下的 partial correctness，终止性不在已完成保证内；内存资源/访问/保持存在实质义务。见 `../QCP-GUARANTEE-AUDIT.zh-CN.md`。
- 全部合法长度与任意硬件 VLEN 是两回事。不得删输入域来凑证明。
- SALTyRN 已有 bounded equivalence；LLM-Vectorizer 使用 Alive2。不能称前人没有 formal verification，不能称 first 而不调查。
- 当前未完成新 35 final optimized targets 的 cohort 验证；旧 40 中间版本不能转成结果。
- 四 ISA 是设计和扩展范围，实际 intrinsic coverage 待报告。
- vmax 一元素 NaN 例子体现模型差异，不体现 bounded length 漏检；修复版尚无最终完整证明。已有性能不能声称快于 XNNPACK。
- spec 增强必须覆盖原调用者全部合法调用；原始 source A 默认不改。目标 B 修复应有证据，记录并测性能。
- 无依据的性能数据、首次性和已完成结论不得用漂亮语言补上。

## 本轮重新读取的材料

- `vekto-paper-writing/SKILL.md` 的八条要求与 PL 表述规范。
- `humanizer/SKILL.md` 的正文写作流程、论证、证据与作者覆盖规则。
- SALTyRN PDF 的 Introduction，按两栏正确阅读：硬件专用化 → CPU SIMD → ISA 差异 → 正确性与优化。
- TopoVerus Introduction：学习困难如何引出设计，不复用其研究内容与结果。
- Autocomp v3 §1：硬件价值与编程/优化的人力成本。

## 产物与环境

- 论文目录：`/zp_vegeta/scratch_sb/ycsun/verus/research/project-plan-20261102/vekto-ecoop-draft-20261104`。
- 当前主文件：`sections/introduction.tex`。只改 Introduction 及相关审阅材料，不改 kernel 或实验结果。
- 本轮旧稿：`review/intro-narrative-reset-20261104/introduction.before.tex`，`draft.before.pdf`。
- 编译：TEXINPUTS=/home/ycsun/.TinyTeX/texmf-dist/tex/latex/tools//: TEXMFHOME=/tmp/vekto-texmf TEXMFVAR=/tmp/vekto-tex-var TEXMFCONFIG=/tmp/vekto-tex-config PATH=/home/ycsun/.TinyTeX/bin/x86_64-linux:$PATH bash build.sh。
- PDF render：PYTHONPATH=/tmp/vekto-pdf-only python3，使用 fitz。
- ZIP 应在论文目录的父目录创建，先收集文件列表，禁止把 ZIP 自己纳入压缩。

## 本轮最新写作约束

- 不机械给每段补总结、免责声明或“这表明”式收尾。收尾应完成当前论证或引入下一段必需概念。
- 模型可信性写清人工职责：专家依据 ISA 文档审阅 intrinsic 的语义，程序证明依赖这些定义。不把人的审阅说成已机械验证的 ISA 对应。
- 删除作者指定的 migration 列表句。
- 减少连字符复合描述，用普通句法表达；保留 RISC-V 等正式名称及必要技术术语。
- Reward hacking 用一句直接陈述现象，末尾引用；删除 “Reports of ... demonstrate ...” 的文献转述。
- Keagan 的真实顺序是硬件→CPU SIMD→NEON/RVV差异→正确性与性能→现有方法→LLM流程；他没有单独论证 RVV 影响力。新增的 RVV 价值/库支持动机是本稿按作者反馈作的补充。
