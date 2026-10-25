2026-10-25 matrix worker：完整清单 **32/40**，新增[QS8-QC8W GEMM FP32](verified/qs8-qc8w-gemm-minmax-fp32/README.zh-CN.md)。QS8-QC8W GEMM FP32完整修复版：4实际C/1531义务/16策略/3051同环境fresh模块（续跑谱系明确）/1874假设报告，递归coqchk及32并发准入通过。原NEON保持，RVV恢复ARM NaN优先级；公开容量内正N/K，全binary32参数，固定VLEN128，精确int8输出。intrinsic语义人工复核pending，无形式ISA/ABI或完整终止性定理。 下文旧快照保留原时间含义。

2026-10-25（洛杉矶）：**x32-transposec 修复/兼容版完整通过并收录，正式31/40，目标40/40。** 8实际C单元/381字段/13普通body、116源码fresh普通Coq、489最终假设报告；11既有框架假设、9项公开intrinsic spec视图，人工规格审核pending。干净发布目录核对全部591清单文件、8 CPP/全部源日志及依赖闭包，双san各8808矩阵/1006296word/side、127014公开caller与独立oracle/共错负控复查通过；发布复核不计第二次形式化重放。原件、原反例及精确修复补丁保留。

2026-10-25（洛杉矶）：用户将目标提高为 **40/40**，已启用新的持续工作 goal。设置goal时正式 **30/40**；每1800秒检查真实额度，严格超过95%开始收尾，未完成不得标达成。继续复用现有代码与证明、并行完成候选；完整验收后正常直接提交c-shim-v2。intrinsic-spec边界与完整kernel/helper/caller/fresh门禁标准保持。下文36等旧目标及历史额度保留原时间含义。

2026-10-24（洛杉矶，UTC 2026-10-25 06:27）：用户明确要求继续，当前账户实际额度 **0%**，已归档并解除旧97%收尾锁，恢复推进至少 **36/40**；半小时检查、严格超过95%收尾的规则保留。当前正式 **30/40**，新组件不增加计数。

下文较早28/29项和97%收尾状态保留为历史，当前清单和推进计划见根PROGRESS/MEMORY。

2026-10-24 matrix worker更新：完整清单 **30/40**，新收录[QD8-F32-QC4W GEMM](verified/qd8-f32-qc4w-gemm-minmax/README.zh-CN.md)。5C/1531字段、12策略、1610fresh Coq与1567假设报告通过，32配置workers。用户指定的当前矩阵核已收尾；以下旧快照保留原时间含义。

2026-10-24 当前清单 **28/40**；最新QU8加法与QD8 QC8W IGEMM已完整收录。目标至少36，额度规则见下文；历史快照保留。

# VADD 当前 checkpoint（2026-10-22）

2026-10-24：QU8 RDSUM 修复版已完整通过并直接收录，37实际C单元/1854字段、893普通Coq、2034最终假设报告；详见 [case](verified/qu8-rdsum/README.md)。

