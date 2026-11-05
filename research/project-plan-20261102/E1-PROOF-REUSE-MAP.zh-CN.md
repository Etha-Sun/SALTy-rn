# E1 旧证明资产复用图（35 对 A↔Bopt）

日期：2026-11-05。只读调研，未运行任何 QCP/Coq/native 检查；旧包中的检查记录均为历史证据，不是新验证。
机读版本：[e1-proof-reuse-map-20261105.json](e1-proof-reuse-map-20261105.json)（每核一条记录，含路径、ptr_ops、diff 计数、证据路径）。

## 输入与方法

- 旧包：`build/e1-workers-20261104/w1-rvv-vadd/repo/verification/qcp/verified/<k>/`（commit 821969733，origin/c-shim-v2）。下文相对路径都以该目录为根。
- A：`research/sol-pipeline-comparison-20261030/sources/SALTy-rn/kernels/source/<k>.c`。Bopt：`build/e1-source-pairing-20261104/upstream/optimized-rvv-kernels/<k>.c`。ptr_ops：`build/rvv-ptr-lower-20261104/val6/<k>/run1/<k>.lowering.json`。
- **已核实（脚本）**：
  - 35 个 A 的 sha256 与旧包 originals.json/repair.json 中记录的 NEON 原件 sha 一致（凡有记录的都一致）。因此旧 `impl/testNEON.c` 与 A 的差异都是旧项目自己做的修改。
  - NEON 与 A 的差异按两种方式计数：行级（去注释、压缩空白）和 C token 级。f32-gemm 行级显示 177 行，但这主要是 `x ;` 这类空格差异；token 级只有 3 处。
  - Bopt 用到的 intrinsic 与旧 `impl/testRVV.c` 中 `__riscv_*` 的交集。不含旧 shim 里的 helper，所以是下界。
- **定性字段**：由我和三个只读子代理阅读 repair.json、repair.md、patch、spec.c、.v 文件名以及 Bopt 源码得出。JSON 里 `[V]` 表示在所引文件中读到，`[I]` 表示推断。**所有标 `[I]` 的反例都是手算，没有执行。**
- 我另外核实了：Bopt 是否含 vmfne/vmerge 等 NaN 修复（grep）；s8 的 tail 顺序；f16 的 A 有 NaN 路径而 Bopt 没有；argmaxpool 有 `int k`；dwconv-minmax 有 `w += vl`；qs8-rsum 有 `*output +=`；qs8-vcvt/qs8-f32-vcvt 的参数被截断为 int8；跨包 Coq 文件的 md5 是否一致。

**评级口径**：
- high：旧 NEON 证明针对的是原样 A 或只做了 QCP 语法兼容；spec.c 与功能模型可直接用；Bopt 等价看起来可能成立。
- medium：模型和 spec 可大量复用，但至少有下面一项：NEON 证明针对语义修复或大改版的 A；Bopt 在旧观察下可能不等价（有已知反例）；需要尚未采纳的前提；新 RVV 族很多。
- low：NEON 证明绑在大改或修复版上，而且 Bopt 改了算法、顺序或语义，能带走的只有模型和反例。
- 无论哪个等级，RVV 侧都要按 E1 f32-vadd 的做法重建 pointer-form shim。

## 汇总表

列说明：NEON 一栏指旧 impl/testNEON.c 相对 A 的状态；diff 为“行/token 块”；RVV修复指旧 RVV 是否被修复；交集为“Bopt ptr_ops 中出现在旧 RVV main 里的个数 / 总数”。

