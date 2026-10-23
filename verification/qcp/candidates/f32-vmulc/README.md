# f32-vmulc 候选（未完成整体证明）

该候选直接引用 `impl/testNEON.c`、`impl/testRVV.c` 的原始 kernel；两文件逐字节等于 kernels/source、kernels/target 下的 f32-vmulc.c。输入 B 只需一个 float；输出模型为 `firstn n (map (fun x => fp32_mul x c) A)`。模型保留全部 binary32 输入，包括 NaN、Inf、±0；不要求乘法结合律或有限值。

`spec.c` 是唯一公开契约来源，当前仍是 **draft**。`equivalent` 在正常返回时应返回 1；两侧结果与同一个逐元素乘标量模型一致。两侧原始 kernel 的循环 VC 和 wrapper 的 VC 已分别闭合；仍需最后统一检查 FloatArray 绑定/nonnull 入口、实际 C 调用闭包和 fresh 依赖门禁，才能提升为整案验证通过。

已实际完成：

- `proof/check_primitives.py`：新 broadcast load、标量 RVV lane helper 和 VF multiply 的 102 个 C VC，四个本地 Coq 模块新编译成功。具体记录见 `proof/primitive-status.json`，范围只限新增 primitive。
- `proof/native.py`：原始两侧 kernel 和公开 wrapper 的 430 组 native 检查，B 缓冲区仅一个 float，同时与独立 scalar oracle 比较。有限测试不能替代证明。
- `proof/generate_rvv.py`：从当前公开契约给原始 RVV 只插入注释，生成 42 个 C VC，并检查原始 C token 一致；`proof/check_rvv.py` 已闭合全部 42 项。

`proof/check_rvv.py` 已实际闭合 RVV 原始 kernel 的 42 个 C VC（37 个 call/safety 和 5 个 loop/memory），最终 `KernelChecked : VC_Correct` 编译成功。它检查 RVV 循环 VC，显式复用 verified/f32-vmul 最近完整成功 run 的只读 Coq 依赖；本候选的新 Model、bridge、策略和 VC 另行编译。真实结果以 `proof/rvv-proof-status.json` 为准，不将旧依赖当成新编译。两侧最新检查均显式绑定本轮 root 新编译的 87 个 VMUL 依赖；本候选自己的新增 Coq 组件分别再编译。整体 `whole_kernel_verified` 在统一门禁完成前保持 false。

Shim 的 store 宏仅对当前 kernel 的局部向量 lvalue 借用地址；一般向量表达式尚不支持。RVV 的 32 个模拟 lane 对应当前框架固定配置；未声称覆盖任意硬件 VLEN。inactive lane 显式返回 +0，不从浮点乘法的零性质推导。

复现顺序：`python proof/check_primitives.py`、`python proof/native.py`、`python proof/generate_rvv.py`、`python proof/check_rvv.py`。需已配置 QCP/Coq 环境及 verified/f32-vmul 成功依赖目录。

RVV 的新 unary result bridge 保留显式 in-bounds 条件；`nth_indep` 仅在数组索引有效时更换默认值，不假设 `fp32_mul(+0,c)=+0`。新增九个本地 Coq 模块实际编译，旧 VMUL 库明确只读复用。`Print Assumptions` 继承 QCP 的布局 sizeof 常量、classical、函数/命题外延等既有环境假设，没有新增算术、循环公理或 Admitted。

初始脚手架生成器 `tools/vmulc_candidate.py` 仅生成最初的候选骨架；后续公开 wrapper helper 和新循环证明是在其后扩展，不能用初始 generator hash 声称可逐字重建当前 spec。当前输入以源码 SHA 与各 proof status 记录为准。

NEON 当前结果：111 个原始 kernel C VC 全部通过，并将证明收在 `NeonVcs.v`；`NeonChecked.CheckedOriginalNeon : VC_Correct` 已在 fresh 依赖下实际编译。最新证据见 `proof/neon-proof-status.json`，含源码 SHA、实际命令、live kernel 公共契约 SHA。最后 loop step 的初次 35 秒检查超时，120 秒单目标检查与最后聚合重放均通过，没有为缩短运行时间改变任何契约。

Wrapper 的新比较 helper 与 `equivalent` 已由独立 checker 检查；范围和 fresh 依赖见 `proof/wrapper-proof-status.json`。最新 native430 在该最终 wrapper 上再次通过，B 缓冲区仍仅一个 float。

新增 NEON 复现步骤：`python proof/generate_neon.py`、`python proof/check_neon.py --aggregate --dependency-dir <fresh-VMUL-coq目录>`；RVV 同样接受 `--dependency-dir`。省略该参数时明确复用 verified/f32-vmul 最近记录的已检查依赖，不声称重新编译该依赖。
