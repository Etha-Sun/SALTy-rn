# 共享 C shim 与契约：人工审核入口

这些文件从 `verified/f32-vadd/proof/c/` 移出，属于语义审核边界；不是自动生成的验证副本。
名称保留现有 Coq 命名空间，便于复用已检查的证明。

| 目录 | 审核内容 |
| --- | --- |
| `ByValue/` | NEON intrinsic 函数体、声明契约、store 宏及原始 C 的 frontend |
| `ByvalueRvv/` | RVV 按值调用适配、store 宏、frontend 中 assert/vsetvl 实现及契约 |
| `QcpVadd/` | float32x4/float32x2 类型、float 数组逻辑绑定 |
| `QcpRvv32/` | 32-lane RVV 类型、load/add/store primitive 实现和契约、内存/循环模型绑定 |
| `QcpNeon/`、`QcpNeonLoop/` | 向量内存和 NEON 循环/尾部逻辑绑定 |

当前共享库尚含 VADD 专用的模型绑定（尤其 vadd_values 和循环/尾部定义），
不宣称这些部分已经适用于所有 kernel。RVV 固定 VLEN=128、e32m8、32 lanes，vsetvl 采用 `min(n,32)` 策略；
store 宏仅支持本例局部向量左值。浮点采用 binary32/RNE；这些约束不可默默推广。

## Coq 语义也需要审核

C 契约使用的名字绑定到 Coq 定义，不能只读名字判断意义。为避免复制或移动导致证明变化，
本次保留原有 Coq 物理位置。共享语义审核至少覆盖：

- [fp32、加法、VL 与内存元素](../../../verified/f32-vadd/proof/coq/QcpVadd/VaddBits.v)
- [NEON 内存布局与向量逻辑](../../../verified/f32-vadd/proof/coq/QcpNeon/NeonBridge.v)
- [NEON 分块和尾部模型](../../../verified/f32-vadd/proof/coq/QcpNeonLoop/NeonLoopBridge.v)
- [RVV 布局](../../../verified/f32-vadd/proof/coq/QcpRvv32/RvvLayout.v)、[有效 lane 模型](../../../verified/f32-vadd/proof/coq/QcpRvv32/RvvLogic.v)、[store 模型](../../../verified/f32-vadd/proof/coq/QcpRvv32/RvvStoreModel.v)
- [数值/NaN 观察关系](../../../verified/f32-vadd/proof/coq/NanBridge/BridgeLogic.v)
- [逐元素比较关系](../../../verified/f32-vadd/proof/coq/VaddComparator/ComparatorLogic.v)、[两侧结果组合](../../../verified/f32-vadd/proof/coq/VaddWrapper/WrapperLogic.v)

这些定义的正确性与真实 ISA 的对应仍需单独论证。Coq 检查契约的证明，不替人选择契约。
每次 kernel 审核入口见 [VADD](../../../verified/f32-vadd/README.zh-CN.md)。
