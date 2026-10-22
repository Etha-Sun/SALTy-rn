# 40 kernel 清单与共享 SIMD 需求

基线为 Keegan 上游 `be16280c7812a7459c26c3ce82a47339a3d07718`。仅扫描 `kernels/source/*.c` 与 `kernels/target/*.c`：**40 对、80 个非空文件**。不是新增四个 kernel 名称：40 个 source 已存在，本次补齐了四个 target。

新四项：`qd8-f32-qc8w-gemm-minmax`、`qd8-f32-qc8w-igemm-minmax`、`qs8-qc8w-gemm-minmax-fp32`、`u8-vclamp`。当前 QCP 完整 kernel 证明为 **0/40**；vadd 正在搭建与证明共享支持。清单收录不表示有可运行 mapper/spec 或已经生成/关闭 VC。

逐文件完整 SHA、两侧 intrinsic 名称、CSim 修复来源和历史证据在 `../catalog.json`。intrinsic 提取是去注释后的词法调用集合，保留所有预处理分支；属于保守需求清单，不是已选宏环境的调用闭包，更不是 ISA 语义证明。

## 能力矩阵

| 接口族 | 数量 | 主要内部义务 |
|---|---:|---|
| 逐元素浮点二元/常量 (`binary-f32`) | 7 | 数组分解/拼接、tail padding、NaN/零；min/max需保持各ISA不同语义 |
| 逐元素浮点一元 (`unary-f32`) | 3 | sqrt/round/符号判定及位表示桥；不能排除NaN以简化证明 |
| 复数逐元素 (`complex-f32`) | 1 | 交错布局、复数乘法次序、尾部地址 |
| 数据转换 (`conversion`) | 3 | signed/unsigned扩展、IEEE舍入、FP16编码与特殊值 |
| 整数归约 (`integer-reduction`) | 4 | 整数wrap、分组归约、多行stride与前缀和不变量 |
| 整数截断 (`integer-clamp`) | 2 | signed/unsigned min/max与tail读写 |
| 量化逐元素 (`quantized-elementwise`) | 5 | 饱和、移位编码、VXRM、窄化、magic-bias和参数合法域 |
| 池化/索引 (`pooling`) | 2 | 间接指针表、NaN、argmax并列选择、有效窗口与输出索引 |
| 矩阵/卷积 (`matrix-convolution`) | 10 | packed/indirect/sparse布局、FMA精确次序、嵌套循环与边界mask |
| 浮点归约/指数 (`float-reduction-exp`) | 1 | exp位算法、精确归约树、单次舍入与累加顺序 |
| 排列/打包 (`layout`) | 2 | segment/strided访问、tuple、二维置换和输出有效区域 |

词法独立 API：NEON **190**、RVV **188**，共 **378**。按以下功能安排公共库；分类仅供实现计划，不宣称覆盖正式 intrinsic 规范。

| 公共模块需求 | 不同 API 数 | 涉及 kernel 数 |
|---|---:|---:|
| FMA/融合次序 | 16 | 12 |
| VL调度与容量 | 9 | 39 |
| lane排列/广播/扩展 | 63 | 40 |
| 位重解释/表示桥 | 22 | 15 |
| 内存load/store及lane范围 | 66 | 40 |
| 归约/dot顺序 | 11 | 3 |
| 数值转换/舍入 | 4 | 7 |
| 整数算术/位运算 | 83 | 24 |
| 比较/mask/选择 | 28 | 9 |
| 浮点算术/minmax/sqrt | 39 | 26 |
| 移位/饱和/窄化 | 37 | 19 |

## 逐项状态

