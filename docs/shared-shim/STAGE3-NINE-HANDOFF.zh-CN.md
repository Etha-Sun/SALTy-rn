# 第三阶段九项：当前交接与跨服务器续作

本文件与 `experiments/shim-c-v2/stage3-proof-next/PROGRESS-ROOT10.json` 是当前入口，覆盖旧 ROOT01–09 的当前状态描述；历史证据仍保留。用户要求先整理、提交本地检查点，让另一台服务器的 agent 继续。**未经用户重新许可不 push。**

## 1. 分支、范围和结论

- 仓库：`Etha-Sun/SALTy-rn`，工作分支 `feat/shim-c`。本机工作树为 `/srv/home/yuechunsun/tools/lean/build/shim-c`；外层 `/srv/home/yuechunsun/tools/lean` 是另一研究分支，不要修改或切换。
- 交接使用 bundle 内 `refs/heads/feat/shim-c` 的最新 HEAD。`c66f7a86` 保存上一批 proof/模型审计；`42b1cf13` 保存独立 Argmax target 修复及证据。最终交接 commit/SHA 以 bundle 的随附 receipt 为准。
- 只处理原九项：GEMM 3、卷积3、池化2、SPMM 1。qs8/qu8 转换等九项之外任务不属于本轮。
- **新增整核通过0/9。** 正式 manifest 保留11项：四整数2522项、七浮点3970项，总计6492项历史已验收 VC；本次逐文件复核308个源码/证据 SHA，不是重新运行全部证明。
- manifest SHA256：`430961d6744cca9f23241806484b62deb85cac4c00009906232bfb7ddd06999d`。不要采用已隔离的旧浮点绿色记录。
- 本轮有一个新复现的声明 C/shim 内存安全反例：原 Argmax NEON index tail 越界。不能继续写“本轮无任何 kernel 反例”；也不能把这个安全反例写成已证实的数值输出不等或 ISA 错误。
- 所有本轮 proof/solver 已结束，没有需要接管的活跃进程。

## 2. 最值得保留和继续的成果

### Argmax：实际反例、独立修复与可跨路径复现

原合法域允许 `pixels=1,k=10,channels=1`，index 只有1个 uint32；NEON 第二轮 tail 执行 `vld1q_u32(ib)`，真实共享 C body 的 memcpy 读16字节，ASan 报 heap-buffer-overflow。input 行和 float 输出都按 spec 提供了额外3元素，排除了其他 padding 缺失。RVV exact 对照成功，原版额外 index padding 对照返回相等。

独立新 target：`experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/`。四个文件仍为 neon.c、rvv.c、spec.h、harness.c，单个 proof.patch；仅 NEON tail 改为先读取 c 个真实 index lane 到4元素局部数组，其余填0，再做原载入。原 spec/harness/RVV 字节相同，旧版与旧 SHA 全保留。

- 新 target frozen SHA：`2bcbccdf075886120ee989a32a74ce155bee4e074c48f19b8f03fb449e485e87`。
- 新 NEON SHA：`213e054a00a35375a98ca4c8bf735b9b559edfb9da7f26452fda6a4c5abfb7e1`。
- ASan+UBSan 2100个精确 index extent case 全过，检查 NEON/RVV 与标量 reference 的 value/index，含 NaN、±0、无穷和随机 float bits。有限测试不是全域证明。
- 独立源码/记录审核在 `stage3-proof-next/root-review/argmax-tail-independent01/`，其 accepted 只针对该审查范围。
- 修复片段实际 WP **15/21**，六项 timeout 为两个输出后置条件、assigns 及 memcpy 的三个前提。Typed 的 uint32→char 转换隐藏了子项定义；**桥尚未解决**。

无需 Frama-C、无需旧 `.build` 路径，先用从未使用过的 run 名重现两版运行证据：

```sh
python3 experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/replay-runtime.py server2-runtime01
```