| kernel | 旧NEON vs A | diff | 旧RVV修复 | 交集 | E1 预期 | 评级 |
|---|---|---|---|---|---|---|
| dwconv2d-chw | QCP兼容大改 | 156/112 | 是（RVV语义；NEON兼容） | 0/9 | 可能有反例 | **low** |
| f32-argmaxpool | 语义修复 | 78/46 | 是（两侧） | 0/7 | 可能有反例 | **low** |
| f32-conv-hwc2chw | QCP兼容大改 | 390/100 | 是（RVV语义；两侧兼容） | 1/16 | 可能有反例 | **low** |
| f32-dwconv-minmax | QCP兼容改写 | 5/4 | 是（RVV语义；两侧循环兼容） | 5/5 | 可能有反例 | **medium** |
| f32-f16-vcvt | QCP兼容改写 | 4/2 | 否 | 13/14 | 可能有反例 | **medium** |
| f32-gemm-minmax | QCP兼容改写 | 177/3 | 是（仅RVV） | 5/10 | 可能有反例 | **medium** |
| f32-igemm-minmax | QCP兼容改写 | 10/5 | 是（RVV语义；两侧去restrict） | 4/6 | 可能有反例 | **medium** |
| f32-maxpool | 语义修复 | 73/91 | 是（两侧） | 2/5 | 可能有反例 | **medium** |
| f32-vadd | 与A相同 | 0/0 | 否 | 0/3 | E1已完成 | **high** |
| f32-vcmul | 与A相同 | 0/0 | 否 | 0/5 | 等价可能成立 | **high** |
| f32-vdiv | 与A相同 | 0/0 | 否 | 0/3 | 等价可能成立 | **high** |
| f32-vlrelu | 与A相同 | 0/0 | 否 | 4/5 | 等价可能成立 | **high** |
| f32-vmax | 与A相同 | 0/0 | 是（仅RVV） | 3/3 | 可能有反例 | **medium** |
| f32-vmin | 与A相同 | 0/0 | 是（仅RVV） | 0/3 | 可能有反例 | **medium** |
| f32-vmul | 与A相同 | 0/0 | 否 | 3/3 | 等价可能成立 | **high** |
| f32-vmulc | 与A相同 | 0/0 | 否 | 3/3 | 等价可能成立 | **high** |
| f32-vrndne | 与A相同 | 0/0 | 否 | 2/8 | 等价可能成立（需新引理） | **medium** |
| f32-vsqrt | 与A相同 | 0/0 | 否 | 3/3 | 等价可能成立 | **high** |
| f32-vsub | 与A相同 | 0/0 | 否 | 3/3 | 等价可能成立 | **high** |
| qd8-f32-qc4w-gemm-minmax | 与A相同 | 0/0 | 是（仅RVV；do→while兼容） | 0/15 | 可能有反例 | **medium** |
| qs8-f32-vcvt | 语义修复 | 2/3 | 否 | 3/5 | 需前提/观察决策 | **medium** |
| qs8-rdsum | 语义修复 | 16/14 | 是（两侧） | 8/8 | 可能成立（需定A的UB口径） | **medium** |
| qs8-rsum | 语义修复 | 6/5 | 是（两侧（同一模加修复）） | 4/14 | 需前提/观察决策 | **medium** |
| qs8-vadd-minmax | 语义修复 | 5/2 | 是（两侧） | 8/10 | 需前提/观察决策 | **medium** |
| qs8-vcvt | 语义修复 | 2/3 | 是（两侧） | 0/6 | 可能有反例 | **low** |
| qs8-vlrelu | 语义修复 | 9/7 | 是（两侧（同一取负修复）） | 0/10 | 需前提/观察决策 | **medium** |
| qs8-vmul-minmax-fp32 | 与A相同 | 0/0 | 是（仅RVV） | 1/11 | 可能有反例 | **medium** |
| qu8-f32-vcvt | 语义修复 | 2/3 | 是（NEON语义；RVV兼容） | 4/6 | 需前提/观察决策 | **medium** |
| qu8-rdsum | 语义修复 | 18/11 | 是（两侧） | 7/10 | 等价可能成立（需新引理） | **medium** |
| qu8-rsum | QCP兼容改写 | 4/2 | 否 | 3/7 | 等价可能成立 | **high** |
| qu8-vadd-minmax | 语义修复 | 5/2 | 是（两侧） | 8/14 | 可能有反例 | **low** |
| s8-vclamp | 与A相同 | 0/0 | 是（仅RVV） | 4/4 | 可能有反例 | **medium** |
| u8-vclamp | 与A相同 | 0/0 | 否 | 4/4 | 可能有反例 | **medium** |
| x32-packw-gemm-goi | QCP兼容大改 | 102/34 | 否 | 0/8 | 需前提/观察决策 | **medium** |
| x32transpose | QCP兼容改写 | 18/11 | 是（RVV语义） | 0/8 | 可能有反例 | **medium** |
**计数**：high 9，medium 21，low 5。

