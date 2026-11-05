# 四 ISA 小样本验证计划

2026-11-02。状态：实施计划，未新增证明或性能结果。本计划服务于论文主线“验证可靠、可扩展”；性能作为应用价值。已完成的工作仅为固定源码、既有合同与复用入口的静态核查。

## 目标与范围

对同一个操作的 NEON、RVV、AVX 家族、Hexagon HVX 实现，分别证明满足共同的输出规格，保留内存安全、输入保持和 frame 条件。NEON 是迁移来源，也是需要证明的实现。先尝试 `s8-vclamp`，再做 `f32-vabs`、`f32-vcopysign`，目标规模为3个操作、12个实现；按实际完成量报告，不把目标数写成结果。

浮点输出沿用用户确认的关系 `same_value(a,b) = fp32_eq(a,b) ∨ (isNaN(a) ∧ isNaN(b))`：忽略 NaN payload、零符号；其他数值没有误差容限。输入与内部状态保留完整信息，不提前合并符号零或 NaN。所有特殊浮点输入均保留，仍要求合法内存、长度和平台配置。相关澄清见[共同规格调研第6节](FOLLOWUP-venues-common-spec.zh-CN.md)。

本轮不以四向自动翻译、所有硬件 VLEN、真实 ISA/ABI/编译器精化或全部平台性能比较为目标。主要证明层是列明 intrinsic 语义和公开合同下的 C-shim 模块化部分正确性；是否证明终止性另列，不靠空域或不终止获得等价。

## 固定输入与具体函数

- 复用基线：`c-shim-v2@821969733d7953a212c51839194add416fd5799b`。
- 新样本：XNNPACK `23dd5070fa002ef0b124817798ae090fa29f9653`。
- 当前主工作树实际是 `feat/assembly-reduction-lean`。实施时应从上述固定 c-shim 提交建立独立工作树/分支，保留既有本地修改和历史结果，不能在当前主树切换覆盖。
- 函数前缀统一为 `xnn_<操作>_ukernel__`，下表列出准确后缀。完整文件链接及 PROD 标记见[源码入口](XNNPACK-SAMPLES.zh-CN.md)。

| 操作 | NEON | RVV | AVX 家族 | HVX |
|---|---|---|---|---|
| `s8-vclamp` | `neon_u64` | `rvv_u1v` | `avx2_u128` | `hvx_u128` |
| `f32-vabs` | `neon_u4` | `rvv_u1v` | `avx_u8` | `hvx_u32` |
| `f32-vcopysign` | `neon_u4` | `rvv_u4v` | `avx_u8` | `hvx_u32` |

实际标识符把操作名中的 `-` 改为 `_`，例如 `xnn_s8_vclamp_ukernel__avx2_u128`。本轮已静态确认这12个函数存在于保存的固定源码。含多个展开版本的文件仅选择上述一个函数，不把整个文件所有变体计为完成。选出的三份 RVV 代表文件在原调研中为 NON_PROD，需如实记录；这不阻止研究，但不能称为生产默认路径。

12份固定源码的本地入口如下，均位于保存的 XNNPACK 快照；文件中可能有多个展开版本，实际选取仍以函数表为准：

选中函数的原始行数（包含函数内空白/注释，未计helper与宏展开）分别为：clamp NEON/RVV/AVX2/HVX = 62/25/87/34；vabs = 32/23/32/32；copysign = 41/26/41/41。完整文件行数、函数起止位置、去空白注释行数和SHA见[源码规模记录](FOUR-ISA-SOURCE-SIZES.json)。这些是较短的逐元素kernel，但新增后端、尾部访存和合同差异决定实际验证难度，不能按源函数行数推算证明成本。