需要支持 ASan/UBSan 的 gcc。脚本实际从 Git 冻结文件构造两版输入、重新生成 include、编译并保存新日志；本机 `runtime-replays/handoff-portable01/result.json` 已实跑 accepted=true；又在全新不同路径工作树、没有原 `.build` 的情况下实跑 `clean-checkout01` 成功，见新target的 `CLEAN-CHECKOUT-REPLAY.json`。该检查仍使用同一服务器gcc。这条命令不恢复形式证明环境。

旧 proof 候选 `stage3-proof-next/maxpool/root41`：两个新增整数 helper body **40/40**、全部可达辅助函数 **172/181**、global **5/5**；九个 callee 未证都属于 vbslq_f32 的三次 memcpy 前提。完整库存为876项非CFG body（181 helper、695 wrapper）+5 global = **881逻辑项**，另36 CFG。常规与 no-Qed 的1200秒尝试均无最终 raw；两个 ACCOUNTING 文件列出所有未完成项。**881是旧 root41 的库存，不是修复 target 的新库存。**

原 NEON 主循环还缺完整功能不变量，不能把 helper172/181说成“整核只剩9项”。下一步先为修复 target 新建 proof 候选并完整盘点，再补真实 NEON/RVV 循环关系；不要重跑 `prepare.py` 覆盖已冻结 target。

### DWCONV：可复用的局部内存 frame

优先读 `stage3-proof-next/dwconv/DW38-46-FINAL-HANDOFF.json`。

最佳续作种子 `frame-root45`：新 helper 真实 body **3/3**，原 copy frame **1/1**，所有策略孩子均检查。**该 frame 仍使用前面的未证 next_weight_distinct_base**，不是依赖闭包完成。

`frame-root46` 的分配组2/4：局部对象初态分配为0及随后 distinct-base 通过；入口权重有效性与正分配长度未过，后两项仍是前件债。`frame-root37` 四条 lane frame4/4也不能消掉这些前件。不要把不同版本结果拼成整核通过。

环境完整恢复后，在仓库根目录用新 run 名可复查局部：

```sh
python3 experiments/shim-c-v2/stage3-proof-next/dwconv/run-frame-root38.py frame-root45 server2-helper01 helpers --budget 300 --properties next_dw_disjoint
python3 experiments/shim-c-v2/stage3-proof-next/dwconv/run-frame-root38.py frame-root45 server2-copy01 selected --budget 480 --properties next_weight_copy_frame
```

这些是诊断 runner。继续应在新候选中闭合权重游标初态有效性/分配正值与 base 保持，检查所有新 invariant 的建立/保持；不能增加公共前提。

### GEMM：已证局部 FMA 关系，尚缺旧内存 frame

当前候选 `stage3-proof-next/gemm/candidate90`。其入口/内存三目标实测 **1/3**：指针 origin 过，入口整段有效性与原 next_w_frame_0 未过。`candidate89` origin-only1/2同样只过 origin；frame0为0/1。

此前八 lane 的 source/FMA 关系、完整真实 helper body结果保存在 ROOT05–09 和各候选日志，可复用思路，但很多 caller 依赖这些旧未证 frame。较早76版本的1483项库存不能冒充90版本库存。

已纠正一个重要诊断：实际 VC 有第二个 read_w invariant，位于八次 accumulator havoc 之后；当前只需处理最后实际 tmp copy，不能误称必须再穿过前八次。现有 MemTyped 的 local-linked lemma 是旧 TCB 事实；90未添加新模型公理。不要继续用无法精确匹配 array forall 的 generic T 实例化反复建版本。

## 3. 九项总表与共享缺口