- high：f32-vadd（已完成）、vdiv、vmul、vsub、vmulc、vcmul、vlrelu、vsqrt、qu8-rsum。
- low：dwconv2d-chw、f32-argmaxpool、f32-conv-hwc2chw、qs8-vcvt、qu8-vadd-minmax。

**NEON 侧改动（旧 NEON 证明针对的是被修改过的 A）**：
- 语义修复（11）：
  - f32-argmaxpool：size_t 计数；tail 只读已初始化的 lane。
  - f32-maxpool：64 位计数。
  - qs8-rdsum：size_t rows、ceil、`*output` 模加。
  - qu8-rdsum：size_t rows、ceil。
  - qs8-rsum：`*output` 模加。
  - qs8-f32-vcvt、qu8-f32-vcvt、qs8-vcvt、qs8-vlrelu：消除 INT32_MIN 取负 UB。
  - qs8-vadd-minmax、qu8-vadd-minmax：shift 低字节解码。
- 仅 QCP 兼容（9）：f32-dwconv-minmax、f32-gemm-minmax、f32-igemm-minmax（do→while 或 restrict）；f32-f16-vcvt（hex 字面量）；qu8-rsum（static、尾逗号）；x32transpose（vzip 拆分、宽高为 0 的守卫）。另外三个是大幅重构：dwconv2d-chw、f32-conv-hwc2chw、x32-packw-gemm-goi（helper 抽取、嵌套调用提升、vld2_lane 拆分；均为 `original_source_refinement_proved=false` 或 `semantic_counterexample=false`）。
- 与 A 逐 token 相同（15）：f32 的 11 个逐元素核、qd8-f32-qc4w-gemm-minmax、qs8-vmul-minmax-fp32、s8-vclamp、u8-vclamp。

## 跨 kernel 可复用资产（前 5）

1. **FP32 FMA 模型**（Flocq Bfma，单次 RNE 舍入；含 fused 与 split 的见证引理）。两组文件逐字节相同，md5 都是 7e10c691a2，已核实：
   - `GemmSpec/FmaModel.v`：在 f32-gemm、igemm、spmm、qd8-qc4w、qd8-qc8w gemm/igemm 中。
   - `proof/coq/FmaModel.v`：在 f32-dwconv-minmax、dwconv2d-chw、conv-hwc2chw、raddstoreexpminusmax 中。
   - 适用于 vfmacc/vfmadd。
2. **NaN 语义的 min/max 模型**（ARM 传播 NaN；RVV 是 maximumNumber/minimumNumber）：
   - `f32-gemm-minmax/proof/coq/GemmSpec/IntrinsicModel.v`，4 个 gemm 包中相同（已核实）。
   - `f32-vmax|f32-vmin/proof/coq/Model.v`（mm_arm_bits/mm_rvv_bits）。
   - `f32-maxpool/proof/coq/Model.v`（精确位：mp_arm_bits/mp_rvv_bits）。
   - 约 13 个核的 vfmax/vfmin 都需要这些模型，配套的旧 NaN 反例很可能就是 E1 的结论。
3. **“数值相等或同为 NaN”观察栈**：`f32-vadd/proof/coq/{NanBridge,VaddComparator,VaddWrapper,relations}`。f32 逐元素核、gemm 族以及 qs8/qu8-f32-vcvt 的 spec 都用它，E1 f32-vadd 已复用过。
4. **整数回绕与求和模型**：
   - `qs8|qu8-rsum`、`qs8|qu8-rdsum` 的 `proof/coq/Model.v` 四份相同（md5 4177718e0b，已核实）。
   - 配套 `IntegerFacts.v`。
   - `qd8-f32-qc4w-gemm-minmax/proof/coq/Qd8Phase/IntegerFold.v`（wrap32 点积与顺序无关）。
   - 适用于 vwadd/vwaddu/vredsum/vwredsumu 的重结合。
