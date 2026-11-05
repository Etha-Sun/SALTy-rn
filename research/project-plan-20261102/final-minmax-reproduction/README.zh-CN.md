# 最终优化 vmax/vmin 的 NaN 反例复现

结论：35 个最终优化版本中的 f32-vmax 和 f32-vmin 都仍保留 NaN 与数值输入的语义差异。推荐 vmax 作为 motivating example 的首选，但目前没有它快于 XNNPACK 的已确认性能证据，也没有最终版本的修复证明。

## 固定源码与执行方式

- 最终 RVV 来自 keaganchern/optimized-rvv-kernels 提交 `80feb4564cb470de301062109b6f89db672bdf9d`。
- vmax blob：`ea66425c731e70bd36422ac50456dd81da22f897`，62 个物理行。
- vmin blob：`dbdd236f60e8d51a81fa789ade64c92ba3a30cdb`，67 个物理行。
- NEON 对照是 SALTy-rn `be16280c7812a7459c26c3ce82a47339a3d07718` 的 `kernels/source/f32-vmax.c` 和 `f32-vmin.c`，各 43 行。此次按文件内容核对，没有将其默认等同于每个最终文件生成时未公开的完整运行记录。
- 四个 kernel 文件均未修改。编译时注入头文件、参数结构及 XNN 宏定义；同一个 harness 调用原函数。使用 Zig 0.15.2 的 C 编译器，O3、关闭 fast-math 与 FP contraction，静态链接。
- RVV 使用 QEMU 8.2.2，VLEN=128、256、512。ARM 使用 QEMU 6.2.0 AArch64，FPCR=0。QEMU ARM 从发行版包解包到 `/tmp`，没有安装系统包。
- 这是新运行的已编译机器码指令模拟，不是 C-shim 回放，不是物理硬件测量，也不是完整形式证明。

## 实际输出

| kernel | 元素数 | A bits | B bits | NEON 输出 | 最终 RVV 输出 |
| :--- | ---: | :--- | :--- | :--- | :--- |
| vmax | 1 | 0x7fc12345 (qNaN) | 0x3f800000 (1.0) | 0x7fc12345 (NaN) | 0x3f800000 (1.0) |
| vmin | 1 | 0x7fc12345 (qNaN) | 0x3f800000 (1.0) | 0x7fc12345 (NaN) | 0x3f800000 (1.0) |

NaN 放在右输入也复现。该差异不被“双方 NaN 等价、正负零等价”的观察关系接受。输入数组提供足够 padding，各缓冲区分离，batch 为正且为 4 的倍数，满足当前代码可见的前提。该结论适用于允许 NaN 的合同；若原部署另有 finite-only 调用契约，必须另行核查，不能仅靠测试只选有限数推导这一契约。

测试长度为 1、4、15、16、17、31、32、33、63、64、65、127、128、129、257，覆盖两实现的部分块、完整块和多轮处理。每个长度运行左 qNaN、右 qNaN、双方 qNaN和有限值四组。共 480 次 kernel 调用，组成 360 对 NEON/RVV 比较，其中 180 对单侧 NaN 比较表现不等。双方 NaN及有限值对照均符合预期。所有被测输出元素均与报告的首元素一致，输出区外哨兵保持不变。这些有限测试不构成全输入内存安全证明。

原始文件与日志：

- [vmax NEON](vmax/neon.c)、[最终 RVV](vmax/rvv.c)、[NEON 输出](vmax/neon.jsonl)、[RVV VLEN512 输出](vmax/rvv-vlen512.jsonl)。
- [vmin NEON](vmin/neon.c)、[最终 RVV](vmin/rvv.c)、[NEON 输出](vmin/neon.jsonl)、[RVV VLEN512 输出](vmin/rvv-vlen512.jsonl)。
- [命令、工具版本和哈希](results.json)、[编译执行脚本](run.py)、[共同 harness](harness.c)。

