# RVV 指令内部的 lane loop 与受检查 loop block

记录与调研日期：2026-10-03。状态：经过源码/文献审计的候选；抽象 pilot 编译与 fresh 内核复查通过，真实 ISA bridge 尚未证明。没有把此候选自动采纳为实现路线。

## 用户原话

> 我们能不能将rvv的视作一个操作然后以及类似vl的循环，如果我们能在解析的时候把它变成一个loop block是不是可以解决我们目前无法证明，或者速度极慢的问题

## 1. 对想法的解释

我将这个问题分成两个层次。

第一层是**一条向量指令内部**：例如 `vle8.v` 对活动 lane 读取内存并更新目的向量，可用带 index、vl、mask、vstart 和明确状态效果的 loop block 表示。

第二层是**完整 kernel 的外层 strip-mining 循环**：每轮设置 vl、执行一组向量操作、推进指针并减少剩余长度。当前 Coq 条件性 RVV 证明已对这一层做良基归纳，手写 Lean 模型也已有完整 kernel 定理。因此最直接对应当前加载瓶颈的是第一层。

假设第一阶段沿用当前无异常 RAM、unmasked、vstart=0、SEW32/LMUL1/VLEN256 配置，保留原 Hload 合同。任意 VLEN、mask、ta/ma、异常与 MMIO 是后续范围，不能默认为第一版已覆盖。

## 2. 答案与创新边界

**可行，值得实验，但“解析时改成循环”本身不保证正确或加速。** 它改变语义表示和证明组织，必须证明新块与原 trace/ISA 之间的关系，并核查完整证书。