5. **定点舍入与饱和（VXRM）**：
   - `qs8-vcvt/proof/coq/Model.v` 与 `qs8-vlrelu` 中的相同（md5 2392c19fbc；qcv_qrdmulh_equiv、qcv_rvv_clip15，可对应 vsmul RNU，后者是推断）。
   - `qs8|qu8-vadd-minmax/proof/coq/ShiftFacts.v`（RNU、dyadic round）。
   - 注意：旧 shim 契约是按调用点特化的（例如 vnclip 要求 `d==0 && rm==2`），能带走的只有 Coq 函数。

其他：
- `u8-vclamp/proof/coq/RvvRepair/Policy.v`（RVV 1.0 legal_vl）
- `x32-transposec/proof/coq/{SignedStrideFacts,StrideModel}.v`（strided 与 segment 寻址）
- `f32-argmaxpool/proof/coq/IntrinsicSemantics.v`（vmfgt/vmerge）
- `f32-dwconv2d-chw/proof/coq/TerminalModel.v`（vfslide1up/down）

## 全局坑（已核实，除非另行标注）

- 旧 RVV 形式模型都是扁平的逐 lane struct；u8-vclamp 是 32 个打包的 uint32。struct 与数组之间的对应没有证明，所以 pointer-form shim 必须重建。
- QCP 2.1.4 在 `--arch=64` 下把 `unsigned long` 解析为 UINT32（`qs8-vadd-minmax/proof/type-width-repair.json`），旧项目因此改用 `unsigned long long` 作 size_t。Bopt lowering 的 ptr_ops 中 vl 声明为 `"unsigned long"`，需要核对宽度模型。
- QCP 会省略 u16→s16 转换（`qu8-vadd-minmax/proof/unsigned16-decode-repair.json`），会影响 Bopt 中的 vreinterpret 和 `(int16_t)` 转换。
- QCP 前端不支持：do-while、局部 static、初始化尾逗号、hex 浮点字面量、实参中的后置自增、嵌套向量调用、restrict 转换。原样 A 在 E1 中也需要同样的改写，应披露为兼容改写，而不是修复。
- **多数 Bopt 去掉了旧项目的修复（核实方法是 grep 与读源码）**：
  - NaN 的 min/max/clamp：vmax、vmin、gemm、igemm、qc4w、maxpool、dwconv-minmax、dwconv2d-chw、hwc2chw。
  - f16 的 NaN 路径。
  - s8/u8-vclamp 的 clamp 顺序。
  - argmaxpool 的 `int k`。
  - dwconv-minmax 的 `w += vl`。
  - transpose 的宽为 0。
  - qs8-rsum 的有符号 `*output +=`。
  - packw 写入空洞。
- 建议先在 native 上对 A 与 Bopt 重放旧反例，再投入证明。不得为了拿到证明而悄悄加上无 NaN、`lo<=hi` 或 zp 范围之类的前提。

## 逐核说明

“事实”为已核实（附路径）；“推断”未执行。

### f32 逐元素
- **f32-vadd**（high）
  - 事实：NEON 与 A 相同。E1 已复用旧 NEON 证明、spec.c，以及 VaddBits/BridgeLogic/VaddSegments/NanBridge 和 comparator/wrapper；RVV 已重建（旧版为 m8 32-lane struct，Bopt 为 m4）。
  - 路径：`f32-vadd/README.zh-CN.md`、`../shared/c-shim/f32/README.zh-CN.md`。
- **f32-vdiv / f32-vmul / f32-vsub**（high）
  - 事实：都由 vadd 模板生成，op 分别为 fp32_div、mul、sub（`<k>/family.json`），观察关系同 vadd。
  - Bopt 在 vdiv 上为 m4（旧 m8），vmul/vsub 与旧版完全一致。
  - 推断：照搬 vadd 的 E1 流程即可。
