# 第三阶段：卷积三项的实际 proof 续补

本轮已结束：新增整核通过0；conv六个整数helper实际91/91，minmax关键主断言经修正实际5/5。

本目录只包含独立候选与新日志，没有修改旧 kernel、shim、公开 spec/wrapper、模型、checker 或历史 SHA。固定当前 `handoff-model-plus`、VLEN128、native IEEE/RNE；没有切换后续 unary 工具修复环境，没有新增kernel/wrapper输入前提或假定缺失的地址/位表示桥。原始合法域和输出观察保持不变。

没有新增整核通过。`STATUS.json` 汇总实际执行结果，`evidence-sha256.json` 固定本目录公开证据。缺失最终 body JSON 的计数为 null，不是0/0；global6/6、helper91/91或定点绿色均不是整核通过。所有 full 都是独立全量尝试，未冒充正式 checker 的 complete=true。

## proof 实际变化与候选选择

| Kernel | 最新实质候选 | 完整尝试与局部诊断必须分开 |
|---|---|---|
| f32-conv-hwc2chw | `revision3/f32-conv-hwc2chw` | 原本目录首版完整300秒；revision3在新增真实frame和整数helper body证明后再完整1200秒。六个真实整数helper 91/91；新主游标/VL/ky界定点4/5，仍缺cursor保持。 |
| f32-dwconv-minmax | `revision5/f32-dwconv-minmax` | 完整300秒运行的是revision4；revision5仅把同一块对齐assert前置到vsetvl调用前后定点复验，不能把revision4全量当revision5验收。revision4新主程序断言4/5；revision5前置cut后同一5项实际5/5，仍只定点，不是整核。 |
| f32-dwconv2d-chw | `revision2/f32-dwconv2d-chw` | 首版做完整300秒；revision2补真实loop frame后仅定点，9项中6项通过。未在revision2做全量，不混记。 |

conv首版补行奇偶/通道分块/宽度游标与VL；revision2补外层及NEON宽度loop真实assigns、RVV ow/dx/c_in/ky的累加器frame。revision3还合并此前未进入v4全量proof的六个fp_index body候选，并新补inactive-lane结论及zero-suffix循环归纳。91项包含六个函数的完整所选body义务，仍不覆盖整个conv。

dwconv2d首版补三行推进、宽度分块、VL界；revision2补实际修改的输入/输出指针、滚动寄存器、输出区域和errno frame。定点仍缺NEON高度/三行余数保持及RVV三行余数保持。

minmax补块对齐、VL精确值、尾store区间；revision2补真实输入行和packed weights的validity不变量；revision4修复ACSL注释语法；revision5将未证块对齐cut前移，不删除它也不将它当假设。新不变量自身仍须完整body证明。

## 未证原因与下一步

- 当前Typed下canonical_nan、float/word memcpy及指针有效性桥仍未闭合。conv还有大量uintptr偏移；minmax既有row指针+0也有input表+stride，不能因直接roundtrip被CIL消除就认为一般地址桥已证。
- conv新增整数helper已实际闭合，下一步应利用其索引/掩码结论继续将原合法域导入主循环，再解决地址模型；主输出/FMA累计关系仍未证。没有将FMA换成普通乘加。
- dwconv2d的真实frame使9个选定义务中6个闭合，但相应指针/位重解释与最终输出关系仍未证。
- 本目录没有发现真实kernel反例，不能依据timeout修target。主agent另做的原生反例搜索应看其独立证据，不能当WP证明。

## 执行与失败记录

`prepare*.py` 只新建目录，旧checker的prepare执行原C/token/spec守卫，每kernel仍一个proof.patch。`run-case.py` 是有限执行器：配置先于prover解析，绝对入口、wp-par1、同上下文正反控制、实际完整调用闭包；全局lemma单独保存。执行前后核对source/patch/model SHA。其结果显式complete=false；如果以后全绿，仍须主agent正式checker独立验收。

初次 `control01` 为Unknown prover环境错误；后续按旧runner补PATH并将Why3配置移到prover参数之前。minmax首版的多条assert写在同一ACSL注释块造成解析错误，control02/control04原始失败保留；revision4逐条拆开后实际控制通过。这是候选proof语法错误，不是kernel错误。

早期误启动的run03仅多跑一次conv控制，选定任务因独占日志open(x)拒绝，没有覆盖raw/log或重跑主程序。该控制与run02定点短时重叠，之后所有任务严格串行。run03曾先写selected01命令元数据，实际命令以selected01.log首行和另存的selected01-actual-underlying-command.json为准；专门的command-provenance说明保留这一差错。旧canonical记录完全未动。

`queue-followup.py` 等待首波完成后串行续跑；`queue-refine.py` 等待1200秒conv完整尝试结束后才跑minmax前置cut。中间 `revision2/f32-conv-hwc2chw` 与 `revision2/f32-dwconv-minmax` 只有静态守卫，作为后续修订源保留，并未单独执行；未使用的run-revision2.py是原计划脚本，不能作为执行证据。实际执行只以command/result/raw/log为准。