2026-10-24 最新入口：有效28/40，目标至少36；以 verified/manifest.json 与根 PROGRESS/MEMORY 为准。用户已统一允许直接采用与原始规范对应的 intrinsic spec，C implementation/body 证明可选，详见 [Intrinsic 规范边界](docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。这取代下文历史的 intrinsic 实现必选门槛；不改变既有证明身份，不因规则更新增加计数。

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。 下文50%等旧阈值及其取消记录均属历史。

## 2026-10-22 收尾：5/40，额度50%停止扩展

新增 `verified/f32-vmulc`，原始两侧 C 不改，B仅一个float，完整binary32输入域保留。
12个实际C单元、605个VC、110普通Coq模块与两个最终gate通过，最终spec显式保证输出等价。
迁移后12份CPP和112份Coq源码身份核对通过，native430重跑通过。
FastFrame编译环境冲突的失败、无证明内容修改的重绑和成功门禁均公开归档。
当前已验证：VADD、VSUB、VMUL、VDIV、VMULC，清单以 `verified/manifest.json` 为准。
额度到50%时停止新增kernel/证明，仅完成既有检查和入库推送；平方根仍未验证。
计数范围仍是公开契约下的C-shim模块化部分正确性，不含真实ISA对应和终止性。
以下4/40和更早记录保留其历史时间含义。

## 2026-10-22：算术族批量检查，当前 4/40

已验证目录统一为 `verified/f32-vadd`、`verified/f32-vsub`、`verified/f32-vmul`、`verified/f32-vdiv`，
机器清单为 `verified/manifest.json`。四案均保留原始 NEON/RVV C 文件，公开 `spec.c` 包含比较函数、
`equivalent` 与显式输出关系；`proof/c` 只保存证明注释和策略，实际 C 验证副本从 impl/spec/shim 生成。
VADD 迁移后从空目录完整重放通过；其余三案各自重新生成 11 个 C 单元和 8 组策略，
再以 32 并发重新编译全部 87 个本地 Coq 模块及 FinalCheck；没有复用旧实验 .vo。
每案 native 430 例也通过。SUB/MUL/DIV 入库迁移再次核对 11 份预处理输入、87 份 Coq 源码与最终依赖闭包
逐字节一致；`proof/relocation-audit.json` 是迁移身份审计，不冒充第二次 Coq 重放。

`tools/binary_family.py` 仅实例化已经匹配的算术形状：实际 C 运算符及 fp32 模型同步变为减/乘/除。
全部 binary32 输入（含 NaN、Inf、±0）仍合法，除法未添加除数非零前提；没有新增公理。
不变量和证明模板复用，三案无需逐 VC 手工补 Coq。遇到其他控制流/接口则拒绝套用。
`tools/promote_case.py` 只接受完整通过且源码身份一致的候选，入库后更新机器清单。

`candidates/f32-vsqrt` 仅有模型编译及 native156例，QCP 缺 sqrt 原语且外部实现未证，未计入完成数。
当前 4/40 指各自公开契约下的 C-shim 模块化部分正确性；不包含真实 ISA 对应或终止性。
本轮最新额度规则为剩余 >50% 才扩展，<=50% 收尾；不恢复旧后台等待策略。

## 当前目录审核边界（2026-10-22 更新）

共享 C shim、类型、intrinsic 契约和 frontend 已从 `verified/f32-vadd/proof/c/` 移到
[shared/c-shim/f32](shared/c-shim/f32/README.zh-CN.md)；本 kernel 的观察与 wrapper 绑定位于
`verified/f32-vadd/contracts/`。Coq 语义定义的位置未动，需审核的定义在共享 README 中明确链接。
内核完整注释副本已删除：验证时从 `verified/f32-vadd/impl/` 读取原始文件，只插入契约/不变量/断言注释。
新增原始/注释两路 CPP token 对照、11 单元 C 调用/契约闭合和最终 `VC_Correct` Module 门禁。
`equivalent` 最终后置条件已显式加入 `outputs_related(L,R)`；比较器契约仍只证明等价输入返回1，
未声称它已形式化证明所有不等输入返回0。最终输出关系直接由两侧 kernel 的共同模型保证。
删除重复模板后的完整检查已通过：空目录11 C单元、8组策略、32并发全部87本地Coq模块及FinalCheck，约380秒。
本次没有中断续跑，没有复用旧实验.vo，也未修改手写Coq证明。
独立空目录审核检查21模块+门禁通过（约37秒）；native430例通过，10个负对照被拒绝。
具体负对照见 `verified/f32-vadd/proof/layout-audit.json`；命令记录见 `verified/f32-vadd/proof/status.json`。
重复 spec C 模板和 `spec-preamble.txt` 也已删除：`proof/c/` 仅保留 Inv/Assert 注释JSON和策略。
所有 wrapper/比较helper的定义、声明、契约、类型/导入前缀均直接来自公开 `spec.c`；内核来自 `impl/`。
四份重新生成的spec目标仅增加Coq导入，证明义务未改变。最新完整检查以 `proof/status.json` 为准。
用户已取消本轮 60% 暂停限制；以下旧额度策略和旧目录描述均属历史记录。

## 2026-10-22：impl / spec / proof 分离

当前审核入口为 [vadd/spec.c](verified/f32-vadd/spec.c)，集中比较函数、`equivalent` 和前后置条件。
`verified/f32-vadd/impl/testNEON.c`、`testRVV.c` 逐字保留原实现；全部本地Coq、shim与检查脚本位于 `verified/f32-vadd/proof/`。
用户明确接受适合证明的比较函数/wrapper形式，因此新入口不再以旧mapper内联循环的转换对应为验收条件。

`python3 verification/qcp/verified/f32-vadd/proof/check.py` 已实际通过：从空输出目录重新生成11个C单元的VC、
检查策略，并重新编译全部87个本地Coq模块，不读取旧实验.vo。审核入口单独21个模块也已通过；
原始C与新spec直接链接的430个native回归通过，额外宏及return0负对照被拒绝。
该次整理前快照与完整检查输入一致的记录见 `verified/f32-vadd/proof/source-audit.json`；不是本次目录整理的新证据。
可计为当前C-shim语义、既定前置条件下的模块化等价性1/40；真实ISA对应、终止性等仍单独列明。
以下旧mapper门槛与未重放依赖的记录保留其历史含义，不覆盖这个新入口的结果。

## 2026-10-22：保留原调用形式的新路径

用户授权本轮继续试验，实时 quota <=60% 时收尾暂停；此前70%的等待规则不用于本轮，
没有恢复后台自动等待。原始两侧 kernel、公开 spec.h/mapper.c 和冻结输入仍未修改。

已独立通过：NEON 原 C token 路径的118个完整kernel VC与26个shim VC；
RVV 原 C token 路径的45个完整循环/helper VC与11个按值外壳VC。
旧 equivalent 的9个条件式 caller VC已重新检查，两侧kernel合同与其声明一致。
NEON新实现430个native case与原实现一致。新入口和边界见
[按值VADD说明](experiments/byvalue-vadd/README.zh-CN.md)；统一重放入口为
`experiments/byvalue-vadd/replay.py`，完整重放结果单独写入该目录的replay-status.json。

load/add保留按值接口；store通过shim宏内部借用局部向量地址，原kernel调用无需改写。
纯按值store出现重复输出资源，失败对照保留，不作为成功证据。
新路径消除了原kernel到pointer/out副本的转换义务；没有把旧依赖闭包或旧公开mapper
到helper形式的对应算作本轮已验证。因此全库端到端接受记录仍保持0/40。

统一入口本轮完整重放通过：所有6个阶段退出码为0；NEON目标重新生成后，8个新Coq模块按序重新检查。
最后实时quota为64%，未触发60%暂停阈值；本轮试验已收尾，不启动其他kernel。

下面各条保留此前pointer/out路线的历史记录，不能与新路径的VC数直接相加。

完整QCP kernel仍为 **0/40**。以下是不同组件的检查范围，存在重复依赖，不能将数字直接相加。原始kernel、公开spec.h、mapper.c和冻结输入均未修改。

| 组件 | 已检查范围 | 入口 |
|---|---|---|
| 初始共享基础 | 48项；NaN bridge另14个C VC | `tools/verify.py`（初始四项重放） |
| 公开接口生成 | 两个短模板，从interface.json生成；与冻结spec/mapper逐字相同 | `tools/generate_review.py --check` |
| 输出模型关系与分块 | 9个纯Coq引理：NaN-aware反身性、共同模型到关系、长度/前缀分块/索引等 | `experiments/vadd-relations/run.py` |
| 实际比较循环 | 12个loop VC+4策略；另重查read2、NaN链14、旧数组策略2；51native控制 | `experiments/vadd-comparator/run.py` |
| NEON块与局部struct | 4通用引理+4策略+6实际调用VC，共14项 | `experiments/vadd-neon/run.py` |
| NEON循环与尾部 | 完整101个kernel VC及5个lane0 VC；26证明文件顺序重放通过，源码/预处理绑定与3个变异负对照通过。旧tail6记录保留 | `experiments/vadd-neon-loop/run_full.py` |
| wrapper条件式组合 | 9个caller VC+1策略；只证明给定callee合同下的组合，两个kernel body与adapter仍为依赖 | `experiments/vadd-wrapper/run.py` |
| RVV完整32lane primitives | load100、add101、store75个C VC；数组3、store5策略；396load/add及396store native对照 | `experiments/vadd-rvv/run.py --add --store` |
| RVV循环、尾部与调用组合 | 37个test_rvv+5个helper VC，2循环策略；另9个chunk调用VC。完整模块及20步统一重放通过，含新模型依赖显式编译 | `experiments/vadd-rvv/run_loop.py` |

RVV primitive整套重放已通过并发布于`140851d4`。输入域包含全部fp32；load/store只要求VL个有效cell，VL=0允许数据指针为NULL，但完整向量对象仍由调用者拥有。旧180秒add超时保存在history，不以新结果覆盖历史。

## 下一步，按此继续

1. NEON：完整101个VC已由checked Module实现并编译；26证明文件已顺序重放，QCP重新生成同一goal；实际C、头文件、策略和预处理输入已绑定，宏替换、Inv修改、反斜杠换行3个负对照均被拒绝。检查点为`vadd-neon-loop/checkpoint-full101.json`。literal lane0使用同一实际C body的专门契约，并另证5个VC，没有把该body作为extern假设。保留旧首次load和lane实例化失败记录。
2. RVV：原始控制流的37个kernel与5个helper VC已组成完整checked模块；2条loop策略、9个chunk调用VC也已检查。20步统一重放已通过，包括RvvLoopMemory/Result/Model依赖按顺序编译。普通C未改；两处Assert保留活跃locals与原pre推出的事实，删除丢失局部vector资源的末尾cut。最小struct drop/keep复现已发布于`05ee3243`；保留失败日志，不以崩溃推断程序不等。FastFrame用分离合取规则直接构造字段重排证明，避免96cell通用tactic超时。
3. 最终接线：两侧lowered C body已证明共同vadd_values；关系桥、实际比较循环与公开equivalent调用方也分别检查。独立审查确认两侧body的调用合同与wrapper一致。下一步建立单一依赖闭包重放入口与汇总准入记录；当前tools/verify.py仍只重放初始四项。原始mapper到helper形式、向量按值到pointer/out的程序转换对应仍是未闭合边界；ISA→C shim对应另列，不因C proof通过而自动成立。
4. 生成器保持小型模板程序。其余39项交第二服务器，按docs/ROADMAP及协调PR分工；本机先完成VADD。

## 保存与暂停

最新已发布检查点：`7c39839b`（RVV完整C unit与20步重放）；NEON完整body在`63367cf3`。两侧公开契约和原始C token身份已经独立复核，原始程序转换/ISA边界仍显式保留。下次恢复优先读本文件与RVV `LOOP.zh-CN.md`，不要从早期失败记录重新开始。

本轮按用户额度规则进入wait_initial后，前台实际完成14轮1800秒等待与实时查询，随后确认额度恢复100%，已恢复leader模式；之后到70%（含）保存并等待。没有使用context百分比或旧session日志代替实时额度。备用用户定时器仍存在；前台活动期间保留 `.build/quota/wakeup-pending` 防止重复唤醒。

所有checked成果应以各目录status/命令日志/hash为准，生成的自动Admitted模板不进入检查链。循环探索的中间VC、源码含Qed或编译超时均不表示完整kernel正确性。旧CSim修复仍只读参考，不静默替换原始代码。

最后实时查询已到70%；按用户最后明确的“跑到70停”，门槛取含70%，已进入wait_leader。所有稳定结果已推送；继续前台每1800秒查询，恢复至少90%再工作。

用户随后明确要求“不要等待，收尾并进入问答”。已终止前台等待，并停止本机`c-shim-v2-heartbeat.timer/service`；不再自动查询或恢复工作。稳定证明包与代码已推送，后续工作等待用户新指令。
