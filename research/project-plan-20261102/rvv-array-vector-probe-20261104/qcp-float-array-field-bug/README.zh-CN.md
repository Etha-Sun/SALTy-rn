# QCP 2.1.4：局部 struct 中的 float/double 数组字段无法通过类型推断

2026-11-04。最先由 W1 发现，监督者复现并扩展到其他元素类型。

最小例子：`struct V { T s[64]; };`，在函数 `probe` 中声明一个局部变量 `struct V v;`。

| T | 结果 |
|---|---|
| signed/unsigned char、short、unsigned short、unsigned int、long | 生成成功 |
| int | 生成成功（W1 的对照，以及 probe p1–p5） |
| float | `Type inference error: cannot unify (Z -> Z -> list Z -> Assertion) with (Z -> Z -> list fp32 -> Assertion)` |
| double | 同类错误，list fp64 |

去掉 `FloatArray` 的 Extern 声明（a.c），或者把它声明成 `list Z`（b.c），错误不变。可以推断：QCP 为局部 struct 的数组字段内部生成谓词时，统一使用 `list Z`，与它内置的 `FloatArray`/`DoubleArray` 签名冲突。

**处理：** E1 的 float 向量在 QCP shim 中改为 32 位比特 lane 表示：`unsigned int s[VLMAX]`，由 `UIntArray` 持有。合同中通过 `bits_of_float_value` 等函数与 `fp32` 相互转换。QCP 自身的内存模型就是 `store_float x v = store_4byte x (bits_of_float_value v)`，而 `fp32` 是保留 NaN payload 的 Flocq `binary32`，所以这样表示不弱化任何语义。kernel 源码不受影响。

本目录的文件可以作为发给 QCP 作者的最小复现。