| 操作 | ISA | 本地源码 |
|---|---|---|
| clamp | NEON | [s8-vclamp-neon-u64.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/s8-vclamp/s8-vclamp-neon-u64.c) |
| clamp | RVV | [s8-vclamp-rvv-u1v.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/s8-vclamp/gen/s8-vclamp-rvv-u1v.c) |
| clamp | AVX2 | [s8-vclamp-avx2-u128.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/s8-vclamp/s8-vclamp-avx2-u128.c) |
| clamp | HVX | [s8-vclamp-hvx.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/s8-vclamp/gen/s8-vclamp-hvx.c) |
| vabs | NEON | [f32-vabs-neon.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vunary/gen/f32-vabs-neon.c) |
| vabs | RVV | [f32-vabs-rvv-u1v.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vunary/gen/f32-vabs-rvv-u1v.c) |
| vabs | AVX | [f32-vabs-avx.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vunary/gen/f32-vabs-avx.c) |
| vabs | HVX | [f32-vabs-hvx.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vunary/gen/f32-vabs-hvx.c) |
| copysign | NEON | [f32-vcopysign-neon.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vcopysign/gen/f32-vcopysign-neon.c) |
| copysign | RVV | [f32-vcopysign-rvv-u4v.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vcopysign/gen/f32-vcopysign-rvv-u4v.c) |
| copysign | AVX | [f32-vcopysign-avx.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vcopysign/gen/f32-vcopysign-avx.c) |
| copysign | HVX | [f32-vcopysign-hvx.c](/zp_vegeta/scratch_sb/ycsun/verus/research/ecoop-experience-reading-20261024/xnnpack-four-isa/sources/src/f32-vcopysign/gen/f32-vcopysign-hvx.c) |

## 强制沿用现有 kernel 验证框架

本次补充明确将现有 QCP kernel 框架作为实施要求：规格、实际实现、证明及证据分离，沿用 `verification/qcp` 的目录和完整门禁惯例，以固定提交的[框架交接规范](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/docs/SECOND-SERVER-PROMPT.zh-CN.md)所列kernel包结构为准。原始委派要求复用现有前端/模型并验证真实循环和内存，但未逐字规定这套目录分离；此处是现在明确补充的要求。历史交接中的自动发布或其他服务器操作不构成本轮授权。

| 层 | 必须保存和验证的内容 |
|---|---|
| `spec.c` | 唯一公开函数与kernel合同入口；共同输入域、平台条件、输出观察、安全与frame独立定义；共同Coq数学定义可被引用，但不得把“两端已相等”当调用前提来替代实际符合性证明 |
| `contracts/` | 可选的短逻辑绑定头，只绑定Import/Extern等逻辑名字，不复制 `spec.c` 中的函数合同；早期 `cases/.../spec.h` 可作参考，不维护第二套新kernel公开合同 |
| `impl/` | 四端实际选定C实现的唯一源码入口，保存上游原件身份；任何用于验证的改写单独记录原件、patch、理由及对应关系，不能用标量参考实现冒充原kernel |
| `proof/c/` 与 `proof/coq/` | `proof/c/` 仅保存Inv/Assert注释位置、策略及注释映射，不放另一份手改实现或旧Require/Ensure；`proof/coq/` 保存模型定义、策略、实际kernel/helper证明和最终gate |
| `proof/manifest.json`、`status.json`、`evidence/` 与 `.build/` | manifest绑定实际源码/合同/模型/工具/依赖身份；status指向完整检查日志。完整C验证副本、CPP、生成VC与编译产物从当前 `impl/spec/shim` 自动生成到 `.build/`，不得在Python字符串中藏旧函数体/旧合同来替代入口 |
| 既有 `shared/` / `shim/` 与 intrinsic账本 | `shim/` 提供类型、intrinsic规范及调用适配，模型尽量共享；独立列官方来源、配置和信任边界。普通helper、适配器、wrapper、比较器必须验证实际函数体，不得充当公理或伪装成intrinsic |

四端扩展的 `impl/testAVX.c`、`impl/testHVX.c` 等名称仅为计划命名，尚不是现成接口或已实现后端；实施时按选定包的既有脚本/清单惯例接入，不能仅靠放入文件就视为已被完整门禁覆盖。新实例先留在 `candidates/`，完整门禁通过后才能登记到 `verified/`，不得提前签发。

验收必须包括实际kernel循环不变式、分支、调用前提、地址/长度算术、读写范围、内存安全和frame。源码改写、输入域变化和profile变化逐项登记，禁止静默缩域。数学规格或共享引理通过，只能说明该部分成立；**仅证明抽象数学模型，不能声称实际四端kernel通过**。最终结论必须由实际C生成义务、各端实现证明和共同观察入口完整连接，并明确部分正确性及未解除的信任边界。

