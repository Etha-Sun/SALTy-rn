# 给另一台服务器 agent 的完整接续 prompt

2026-10-23 用户更新：完整验证通过后先 fetch，直接提交并正常 push 到 `c-shim-v2` 的 `verified/`，不再通过功能 PR 发布。可参考 Frama-C 修改本案 `impl/` 后证明修复版，保留修复记录和反例；不必另建修复版目录。下文以本次更新后的规则为准，证明标准不降低。

你是 SALTy-rn 的 QCP kernel 验证实施负责人。请直接接续现有 verified 框架，实际验证更多 kernel，目标是逐项处理完整40项。不要重新搭另一套框架，也不要为了凑40/40而改变原程序、intrinsic语义或输出关系。若原版本不等价，交付反例与独立修复候选，而不是伪造证明。

## 1. 仓库、基线与工作方式

- 仓库： https://github.com/Etha-Sun/SALTy-rn
- 集成分支：`c-shim-v2`，完整已发布基线：`51fd96df027a188a1e10019eb53195999a107062`。取该分支最新提交，并确认包含本基线；旧 `main`、Sail研究分支不是本任务入口。
- 协调板： https://github.com/Etha-Sun/SALTy-rn/pull/1
- 环境工作PR： https://github.com/Etha-Sun/SALTy-rn/pull/2 。读取其最新内容再判断是否可用，不能把“已有PR”当作环境已独立重建成功。
- 原始40对代码及来源：`kernels/source/*.c`、`kernels/target/*.c`；固定上游 `be16280c7812a7459c26c3ce82a47339a3d07718`，逐项身份见 `verification/qcp/catalog.json`。该上游补齐四个target，完整清单为40，不能再按37项统计。
- leader原工作树为 `/zp_vegeta/scratch_sb/ycsun/verus/build/qcp-kernel-framework`；这是来源路径，不要求你的服务器使用同一绝对路径。

先保护已有分支、未提交文件、工作树和已领取任务，再 fetch 最新集成分支。开发使用隔离的 `codex/worker-<task>` 分支或工作树；完整准入通过后，在最新 `c-shim-v2` 基础上直接 commit 并正常 push，提交到 `verification/qcp/verified/`，同步更新 manifest、catalog 和证据。不再开功能 PR；不强推、不覆盖其他 agent 的工作。未完成的 case 保留在 `candidates/`。

先读协调板最新CLAIM，再发布自己的OWNER/BASE/HEAD/PATHS。已有worker正在做GEMM和环境修复时，保留其任务，其他agent并行领取简单kernel。不要因leader不回复而停止无冲突工作。

## 2. 现状：9/40，接受范围必须准确

权威机器清单为 `verification/qcp/verified/manifest.json`，已有：

| kernel | 完整证据 |
|---|---|
| f32-vadd、f32-vsub、f32-vmul、f32-vdiv | 每案11个实际C单元、8组策略、87个普通本地Coq模块及FinalCheck通过；每案native430例 |
| f32-vmulc | 12个实际C单元、605个C VC；87个fresh共享依赖模块+23个本案普通模块，另两个gate；最终12个VC_Correct绑定通过；native430例 |
| f32-vlrelu | 原始两侧C保持；14个实际C验证单元、958个单元VC字段（含公共assert重复校验）、123个普通依赖/本案模块及FinalCaseCheck，共124个fresh编译模块；native2872例 |
| f32-vcmul | 原始两侧C保持；11个实际C单元、629个单元VC字段、32策略字段，123本地源及FinalCaseCheck共124次fresh普通Coq；native468例 |
| f32-vmin（RVV修复版） | 原始NEON、Frama-C同一RVV修复；12实际C单元、1188单元字段、28策略字段，140本地源及FinalCaseCheck共141次fresh普通Coq；native275例 |
| f32-vmax（RVV修复版） | 原始NEON、Frama-C同一RVV修复；12实际C单元、1188单元字段、28策略字段，146本地源及FinalCaseCheck共147次fresh普通Coq；native275例 |

