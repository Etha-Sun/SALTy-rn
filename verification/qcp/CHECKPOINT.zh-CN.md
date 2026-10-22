# VADD 当前 checkpoint（2026-10-22）

## 2026-10-22：impl / spec / proof 分离

当前审核入口为 [vadd/spec.c](vadd/spec.c)，集中比较函数、`equivalent` 和前后置条件。
`vadd/impl/testNEON.c`、`testRVV.c` 逐字保留原实现；全部本地Coq、shim与检查脚本位于 `vadd/proof/`。
用户明确接受适合证明的比较函数/wrapper形式，因此新入口不再以旧mapper内联循环的转换对应为验收条件。

`python3 verification/qcp/vadd/proof/check.py` 已实际通过：从空输出目录重新生成11个C单元的VC、
检查策略，并重新编译全部87个本地Coq模块，不读取旧实验.vo。审核入口单独21个模块也已通过；
原始C与新spec直接链接的430个native回归通过，额外宏及return0负对照被拒绝。
当前源与完整检查输入一致的记录见 `vadd/proof/source-audit.json`。
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
