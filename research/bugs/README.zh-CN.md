# Bug 记录

验证过程中发现、能追溯到具体来源的 bug，按来源分文件夹存放：

| 文件夹 | 收录范围 |
|---|---|
| [xnnpack/](xnnpack/) | XNNPACK 自身的问题：kernel 与 XNNPACK 自己的参考语义不一致，或 API、参数初始化漏检等。E1 原始 NEON A 的问题也放在这里，因为 A 来自 XNNPACK |
| [bopt/](bopt/) | 最终优化 RVV kernel（Bopt，`keaganchern/optimized-rvv-kernels@80feb4564`）自身的问题 |
| [qcp/](qcp/) | QCP 验证工具（前端、符号执行）的缺陷 |

## 每条记录必须写明

1. **发现途径：** 在哪个实验（E1/E2/E3/E4）中，验证哪一对程序时发现；是证明失败得到的反例，还是辅助手段（普查、SMT 有界证伪、差分测试）先给出线索、再经验证确认。
2. **固定版本**、触发条件和最小反例。
3. **证据：** 源码位置、运行结果（真实 intrinsic + QEMU 或硬件）。
4. **能否在原始应用中出现**：按 `research/project-plan-20261102/LESSONS.zh-CN.md` L1 的流程，逐步查 XNNPACK 的调用路径。
5. **偏离方：** 对照 XNNPACK 参考语义，说明哪一侧不一致。
6. **修复计划**（必填）：
   - 最小补丁和存放位置；原件保留；
   - 修复后要验证的结论，例如 A_fixed ≡ Bopt 或 A ≡ Bopt_fixed；
   - 性能影响：修改 Bopt 时必须实测，不能只写"预计不影响"；
   - 是否需要向上游报告，以及对外报告需要用户同意这一点。
7. **对实验结论的影响：** 原始结论（例如"原始 A ≠ Bopt"）始终保留，修复后的结论单独报告。
8. **状态。**

推断与已验证的结论分开写。

## 索引

| 编号 | 发现途径 | 标题 | 状态 |
|---|---|---|---|
| [XNN-001](xnnpack/XNN-001-vclamp-tail-order/README.zh-CN.md) | E1 s8-vclamp（A ⇔ Bopt），证明时得到反例 | s8/u8 vclamp 的 SIMD 实现中，尾部 min/max 顺序与参考语义相反，`min > max` 时结果不一致 | 已确认；A 的修复补丁已备好；A_fixed ≡ Bopt 正在由 W4 验证 |
| [BOPT-001](bopt/BOPT-001-u8-vclamp-params-abi.zh-CN.md) | E1 准备阶段：改写工具的差分测试暴露了编译冲突，再审源码发现 | u8-vclamp 自定义的 params 布局（uint8）与 XNNPACK（uint32）不一致 | 待实测确认；修复计划见记录 |
| [QCP-001](qcp/QCP-001-float-array-field.zh-CN.md) | E1 f32-vadd，RVV shim 生成 VC 时 | 局部 struct 中的 float/double 数组字段无法通过类型推断 | 已复现；E1 用比特 lane 表示绕开；未向作者报告 |
| [QCP-002](qcp/QCP-002-struct-array-assign.zh-CN.md) | E1 s8-vclamp，证明拷贝适配器时 | 数组字段 struct 之间的整体赋值无法符号执行 | 已复现；shim 拷贝改用逐 lane 循环 |