这些是公开契约下的 **C-shim模块化部分正确性**。真实ISA到shim的形式对应、任意VLEN、完整程序终止性尚未证明，不得用“无条件原始机器代码正确”描述。记录继承的QCP/Coq/Flocq假设；“没有新增公理”不等于“整个项目无公理”。

VMULC关键证据：`verified/f32-vmulc/proof/status.json` → `full-status.json`；原NEON111 VC、原RVV42 VC、新primitive102 VC分别通过，最终全调用闭包也通过。其B缓冲区仅需一个float，不能误套成第二个n元素输入。605包含多个实际C单元，不能再把各分项重复加进去。

`candidates/f32-vsqrt`仍未验证：模型编译与native156例通过，但当前QCP缺checked sqrt原语/实现；仅声明外部sqrtf合同能产生VC，不能消除实现义务。

旧Frama-C/CSim有效清单为16项，另有隔离旧结果；这些只能供参考，不能转记为QCP通过。最初五项此前也有Frama-C结果，本次为独立QCP检查。CSim引用路径、模型修复和原版/修复版差异见 `catalog.json`、`docs/CSIM-REPAIRS.zh-CN.md`。

## 3. 必须沿用的目录与人工审核入口

开发中的kernel放在 `verification/qcp/candidates/<完整kernel名>/`；只有完整通过才物理移入 `verification/qcp/verified/<完整kernel名>/`。

```text
<kernel>/
  impl/
    testNEON.c              原始或明确记录修复后的NEON实现
    testRVV.c               原始或明确记录修复后的RVV实现
  spec.c                    唯一公开函数与kernel契约入口
  contracts/                可选：短逻辑绑定头；不复制spec里的函数合同
  shim/                     本案公开的类型、intrinsic实现/合同、调用适配
  README.md                 输入域、观察标准、硬件配置、命令、完成与开放边界
  proof/
    c/                      仅Inv/Assert注释位置与策略；不放旧C函数体/旧合同
    coq/                    有组织的Coq定义、策略证明、kernel/helper证明及最终gate
    *.py                    小而直接的生成/检查脚本
    manifest.json           精确源文件、模型、依赖、单元与模块身份
    status.json             统一结果入口；引用详细完整检查记录
    evidence/               必要日志、失败及修复来源，不放工具二进制/大缓存
  .build/                   自动生成的完整C验证副本、CPP、goals、编译产物与运行目录；忽略提交
```

人首先审核 `impl` 两文件、`spec.c`、公开 `shim/contracts`，并审核它们引用的Coq语义定义。语义定义即使位于proof/coq，也不是免审内容。`contracts/*.h`通常只是Import/Extern逻辑绑定；真正前后置条件在spec和intrinsic函数注释里，逻辑含义还在Coq定义中。

`spec.c`包含比较helpers、实际调用两侧的`equivalent`与前后置条件。wrapper形式不必固定，可采用已通过的compare_outputs形式。公开post必须明确 `return==1` **以及输出之间的关系**、输入保持与合法写区域。不能只证明比较器在假设两数组已相等时返回1，就宣称kernel等价。

完整生成副本必须直接从当前impl/spec/shim生成。禁止在proof/c或Python字符串中藏另一份旧kernel函数体、旧Require/Ensure模板来替代公开入口。Inv/Assert/where等证明注释可以单独生成；不变量不是用户输入前提。未知模式明确拒绝，不默默降级。

最新新增 qu8-f32-vcvt 修复／兼容版：31实际C单元、1476单元VC字段、61实际body、30策略字段、646本地源+Final共647次fresh普通Coq，1506项假设核对通过；具体公开域和两侧修改原因见对应verified case。当时正式数量为12/40。现新增qs8-vcvt两侧修复版：25实际C单元、1664字段、64实际函数、15策略字段、238次fresh普通Coq、1679项最终报告；当时正式数量13/40，目标至少21。

## 4. 当前intrinsic按值返回的机制

问题并非“QCP完全不能返回struct”。早期带lane数组的向量表示及按值资源交接难处理；当前已验证表示为固定标量字段：

