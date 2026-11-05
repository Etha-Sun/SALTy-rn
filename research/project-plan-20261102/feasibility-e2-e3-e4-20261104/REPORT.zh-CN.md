# E2 / E3 / E4 可行性调查（XNNPACK 867d5a34，只读）

2026-11-04。这份调查由一个只读调研 agent 完成：没有运行证明、编译、kernel 或模拟器。主 agent 抽查了三处源码引用，均一致：`binary-elementwise-config.c:1430-1457`（qs8-vprelu 只在 x86 注册）、`operator-run.c:1705-1730`（Softmax 调用链）、`simd/f32-hvx.h:135-150`（HVX round）。其余引用尚未逐条复核。

标记：**[源码]** 是直接读源码或脚本机械提取，附路径和行号；**[推断]** 是由源码语义推出、未经复现的结论，不能当作反例或 bug；**[估计]** 是难度判断。"缺失"只相对于提交 `867d5a344790802ee067be62f572c2e2722bf6fb`。

机器可读结果：[e2-candidates.csv](e2-candidates.csv)（24 行）、[e3-pairs.csv](e3-pairs.csv)（38 行）。脚本及其输出在 [scripts/](scripts/)。

## 0. 摘要

**E2：严格条件只有 1 个合格操作，放宽后可行。**

- 严格条件是 NEON、RVV、HVX 三端都没有。在这个条件下，已接入 operator 且规模适中的只有 **qs8-vprelu** 族：AVX2 kernel 只在 x86 分支注册，其余架构走 `#else` 的 scalar（`src/configs/binary-elementwise-config.c:1430-1457`），operator 是 `src/operators/binary-elementwise-nd.c:123`。qu8-vprelu 用同一模板，只算 dtype 变体。
- 三端也都没有、但**没有接入任何 config** 的有：f32-raddexpminusmax、vscaleexpminusmax、raddextexp、vscaleextexp，以及 x8-packw AVX2。它们只有声明、测试和 benchmark，属于类别 (c)。
- 其余三端都缺的：qs8-packw 绑定 x86 madd/VNNI 布局；f16-f32acc-gemm 是新 dtype；bf16 gemm 只有汇编，排除。
- 结论：**严格条件下合格的独立操作不足 5 个。** 要凑满 5 个，需要接受"NEON 有、RVV 和 HVX 都没有"这一档较弱条件，这一档样本充足。
- 推荐：qs8-vprelu、f32-vsigmoid、f32-velu、f32-ibilinear、x8-lut。f32-raddextexp 作为高难度备选，需注明未接入 operator。
- 主要风险在 HVX 端：
  - `xnn_div_f32` 实现为 `a*fast_inverse(b)`（`src/xnnpack/simd/f32-hvx.h:66-73`）；
  - 没有原生 FMA（`:38`）；
  - 中间格式是 qf32；
  - HVX 工具链的边界问题尚未解决。

**E3：可行，配了 38 对。**

配对依据是同一 config 角色、同一 params 结构和 init 函数、同一签名，不看函数名。

- **正对照：** 最有价值的是同模板、同 FMA 属性的 NEON(AArch64)↔FMA3 vtanh/vexp。两边常数相同、都用 IEEE 除法，[推断] 很可能逐位相等。
- **应最先检查的差异点：**
  - f32-qs8-vcvt 的 NaN 映射 [推断]：NEON→zero_point，RVV→-128，AVX2/HVX→127。
  - HVX vrndne：v73 及以上版本在 qf32 中计算 |a|+0.5，否则用 `roundf`，两者遇到恰好一半时都向远离零的方向舍入；而 NEON 和测试参考都是 ties-to-even（`test/unary-ops.h:330-333`）。这可能是真实问题，但必须先在 Hexagon 模拟器上复现。
  - AVX `maxps` 的 NaN 结果取决于操作数顺序，在 vmax 和 rmax 模板中表现不对称。
  - RVV `vfredusum` 是无序归约；HVX 在 qf32 中累加。
  - vsqrt 在 x86 默认路径用 rsqrt 近似，consistent 路径才是精确 sqrt。
  - qs8-vmul：ARM64 用 rndnu，与 fp32 版本不是同一契约。
- 已经复现的 min/max NaN 差异，维护者已声明不作保证，不计为新 bug。

**E4：Softmax 可做，但现成的 NEON 与 RVV kernel 不可能严格等价。**

