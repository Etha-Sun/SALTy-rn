# WP memory-model hypotheses 独立审计

快照：2026-10-19 19:00 UTC。只读现有源码、冻结锁、manifest、summary、raw 日志；没有启动 WP，没有 Git 操作，没有修改 C/spec/proof/model/checker。机器可读逐项命令、日志路径、警告片段和相关源码锁 SHA 见同目录 review.json。本文行号均为本工作树当前读取文件。

## 结论

exp v36 日志打印的 `__fc_errno` 分离条件是 WP 模型的适用条件，默认不是已生成并检查的 VC。现有 checker 的全 raw 通过、body/call/global 覆盖与正反控制不能自动消除这个域条件。未来 exp 即使 whole-kernel 全绿，在此门禁解决前，也不能按“仅原公开 ACSL 前提的整核证明”收录。当前 exp whole-kernel 本身仍 pending，本报告不把数学 helper 的局部通过外推为整核。

正式13项也不能统一描述为“日志无此类记录”：qs8-rsum 和 qu8-rsum 的正式 admission 日志均有与内部 onemask_table 的分离条件；其他11项的本地正式目录日志未出现同类警告。本审计没有推翻这些 kernel 的数值等价，也没有构造动态反例；它揭示的是证明适用域与公开 spec/现有验收摘要之间的证据边界。旧冻结、源码和历史结果原样保留。

## 从实际冻结源码追到条件含义

以下源目录缩写 `WP5` 指：

`experiments/codex-kernel-wave1/float-bits/model-native-bytes32-v5-bookkeeping/.build/install/lib/frama-c-wp/core/`

本次独立重新计算 WP5 下 MemoryContext.ml、MemVar.ml、MemBytes.ml、MemAddr.ml、Factory.ml、wp_parameters.ml、register.ml 七个文件 SHA，全部与 v36 使用的 `core-float-wave2/model-native-bytes32-v5-fma/float_model_lock.json` 条目相符。故以下结论来自其冻结实现，未把别的安装版当当前 TCB。

1. Factory.ml:354-359 默认为 Typed heap + Var proxy + Machine integer + Float。:331-347 中 `Bytes` 仅把 heap 换为 Bytes，仍保留 Var proxy；:194-202 明确 Bytes 也包裹 MemVar。于是“Bytes”不等于完全取消变量非别名优化。
2. MemVar.ml:65-72 遍历 RefUsage 判定变量，交给 MemoryContext.set 形成分区；MemBytes.ml:125 的 hypotheses 只是 identity，新增限制主要不是 Bytes codec 的某个 axiom，而是外围 Var 优化的适用性。
3. MemoryContext.ml:81-90 把按值建模的外部/取地址 global 放 globals，把指针形参放 to_heap；:222-247 按类型组合 heap；:254-290 生成 global/context/heap 间 separation；:336-358 还从函数 assigns 指针区域生成与 global 的分离条件。:390-407 把这些表达式打印为新的 behavior requires/ensures。
4. `p+(..)` 不是只指公开 `p[0..n-1]`。MemoryContext.ml:156-167 构造无界范围；MemAddr.ml:377-378 将其编译为整个 base 的无界 offset 集，:404-411 用 base 相等时的集合 disjoint 判定。因此日志中那两条无界 range 条件比单个已访问元素的分离更强。
5. MemVar.ml:379-382 将普通按值 global 变为 `Val(CVAL,...)`，:521-522 对其读取独立 scalar chunk。:1340-1350 的 separated 对该独立变量段与 heap 段直接返回 true；它不是每次都从公开前提重新推导物理不重叠。模型采用这些优化，另行打印必要的外部适用条件。

## 警告不是已证明义务

- WP5/wp_parameters.ml:1061-1077：`-wp-warn-memory-model` 默认 true；`-wp-check-memory-model` 默认 false，help 明确为“Insert memory model hypotheses in function contracts and check them on call. (experimental)”。
- WP5/register.ml:824-829：先建 target、计算 memory context，只有 CheckMemoryContext 为 true 才调用 insert，然后生成/prove goals。:145-166 在报告 JSON 导出之后调用 warn。警告出现时，该条件不因此成为 raw 中的 proved row。
- WP5/MemoryContext.ml:458-466 只是格式化警告；:468-478 的 `Annotations.add_behaviors` 在另一条明确受 check 开关控制的路径。
- exp v36 `inline-neon-readonly-print01.log:1` 的实际命令无 `-wp-check-memory-model`，还明确是 `-wp-prover none`、只选 `core_neon_input_readonly` 的 print/dry 诊断；:364-376 的额外 requires 绝不能当作已证结果。当前正式13条 summary 实际命令同样无 check 开关，且未关闭 warn。
- 现有 tools/shim_c_campaign_modular_v10.py（本波位于 checker-v10 同名文件）:164-175 的 complete 只检查已输出 raw、来源不变及函数/global 覆盖；resource_v12.py:139-143 加模型不变与控制。没有解析/拒绝 memory-model hypotheses，也不证明 `public_requires ==> printed_model_requires`。已有真假控制仅检出部分矛盾模型，不测试公开域是否被优化模型缩小。

即使将来开启 check 开关，也不能直接声称根入口域已闭合：它把 requires 添加到 equivalent 自身，equivalent 没有外部 caller 时这些仍是入口义务。另在当前优化模型中直接新增 `assert separated(&__fc_errno,p)` 也可能由上面的 Rseg/heap 规则化简为 true，不能用它循环证明这套优化本身适用。