```c
struct float32x4_t { float s0, s1, s2, s3; };
/* typedef在shim中提供 */
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b) {
  float32x4_t r;
  r.s0=a.s0+b.s0; r.s1=a.s1+b.s1;
  r.s2=a.s2+b.s2; r.s3=a.s3+b.s3;
  return r;
}
```

load/add/sub/mul/div/get等可以按值参数、按值返回。RVV目前用32个标量字段表示相应配置的向量。原kernel继续写原来的赋值与调用，不把原代码改成pointer/out或SSA副本。

store通过shim宏借用局部向量地址：

```c
#define vst1q_f32(p,a) qcp_vst1q_f32((p), &(a))
/* RVV同类宏：__riscv_vse32_v_f32m8((p), &(a), (vl)) */
```

pointer-store的真实C函数体和合同都已检查。原kernel仍调用原store intrinsic；不是“shim里完全没指针”。现宏只支持当前局部向量左值，不能宣称支持 `store(p,add(a,b))`、任意有副作用表达式、mask/tuple或所有元素类型。新形式先做最小真实探针及正反例；保持求值次数、lane顺序、类型、别名和frame。

纯按值store曾产生同地址written与undef重复资源，不能用这种矛盾前件证明任何结果。现有where是QCP注释，不是普通C调用重写。

## 5. Shim语义来源与禁止reward hack的规则

每个新增intrinsic或新配置都要在一个短语义台账里记录：原始intrinsic名、参数/返回类型、NEON或RVV来源、官方文档版本/章节或伪代码链接、所选ISA配置、C实现/合同、对应Coq定义、body proof与ISA对应状态。优先依据Arm官方ACLE/指令伪代码以及RISC-V官方Vector/浮点规范，必要时查固定版本Sail；独立查证两边，不凭相似名字推断相同语义。

**C body满足合同**与**合同忠实描述ISA**是两个问题。前者完整闭合才能计C-shim验证通过；后者需要来源审核和明确剩余形式化边界。不得将未经证实的ISA语义选择隐藏在“已证明”标签中。分别记录 `spec-only`、`body-checked`、`ISA-correspondence-checked`；早期extern合同只能帮助探索caller，不能计完整kernel。

必须保留的真实差别包括：

- ARM NaN传播min/max与RVV minimumNumber/maximumNumber分别建模。不能给它们同一个方便证明的实现。
- FMA单次舍入；普通乘加两次舍入；保持实际累加顺序与归约树。不能为证明套结合律、交换律或临时放宽精确关系为误差容限。
- binary32/16精度、舍入、NaN/Inf/±0、quiet/signaling与payload相关位行为、subnormal及架构状态。仅最终观察可忽略被公开规格排除的差别；中间reinterpret/分支/除法不能无条件使用“数值相等或同NaN”替代位语义。
- 明确符号扩展、截断、wrap、饱和、移位宽度与VXRM；reinterpret不是数值cast。
- VL/VLMAX、SEW/LMUL、mask/tail policy、inactive lane及读写地址/长度。现有RVV shim把某些不被使用的inactive lane选为+0，只能在当前明确选择/允许的模型下使用；它不是所有真实RVV指令在所有策略下必须写零的证明。若后续代码观察这些lane，必须重新论证选择与ISA规范、调用约束的一致性。

禁止以下取得“成功”的方法：

1. 让两边shim共享一个错误操作以制造相等；例如把sub/mul都解释为add，或让load/store/输出变成常量。
2. 把post关系定义为True、从前提直接假定最终输出等价、给不可能满足的Require、复制冲突heap资源再用False消去。
3. 未说明地排除NaN/Inf/零、增加非零除数、固定n=1、限制矩阵为1x8，然后宣称整个原kernel已完成。真实内存/参数/溢出约束需要有接口依据并公开；有限子情况另行标识。
4. 为消除VC改原始C、改变FMA/归约顺序、移除分支、把完整kernel换成手写功能模型。若必须lower原调用，需独立source-to-model语义桥；仅token对照/native不等于该桥完成。
5. 用Admitted、新增未证公理、未闭合extern/libm合同、只定义VC_Correct ModuleType、仅生成VC或仅跑native代替完整实现证明。
6. 把其他ISA的模型当当前ISA规范；照抄CSim旧shim/修复target而不查来源与原反例。

