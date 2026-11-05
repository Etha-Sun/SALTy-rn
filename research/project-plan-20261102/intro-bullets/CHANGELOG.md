# Introduction bullet points 版本记录

## v1-original.md

从对话中的第一份完整九段 bullet points 恢复，作为本轮回退基线。未采用后来整段简化的版本。

## v2-preconditions.md（当前版本，2026-11-04）

仅修改两处 calling contract 表述：

- 第 3 段：the calling contract → the preconditions in the spec。
- 第 5 段：explicit calling contracts → the preconditions in the spec。

其他正文保持与 v1 完全相同。没有加入后续版本的 “Verify the same optimized code used in performance measurements.”。第 4 段保留作者指定的 “Comparing kernels across ISAs requires a shared basis for reasoning about their behavior.”。

完整差异见 v1-to-v2.diff。本轮未修改 LaTeX 论文。

后续编辑从当前版本复制为新版本，并记录逐行 diff；不要覆盖历史版本或进行未经要求的顺带改写。

## v3-assembly-scope.md（2026-11-04）

只修改第五段。按作者指定，以对话中“assembly 缺点是不是太少”之前的六条版本为基础，仅新增一条 exception handling / privileged execution 的范围说明。没有采用后来加入的“编译展开”“证明离源码更远”等论点。

输入取自作者已编辑的 v2 文件，包含 `kernel outputs (memory access...)` 和 `Assembly-level proving involves ...`。完整保存为 v2-before-v3.md，避免覆盖或丢失作者修改。其他八段与此输入逐字相同。差异见 v2-to-v3.diff。未修改 LaTeX 论文。

## v4-isa-models.md（当前版本，2026-11-04）

仅替换第五段的一条 assembly 描述，改为两条：分别说明 NEON/RVV 使用不同 ISA 模型，以及证明需要关联这些状态并对应固定宽度 SIMD 与 VLA 的计算。exception handling / privileged execution 及其余内容均未修改。

以作者当前已编辑的 v3 为输入，完整保存在 v3-before-v4.md；保留作者对第 3、6 段的修改。差异见 v3-to-v4.diff。检查确认本次只有一行删除、两行新增，其他八段逐字相同。未修改 LaTeX 论文。

## 直接更新 V2（当前工作文件，2026-11-04）

按作者要求，将确认后的第五段写回 v2-preconditions.md，其他八段保留 V2 原文。后续在 V2 上编辑，不再另开工作版本。修改前副本为 v2-before-paragraph5-update.md，差异见 v2-paragraph5-update.diff。V3/V4 仅作历史记录。

## V2：调整 assembly 的三个逻辑点（2026-11-04）

按作者要求，仅修改第五段的三条 assembly 说明：ISA 模型中的寄存器、内存、控制流与指令行为；NEON 和 RVV 两个模型之间的对应关系；验证范围之外的异常处理与特权执行。其余内容保持不变。修改前副本为 `v2-before-assembly-three-points.md`，差异见 `v2-assembly-three-points.diff`。

## V2：按作者确认更新第七段（20261104-173029）

突出专家只需审核等价性 spec 与验证反馈，再根据反例补充前置条件或修复实现并重新验证。仅修改第七段。修改前副本：`v2-before-paragraph7-20261104-173029.md`；差异：`v2-paragraph7-20261104-173029.diff`。

## V2：补全第八段三个任务的动机与价值（20261104-173504）

按作者原始中文批注，补回同 ISA／跨 ISA 的 kernel 和程序优化验证、测试漏洞与 reward hacking、已有实现的复用与人工迁移成本，以及跨 ISA 实现的直接比较、具体反例和修复用途。仅修改第八段，尚未完成的实验不写为已有结果。修改前副本：`v2-before-paragraph8-20261104-173504.md`；差异：`v2-paragraph8-20261104-173504.diff`。