- 真实调用链：`rmax → raddstoreexpminusmax → 标量 1/sum → 原地 vmulc`（`src/operator-run.c:1705-1730`）。
- ARM64 选 neonfma_rr1_lut64_p2，RVV 选 rr2_p6，算法不同。NaN 处理也不同：RVV 把 NaN 钳到 xmin。RVV 的归约是无序的。
- 可行的路线是：固定 NEON 路径，验证一个保持同一算法的 RVV 程序。
- 建议先用 **qs8 mean** 做组合试点：`fill/memset → 多次 qs8-rsum 累加 int32 → reference 转换`。每一步都是整数精确的，框架已有 qs8-rsum 证明（`reduce-nd.c:509-533`、`operator-run.c:1368-`）。之后再做 Softmax。

## 1. 方法与 inventory 核查

所有脚本都以 `python3 -I` 只读运行：

| 脚本 | 用途 |
|---|---|
| `inventory.py` | 已修正，见下文 |
| `cfgarch.py` | 记录每个 config 引用所在的 `#if XNN_ARCH_*` 分支、init 函数和行号 |
| `opsummary.py` | 每个 op 在 ARM64/RISCV/HEXAGON/X86/ELSE 各分支实际选用的 ISA |
| `incparse.py` | 解析 `XNN_UKERNEL(...)`，提取 params 类型和 init 函数 |
| `pairs.py`、`e2table.py`、`opdetail.py`、`showop.py` | E2 表、跨 ISA 注册配对、单个 op 的细节 |

**修正旧 inventory。** 旧版只看 `__` 之后的第一个 token 来判断 ISA，导致 26 个家族被归为 `other:*`，例如：

- transpose（`__4x4_sse`、`__32x8_rvv`、`__32x32_multi_multi_hvx`）；
- `asm_amd64`、`fp16arith`、`armsimd32`；
- `..._minmax__ukernel_4x16c4__asm...` 这类命名。

所以旧表把 x32-transposec 的 RVV 和 HVX 记为空。新版扫描 ISA 后缀中的全部 token，`other` 降为 0。旧输出保存在 `inventory.v1.txt`。

**局限：**

- "已注册"只表示该符号出现在 `src/configs` 中，没有展开 `XNN_ENABLE_*` 和 BUILD 配置。
- raddexp 等族只在 `.h` 中声明，不出现在 `.inc`。

**结构事实 [源码]：** 43 个 `.c.in` 模板 include `src/xnnpack/simd/f32-${ARCH}.h`，但仓库里没有 `f32-rvv.h`。由此可知：

- "缺 RVV、但有 HVX"多半是因为 RVV 没有这个抽象头。
- 对这些模板来说，AVX→HVX 基本只是换一个头文件，作为 E2 的贡献偏弱。
- 同模板的跨 ISA 版本只在 `xnn_*` 包装层不同，是 E3 的天然配对。

另外，部分模板会按 `XNN_SIMD_HAS_NATIVE_FMA` 选用不同常数，例如 vtanh（`src/f32-vtanh/rational-9-8.c.in:38-56`）；vexp 模板没有这类分支。

## 2. E2

### 严格条件下的候选 [源码]

- **qs8/qu8-vprelu（AVX2）：**
  - 共 28 个不同 intrinsic、108 处调用。
  - tail 用 16 字节的 `_mm_loadu_si128`，函数标有 `XNN_OOB_READS`。
  - 用 magic-bias 舍入，clamp 之后做饱和 pack。
  - params 初始化在 `src/microparams-init.c:937-960`。
  - scalar 参考是 `qs8-vprelu-scalar-u*.c`，测试是 `test/qs8-vprelu.cc`。
- **radd/vscale-exp 族（avx2、avx512f）：** config 中没有任何引用，只有 `test/f32-raddexpminusmax.cc` 等测试。
- **x8-packw AVX2：** 未注册，config 使用 scalar（`gemm-config.c:1940` 附近）。

### 较弱条件：逐条核对 config 中的回退 [源码]

| op | RVV / HVX 的实际选择 |
|---|---|
| f32-vsigmoid | 走 `#else` 的 scalar（`unary-elementwise-config.c:2003`）；AVX2/AVX512 版本只在 !consistent_arithmetic 时选用（1955-1964） |
| f32-velu | RISCV 显式选 scalar（1182）；HVX 走 `#else`（1186） |
| f32-vmulcaddc | scalar（`vmulcaddc-config.c:122`） |
| f32-ibilinear / ibilinear-chw | scalar（`ibilinear-config.c:96`、`ibilinear-chw-config.c:78`） |
| s8/u8-ibilinear | scalar（`ibilinear-config.c:137/178`） |
| s8/u8-maxpool | scalar（`maxpool-config.c:148/182`）。模板本可生成 HVX 版本，但 `scripts/generate-s8-maxpool.sh` 没有实例化，按类别 (c) 处理 |
| x8-lut | scalar（`x8-lut-config.c:78`）；NEON 只在 AArch64 上用 tbx |
| x8/x16/x24/x64-transposec | scalar（`transpose-config.c:151-208`） |
| qu8-gemm fp32 | `scalar_lrintf`（`gemm-config.c:5998`） |
| f32-qc8w-gemm | scalar（`gemm-config.c:2136`） |
| f16 逐元素族 | HVX 没有任何 f16 kernel；RVV fp16 只覆盖少数算子 |