- **f32-vmulc**（high）
  - 事实：`Model.v`（vmulc_values）；vfmul_vf_f32m8 与旧版 3/3 一致。
- **f32-vcmul**（high）
  - 事实：`ComplexModel.v`。旧 RVV 为 m4（Bopt m2）。vmla/vmls 按两次舍入建模，不允许 FMA 收缩。NEON 实部 tail 会越读进 imag 区。
- **f32-vlrelu**（high）
  - 事实：`Model.v`、`RvvModel.v`、`RvvPrimitiveMask.v`、`RvvPrimitiveReinterpret.v` 可复用。新增 `vfmul_vf_f32m8_mu`（mask-undisturbed）。
  - 坑：符号位判断会同时选中 -0 和负 NaN。
- **f32-vsqrt**（high）
  - 事实：两侧原件均验证过，`Observation.v` 中已有 sqrt_cross_isa，intrinsic 3/3 一致。
  - 坑：负数输入时 ARM 与 RVV 的 NaN 位模式不同，只在“同为 NaN”的观察下才等价。
- **f32-vmax / f32-vmin**（medium）
  - 事实：旧 RVV 只修了 NaN（仅 RVV 侧，`proof/repair.json`），121 例中有 44 个反例（`proof/history/original-121-case-replay-status.json`），没有加强前提。
  - 事实：Bopt 是纯 vfmax/vfmin，没有 vmfne/vmerge（grep）。
  - 推断：旧反例对 A 与 Bopt 直接成立。`Model.v` 中的 mm_rvv_bits 可作为 maximumNumber/minimumNumber 的通用模型。
- **f32-vrndne**（medium）
  - 事实：NEON 相同；旧 RVV 用 magic-number 加减算法。Bopt 换成 vand+vmsle 掩码、vfcvt_x_f/f_x 与 vfsgnj_mu，共 5 个新族。
  - 推断：需要假设 frm=RNE，并补一个舍入桥接引理。
- **f32-f16-vcvt**（medium）
  - 事实：两侧都把 2 个 hex 字面量改成十进制（`proof/compatibility.patch`），不是语义修复。观察为输出 uint16 的精确位。
  - 事实：A 有 0x7E00 NaN 路径，Bopt 没有（grep）。
  - 推断：输入 NaN 时 Bopt 输出 0x7C00|sign（Inf），A 输出 0x7E00|sign，预计有反例。`vfmadd_vf` 需要一条“x·2^-110 精确”的引理。
- **s8-vclamp**（medium）
  - 事实：旧 RVV 的顺序被修复，反例为 n=1、x=0、min=1、max=0 时 NEON 得 1、RVV 得 0（`proof/repair.json`），没有加 `lo<=hi`。
  - 事实：Bopt 全程先 max 后 min（grep）。
  - 推断：旧反例重新成立。
- **u8-vclamp**（medium）
  - 事实：旧 RVV 原件本来就是 bulk/tail 顺序；`proof/rvv-avl128.patch` 是可选变体。`FullU8/U8Logic.v` 与 `RvvRepair/Policy.v` 可复用。
  - 推断：Bopt 在 tail 也先 max 后 min，因此 n=1、x=0、lo=1、hi=0 时出现反例。打包 word 的模型不适合 pointer-form。

### 量化
- **qs8-f32-vcvt / qu8-f32-vcvt**（medium）
  - 事实：NEON 把 `-zp` 改为模减，属于语义 UB 修复（`proof/repair.json`）。qu8 的 RVV 只把 for 循环的逗号步进挪到循环体里（兼容）。spec 允许 zp 取全部 int32，观察用 NanBridge。两者的 `Model.v` 相同。
  - 事实：Bopt 有 `(int8_t)`/`(uint8_t)` zero_point 截断（已读源码）。
  - 推断：除非限制 zp 范围，否则两侧不同。vfwcvt 从 int16 转换是精确的。