最小验证既要跨两侧对照，也要与独立scalar/位语义oracle或可信语义源对照，防止双方同错。增加有效输入上的错误结果/错误模型控制、源篡改拒绝控制和false目标控制；保留实际结果。它们是回归与身份防线，不是模型一致性或ISA形式对应的完整证明。

## 6. 原始版本、修复版本与40项台账

catalog已记录旧CSim中4个与当前上游target不同的已收录版本：u8-vclamp、f32-vmin、f32-vmax、qs8-vcvt。尤其旧u8-vclamp-v3是在旧空target基础上另写，新上游u8 target须独立验证。其它NaN/FMA/layout/shift等反例与修复见CSIM-REPAIRS文档。

原版本实际不等价或需修复才能验证时，先参考已有 Frama-C 修改，保留原始身份、反例、条件和来源。按用户最新授权可以直接修改本案 `impl/`，在 repair 记录中保存原始/修复 SHA、精确 patch、原因与观察范围，并标记当前变体为 `repaired`；不必另立目录。上游 `kernels/source/`、`kernels/target/` 的原始锁定文件保留。完整证明修复版后才能入库，不能把修复版称为原版证明。工具超时或环境失败不自动等于程序反例。

当前建议按能力分组推进；可并行，不必等GEMM才能证明简单kernel：

| 组 | 完整kernel集合 | 数量 |
|---|---|---:|
| 已通过 | f32-vadd、f32-vsub、f32-vmul、f32-vdiv、f32-vmulc、f32-vlrelu、f32-vcmul、f32-vmin（RVV修复版）、f32-vmax（RVV修复版） | 9 |
| byte/整数邻近接口 | s8-vclamp、u8-vclamp、qs8-f32-vcvt、qu8-f32-vcvt、qs8-vcvt、qs8-vlrelu | 6 |
| 其余float逐元素/转换 | f32-vrndne、f32-vsqrt、f32-f16-vcvt | 3 |
| 整数归约与量化 | qs8-rsum、qu8-rsum、qs8-rdsum、qu8-rdsum、qs8-vadd-minmax、qu8-vadd-minmax、qs8-vmul-minmax-fp32 | 7 |
| 布局 | x32-packw-gemm-goi、x32-transposec | 2 |
| 矩阵/卷积 | f32-gemm-minmax、f32-igemm-minmax、f32-spmm-minmax、f32-conv-hwc2chw、f32-dwconv-minmax、f32-dwconv2d-chw、qd8-f32-qc4w-gemm-minmax、qd8-f32-qc8w-gemm-minmax、qd8-f32-qc8w-igemm-minmax、qs8-qc8w-gemm-minmax-fp32 | 10 |
| 池化/exp归约 | f32-maxpool、f32-argmaxpool、f32-raddstoreexpminusmax | 3 |

以catalog为机器身份来源，不手抄出重复/遗漏条目。每项保持 `not-started / in-progress / proved / counterexample / tool-gap / environment-blocked`，附显式输入域、原版/修复身份与证据。目标是处理全部40项，不承诺错误原版都存在等价性证明。

已有GEMM worker的最新进度需先读协调板，不可误计：1x8 lowered子情况有局部聚合证明，full-domain caller44项仍依赖两kernel合同；全域原kernel完整证明、19种lowering语义对应等仍开放。部分QCP在scope退出时crash属于工具问题，不是kernel反例，也不允许为避crash缩小公开域。其本地未push成果/环境改动要保留。

## 7. 已积累的省工经验

