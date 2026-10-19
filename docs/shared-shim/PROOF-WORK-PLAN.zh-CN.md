# 环境恢复后的证明分工

本页基于 `f2f8d2c` 的 RESULTS/manifest 和当前独立环境复验，不把运行中或局部诊断算整核通过。当前40项：正式收录11项，待证明26项，缺target3项。用户要求暂不push；环境阶段提交 `9297d29` 仅在本地。

当前环境的 front/plus 正反控制、Cint54/54和f32-vadd571/571已实际通过，见 [恢复验收](LOCAL-RECOVERY.zh-CN.md)。这里的就绪范围是 Typed 浮点/转换环境；原整数Byte工具资产没有据此宣称恢复。

本次新完整尝试的结果见 [RESULTS-LOCAL.json](../../experiments/shim-c-v2/handoff-local/RESULTS-LOCAL.json)：qu8-f32-vcvt为838/845、剩7项，原最终wrapper量词连接目标闭合，其余7个pending的property与原报告相同。全部guard、模型控制和body/lemma覆盖检查通过，仍未整核通过。qs8的固定lane展开候选耗尽1200秒主WP预算，没有最终body报告；不以checker的0/0占位或空pending作结果，原剩11项的基线保留。本次新增整核通过0。

## 当前并行任务

- qs8任务：`qs8-f32-vcvt`，先处理固定lane、tail偏移和RVV中心化关系。候选和诊断各自独立，当前完整运行在 `handoff-replay/qs8-f32-vcvt`。
- qu8任务：`qu8-f32-vcvt`，先处理NEON高半lane、tail重绑定和RVV的转换/乘法连接。当前完整运行在 `handoff-replay/qu8-f32-vcvt`。
- 共享地址任务：调查 `uintptr` roundtrip及加偏移的最小正反控制，定位工具/模型缺口；不更改活跃模型，不启动GEMM整核。
- 主agent：核查冻结、资源预算、全部raw VC与调用/body/lemma覆盖，独立验收并更新结果。每个整核目前2 workers/1200秒预算，不并发重跑全部26项。

首轮诊断也已结束。qs8尾部候选在无策略定点检查中8/12，仍缺分支内vy/done重绑定及lane1实例化；qu8的三个有body helper局部8/8，kernel定点目标4/8。诊断关闭策略/RTE等配置与完整run不同，且下游目标可能依赖上游未证断言，不能将这些数字并入整核计数。最终qu8-next候选还含未运行改动；实际诊断版本另有可重建的proof快照。

地址最小控制为11/16，包含按预期未证的false。直接roundtrip能证源于CIL消除嵌套cast；+0、+sizeof以及保存uintptr后转回指针未证。源码调查表明Typed缺少uintptr范围及整数地址/shift连接。只对+0做独立前端规范化是候选实验，不是通用桥，当前未改工具/模型。详见 `experiments/shim-c-v2/handoff-address-investigation/`。

## 26项优先级与难点

以下数量均来自交接中的完整报告。新proof会改变VC集合，不能直接用不同候选的通过数量比较进展。预算耗尽且没有完整body报告的项不填0/0，也不引用单独global结果代替整核。

| 优先级 | Kernel | 交接完整结果 | 主要难点 |
|---|---|---|---|
| 1 | qs8-f32-vcvt | 794/805，剩11 | intrinsic已全证；lane、tail和wrapper关系 |
| 1 | qu8-f32-vcvt | 835/843，剩8 | intrinsic已全证；高半lane、tail、RVV关系 |
| 2 | f32-vcmul | 377/418，剩41 | helper全过；uintptr后有效性、主循环/frame和最终关系 |
| 3 | f32-vlrelu | 491/520，剩29 | float/bits和memcpy桥、前缀 |
| 3 | f32-vrndne | 662/679，剩17 | bit表示、magic-number舍入、符号重构 |
| 3 | f32-vsqrt | 383/402，剩19 | bit表示和标量bit-search与正确舍入的关系 |
| 3 | f32-f16-vcvt | 预算耗尽，无完整body报告 | float/word位表示及tail/frame |
| 3 | qs8-vcvt | 698/719，剩21 | struct按值memcpy、ASR/RNU、tail packing |
| 3 | qs8-vlrelu | 846/866，剩20 | struct/字节store、舍入移位及kernel归纳 |
| 3 | qs8-vadd-minmax | 预算耗尽，无完整body报告 | 整数Byte、舍入/移位、tail与整核归纳 |
| 3 | qu8-vadd-minmax | 预算耗尽，无完整body报告 | 同上 |
| 3 | qs8-vmul-minmax-fp32 | 预算耗尽，无完整body报告 | float/int位表示、舍入移位与内存/循环关系 |
| 3 | x32-packw-gemm-goi | 预算耗尽，无完整body报告 | struct/segment/strided store、uintptr和布局归纳 |
| 3 | x32-transposec | 预算耗尽，无完整body报告 | Typed字符指针cast丢信息、地址桥、tile/frame |
| 独立工具/归纳任务 | qs8-rdsum | 420/702，剩282 | sum/lambda有明确WP/Why3错误，另有多行/地址归纳 |
| 独立工具/归纳任务 | qu8-rdsum | 预算耗尽，无完整body报告 | 多行归纳、地址桥、floor/范围和终止 |
| 后续复杂核 | f32-gemm-minmax | 预算耗尽，无完整body报告 | packed权重、多行NR8/K累加、FMA及输出归纳 |
| 后续复杂核 | f32-igemm-minmax | 预算耗尽，无完整body报告 | indirection、positions/K累加和NR8输出 |
| 后续复杂核 | qd8-f32-qc4w-gemm-minmax | 预算耗尽，无完整body报告 | packed 4bit、补偿/尺度、FMA和嵌套循环 |
| 后续复杂核 | f32-spmm-minmax | 预算耗尽，无完整body报告 | 稀疏cursor、prefix_nnz/diff、行strip/FMA |
| 后续复杂核 | f32-conv-hwc2chw | 预算耗尽，无完整body报告 | 69处uintptr、halo、边界和多层布局 |
| 后续复杂核 | f32-dwconv-minmax | 预算耗尽，无完整body报告 | bit/地址桥、pixel/channel前缀和真实累加顺序 |
| 后续复杂核 | f32-dwconv2d-chw | 预算耗尽，无完整body报告 | 滚动缓冲、halo/尾块、三输出行关系 |
| 后续复杂核 | f32-maxpool | 预算耗尽，无完整body报告 | 9输入分组、多pass归并、clamp与地址桥 |
| 后续复杂核 | f32-argmaxpool | 预算耗尽，无完整body报告 | 位选择、value/index与tie-breaking归纳 |
| 后续复杂核 | f32-raddstoreexpminusmax | 预算耗尽，无完整body报告 | 无uintptr，但有位表示、指数构造、多项式及sum归纳 |

缺target的3项为 `qd8-f32-qc8w-gemm-minmax`、`qd8-f32-qc8w-igemm-minmax`、`qs8-qc8w-gemm-minmax-fp32`。需要先建立/审查对应target，不能算proof失败。

共享障碍优先处理地址桥、float/word位表示和struct packing。工具/模型修复须独立新版本、语义审计和正反控制；不以新axiom、无body合同、弱化合法域或输出关系代替证明。当前26项未证不能据此判为kernel错误。