### 推荐短名单 [估计]

| # | op | 难度 | 说明 |
|---|---|---|---|
| 1 | qs8-vprelu | 低到中 | 唯一满足严格条件且已接入 operator 的操作 |
| 2 | f32-vsigmoid | RVV 中，HVX 高 | 用 consistent 路径的 `avx_rr2_p5_div`；HVX 需要可证明的 IEEE 除法 |
| 3 | f32-velu | 中到高 | `avx512f_rr1_p6` 或已注册的 `avx2_rr1_lut4_p4_perm`；params 结构加 permute 查表 |
| 4 | f32-ibilinear sse_u8 | 低到中 | indirection 指针结构 |
| 5 | x8-lut ssse3/avx2 | 中 | 整数精确，但 16 段 pshufb 加 xor 叠加的技巧需要证明 |
| 6 | f32-raddextexp（备选） | 高 | 扩展指数表示；需注明未接入 operator |

- **可替换：** f32-vmulcaddc、x24-transposec、s8-ibilinear。其中 s8-ibilinear 在 `sse41-u16.c:92` 用 `_mm_add_epi16` 加到 32 位累加器上，它与 32 位加法等价依赖常数低半为 0，需要证明。
- **不建议：** maxpool（基本只是换头文件）、unpool/pad（过于简单）、qu8/f16 gemm（成本高）、bf16（只有汇编）。
- **性能基线：** 目标端没有原生实现可比时，用上表中 config 回退的 scalar kernel。

## 3. E3

完整配对见 [e3-pairs.csv](e3-pairs.csv)。每行包含两侧文件、注册位置、是否同模板、params 和 init、契约注记、优先检查的差异点、[推断] 的预期关系，以及框架是否做过。

### 预期相等的正对照

- vtanh/vexp：NEON↔FMA3（E3-01、E3-03）。
- vsqrt：NEON↔RVV（框架已做）；NEON↔AVX 的 consistent 路径。
- vlrelu：NEON↔AVX，两者都按符号位选择。
- qs8-f32-vcvt 的第三端。
- s8-rmax：四端，整数精确。
- vcopysign、x32-transposec，以及共享模板的 maxpool/avgpool。

### 预期有差异、应先检查的点 [推断]

- **f32-qs8-vcvt 的 NaN（E3-23、E3-24）：**
  - NEON：`vcvtnq` 把 NaN 变成 0，输出 zero_point。
  - RVV：先用 `vfmax/vfmin` 钳制，再用动态 FRM 的 `vfcvt`，NaN→-128。
  - AVX2：`min_ps` 返回第二个操作数，NaN→127。
  - HVX：magic-bias 后做饱和相减，NaN→127。
- **HVX vrndne（E3-19）：** 见摘要。
- **RVV vrndne 与 vlrelu 的 ±0：**
  - RVV vrndne 经过整数转换，会丢失零的符号。
  - vlrelu 中 RVV 用 `vmflt` 比较，NEON 用符号位；slope 为负时，零的符号会不同。
  - 框架的"数值相等"观察关系会掩盖这类差异，这对 E4 有影响。
- **AVX vmax/rmax 的 NaN：** 结果随操作数顺序和 NaN 位置而变（`f32-vmax-avx-u16.c:42`、`rminmax/simd.c.in`）。
- **归约：**
  - RVV `vfredusum` 无序（`f32-rsum-rvv-u4v.c:43`）。
  - HVX 在 qf32 中累加；head 部分用 128 字节 loadu，但函数签名上没有 `XNN_OOB_READS`（`f32-rsum-hvx-u64-acc2.c:17-24`）。
- **HVX 的 rational 族：** 除法是近似的，FMA 不融合，clamp 常数也不同。
- **vsqrt（E3-18）：** x86 默认路径用 rsqrt 近似，不是精确 sqrt。
- **契约本身不同：**
  - qs8-vmul：ARM64 选 rndnu，RVV 和 x86 用 fp32，两者不是同一契约，适合作为契约澄清的案例。
  - gemm、dwconv、packw：packed 布局随 mr/nr/kr 变化，必须在 packw+gemm 组合的层面比较。