| Kernel | 接口族 | NEON/RVV API | 上游新 target | CSim 历史 manifest | QCP 整核 |
|---|---|---:|---|---|---|
| f32-argmaxpool | pooling | 17/9 |  | 未收录 | 未完成 |
| f32-conv-hwc2chw | matrix-convolution | 13/17 |  | 未收录；有独立修复 | 未完成 |
| f32-dwconv-minmax | matrix-convolution | 12/8 |  | 未收录；有独立修复 | 未完成 |
| f32-dwconv2d-chw | matrix-convolution | 18/9 |  | 未收录；有独立修复 | 未完成 |
| f32-f16-vcvt | conversion | 31/17 |  | 未收录 | 未完成 |
| f32-gemm-minmax | matrix-convolution | 13/6 |  | 未收录；有独立修复 | 未完成 |
| f32-igemm-minmax | matrix-convolution | 13/5 |  | 未收录；有独立修复 | 未完成 |
| f32-maxpool | pooling | 9/6 |  | 未收录；有独立修复 | 未完成 |
| f32-raddstoreexpminusmax | float-reduction-exp | 27/20 |  | 未收录；有独立修复 | 未完成 |
| f32-spmm-minmax | matrix-convolution | 17/8 |  | 未收录；有独立修复 | 未完成 |
| f32-vadd | binary-f32 | 7/4 |  | 已收录（历史） | 未完成 |
| f32-vcmul | complex-f32 | 9/6 |  | 未收录 | 未完成 |
| f32-vdiv | binary-f32 | 7/4 |  | 已收录（历史） | 未完成 |
| f32-vlrelu | unary-f32 | 12/7 |  | 已收录（历史） | 未完成 |
| f32-vmax | binary-f32 | 7/4 |  | 已收录（历史）；有独立修复 | 未完成 |
| f32-vmin | binary-f32 | 7/4 |  | 已收录（历史）；有独立修复 | 未完成 |
| f32-vmul | binary-f32 | 7/4 |  | 已收录（历史） | 未完成 |
| f32-vmulc | binary-f32 | 8/4 |  | 已收录（历史） | 未完成 |
| f32-vrndne | unary-f32 | 14/13 |  | 未收录 | 未完成 |
| f32-vsqrt | unary-f32 | 7/4 |  | 未收录 | 未完成 |
| f32-vsub | binary-f32 | 7/4 |  | 已收录（历史） | 未完成 |
| qd8-f32-qc4w-gemm-minmax | matrix-convolution | 26/16 |  | 未收录；有独立修复 | 未完成 |
| qd8-f32-qc8w-gemm-minmax | matrix-convolution | 22/16 | 是 | 未收录 | 未完成 |
| qd8-f32-qc8w-igemm-minmax | matrix-convolution | 22/16 | 是 | 未收录 | 未完成 |
| qs8-f32-vcvt | conversion | 14/8 |  | 已收录（历史） | 未完成 |
| qs8-qc8w-gemm-minmax-fp32 | matrix-convolution | 28/16 | 是 | 未收录 | 未完成 |
| qs8-rdsum | integer-reduction | 16/9 |  | 未收录 | 未完成 |
| qs8-rsum | integer-reduction | 12/10 |  | 已收录（历史） | 未完成 |
| qs8-vadd-minmax | quantized-elementwise | 30/13 |  | 未收录；有独立修复 | 未完成 |
| qs8-vcvt | quantized-elementwise | 14/11 |  | 已收录（历史）；有独立修复 | 未完成 |
| qs8-vlrelu | quantized-elementwise | 17/13 |  | 已收录（历史） | 未完成 |
| qs8-vmul-minmax-fp32 | quantized-elementwise | 26/14 |  | 未收录；有独立修复 | 未完成 |
| qu8-f32-vcvt | conversion | 16/9 |  | 已收录（历史） | 未完成 |
| qu8-rdsum | integer-reduction | 18/9 |  | 未收录 | 未完成 |
| qu8-rsum | integer-reduction | 12/10 |  | 已收录（历史） | 未完成 |
| qu8-vadd-minmax | quantized-elementwise | 25/17 |  | 未收录；有独立修复 | 未完成 |
| s8-vclamp | integer-clamp | 16/5 |  | 已收录（历史） | 未完成 |
| u8-vclamp | integer-clamp | 16/5 | 是 | 已收录（历史） | 未完成 |
| x32-packw-gemm-goi | layout | 6/8 |  | 未收录 | 未完成 |
| x32-transposec | layout | 5/3 |  | 未收录 | 未完成 |

## 接入与验收规则

1. 人类审查原始两侧函数、接口配置、`spec.h` 和 `mapper.c`；共享 intrinsic/内存/浮点模型另作一次版本审查，不从逐 kernel 审查中隐去。
2. 公开 post 保持 `equivalent` 返回 1；整数/浮点/索引输出使用明确 observation 模板。内部模型和循环不变量可以复杂，但必须关闭其自身 VC。
3. 先完成 vadd 的 load/add/store/VL/half-lane 与数组前缀桥，再复用到其它 binary-f32；min/max 必须单独审查原版语义差异。然后推进整数 clamp/reduction/conversion；布局、量化、矩阵族各补模板。
4. 将原始、修复候选分别固定版本。发现 CSim 已知反例时先重放原版与修复版；禁止让 shim 改变原 intrinsic 语义来掩盖差异。
5. `python3 verification/qcp/tools/inventory.py --check` 检查40配对、当前文件与已固定上游commit、catalog SHA/词法清单；不会运行40个证明。
6. 若只写 intrinsic 契约，消费者通过仍是条件性结果；只有实际实现、调用前件、helper、mapper、wrapper依赖闭包均检查，才能标成整核通过。ISA→C shim 另列义务。
