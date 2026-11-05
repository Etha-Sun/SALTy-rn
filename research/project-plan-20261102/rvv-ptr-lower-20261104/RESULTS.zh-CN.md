# rvv_ptr_lower 在 35 个最终 Bopt kernel 上的结果

2026-11-04。

- 工具：`tools/rvv_ptr_lower/`，版本 rvv_ptr_lower 1.0.0。规则表见工具的 README。
- 输入：`keaganchern/optimized-rvv-kernels@80feb4564` 的 35 个文件。
- 原始记录：[validation.json](validation.json)。完整运行目录在 `build/rvv-ptr-lower-20261104/val6/`（未提交），内含每个 kernel 的改写结果、生成的头文件、改写日志和 QEMU 输出。

## 结论

| 检查 | 结果 |
|---|---|
| 改写成功（无拒绝） | 35/35 |
| 确定性（两次运行输出逐字节相同） | 35/35 |
| 幂等性（对输出再运行一次，没有改写也没有拒绝） | 35/35 |
| QEMU 差分（VLEN 128/256/512 下原版与改写版的 stdout 完全相同，包括 PASS/FAIL、错误信息和所有静态缓冲区的哈希） | 35/35 |

改写后，kernel 中剩下的 `__riscv_` 调用只有 `vsetvl`/`vsetvlmax`，它们只返回标量。

规则使用次数：

| R1 | R2 | R3 | R4 | R5 | R6/R8 | R12 | R13 | R4+R9 |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 473 | 4 | 148 | 1156 | 19 | 164 | 85 | 8 | 6 |

- R4（累加器 `acc = f(acc, …)`，先写入临时变量再拷回）占大多数。
- R12（kernel 内部宏展开）用于 f32-conv-hwc2chw、f32-igemm-minmax、qs8-rdsum 三个文件。

改写后共用到 170 个不同的指针形式操作和 18 种向量拷贝类型，这就是 QCP shim 需要提供合同的范围。最多的几族：vmv 10、vle32/vse32/vadd 各 8、vget/vreinterpret 各 7。另有 tuple 操作（vget/vset/vlsseg/vsseg）和 `vundefined`。

**差分测试的局限：** 这是测试证据，不是证明。上游 harness 的规模较小，例如 f32-vadd 只有 64 个元素，在 VLEN512 下只跑一轮循环。改写的正确性依据是规则表及其语义论证。

## 顺带发现（与工具无关，属于 E1 原始 Bopt 的问题，待分诊）

1. **6 个 Bopt 在上游 SALTy harness 中与标量参考不一致。** 改写前后结果相同，说明问题来自原 Bopt 或 harness 本身：

   | kernel | VLEN 128/256/512 | 首条报错 |
   |---|---|---|
   | f32-f16-vcvt | FFF | NaN 输入：得到 0x7c00（Inf），期望 0x7e00（qNaN） |
   | f32-igemm-minmax | FFF | 第 4 通道数值不同 |
   | qd8-f32-qc4w-gemm-minmax | PFF | 只在 VLEN 256/512 失败，结果为 0；与 VLEN 有关 |
   | qs8-vmul-minmax-fp32 | FFF | 差 1（舍入？） |
   | qu8-vadd-minmax | FFF | 得到 255，期望 0（饱和或参数布局？） |
   | x32-packw-gemm-goi | FFF | 填充区的 canary 0xdeadbeef 被写成 0 |

   这些 harness 原本是为 SALTy 的 B0（`kernels/target`）编写的。Bopt 可能使用不同的参数布局或约定，所以它们**不能直接算作反例**。需要逐个判断：是 harness 与 Bopt 的接口不匹配，还是 Bopt 真实出错。

2. **6 个 Bopt 自带 params struct 定义，与 XNNPACK 的 microparams.h 冲突。** 它们是 f32-dwconv-minmax、f32-maxpool、f32-vmulc、qs8-vlrelu、s8-vclamp、u8-vclamp。上游 harness 无法直接编译这些文件。差分测试对原版和改写版做了同样的测试用适配：删除 kernel 自带的定义，改用 XNNPACK 的定义。

   其中 **u8-vclamp 的定义与 XNNPACK 布局不同**：Bopt 是 `struct { uint8_t min; uint8_t max; } scalar`，XNNPACK 是 `uint32_t min/max`。放进 XNNPACK 调用时，参数读取位置不同。这一点需要在 E1 的 spec 中明确：以哪个 ABI 为准。