## 必须先处理的发现：clamp 不能直接套用简化数学合同

旧 [s8-vclamp spec.c](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/s8-vclamp/spec.c) 和 [README](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/s8-vclamp/README.md) 明确允许全部有效 int32 参数，截断后 `lo` 可以大于 `hi`。NEON 的前 `floor(n/64)*64` 个元素采用 `max→min`，其余采用 `min→max`；旧 RVV 已为此修复，才能保留旧公共域。

固定 XNNPACK 样本也有顺序差异：NEON 按64字节分界；AVX2 按128字节分界；RVV/HVX 使用 `max→min`。例如 `n=1,input[0]=0,lo=1,hi=0`，NEON/AVX2 得1，RVV/HVX得0。又如 `n=64,lo=1,hi=0`，NEON 大块得0，AVX2 小块得1。它们是由源码分支和整数运算推导的反例，本轮未执行新测试；第一个对应旧包已经记录的同类反例。

旧 [Model.v](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/s8-vclamp/proof/coq/Model.v) 已有 `s8_actual_counterexample`、`s8_ordered_schedules`、`s8_values`，可作为复用与规格讨论依据。

因此任务 A 的结果必须明确以下路线，不能自动加 `lo<=hi` 后声称保留原域：

| 路线 | 允许主张 | 后续义务 |
|---|---|---|
| 保留旧广域与参考分块行为 | 验证原 NEON 参考行为在其他实现中的保持 | 原版反例保留；新 RVV/AVX/HVX 的修复或同语义变体逐项登记、说明与旧修复的关系；具体源码改动由用户确认 |
| 单列有序阈值的四端原版试点 | 在明确 `lo<=hi` 的新试点域中验证标准 clamp | 这是与旧公开合同不同的输入域；需明确采用理由与用户确认，原广域结果/反例仍保留 |

推荐先完成广域审计和具体修复方案，保持现有合同；不要默认缩域。若该决策未定，继续准备 vabs/copy-sign 的前端、模型和合同，不让 clamp 参数域选择阻塞全部工作。四端原版“不能在旧域下共同等价”也是可报告的可靠性证据，不能只保留成功样本。

## 可复用内容与缺口

| 现有内容 | 可以复用 | 不能直接继承 |
|---|---|---|
| VADD `NanBridge/BridgeLogic.v`、`relations/ResultBridge.v`、比较器 | 数值/NaN观察定义、逐元素关系、共同结果到等价的组织方式 | 不自动得到新操作的正确性；需补共同关系的组合引理和实际入口证明 |
| 旧 s8-clamp `Model.v`、`MemoryModel.v`、`ProgramModel.v` | 有符号字节截断、min/max顺序引理、数组与frame、精确参考函数 | 新 XNNPACK 函数/参数布局与旧副本并非同一身份，必须比较完整源码/helper闭包 |
| 旧 s8-clamp NEON load/store/ext、signed-tail | 8/16字节向量访问、移位与1/2/4字节尾写思路及已证引理 | 适配后的地址、类型、求值次数和输出不对齐行为仍需核对 |
| 旧 s8-clamp RVV 模型 | 活动前缀、数组切分、动态循环证明结构 | 旧 e8m8/VLEN128/VLMAX128；新候选是 e8m1，不可直接改名使用证书 |
| `shared/c-shim/f32` | NEON按值调用、float内存、loop/tail、RVV绑定的工程入口 | 该库声明仍含 VADD 专用绑定，RVV固定 e32m8/32 lanes；vabs e32m1、copysign e32m4均需新实例化 |
| QCP 前端及既有完整门禁 | 预处理→真实C义务→Coq依赖/接口/假设审核→冻结记录 | AVX/HVX 类型、指针转换、普通 SIMD helper 不是已验证的新后端 |

在固定已签发目录中未找到独立 `f32-vabs` 或 `f32-vcopysign` 整核包。它们按新实例计划，不能把现有40项计数当作这两个操作已完成。