- **qs8-rdsum**（medium）
  - 事实：两侧都修复了 `int r→size_t`、ceil 和 `*output` 的模加（`proof/repair-neon.patch`、`repair-rvv.patch`、`original-counterexamples.json`），没有加强前提。Bopt 的 8 个 op 在旧 RVV 中都出现过。
  - 推断：原样 A 的有符号 `+=` 存在 UB，需要决定 E1 中 A 的 UB 口径。
- **qu8-rdsum**（medium）
  - 事实：两侧修复了 size_t rows。`vwaddu_vv`、`vzext_vf2` 是新族。
- **qs8-rsum**（medium）
  - 事实：两侧都把 `*output +=` 改为模加；反例为 Init=INT32_MAX、n=1 时触发 UBSan。
  - 事实：Bopt 第 104 行仍是有符号 `+=`。
  - 推断：需要明确 UB 策略或无溢出前提。vget 归约树可以用 rs_fold_s32 处理。
- **qu8-rsum**（high）
  - 事实：NEON 只去掉 static 和尾逗号（兼容），RVV 未修复，观察为 u32 回绕后精确相等。
  - 新族：`vwaddu_vx/wv`、`vwredsumu`。
- **qs8-vadd-minmax**（medium）
  - 事实：两侧都改为 shift 低字节解码，记录了 5 个原始不匹配加 UBSan（`proof/evidence/original-counterexamples.json`）。`ShiftFacts.v`、`ControlFacts.v` 可复用。
  - 推断：Bopt 把 ozp<<shift 折进 int32 偏置，饱和顺序也变了，需要较窄的前提，否则有反例。
- **qu8-vadd-minmax**（low）
  - 事实：修复同 qs8；`UnsignedModel.v`、`UnsignedDecodeFacts.v`。
  - 推断：Bopt 算法不同。负的 int16 经 reinterpret 后再 vnclipu 得 255，而 NEON vqmovun 得 0；vnsra 是截断而不饱和。很可能有反例，建议先跑 native。
- **qs8-vcvt**（low）
  - 事实：两侧都修复；反例为 input=-128、izp=128、m=32768 时 NEON 得 127，原 RVV 得 -128。`Model.v` 中有 qcv_qrdmulh_equiv。
  - 事实：Bopt 第 18–36 行把 izp/ozp 截断为 int8，先 vnclip 到 i8 再做 vsadd。
  - 推断（手算，未执行）：x=127、izp=-128、m=255、ozp=-100 时 NEON 得 127，Bopt 得 27。
- **qs8-vlrelu**（medium）
  - 事实：两侧都修了取负 UB，NEON 另把 vzero 提出为常量（兼容）。`LreluModel.v` 与 qs8-vcvt 共用 `Model.v`。
  - 推断：Bopt 不取负，所以 multiplier ≡ -32768 (mod 2^16) 时符号翻转。
- **qs8-vmul-minmax-fp32**（medium）
  - 事实：NEON 相同。旧 RVV 改用 magic-bias 算法；反例为特定 scale 值及负 NaN 的 scale（`proof/native/counterexamples.c`）。
  - 推断：Bopt 用 fused vfmadd 加 vfncvt，舍入路径与 NEON 不同；旧的 scale 反例可能再次成立。需要 frm=RNE。

### 卷积与池化
- **dwconv2d-chw**（low）
  - 事实：NEON 是兼容大改（helper、去 static、提升 58 个嵌套调用；`proof/repair-neon.patch`，`semantic_counterexample=false`）。RVV 修了 NaN，有 3 个反例，旧配置 e32m2（Bopt m4）。`Model.v`、`FmaModel.v`、`TerminalModel.v` 可复用。
  - 推断：Bopt 没有 NaN 修复（grep 已核实），FMA tap 顺序也不同。
- **f32-argmaxpool**（low）
  - 事实：两侧都修复了 2^31 计数（反例 `proof/original-counterexamples.json`）；NEON 的 tail 改为只读 active lane。观察为精确位加 u32 索引。
  - 事实：Bopt 第 64 行仍是 `int k=(int)pooling_elements-1`。
  - 推断：Bopt 改用 vfmax 更新值，NaN 和 ±0 的位都会出问题。
