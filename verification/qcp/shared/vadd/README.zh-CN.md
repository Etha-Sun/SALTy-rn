# 已检查的 vadd 共享接口

在 framework worktree 根目录运行：

```sh
python verification/qcp/experiments/vadd-proof/run.py
```

Runner 重新生成 C 和实际函数体的 QCP VC，核对 VC 与已审核的 goal 文件一致，然后顺序执行 `coqc`。实验命令、源码哈希、日志和结果在 `experiments/vadd-proof/status.json`。QCP 与 Coq 库使用当前环境已安装的 QCP 2.1.4 / Coq 8.20.1；Coq namespace 为 `QcpVadd`。

`intrinsics.h` 可以直接提供给 flat-struct lowered kernel。NEON 类型名为 `struct float32x4_t`、`struct float32x2_t`；输出向量为首个指针参数，输入向量为 const 指针。`intrinsics.c` 为带契约的实际实现，`intrinsics_checked.v` 实现其全部 VC 接口，包含标量加法调用依赖。

已完整检查的 NEON 支持：`vld1q_f32`、`vaddq_f32`、`vst1q_f32`、`vst1_f32`、`vget_low_f32`、`vget_high_f32`、`vst1_lane_f32`。`qcp_vadd_block4` 检查实际 load/load/add/store 调用串，scratch 向量由调用者提供且在 precondition 中明确拥有。完整 RVV 支持目前只有固定 cap32 的 `__riscv_vsetvl_e32m8`；`qcp_rvv_add_lane32` 检查 `i < vl` 时加法、否则置零的单 lane 行为，不能当作完整 32-lane RVV load/add/store 证明。

`float_array.strategies` 将任意合法索引的 `FloatArray.full` 分解为浮点 cell 和 `missing_i`，并将未修改的 cell 合并为 segment。两条策略均通过 StrategyCheck 产生义务并由 Coq 证明。`array_read.c` 对真实 `*out = p[i]` 做了完整的策略使用验证。QCP 数组访问地址应使用 `pointer_offset(p,i,float)`，它与普通 annotation 中 `p+i` 的前端表示不同。

全部 fp32 值均在输入域中，包括 NaN、无穷与有符号零。C annotation 对 float 使用 `==` 会变成 IEEE `fp32_eq`；NaN 不自反，因此精确模型值关系使用已定义的 `fp32_bits_equal`（Coq equality）。策略语言中多态的 `v == l[i]` 生成 Coq equality，可实例化读取结果。QCP 的 RNE 加法模型采用自己的 NaN 选择策略；这些本地证明尚未建立该模型与实际 ISA/宿主编译器的对应关系。

没有编译或接受 QCP 自动生成的 `Admitted` 文件。检查实现中没有新增 axiom/Parameter；goal 文件中的 Module Type 义务由 checked Module 全部实现。`Print Assumptions` 保留 QCP 布局参数、地址解释参数和标准 Coq/Flocq 的经典实数、外延性假设，不能称为完全无假设的 ISA 证明。

`attempt_kernel.py` 使用原始 `kernels/source/f32-vadd.c`，只进行现有表示 lowering，附上原 demo 的完整 NEON kernel 契约再运行 QCP。它保留 byte batch、3 个 padding float、全 fp32 域和分离内存条件。当前停止点记录在 `experiments/vadd-proof/kernel-attempt/result.json`：向 `vld1q_f32` 同时提供 4 个读取 cell 的资源拆分尚未闭合。局部 struct 分解、数组块接口、循环不变量和 tail 组合仍待完成；完整原始 kernel 证明保持 pending。