| Kernel | 当前入口/保留证据 | 仍需完成 |
|---|---|---|
| f32-gemm-minmax | gemm/candidate90、PROGRESS-ROOT10 | 入口有效性、旧 frame、完整 kernel/callee/global |
| f32-igemm-minmax | dwconv/igemm-frame-r3；完整库存771 | 完整 raw 未得；早期26/26定点不是全域输出证明 |
| qd8-f32-qc4w-gemm-minmax | spmm/qd8-nibbles-r10/STATUS.json；AND真实闭包30/30 | bits_i8 的真实 memcpy、packing 和主程序；bitwised v2 qualified 不意味着 kernel已证 |
| f32-conv-hwc2chw | dwconv/conv-cursor-inline-r4；完整库存2328 | 3500秒尝试无最终raw，halo/内存/主输出；6个global另算 |
| f32-dwconv-minmax | frame-root45/46、最终交接JSON | validity/base依赖及全程序 |
| f32-dwconv2d-chw | dwconv/root30；完整库存1655 | 新高度关系完整尝试超时无raw；滚动行与输出 |
| f32-maxpool | maxpool相关r3；历史库存1239 | 主循环/内存/完整输出；1200秒无最终raw |
| f32-argmaxpool | 新 tail-v1 target；旧 root41只供proof参考 | 新库存、NEON功能循环、uintptr和float/memcpy桥 |
| f32-spmm-minmax | spmm/STATUS-ROOT08.json；地址控制39/45 | Typed 缺 uint64规范化往返和非零affine桥；不是已证kernel错误 |

表内数字都属于指明的候选和范围，不能求和或拼接成当前通过率。进一步原始分母/未完成项见 `stage3-inventory/REPORT.zh-CN.md` 及各候选完整 inventory。

共享 Byte 模型资格：**所有 Byte 版本均未用于九项验收。**

- Byte1..34：已确认继承的全称 pointer-width Admit 与无界 offset/static inverse 冲突，拒绝资格，即使负例未被自动证明也不能采纳。
- 独立35删除这两处事实，但仍 **UNQUALIFIED**：七组控制的地址组39/45含四个真目标未证；严格 vadd **556/571、15 pending、complete=false**。
- ground uintptr 范围来自读取整数左值的类型假设，不是 body 证明；该抽象状态过滤的 refinement 仍需审计。
- 两个 UNSAT 地址诊断实际先删除部分假设形成更强的 subset，再加入剩余既有 forall 的准确实例；不是完整原 SMT 或 Frama-C raw。仅改触发器的公平对照仍未闭合。
- 详情：`root-review/byte-address-audit01/AUDIT.json`、`byte-address-audit02/REVIEW.md`。不要再以长跑负例正常替代语义审查，也不要继续堆未资格化版本去跑 kernel。

## 4. 另一台服务器的环境恢复边界

**Git/bundle只含源码、补丁、配置和证据。二进制、opam、wp-share安装树、observer插件不随它恢复。** 新机器不能安装官方 Frama-C 后直接声称复现；旧锁含绝对路径和 binary SHA。

先读：

1. `AGENTS.md` 顶部当前分支说明、当前 HANDOFF、当前 NEXT-AGENT-PROMPT。
2. `experiments/shim-c-v2/MODEL-AND-TCB.zh-CN.txt` 和当前总 REPORT。
3. `docs/shared-shim/LOCAL-RECOVERY.zh-CN.md`、`handoff-local/ENVIRONMENT-ACCEPTANCE.json`。
4. `environment-recovery-local/README.zh-CN.md`、`handoff-plus-evidence/README.zh-CN.md`。
5. Argmax 用的 `stage3-unary-front/README.zh-CN.md`、`ACCEPTANCE.json`；QD8用的 `stage3-bitwised-front-v2/QUALIFICATION-ROOT01.json`。

当前已实际验收环境为 Frama-C33、OCaml4.14.2、Why3 1.8.2、Z3 4.12.5、CVC5 1.2.1。入口必须是绝对路径：

| 用途 | 本机 qualified入口 | lock SHA256 |
|---|---|---|
| GEMM/DW/SPMM基础 | experiments/shim-c-v2/handoff-model-plus/frama-c.py | f6756e5cf0665df060894ccf02993483bd8306f52795a3dd5f739296e110fc67 |
| Argmax逻辑非修复 | experiments/shim-c-v2/stage3-unary-front/frama-c.py | 18fae880dd3039ce8d2a5dbc5840052444be0dd0cd11916c2cb64e0fbe000973 |
| QD8位运算修复 | experiments/shim-c-v2/stage3-bitwised-front-v2/frama-c.py | 25860866917bffd4a16cfa37a7535b499439d4d315946cfd47d145ede54f8d5d |

如果回到原服务器，先查 `/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence` 的现状和原环境；**不能假定它已有本机新 unary/bitwise 修复或同一锁**。当前 `/srv/home/...` 的源码安装与 solver 在 `.build` 下。