遵循[现有 intrinsic 政策](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md)：原生 intrinsic 可用公开、可追溯的 spec 与 Coq 定义，不强制另写 C body；普通 helper、wrapper、比较器和适配逻辑必须验证实际函数体。所有 native 调用精确绑定到语义账本，不能把整个 kernel 或普通 helper 改名为 intrinsic。

## 实施任务与验收

| 任务 | 输入与依赖 | 具体产出 | 完成条件 |
|---|---|---|---|
| A. 冻结身份与合同 | 两个固定提交、12个候选函数；无证明前置 | 每实现清单：源码/helper/工具hash、参数单位、PROD状态、profile、输入域、观察；clamp域差异及修复方案 | 函数/依赖可定位；数值域无悄然收缩；共同域非空；clamp策略明示；未决项不会被标已接受 |
| B. 验证环境与最小重放 | A及已配置QCP环境 | 新run目录与环境记录；一个已有小模块/入口的独立重放 | 工具版本、依赖路径、源码hash一致；失败区分环境/证明，不覆盖历史status；先有限预算再扩大 |
| C. 共同规格与公共引理 | A；B只影响编译检查 | 共享Coq规格、`spec.h`接口、观察/列表桥接；整数精确结果及浮点输出观察类 | 每合法输入有确定观察结果；不要求NaN payload/零符号一致；安全/frame独立表达；spec不预先假设两侧结果相等 |
| D. clamp NEON/RVV接入 | A的clamp路线明确，B/C | 旧模型复用说明、两端当前源码证明、改动台账 | 新函数/profile下的实际循环与尾部义务完成；原始/修复状态分开；旧证据只作旧证据 |
| E. clamp AVX2/HVX接入 | A/B/C；D有助复用但两个新端可以独立建模 | AVX/HVX intrinsic账本、普通helper证明、各端整核合同 | 按准确min/max次序和尾部读写证明；所有callee覆盖；若需修复，先给可审阅patch与理由，未确认不计验收 |
| F. clamp四端组合 | D/E | 一个共同规格入口、四端符合性与六对观察等价推论、完整重检记录 | 顶层只组合接口；不靠选择有利VL或排除反例输入；完整源码依赖门禁通过，显式假设/profile可见 |
| G. vabs四端 | B/C，复用D/E访存；可在clamp决策待定时先做 | 按位abs参考函数，再映射到same_value；四端整核证明 | NaN、±0、Inf、subnormal保留；每端FABS/mask/vfabs语义按profile审查；有效输出和frame满足公共合同 |
| H. copysign四端 | G及双输入内存适配 | 保留输入符号位的参考函数、四端符合性证明 | 符号输入为±0/NaN时仍使用原始符号位；双输入、广播常量、tail和只读别名策略显式；不误用输出观察合并输入 |
| I. 汇总扩展性证据 | 每步持续记账，F/G/H提供最终结果 | 3×4状态矩阵、首次/增量成本、失败与修复分类、可重放说明 | 目标/完成/失败分开；新ISA首次成本不藏进“免费共享”；没有把12实现算成12个独立操作 |

任务顺序以依赖为准，不承诺未经试跑的工期。推荐第一批执行 A/B/C，随后启动 clamp 的 D/E；若 clamp 域/修复尚未选定，G 的准备和单端证明可继续。每完成一个端就记录结果，避免最后才追溯成本。

## 关键实现检查点

- **AVX2 clamp**：不只有 `_mm256_*`。后半段含128位 min/max、cast、unpack、shift、`_mm_cvtsi128_si32` 和 `unaligned_store_u16/u32`；后者属于普通 helper，需纳入闭包。`XNN_FORCE_REALIZATION` 的预处理结果也要登记。
- **HVX**：128字节向量，`xnn_*` helper继续绑定到 `Q6_*` 操作；尾读整向量、尾写有效字节。不得把 `xnn_load_tail_*` 假定为仅读剩余元素。
- **内存域**：clamp 的 NEON尾读最多额外7字节、AVX2尾读最多额外15字节、HVX尾读最多额外127字节；这些是所选函数源码访问分析，须在证明中落实。可提供各端不同物理padding并证明相同抽象输入；若采用共同分配，也明确记录其与旧合同的差异。只观察有效输出并不豁免越界读或未写区域frame。
- **RVV**：将硬件 VLEN、SEW/LMUL、vstart、VL选择写入profile，按候选函数实际类型建立模型；若只验证某个固定 VLEN/策略就精确报告。非活动lane不能无条件归零后当作完整ISA事实。
- **浮点**：保存原始输入位模式；可以使用精确位操作参考模型，最终只要求same_value。审查 FP profile，不用忽略NaN payload来掩盖NaN与普通数的差异。异常状态/陷阱是否观察单列。
- **结构与修复**：先尝试原样保留C循环；预处理、宏、按值调用改写给出映射。改变循环结构、指令顺序、输入域或数值结果时出具具体diff和证据，NEON修复同样逐项确认；人工intrinsic审核状态另列，不能从proof通过推断获准。