- **f32-conv-hwc2chw**（low）
  - 事实：NEON 是兼容大改；RVV 有 6 项语义修复（`proof/REPAIR.zh-CN.md`），反例为 H1/W1/C1 时 0x7fc00000 对 0xc0000000。
  - 事实：Bopt 没有 NaN 修复，vlseg6 不带掩码，并用 int32 做宽度比较。
  - 推断：累加顺序不同。
- **f32-dwconv-minmax**（medium）
  - 事实：NEON 只改了 do-while。RVV 修了权重步长和 NaN，有 3 个反例；Bopt 的 5 个 op 与旧版完全一致。
  - 事实：Bopt 有 `w += vl`。
  - 推断：channels=1 的反例重新成立；三次 fused 运算与 FMA/MUL/FMA/ADD 的舍入也不同。
- **f32-maxpool**（medium）
  - 事实：NEON 修了 64 位计数，另有兼容改写。RVV 改为 9 输入 max 树并修了 NaN 优先级，反例为 K=2 时 [7fc12345, 3f800000]。观察为精确位。
  - 推断：Bopt 是线性 vfmax，没有 NaN 修复，NaN 反例会重现；无 NaN 时可能等价。

### GEMM 与打包
- **f32-gemm-minmax**（medium）
  - 事实：NEON 只加了宏前导并做 do→while（token 级 3 处）。RVV 修了 NaN clamp，反例为 A[0]=NaN、lo=-1、hi=1 时 NEON 得 NaN、RVV 得 1（`repair.md`）。`GemmSpec/*`、`GemmRepair/*`、`F32Admission/Boundary.v` 可复用。
  - 事实：Bopt 有 30 处 vfmax，没有 NaN 修复。
- **f32-igemm-minmax**（medium）
  - 事实：NEON 有 2 处 do→while 并去掉了 restrict；RVV 修了 NaN clamp。`FloatIndirect/*` 可复用。
  - 推断：Bopt 在 a0==zero 时跳过 FMA，而 spec 允许 zero 缓冲区内容任意，0·Inf 会产生 NaN。
- **qd8-f32-qc4w-gemm-minmax**（medium）
  - 事实：NEON 与 A 相同。RVV 修了 NaN clamp，反例为 inv_scale=NaN。`QC4W/*` 与 `Qd8Phase/IntegerFold.v` 可复用。`vwmul_vx`、`vwadd_wv` 是新族。
  - 坑：NEON 目标在 16 GiB 下 OOM。
  - 推断：Bopt 没有 NaN 修复（grep 已核实），旧反例成立。
- **x32-packw-gemm-goi**（medium）
  - 事实：NEON 是兼容大改（`LaneLoadBridge.v`）。RVV 只做了兼容（tuple 改为 vsse32），没有反例。观察为包括空洞在内的全状态 u32 相等。
  - 推断：Bopt 的 vsseg2 会往 A 不写的空洞槽位写 0，因此需要改观察或接受反例。tuple 族都是新的。
- **x32transpose**（medium）
  - 事实：NEON 做了兼容（vzip1/2、宽高为 0 的守卫，见 `ZipBridge.v`）。RVV 修了宽为 0，反例为 width0/height1 时的 0xa1234567。`SignedStrideFacts.v` 与 `StrideModel.v` 可复用。
  - 事实：Bopt 不处理宽为 0，stride 断言更强，函数名也不同（`xnn_x32_transposec_ukernel__8xv2_rvv`）。

## 不确定与下一步

- 所有“可能有反例”的判断都没有执行。下一步：用旧包的 native harness 或反例源（例如 `*/proof/native/counterexamples.c`、`*/proof/original-counterexamples.json`），在 A 与 Bopt 上用有限预算重放。
- 本图只依据文件名和摘要判断哪些 .v 是“语义模块”，没有检查它们在 Coq 8.x/QCP 2.1.4 环境里能否单独编译和导入，也没有检查对生成 VC 的依赖。复用前要先单独编译。
- 是否接受某个窄化前提（无 NaN、`lo<=hi`、zp 范围、shift 范围）属于项目决策，本图不做选择。
