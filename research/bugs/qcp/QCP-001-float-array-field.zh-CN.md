# QCP-001：局部 struct 中的 float/double 数组字段无法通过类型推断

- **版本：** QCP 2.1.4（本地 `.local/qcp/QCP-V2.1.4`）。
- **发现：** 2026-11-04 由 E1 worker W1 发现，监督者复现，并扩展到其他元素类型。
- **最小复现与各元素类型的结果：** [rvv-array-vector-probe-20261104/qcp-float-array-field-bug/](../../project-plan-20261102/rvv-array-vector-probe-20261104/qcp-float-array-field-bug/README.zh-CN.md)。
- **现象：** `struct V { float s[64]; }; ... { struct V v; }` 报错 `cannot unify (Z -> Z -> list Z -> Assertion) with (Z -> Z -> list fp32 -> Assertion)`。double 同样报错；char/short/int/unsigned/long 都正常。
- **影响与处理：** E1 中的 RVV float 向量改用 `unsigned int s[VLMAX]` 比特 lane 表示，合同中通过 `bits_of_fp32`/`fp32_of_bits` 转换。f32-vadd 的 RVV 侧已用这种表示在三种 VLEN 下证通。
- **状态：** 尚未报告给 QCP 作者，对外报告需用户同意。