## bounded 检查对照及机制

额外对最终 vmax 运行本地 SALTyRN cvc5 后端，长度 1、VLEN512、每次查询预算 20 秒，返回 VERIFIED / ALL_PASSED。这个是本次运行结果，不是找回 Keagan 论文当时的通过日志。

检查器基于提交 `be16280c7812a7459c26c3ce82a47339a3d07718`，本地树存在此前的构建适配、harness 生成及其他 intrinsic 扩展。相关 NEON core、比较函数和 symbolic buffer 与该提交一致；本地改动另存为 [checker-local-changes.patch](checker-local-changes.patch)。因此称为“本地 SALTyRN 后端复现”，不称为未修改的论文精确工件。

问题位于 `neon/ops/core.hpp`：`vmaxq_f32` 直接构造 `FLOATINGPOINT_MAX`，与 RVV 一样，没有保留 NEON 的 NaN 传播差异。输入缓冲区使用符号字节，比较函数拒绝 NaN 与有限值相等，因此不能把这次接受解释成只有有限随机输入或输出容差过宽。

在隔离的模型副本中，只给 NEON min/max 增加“任一操作数为 NaN 则结果为 NaN”的条件。复用原生成 harness，不修改任何 kernel、长度、VLEN 或输出比较，结果变成 COUNTEREXAMPLE，失败位置为 0。这是对该模型问题的定位实验；模型修正使用 canonical NaN，适合当前忽略 payload 的观察，不是对完整 ARM 浮点模型的认证。

- [原模型检查结果](bounded-vmax/smt.json)、[完整驱动日志](bounded-vmax/driver.log)。
- [隔离模型补丁](diagnostic-neon-model.patch)、[修正模型后反例日志](diagnostic-model.log)、[定位实验脚本](check_model.py)。
- vmin 的 ISA 模拟反例同样成功；但原有自动生成 harness 在 C++ namespace 内重复声明参数结构，产生类型不匹配，[其 bounded 运行停在编译阶段](bounded-vmin/smt.json)。没有把它计作验证通过或验证失败，也没有为此修改 kernel。

这个案例可以说明独立语义检查找出了本地既有检查器接受的差异。不能把它写成“长度有界必然漏掉此类 bug”：长度 1 的正确模型已经找到了反例。

## Keagan 论文里的性能

核查用户提供的 16 页 SaltyRN.pdf 的文本和图 9 至图 15。图 10 至图 13 的逐 kernel 性能图没有独立 vmax/vmin 项。图 14 的五个 Autocomp 案例是 raddstoreexpminusmax、transpose、vmulc、gemm 和 dwconv2d-chw，也不包含 vmax/vmin。

因此，这版论文没有可引用的 vmax/vmin 最终优化速度或相对 XNNPACK 的倍数。它报告 32 个 kernel，最终输出仓库声明 35 个，两者的版本和覆盖也不能自动对齐。不能借用 gemm 的 minmax 或 maxpool 的柱子，它们是不同操作。

这轮没有跑 Saturn 性能，QEMU 时间不作为性能指标。旧 40 项中间版本的修复成本也不移用到这里。

## 选样建议

优先 vmax：代码较短，主循环固定使用 VLMAX，剩余部分用可变 VL；与 NEON 固定四元素及显式尾部存储容易并列解释。NaN 反例只有一个元素，修复点清楚；现有本地 bounded 后端还能直接构造“接受原模型、正确模型给出反例”的对照。

vmin 可作为备选：它提前加载下一块并维护当前与下一块的 vl，优化结构更丰富，但页面和解释成本更高，当前还有独立的 harness 接入障碍。

完整 motivating example 尚需同平台 XNNPACK RVV、最终 vmax、最小修复版的性能比较，以及最终修复版本的完整证明。若实际性能不满足要求，应保留 vmax 为语义诊断案例，另选有实测优化收益的主例，而不是预写加速结论。