最接近工作是 [Hydride，ASPLOS 2024](https://hydride.cs.illinois.edu/files/2024/04/Hydride.pdf)，已经做 SIMD 语义 loop rerolling 与参数抽象；[Lift-off / ASLp](https://github.com/UQ-PAC/aslp) 已保留未知界限的 while；[Islaris](https://www.cl.cam.ac.uk/~jp622/islaris.pdf) 已能组合机器程序循环。文献对照和具体范围见 [调研](../cross-isa-20261003/LITERATURE.zh-CN.md)。

2026-10-03 追问补充：Hydride 的 Figure 3 将 interleave 指令的重复切片重构为循环；§6.2 明确不支持 load/store 指令合成。因此表示思路有实质重合，当前 `vle8.v` 的真实内存合同仍是不同的证明任务，不能把二者说成已解决同一个问题。

候选增量应是：针对 RVV，导出带**可检查语义证书**的结构化块，处理动态 lane 活动、寄存器表示、内存 frame 和分块策略，并使真实程序的无界规格证明更便宜。仅新写一个抽象 for，或让 parser 信任未经证明的摘要，增量不足。

## 3. 当前证据支持什么

审计详见 [证明地图](../cross-isa-20261003/PROOF-AUDIT.zh-CN.md)。

- Coq 的加载 `Hload` 要覆盖 VL=0..8；仅 VL=0/1 已完成。上层 loop、kernel、byte spec 可以在 Hload 参数下组合。
- 原始加载 `.isla` 解压为 147,213,679 字节，原 Coq trace 为 2,481,220 字节，常量共享版为 2,365,368 字节。原版和共享版均有 288 个 vr2 写节点、36 个内存读节点、8 个分支节点。这些是整棵语法树的词法计数，不是一次执行的动态访问数，也不是总执行路径数。
- 常量共享版已由 `a800001ca_shared_exact` 证明等于原 trace。不能把“使用公共位宽常量”当作尚未尝试的新办法；它并未消除重复的整寄存器更新。
- 历史 VL1 加载证明有约 1962/2205 秒的成功编译记录；VL2 曾有 byte-read tactic 地址形式不匹配后被取消的记录。这里既有表示成本，也有自动化问题；失败不能都归结为动态 vl 不可证明。
- [已有手写 Lean RVV 模型](../assembly-reduction/Machine.lean) 的 `writeVector` 本来就用 `List.range.foldl`；其完整 reduction kernel 本次重查通过。它不含 Sail refinement，恰好说明“易证模型”与“真实语义桥”是不同工作。

成本数据的来源/口径和当前运行见 [运行报告](../cross-isa-20261003/RUN-REPORT.zh-CN.md)。不同主机、不同命题的时间不能拿来计算 speedup。

## 4. 新 block 应有的合同

以受限 `vle8.v` 为例，目标不仅是得到一个向量函数，还需要：

```text
sources := 原始状态的快照
for i in [0, vl):
    if vstart <= i and enabled(mask, i):
        读取 sources.memory[p + i]
        更新 destination 的 byte lane i
按所选 tail/mask policy 处理非活动 lane
按模型约定规范化目的寄存器表示
成功执行时更新 vstart 等规定状态
恢复输入内存与未改动寄存器资源；进入 pc+4
```

这里的 sources 快照避免将后一次 lane 读取意外解释成已修改的目的寄存器。Load 的内存效应也不能从纯 `input : Nat → Byte` 函数直接推出。

对当前 `loaded8`，需要精确连接如下结构：

\[
\operatorname{pack}_{32}\bigl(i\mapsto
   \text{if }i<vl\text{ then }M[p+i]\text{ else }\operatorname{byte}(old,i)\bigr).
\]

`pack32` 只装入 256 位，外层 Sail 容器却是 65536 位。这个表示规范化不能省略：即使 VL=0，整个 old 也不一定保持。可选择证明精确打包相等；或者引入 abstract relation，只观察真正寄存器内容，并证明所有后续指令对此关系相容。后者不直接满足现有任意 old 的精确 Hload，接口迁移成本必须计入。

## 5. 三条实现路线

| 路线 | 做法 | 语义义务与代价 |
| --- | --- | --- |
| A. 原 trace 的证明支持摘要 | 保留原 trace；用通用 lane-update/packing/frame 引理为它证明 block 合同。Parser 可以建议匹配和生成证书 | 不必改变 Islaris trace 语法；证书仍受 Coq 检查。若匹配最终需要展开所有分支，成本可能仍高 |
| B. Parser rerolling + 结构化 trace | 识别展开模式并产生 loop AST，同时生成原/新 trace 对应证书 | 当前 `isla_trace` 无 loop 构造。需新操作语义、WP 规则、simulation，或将 block 降回现有逻辑并证明对应；不能仅修改 parser |
| C. 在 Sail / IR 层保留循环 | 避免先产生巨大展开 trace，再恢复循环；导出参数化块与语义桥 | 有望避免生成成本；需支持结构化语义、状态/异常和提取正确性。工程范围最大，不能先绕开当前真实义务再宣称解决 |

建议先做 A 的固定配置实例，选择 VL=2 作为首个未闭合真实加载案例。先证明“相同合同可以闭合且完整检查更便宜”，再决定 B/C。A 不是最终规模化承诺：若成本由展开树本身主导，早期保留循环的 C 可能更有优势。

## 6. 正确性义务清单

这是研究中的语义要求，不是额外审批流程。

1. **语义来源**：固定 opcode、Sail 快照、配置与提取约束；证明摘要对应这些输入。
2. **任意活动 lane**：i 的值正确，包括宽度、地址、扩宽与符号解释；VL=0、边界 VL 都要覆盖。
3. **未活动内容与容器**：prestart、masked-off、tail、物理分组别名、高位规范化的约定一致。
4. **内存**：访问集合与权限正确，输入保持，不会将 masked-off lane 也读取；若不覆盖 faults/MMIO，合同明确限定普通 RAM。
5. **状态与控制**：pc、vl/vtype/vstart 及平台寄存器效果完整；illegal configuration 不能被吞掉。
6. **组合**：block 合同确实实例化 Hload；然后接上现有 loop/kernel/spec。
7. **检查边界**：无新增未证明公理、无 `sorry`、无隐藏 trusted replacement；完整 proof object 检查成本计入实验。

支持一般 RVV 时，还要处理 mask、ta/ma 的允许非确定结果、EEW/EMUL/重叠、无序内存和精确异常/重启。这些来自 [RVV 1.0 规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)，不能只按 SIMD map 的直觉补全。

## 7. 最强反对理由与竞争解释

**最强反对理由**：现有手写 loop 模型已经可证明，新增 parser 只是搬运这份模型；最难的原 ISA refinement 未减轻，而桥接证书甚至比直接证明更贵。Hydride 已覆盖 loop rerolling 的主要表示创新，因此仅做 rerolling 不足以支撑论文。

竞争解释如下。

| 假设 | 可区分的预测 |
| --- | --- |
| H1：重复整寄存器重建主导成本 | lane/packing 摘要使 Qed 和 object check 明显下降；只修 tactic 或共享常量不足 |
| H2：主要是 matcher/自动化缺陷 | 修正 byte-read 和资源组织后，原 trace 在相同资源预算内即可闭合 |
| H3：主要是 Coq conversion / proof term 形状 | loop 文件虽小但 bridge/coqchk 仍昂贵；应比较反射、opaque 分层和缓存证明，而非只看 parser |
| H4：提取展开树是主要瓶颈 | 从结构化 Sail 保留 loop 才能明显减少生成/内存成本；事后 rerolling 帮助有限 |

这些是假说，本次未得到同一 Coq 环境的受控对照，暂不选择其中一个作为已确定原因。

## 8. 本次最小 pilot 与它的边界

[LoopBlockPilot.lean](../cross-isa-20261003/LoopBlockPilot.lean) 建立一般 lane loop 的单点读出定理，覆盖任意 vl、start、mask 和任意源快照；由此推出活动 lane 更新、tail 保留和 prestart 保留。它另外包含三项具体不等性反例：忽略 mask、忽略 vstart、忽略宽容器规范化会改变结果。

[run-pilot.py](../cross-isa-20261003/run-pilot.py) 编译、报告传递公理、fresh kernel 复查，再将三项不等性误改为相等，要求 Lean 拒绝全部错误命题，并输出当前 trace 词法 profile。本次上述检查全部通过；结果保存在 [RESULTS.json](../cross-isa-20261003/RESULTS.json)。负例用于检验关键遗漏，不能代替源语义证明；mask/vstart 负例针对一般化表示，不是在报告当前 unmasked 配置中的 bug。

该 pilot 使用 undisturbed lane 的纯函数；没有真实内存权限、异常、ta/ma、多寄存器重叠，也没有到 Isla 的 bridge。它没有解除 Hload，没有测到 ISA proof speedup。它验证的是引理组织可以复用，以及上述简化确实不能无条件采用。

## 9. 最小可证伪实验

第一步恢复固定 Coq 8.19/Islaris 环境，复现 NEON 小模块与顶层。第二步用原始和 shared trace 建立同一 VL2 加载合同基线，先修已知 matcher 问题。第三步引入 lane-loop/packing 摘要，但保留原 opcode、原输入域和原 postcondition。

基线与候选逐项记录：生成时间、coqc/证明搜索时间、Qed 时间、递归 coqchk 时间、峰值 RSS、proof object 大小、维护代码量。分别报告冷缓存首次桥接和暖缓存后续 kernel，不能只计入调用已缓存 block 定理的毫秒时间。

最低成功条件：VL2 的真实合同编译和递归 coqchk 通过，原高位表示效果一致，无额外公理；完整 Hload 则还要覆盖 VL0..8，实例化原条件性程序，并复查最终输出/内存合同。

必须保留的负例：遗漏某个活动字节；错误 lane 地址；inactive 仍访问内存；mask/vstart 遗漏；任意 old 的高位错误；不同 widths/alias 的来源误读。浮点归约不在首个整数实验范围，可作为“不能无条件推广分块”的负对照。

淘汰/转向条件：桥接检查总成本无收益；只能弱化合同或提高信任边界才能成功；VL2 改进不能复用到 VL3..8；修复 matcher 已同样有效；或者差异化主要贡献已被近邻工作覆盖。若只有当前快照的包装优化，可保留为工程成果，不必强行形成通用论文主张。

## 10. 与前两份 idea 的关系

[001](001-cross-isa-spec-interface.zh-CN.md) 是两个 ISA 到共同 F 的接口；[002](002-rvv-small-vl-reference.zh-CN.md) 是受条件约束的分块/小 vl 参考路线；本 idea 是指令内部的语义表示及受检查的 lifting。三者可组合，但证明义务不同。

可形成的链是：真实 ISA → 精确 lane block → 任意分块 kernel → 共同 byte/memory 规格 → cross-ISA 观察等价。当前最缺的仍是第一条真实桥，而非最后的列表求和恒等式。