## 小规模验证设计

先以有限回归发现规格/模型错误，再以形式证明覆盖声明域；测试通过不能替代证明。clamp 检查有序/相等/倒置阈值、全有符号字节边界，以及64/128分块前后。浮点检查普通值、±0、±Inf、正负subnormal、不同NaN位模式与符号输入；长度覆盖1、各向量宽度前后、多个块及tail。若试点合法域不含长度0，仍检查入口策略，但不把0长度测试计为域内覆盖。

负对照针对当前合同：错误lane顺序、尾部漏写、符号错误导致非零输出变化、NaN与普通数混淆，应被测试或证明拒绝。`vneg` 的 `+0/-0` 差异在当前same_value下不是负例，只能作为观察规则敏感性演示。

每个正式重放冻结源码、合同、intrinsic定义、工具及配置，在新输出目录产生完整日志。沿用实际QCP环境说明；不要套用旧Sail目录的Coq版本。资源预算先经小样本测量制定，不直接复制旧脚本的高并发参数。

## 扩展性度量与公平比较

每个新端记录：新增/复用intrinsic数量、定义与引理来源、公共/特有手写LOC、生成LOC、实际依赖重检数量、首次构建与增量证明时间、峰值内存、人工适配/修复与审核记录。人工耗时未记录就标缺失，不倒推。

计入公共规格和基础库的首次成本；先报告clamp的建库成本，再报告vabs/copysign新增成本。若比较共同规格与固定NEON参考的直接关系路线，两者使用相同输入域、观察与语义基础，固定参考路线也允许复用既有源侧证明与底层引理。四端4份符合性证明能组合6对关系是组织性质，不自动意味着比3条固定参考关系边更省成本。

首批三个逐元素操作能证明接入可行性，不能单独支撑任意kernel可扩展。若基础闭环成功，再增一个转置或量化案例；该扩展是后续候选，不阻塞首批验收。

## 与其余论文工作的关系

| 并行工作流 | 需要做的事 | 与四端试点的依赖 |
|---|---|---|
| 原40项可靠性审计 | 每项原版/修复版身份、修改确认、合同/假设、失败与新重验记录 | 只优先取试点实际依赖的s8/VADD；不要求40项全完成后才能接AVX/HVX |
| 原40项性能台账 | 编译/设备/测量/尚未重验状态；完整记录未测原因 | 不作为四端证明前置；最终性能主张必须绑定实际源码与proof profile |
| 代表性优化应用 | 选择少量有价值的优化，将proof与同profile性能连接 | 支撑应用价值；不把旧VLEN512性能嫁接到VLEN128证据，不要求四种设备全测 |
| 论文主线 | 可靠性证据、合同边界、扩展成本与失败经验 | 本试点回答“新ISA/新操作要付出什么成本”，不承担整个论文所有贡献 |

第一批可交付物是固定合同/身份清单、clamp旧域差异记录、公共spec草案和最小环境重放；随后才是逐端整核结果。任何没有闭合的证明、未确认修复或不可用设备都按真实状态报告。

## 本计划的静态核查记录

本轮读取了仓库交接、当前项目规划和观察规则澄清；通过 `git show` 读取固定 c-shim 的 VADD共享库说明、intrinsic政策、s8合同/README/模型；检查保存的12份XNNPACK函数及clamp访存/顺序。未切分支、未改kernel、未运行证明、未测性能、未覆盖历史结果。当前仅新增本文件。
