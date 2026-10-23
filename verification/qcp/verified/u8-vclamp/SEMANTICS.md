# u8-vclamp shim 语义台账

审核入口是本目录实际 C 及注释合同，以及其 Import 的 Coq 定义。下表的 `body-checked` 由完整包的实际 C 目标及 typed gate 支持；没有把来源人工对照标成 `ISA-correspondence-checked`。当前状态入口为 [status.json](proof/status.json)。

NEON 来源为 [Arm ACLE Advanced SIMD Intrinsics Reference](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)，2026-10-23 查阅，2026Q1 之后的持续发布版本（按页面 Git 提交标识）；对应章节为 Minimum/Maximum、Load/Store、Duplicate、Get low、Vector extract、Reinterpret。RVV 来源为 [RISC-V Vector V1.0](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html)，手册版本 v20260120，主要为 VL constraints、Vector Unit-Stride Instructions、Vector Integer Min/Max、Tail/Mask policy。以下描述明确本包选择，来源链接不替代形式语义桥。

| intrinsic 与类型 | 本案语义、配置／调用范围 | 实际 C／合同与 Coq 绑定 | body 状态 |
|---|---|---|---|
| `vmin[_q]_u8`、`vmax[_q]_u8`：两个 uint8x8/16 向量返回同型 | 无符号逐 byte min/max；8 或 16 lanes；ACLE UMIN/UMAX | [full_neon_shim.c](shim/neon/full_neon_shim.c)，[U8Logic](proof/coq/FullU8/U8Logic.v) 的 u8_min/u8_max；FullU8.full10_goal | body-checked |
| `vld1[_q]_u8(const uint8_t*)`、`vst1[_q]_u8(uint8_t*,vector)` | 读取／写入完整 8 或 16 bytes，顺序保持；store 宏借用局部向量 | [full_neon_shim.c](shim/neon/full_neon_shim.c)、[arrays.h](shim/neon/arrays.h)；UCharArray 的 full/seg；FullU8.full10_goal | body-checked |
| `vdupq_n_u8(uint8_t)`、`vget_low_u8(uint8x16_t)` | 16 bytes 广播；提取低 8 bytes。get-low 展开成结构字段访问 | [full_neon_shim.c](shim/neon/full_neon_shim.c)；实际展开后包含于 NEON 目标 | body-checked／展开点已覆盖 |
| `vext_u8(uint8x8_t,uint8x8_t,int)` | 此 kernel 只有同一无副作用局部向量作两参数、位移字面量 2 或 4；模型只实现这两个 self-EXT 调用形态 | [full_neon_shim.c](shim/neon/full_neon_shim.c) 中 qcp_self_ext2/4；FullU8.full10_goal；不宣称通用两向量 EXT 支持 | body-checked |
| `vreinterpret_u32_u8(uint8x8_t)`／`vreinterpret_u16_u8(uint8x8_t)` | 保持 byte view；不是数值 cast。32/16 位解释采用小端 | [tail.c](shim/neon/tail.c)、[le_store.c](shim/neon/le_store.c)；U8Tail／TailAdapter 证明与 FullU8.full10_goal | body-checked |
| `vst1_lane_u32(uint32_t*,uint32x2_t,int)`／`vst1_lane_u16(uint16_t*,uint16x4_t,int)`／`vst1_lane_u8(uint8_t*,uint8x8_t,int)` | 本案 lane 恒为 0；实际嵌套 reinterpret 表达式先求值一次，再经 adapter 写 4/2/1 bytes。不增加输出 word 对齐 | [full_neon_shim.c](shim/neon/full_neon_shim.c) 中 qcp_array_store32/16/8_0，[tail.c](shim/neon/tail.c)；byte permission 与值 roundtrip 证明 | body-checked |
| `__riscv_vsetvl_e8m8(size_t)` → size_t | VLEN128、SEW8、LMUL8、VLMAX128，所选返回值 min(AVL,128)；可选版本先 cap 请求 | [packed_impl.c](shim/rvv/packed_impl.c)、[U8Logic](proof/coq/FullU8/U8Logic.v) 的 u8_vl；VLCodecVC.CheckedVL；[Policy](proof/coq/RvvRepair/Policy.v) | body-checked；Policy 是规范规则的数学应用 |
| `__riscv_vle8_v_u8m8(const uint8_t*,size_t)` → vuint8m8_t | vstart=0、无 mask，读前 vl bytes；inactive byte 在此模型置零 | [packed_impl.c](shim/rvv/packed_impl.c)，[Packed32Model](proof/coq/FullU8/Packed32Model.v) 的 lane_load/word_load；MemoryCodecVC、VectorRepair.VectorVleGate | body-checked |
| `__riscv_vminu_vx_u8m8`／`__riscv_vmaxu_vx_u8m8`：(vector,uint8_t,size_t) → vector | active byte 做无符号 min/max，inactive byte 保留原值；后续本案只观察 active lane | [packed_impl.c](shim/rvv/packed_impl.c)，[Packed32Model](proof/coq/FullU8/Packed32Model.v) 的 active_min/max、word_min/max；ActiveCodecVC、VectorRepair.VectorVmin/VectorVmaxGate | body-checked |
| `__riscv_vse8_v_u8m8(uint8_t*,vector,size_t)` → void | 向量表达式求值一次并借用临时对象；只写 vl bytes，其他内存 frame 保持 | [packed.h](shim/rvv/packed.h)、[packed_impl.c](shim/rvv/packed_impl.c) 中 qcp_rvv_store；GettersCodecVC、StoreCodecVC | body-checked |

RVV 的 pack4/word_byte、按 word 取 byte、active 算术和内存 helpers 共 17 个真实函数，均在 public packed_impl.c；生成时按函数从这里提取。32 个 uint32 字段恰好编码 128 个 uint8 lane，不是把硬件 VLMAX 缩成 32。load 置零是本案内部 inactive 值的确定选择，不能推断真实 tail-agnostic 指令必须清零；本案没有把这些 inactive 值写出或交给下一轮观察。

共同内存使用 QCP 的 64 位小端 UCharArray；参数转 uint8 的逻辑是模 256，保留全部 uint32 参数。NEON 和 RVV 各自按实际代码的 bulk64 与尾段顺序运算。assert frontend 的 C body 为条件假时不返回，合同用于部分正确性；它不产生额外终止性结论。NEON frontend 中 XNN_OOB_READS 为空标记，XNN_UNLIKELY 保留条件表达式；完整输入包含 7 字节 padding。

全部源码调用形态、展开 token、callee 合同和模型绑定受输入锁与调用图审核约束。这里只为本 kernel 的具体调用形态提供适配，不扩大到任意带副作用表达式、不同参数 alias、mask、其他 SEW/LMUL/VLEN。已完成的 C body 证明与上述显式语义范围共同构成本案 verified 结论。