以上都只是待查点，没有一项被断言为 bug。

## 4. E4

### Softmax 调用链 [源码]

1. `src/subgraph/softmax.c:39,72`：create 和 reshape；channels 取最后一维，stride 等于 channels。
2. `src/operators/softmax-nc.c`：
   - create（333-369）使用 `xnn_init_f32_raddstoreexpminusmax_config(flags)`，consistent 标志会改变 x86 上的选择；
   - reshape（577-599）设 `rmax_init=-INFINITY`，rmax、expminus、minmax 的 params 都是 NULL/0；
   - context（444-455）中 `vmulc = vmul->opc_ukernel`；
   - 以 task_1d 按 batch 行并行（472-475）；
   - `compute_reciprocal_f32` 计算 `1.0f/*input`（535-540）。
3. `src/operator-run.c:1705-1730`：每行依次执行 rmax、raddstore（x→y，同时输出 sum）、取倒数，最后**原地**执行 vmulc（y→y）。

各 ISA 实际选用的 kernel：

| 步骤 | ARM64 | RVV | HVX |
|---|---|---|---|
| rmax | `neon_u16_acc4`（`reduce-config.c:913`） | `rvv_u8v`（967） | `hvx_u64_acc2`（974） |
| raddstoreexpminusmax | `neonfma_rr1_lut64_p2_u16_acc2`（`raddstoreexpminusmax-config.c:73`），需要全局表 `src/tables/exp2-k-over-64.c` | `rvv_rr2_p6_u4v`（108） | 只在 hvx flag 下赋值（110-114） |
| vmulc | `neon_u8`（`binary-elementwise-config.c:930`） | `rvv_u8v`（975） | — |

### 组合条件与数值问题 [推断]

- **算法不同：** NEON 用 lut64 加二次多项式，RVV 用 rr2 加六次多项式，现成的两端不可能严格相等。
- **NaN：** NEON 的 rmax 和 exp 会传播 NaN；RVV 的 `vfmax(x, xmin)` 把 NaN 变成极小的有限值，`vfredmax` 也会忽略 NaN。含 NaN 或 +inf 的行（inf−inf 得 NaN）最终结果可能不同。
- **±0：**
  - rmax 遇到 ±0 并列时，max 可能取到任一符号。由于 x−max 经过 exp 后都是 1，可以论证下游不区分这两种情况。
  - 但取倒数会区分 ±0，所以 sum 不能使用弱化的观察关系。
- **sum 的归约顺序：**
  - NEON：acc2 → `vaddvq` → 尾部按 2+1 处理。
  - RVV：`vfredusum`，vl=n；另外 `vfncvt` 依赖 FRM。
- **内存：**
  - NEON 的 raddstore 会越界读 x，vmulc 会越界读 y，需要 `XNN_EXTRA_BYTES` 填充（`include/xnnpack.h:28-31`：Hexagon 为 128 字节，其他为 16 字节）。
  - vmulc 是原地调用。
  - x==y 的原地 softmax 需要单独的前置条件。
  - 全局只读表必须纳入程序边界。
- **建议的证明边界：**
  - 包括：每行的 `xnn_compute_floating_point_softmax` 主体、batch 行循环（按 stride）、固定为 ARM64 选择的函数指针、reciprocal、`rmax_init`。
  - 排除：pthreadpool、operator 状态机、config 与硬件检测、内存分配。
- **路线：** 保留 NEON 的 lut64_p2、FMA、累加树和尾部处理，写出对应的 RVV 版本并验证；不证明多项式对数学 exp 的逼近误差。框架历史上的 raddstore 案例用的是另一个 NEON 源（p5）加修复过的 RVV，不是生产环境中的配对。

### 备选

- **qs8 mean/sum（推荐先做）：**
  - 真实调用链：`reduce-nd.c:509-533` 加上 `operator-run.c:1368-` 的 contiguous_reduce，执行 memset/fill → 多次 rsum 累加到 int32 → reference 转换（这段 C 代码两端相同）。
  - 每一步都整数精确，后置条件"out += Σx"天然可以组合。
  - 框架已有 qs8-rsum 和 qs8-rdsum 的证明。
  - 缺点：SIMD 内容较少，论文冲击力不如 Softmax。
- **qu8 softmax：** 由 u8 rmax 加 lut32norm 构成，但 lut32norm 只有 scalar 实现，不推荐。

**建议：** 先用 qs8 mean 打通组合证明的基础设施，再按固定 NEON 路径的路线做 Softmax。
