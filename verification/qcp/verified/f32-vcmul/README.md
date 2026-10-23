# f32-vcmul：planar 复数乘法

统一 fresh C-shim 门禁已通过：11 个实际 C 单元、37 个有真实 body 的 C 函数、629 个逐单元 `VC_Correct` 字段和 32 个策略字段。全部 123 个本地依赖/本案模块及最终门禁从源普通 Coq 编译通过，共 124 个模块；全部 661 项 `Print Assumptions` 已归档。结果见 [proof/status.json](proof/status.json)、[proof/manifest.json](proof/manifest.json) 和 [完整证明证据](proof/evidence/full-run/status.json)。VC 字段按生成单元计数，不声称彼此语义去重；分区数量不作为额外 kernel 计数。

两份 [原始实现身份](proof/originals.json) 均保留上游逐字内容；本案无需修复 `impl/`。公开审查入口是 [spec.c](spec.c)、`impl/`、`shim/` 和 `proof/coq/`。证明用的 Inv/Assert/where 只以注释加入副本，门禁同时检查原始与副本的 C/CPP token 身份，以及全部调用的声明、契约和真实 body。

`n` 是复数元素数。每个输入包含 `real[n]`、`imag[n]` 和 3 个可读 padding float；两个输出各包含 `2*n` 个 float。公开契约要求这些数组及可读 params 分离，且 `0<n<=2305843009213693947`。NaN、Inf、正负零、subnormal 均未排除。NEON 实部尾读取可进入同一个输入的虚部区域，证明保持整个输入数组资源；RVV helper 只读取/写入 `vl` 个活跃元素。

实部按 `round32(round32(ar*br)-round32(ai*bi))` 计算，虚部按 `round32(round32(ar*bi)+round32(ai*br))` 计算。`vmlaq_f32`、`vmlsq_f32` 遵循 [官方 ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html) 的普通乘法后加减，两次舍入；没有替换成 FMA。原始 NEON 循环及三个尾分支、原始 RVV 循环、算术/内存 helper 和公开逐 lane 比较 caller 都分别对应实际 C 目标，再由统一门禁绑定。

配置固定为 LP64、little-endian、binary32、RNE、gradual underflow；RVV 固定 VLEN=128、SEW=32、LMUL=4、VLMAX=16、`vl=min(AVL,16)`、`vstart=0`。输出观察是数值相等或双方都是 NaN，覆盖全部 `2*n` 个输出。

这是显式内存契约下的 C-shim 部分正确性。QCP 的固定 NaN handler 不等于 Arm 的 payload 传播或 RVV canonical NaN 位；当前 kernel 不观察中间 NaN 位。formal 的 inactive lane 正零是未观察字段的代表值。ISA/shim 观察对应、native 位数组与 formal scalar-field struct 的布局对应、完整终止性、任意硬件 VLEN，以及 FP flags/traps 等价均未证明。继承的 Coq/QCP/Flocq、classical/extensionality 和 C memory/type/address 假设保留在最终 `Print Assumptions` 日志中，见 [semantics.json](proof/semantics.json)。

独立 native 检查覆盖 468 个样本、每侧 41592 个输出 lane，并检查 ASan/UBSan、输入/padding/params 与输出 frame、非 NaN 精确位（含零符号）。错误输出、融合运算及双方共享错误乘法的负控制都被拒绝；双方同错时仍由独立 scalar oracle 识别。实际 load4、RVV16 load/VL 和 store/getter helper 也有各自位精确与 frame 回归。有限 native 检查不作为形式证明或硬件执行结果。

重放时先配置 QCP 2.1.4、Coq 8.20.1，并准备一次有独立完整记录的 VADD fresh dependency replay。`CONFIG` 指向 Coq 配置，`VADD_COQ` 指向该 replay 的 `coq/`。从本案目录执行：

```sh
python3 proof/native.py
python3 proof/check_full.py --config "$CONFIG" --dependency-dir "$VADD_COQ" --jobs 4
python3 proof/record_status.py
```

full runner 从 live C 和策略重新生成目标，从源编译全部本地 Coq 模块，不复制组件 `.vo`，最后对所有实际 C/strategy 接口进行全限定 typed 检查。每进程使用 16 GiB 限额，采用有限超时。历史候选阶段记录保留 provenance；搬迁审计检查证据与 live 输入身份，不另称一次证明。