换路径/重建必须：保留所有旧锁 → 建独立环境/候选版本 → 审计源码差异和新 binary/依赖 SHA → 跑正反语义控制 → 重新冻结 → 使用新 run 名完整复验已通过的 f32-vadd571项 → 全守卫通过后才继续九项。已有 prepare/build脚本是本机配方，不是已验证的一键bootstrap。不要把新绝对路径写回旧锁或旧frozen。

所有原 runner/日志中的绝对路径均属历史证据。新环境应在新候选中重新生成 source_guard/annotated，保持 C/token/spec/proof SHA 并声明新的工具锁。不要执行旧 `actual_command` 去覆盖旧日志。observer 必须针对所用安装构建并记录SHA，设置 `WP_OBSERVER_JSONL` 和 solver PATH；不要关闭 strategy-engine 导致 proof 注解被跳过。

本机曾确认启动阶段卡在 `/sys/devices/system/cpu`，Frama-C尚未进入WP。该延迟与真实 solver timeout 分开记；检查可用内存，先小检查，par1–2、每solver有限预算，不要并发重跑33项。

## 5. 验收与不要重复的错误

- 保持公共输出相等、原合法域、VLEN128及RNE；浮点观察为数值相等或双方NaN，不比较±0符号、NaN payload或flags。ISA→shim和工具链仍属TCB。
- 不能为 proof 增加 finite/nonNaN 或地址范围 requires，不能改原C/shim/spec/wrapper或旧模型/锁/checker。实际bug只能像tail-v1这样建独立修复target重新冻结。
- 禁止 axiom/assume/admit、无body外部ghost合同、跳过真实callee、Bytes+float旧不健全组合或改Real抽象。不要把 FMA 当普通乘加。
- 必须 complete=true、全部raw通过、pending空，source_guard/unchanged/model_inputs_unchanged/model_control.accepted均真，missing_body_ensures/global_lemmas为空，完整日志和SHA一致。
- 目前自定义局部/closure runner都是诊断。root41显式inline更多真实u32调用；旧strict checker不会自动理解所有 diagnostic_inline_calls 字段。整核验收前必须独立审计完整body、ghost helper、global覆盖及实际编译选项，不能用脚本名字“full”充当覆盖证明。
- 不同候选结果不拼接；global5/5、helper全绿、timeout0/0、无raw都不算整核。Pre最小控制未复现标签bug；不能仅凭heap map的数字后缀判断状态。
- 审计 `root-review/audit32.json` 覆盖189个旧实现不变的proof候选和30169个锁条目，contracts检查无新增requires；新修复target由独立源码审查和source_guard另验。它们只证明输入/修改边界，不证明断言为真。

## 6. 无 push 的传递方式

交接包为 `feat/shim-c` 的 Git bundle，附带 SHA256/HEAD/base receipt。bundle基点是 `f2f8d2cd7fb1eebdbb1df4bc470f7341c98bc23d`，接收仓库须有该对象。它包含本地后续提交，不包含工具安装。当前 origin 还有独立的转换工作，本轮没有 merge/rebase/force-push。

接收 agent 先查 branch/status/remote，保留已有工作，再核对receipt并验证bundle：

```sh
git bundle verify /path/to/SALTy-rn-feat-shim-c-root10.bundle
git fetch /path/to/SALTy-rn-feat-shim-c-root10.bundle refs/heads/feat/shim-c:refs/remotes/handoff/feat-shim-c
git worktree add -b handoff/shim-c-root10 ../shim-c-root10 refs/remotes/handoff/feat-shim-c
```

若相同名称已存在，选择独立新名称；不要覆盖现有工作树/分支。工作内容仍续接本次 feat/shim-c HEAD；后续合并回用户分支前核对无关提交，未经许可不push。

新 agent 的第一份回报应明确：实际HEAD/工作树、环境是可直接复用还是待重建、原版安全反例/新target状态、将闭合的一个具体完整依赖。先用portable native replay确认交接文件可用，再恢复proof环境；不再只报告局部绿色增长。