- `tools/binary_family.py`只支持已经确认形状的SUB/MUL/DIV。原始C字节冻结；同一小生成器同步替换真实C操作和fp32模型，三案无需逐VC手工补Coq。不要无审核扩展为所有操作或把min/max强行放进同一运算语义。
- 相对VADD的24个shim C/H文件，SUB/MUL/DIV各有13个逐字相同；其余主要是运算/名字/模型绑定变化。现阶段允许各case保留隔离版本，先积累已通过结果，最后再集中抽共享、统一审核。不要现在为完美共享库重构全部已验证case。
- VMULC比opcode替换多了单数组+广播常量模型。复用map/firstn、有效向量前缀与分段追加lemma，复用已有load/store/数组策略，新的NEON111项合成515行NeonVcs.v；不需每加kernel就从零手写几千行。
- nth/map默认值必须带in-bounds条件：`0 * c`对NaN/Inf不一定为0，不能用错误默认值等式简化越界情况。
- 用地址归一化、andp/sepcon结合归一化、FastFrame/fast_cancel及通用数组拆拼，避免对96字段盲目entailer或setoid重写。纯条件先单独lia，heap frame再精确取消；必要时unfold undef struct谓词和消除合法的析取分支。
- `verified/f32-vadd/proof/automation/`有通用float内存tactic独立原型，已覆盖39个未改VC；它不等于所有kernel不变量自动生成，也不是替换当前正式证明的免审许可。
- 旧某单VC35s超时，给同一证明120s后成功；区分timeout与真正失败，先用-time定位而非改spec。
- VMULC各组件独立成功后，FinalCaseCheck发现FastFrame.vo库假设不一致。统一在同一fresh Model/FastFrame环境重编译两个原有primitive模块后才最终通过。公开记录见 `proof/rebind-history.json`、`proof/evidence/`；不能拿source hash相同或.vo存在就跳过统一绑定。
- `tools/promote_case.py`当前是11单元/87模块二元族的严格迁移器，不是所有未来case的通用工具；VMULC为12单元/110普通模块，不能为适配工具伪造计数。迁移须核对全部实际CPP、Coq源码及调用闭包身份；迁移身份审计不是第二次证明重放。
- `tools/vmulc_candidate.py`仅初始scaffold，明确不保证逐字重建最终spec。新生成器要保持短小、确定性和模式检查；生成模板的post不能偷偷替代当前公开spec。

## 8. 每个kernel的完整准入标准

依次完成并保留实际新日志：

1. 原source/target来源与hash，impl逐字相同；原始/加注释两路C token及同frontend CPP token一致。额外预处理指令、宏注入、私有Require/Ensure替换必须拒绝。
2. 简单公开spec，输入输出对象/长度/单位、padding、alias、参数域、overflow、frame、硬件配置与最终观察明确；模型定义有审查入口。比较器合同不偷偷承担原kernel证明。
3. 所有实际kernel、intrinsic、helper、compare/wrapper的真实C unit清单。遍历全部call，callee合同与已证明body精确绑定，不能只信extern声明；新的assert/vsetvl helper也要覆盖。
4. 用该次实际C重新生成QCP goals与策略目标；核对checked Coq目标就是这次生成目标。`--no-float-finite-vc`用于当前完整IEEE域路径，不得借有限性默认检查无意缩小域。
5. 所需Coq依赖先编译，新C VC/策略全部闭合；最终真正实例化每个unit的 `Module ... : <fresh_goal>.VC_Correct := <checked_module>`。ModuleType里有Axiom列表只是接口，不是证明。
6. 统一fresh依赖环境下的完整门禁，核查生成目标、source/模型hash与logical module一致性。既有共享依赖若复用，必须有精确来源和完整已检查身份；发布验收需fresh重放必要闭包，不使用任意旧实验.vo伪装当前检查。不得把Model/FastFrame同名而不同编译实例混用。
7. 导出Print Assumptions及显式theorem参数/未证extern/继承假设。Coq显示Closed也不能消除显式参数或C→ISA边界。native、ASan/UBSan和负控制另行记录，不并入形式证明计数。
8. 全部通过后才移入verified，写README、manifest、status详细指向证据，更新总清单/catalog。不按固定VC数写死判定；区分普通模块、gate和重复编译次数。搬迁后核对实际CPP/Coq源身份，保留历史命令/失败记录，支持新路径重放。

## 9. 环境与并行

先恢复你服务器QCP/Coq环境并验证工具/库源版本与hash，阅读PR2。当前leader用QCP-V2.1.4和配置中的Coq环境；其它研究分支的Coq8.19/Lean环境不能无说明混用。Git只包含来源/脚本/证据，不包含已配置工具链或全部.build缓存。