## exp 的 errno 条件与有效类型

`experiments/shared-extension/complex/cases/f32-raddstoreexpminusmax/spec.h:15-24` 只要求输入/输出/sum 互相分离，没有与 errno 分离；:23 允许函数 assigns errno，不表示 buffer 和 errno 自动分离。

`float-bits/model-native-bytes32/libc/math.h:2145-2151` 的真实 fmaf 合同 assigns errno 和 result，因此程序即使不观察 errno，也要处理 errno 改写对 alias buffer 的影响；`experiments/shim-c-v2/toolchain-build/.build/install/share/frama-c/share/libc/errno.h:144-145` 声明 `int __fc_errno` 并把 errno 宏映射到它。

有效类型可解释正常 C 调用中为何真正 float 数组通常不会别名那个独立 int 对象：直接通过不兼容 float lvalue 访问 int errno 不属于正常有定义的 typed C 执行。但这不是当前公开 ACSL 域蕴含上述所有分离条件的已检查证据。特别是 WP5/MemBytes.ml:366-386 的 validity 仅使用 allocation、权限及字节长度；它不在此检查 effective type。也没有找到把该 ISO C 条件导入并检查成六项额外 requires 的义务。

因此应分清两种可诚实结论：“在明确的模型分离条件和 C/ABI 对应假设下证明”可以保留；“原公开 Bytes 内存域已完全推出这些条件”目前不能报告。也不能把 cast 到 errno 的字节状态随意称为有定义 C kernel 的算法反例。

## 正式13项的实际结果检查

读取 manifest 指向的13份正式 proof_evidence summary，优先 actual_command，并扫描对应目录35份本地 .log（包含 Git ignored 日志，未只依赖 rg 默认过滤）。所有命令均未启用 check，也未出现关闭 warn 的参数。具体命令与所有日志名保存在 review.json。

| 正式项目 | 实际模型 | admission 日志的 memory-model hypotheses |
|---|---|---|
| qs8-rsum | 默认 Typed | separated.log:59-64：input+(..) 与 test_neon_onemask_table 整块分离 |
| qu8-rsum | 默认 Typed | final02.log:59-64：同上 |
| s8-vclamp | 默认 Typed | 未出现 |
| u8-vclamp-v3 | 默认 Typed | 未出现 |
| f32-vmin-v2、f32-vmax-v2 | Typed+float | 未出现 |
| f32-vadd-v2、f32-vsub-v2、f32-vmul-v2、f32-vdiv-v2、f32-vmulc-v2 | Typed+float | 未出现 |
| qs8-f32-vcvt、qu8-f32-vcvt | Typed+float | 未出现 |

两项 rsum 的条件并非 errno，而是 `\separated(input+(..), &(test_neon_onemask_table[0])+(..))`。各自 neon.c:18-21 定义局部 static const 32-byte 表，:46 取表地址作尾部 load；公开 equivalent 合同 qs8-rsum/spec.h:46-53、qu8-rsum/spec.h:35-40 没有该分离条件。

这里也不能仅凭“const”或有效类型宣布条件已含于公开域：input 和表元素类型相同且都只读。作为“公开 ACSL 条件本身不写出此分离”的状态级示例，n=1、input 指向表首、initial=0 时，所需16-byte readable padding可在32-byte表内，qs8 数值溢出界也满足，而整块 separation 为假。这不是已执行的程序反例；该内部 static 地址是否可由真实外部调用者获得、模型是否能进一步去掉过强分区，需要独立论证。日志已经明确只能给条件性覆盖，不能拿 579/579 或567/567 宣布该额外条件已被证明。

其余11项“未出现 warning”只说明这些保存的实际命令没有打印非空模型分区要求，不是整个内存模型/ABI/严格 ISO C UB 的一致性定理。正式数量仍13，旧记录未改。

## 最小诚实处理与未来门禁

1. 立即保留条件性边界：在未来 exp 收录之前，完整列出最终正式 profile 打印的 memory-model hypotheses；没有 warning/条件已独立导出/另有明确条件性范围三者需要分清。不能把局部数学 body 通过用于替代此门禁。
2. 不改原 spec/实现/模型，不覆写旧证据。若原公开域无法推出额外条件，则保持原目标 pending；需要条件性版本时应另命名、另冻结并明确范围，不能以它充当原目标完成。
3. 一个源码支持但本次未运行的消除 errno 优化条件候选：另冻结标准 `-wp-alias-vars __fc_errno` 配置。WP5/wp_parameters.ml:222-227 定义该选项，Factory.ml:110 选择 ByAddr，MemVar.ml:381、527-530 将其交回同一底层 heap。因此模型可显式跟踪 errno 与 buffer 的物理 alias，而无需预先假设它们分离。它需要完整新 campaign、同 profile 正反控制、最终 warning 复查和所有 body/call/global/RTE；不能只加选项并继承旧绿色。
4. 若采用有效类型/外部可达性证明来消除条件，应独立明确 C 域、errno 的 int 对象/ABI、float 对象有效类型和 unbounded base 分离的推导；不能在同一个已假设非别名的 Var 模型中用一个 trivially true cut 充当该推导。
5. checker 后续可在独立版本将 memory-model warnings 纳入显式审核/拒绝门；仅做日志字符串扫描也不等于数学证明，但至少防止出现警告仍自动 complete。这里没有修改 checker 或暗中改变既有验收口径。

本报告仅完成适用域/TCB审计。没有重复 exp 数值 helper 或 repr16 的证明，也没有启动任何 WP 试验。