先在隔离工作树或输出目录重放VADD，保留旧状态；当前标准入口支持：

```sh
python3 verification/qcp/verified/f32-vadd/proof/check.py --config /your/coq-flags.json --jobs 16
python3 verification/qcp/verified/f32-vadd/proof/native.py
```

前四个case支持上述check入口。VMULC有分组件生成/检查与统一check_full.py，读取其README.md、脚本参数及full-status中的真实命令；这些脚本仍含leader路径/默认配置，需做最小环境移植，不能假定全部支持--config或新clone一次运行即成功。移植保留公开C/spec/Coq源，若工具/模型变动则显式记录并重放。不要篡改旧lock/hash把新环境冒充原环境。

用户最新要求目标至少21个完整verified kernel，从简单到难推进；新验证批次默认16并发、每进程16GiB，按任务设置有限时限，并根据本机实际可用内存和其他worker占用安排独立批次。可拆分独立证明模块以缩短关键路径；依赖未就绪时不为凑并发重复启动相同任务。现有长任务保持冻结，保留实际资源/源/结果记录。实现修复可主动参考Frama-C和Arcadia-y，保留原因、原身份、补丁和反例，无需再等批准。一次检查通过后，仅因新变更、失败或明确未决疑点再扩大/重复检查。

用户最新已明确取消人为额度百分比停止线；不再因旧50%/60%/70%阈值暂停验证、交接或审核。实际服务不可用时如实记录，不伪造继续执行。不要使用leader thread/凭据/额度；若记录quota必须是真实查询结果，不可用时明确不可查询，不编造百分比。已有心跳保留且避免重复部署；每30分钟读取协调板、集成checkpoint及相关PR，无变化保持安静，有领取/阻塞/结果/新评审才留言。未经本机授权不另造常驻后台任务；不假定leader会定时回复。

## 10. 后续统一共享与交付

用户已同意：先按case继续证明，最后统一抽到共享文件夹，集中审核shim。到共享化阶段，按类型/内存/VL、具体intrinsic、数值/位模型、调用适配组织；每个原语保留来源、合同和证明状态。不能仅按同名或C文本相同合并：相同Extern/Import在不同case可能绑定不同Coq运算模型。抽取后核对绑定、实际验证输入及所有受影响kernel的完整门禁，再更新manifest。不能假定挪文件不改变语义。

每次直接提交交付：原始身份、公开spec/shim及语义来源、生成器/annotations、Coq证明与真正最终gate、实际命令和新结果、依赖/工具/模型hash、失败及修复来源、剩余边界。不要提交巨大日志、.vo、编译器/solver二进制或认证资料。环境修改与 kernel 证明分开提交；通过完整门禁的 kernel 在 fetch 后直接提交到 `c-shim-v2` 的 `verified/`，不再开功能 PR。

协调留言格式：

```text
TYPE: CLAIM | BLOCKED | READY_FOR_REVIEW | REVIEW | RELEASE
TASK: kernel或共享能力
OWNER: worker名称
BASE: 集成完整SHA
HEAD: 分支和完整SHA
PATHS: 独占目录
EVIDENCE: 实际命令、结果文件、输入/模型身份、精确通过范围
OPEN: spec问题 / proof缺口 / 工具限制 / 环境失败 / 实际反例，逐项区分
```

现在开始：先同步和读取最新协调信息，保护已有GEMM/环境成果，重放环境与一个verified样例，再将剩余35项按能力分给无冲突agent并持续推进。不要停在计划、native结果或条件性caller；逐项完成真实kernel与全部实现闭包。遇到实际不等价或工具缺口，保存可复现证据并转向其他可推进kernel，不为40/40改写事实。

本次最新正式清单为14/40，新增qu8-rsum（NEON语法兼容版）：21实际C/890字段/34 body，2策略字段，257普通Coq，892项最终假设及463个外部依赖身份核对通过；固定VLEN128、公开mod32域及padding要求见对应README。当前目标至少21；局部组件不计数。
