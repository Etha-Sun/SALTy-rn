<!-- restoration-delivery-20261103T0844Z -->
> 当前恢复交付共2项：qs8-vlrelu 已撤掉零向量临时变量、恢复原嵌套调用，并在原宽域合同完整通过；qs8-f32-vcvt 新独立支持域候选已撤掉 unsigned 取负，两主C逐字节恢复原件，按真实上游qint8零点范围[-128,127]完整通过并完成独立准入审查。两项均覆盖实际helper/body/kernel/caller/最终门禁。宽域旧版保留，正式verified未改。此前同版本qs8-f32-vcvt、qs8-vcvt重验仍不计恢复成果。Maxpool/卷积/PackW及其他范围恢复未完成；当前无活动证明任务、无需用户决定。隔离树候选 RESTORATION-RESULT.zh-CN.md、neon-minimal-audit/restoration-completions.json 为当前结果；以下内容保留为历史快照，旧“未验证”及运行PID不代表当前状态。

<!-- actual-restoration-20261103 -->
> 当前结果：新增结构恢复完整通过1项qs8-vlrelu（恢复两处嵌套零向量调用，保留宽域取负修复）；完整证据在隔离树该候选proof/restoration-final-audit.json与restoration-status.json。早先qs8-f32-vcvt、qs8-vcvt属于同版本重验，不计恢复成果。用户新条件授权已据实际原始调用链审查应用于独立neon-supported-qs8-f32-vcvt：仅加有真实qint8运行时检查来源的zero_point范围，原NEON/RVV主C均恢复A，尚未验证；宽域旧包保留。见隔离树neon-minimal-audit/RESUME.md与domain-evidence。

<!-- restoration-scope-20261103 -->
> 当前最高优先级（2026-11-03 00:35Z用户纠正）：撤掉不必要的源码改写，恢复结构后完整验证；不再以完成11项为目标。下文2/11为历史同版本重验，qs8-f32-vcvt、qs8-vcvt不计新增恢复成果。活动qs8-vlrelu仅恢复原嵌套零向量调用，保留必要取负修复，尚未完成最终验证。优先审查maxpool向量NaN helper，然后HWC/DWCHW、PackW。详见隔离树neon-minimal-audit/scope-correction.json；不得按旧命令重复启动。Mac人工批注本机不可访问，不能解释为已批准。

# NEON 最小修复当前状态

2026-11-02，Sol接续中。工作树`build/neon-minimal-repairs`，分支`codex/neon-minimal-repairs-20261102`，基准821969733。主树仍feat/assembly-reduction-lean，未push，未修改正式verified或四端工作树。

## 用户关心的结果

**当前11项NEON真问题均已重新取得实际原C错误证据，11个原结构最小候选均已有实际C有限诊断通过；新完整C-shim等价证明已完成2项：qs8-f32-vcvt、qs8-vcvt；其他9项未完成。** 这些问题历史已识别，本次不是新发现。新证明正在单进程进行，不能将诊断、VC生成或历史proof拷贝计为完整结果。

- 六项：qs8/qu8-f32-vcvt、qs8-vcvt、qs8-vlrelu、qs8/qu8-vadd-minmax，int32极值取负UB。
- qs8-rsum：signed标量输出加法溢出。
- qs8/qu8-rdsum：计数截断/ceil；qs8另有signed尾部输出加法溢出。
- f32-maxpool：int(K)-9计数溢出。
- f32-argmaxpool：int计数截断和小C多组tail读取越界。

域是**当前821公开catalog/shim合同**，不是上游所有调用域；qs8-vcvt历史Frama合同曾排除INT32_MIN，本次当前合同未排除。旧UB输入没有可证明的旧新全域等价；目标为候选满足预期合同，并在旧定义域保持行为。完整说明见隔离树`verification/qcp/candidates/neon-minimal-audit/AUDIT.zh-CN.md`。

## 新错误证据与候选

- `original-ubsan-replay.json`：六项int32取负及qs8-rdsum尾加法的原件UB；vadd额外显式INT32_MIN调用，补足常规随机调度未覆盖该值的空隙。`minimal-vadd-extreme.json`记录对应候选通过。
- `original-rsum-ubsan.json`：N=1/input=1/旧output=INT32_MAX的原件UB与候选模32结果。
- `original-rdsum-count.json`：rows=2^31、stride=0、完整小输入/zero对象，原NEON/RVV同错为0，应0x80000000。
- `original-pool-count.json`：完整有效K=2^31项表重现Maxpool UB、Argmaxpool错误输出。1MiB已初始化只读共享页映射完整16GiB虚拟表，受1GiB物理内存cgroup和60秒预算保护；不是未初始化表或孤立计数片段。
- Argmaxpool C=1/K=10/仅一个输出元素：旧NEON ASan越界，新候选通过；其原结构NEON/RVV4320例有限回放通过。
- 其余各候选有限回放及公共caller/独立oracle/negative-control结果在`proof/minimal-native-status.json`或`minimal-native-latest.json`；只算有限诊断。
- 全部22份minimal patch已GNU diff序列化并零fuzz精确回放：`minimal-patch-replay.json`。

qs8-rsum RVV自动替换未命中已补好。Maxpool RVV已加必要计数、九输入tree/前值顺序/NaN优先级，原do/读表/通道循环保留；NaN helper恢复向量bitmask版本SHA4443bf4a…，没有栈数组scalar化。其普通helper body证明仍未完成。

| Kernel | 当前最小NEON SHA256 | 完整等价证明 |
|---|---|---|
| qs8-f32-vcvt | `6005fdaf2b46371336b368385a0eb9b5888f853daa4cfb7d8780316c39af9ed7` | 已完成（公开C-shim边界） |
| qu8-f32-vcvt | `da698cee5deb0616434bbfdc318e089e3ef04ac4b93bd863ab427ead22b60f4d` | 未完成 |
| qs8-vcvt | `e37574500b28568dfe482bc8382a078ffe3362b6bb39f9d14e55306d0af9ef46` | 已完成（公开C-shim边界） |
| qs8-vlrelu | `54651f75a2b265b0847e0180fcb62cc29f8b18536d77fc4954e0c6330c278eb1` | 未完成 |
| qs8-vadd-minmax | `d8ace51f059f6d9d21313b5ffa21f96779a2dff3fc9758bfe12ea50be0079b47` | 未完成 |
| qu8-vadd-minmax | `89930b706cabd81966971bc09c5807b0f7fb1e996724bf44f087703db72ed3f4` | 未完成 |
| qs8-rsum | `71fe4b808f8aeeeb89c6f5ff40f59245e2aa759af007cf3d76c8f49b8df2537a` | 未完成 |
| qs8-rdsum | `604a39ab1aa0f63be1310590e90bcda1b98debe264b6a7f707a4c46ed19eb2e2` | 未完成 |
| qu8-rdsum | `e739c591226d1426696a65b0eaff2fa3b617404540a2fb63d5b02b063a2b3a94` | 未完成 |
| f32-maxpool | `c250f04820a2d1f09fd08d554a144d5f890cee6a11c20eb6cc7b905f82b89a78` | 未完成 |
| f32-argmaxpool | `247581a07996ab9d3ef7544a887f47735a2eab33c6535c40edc93580a20490f4` | 未完成 |

## 40项覆盖

完整逐项分类与80份diff hash在`neon-minimal-audit/audit-40.json`：11项NEON真问题，10项NEON主C未改，13项已知语义错误仅在RVV，4项NEON兼容/证明重构，2项未确证边界（qd8-qc8w-gemm prefetch缺完整packed对象反例；transpose零宽旧域行为有意保留）。未将RVV-only/前端改写算NEON成果。

## 当前证明与环境

优先qs8-f32-vcvt：最小NEON/RVV与历史821证明源字节相同。已找到f32-vadd源码与scope=full历史依赖目录`build/qcp-kernel-framework/verification/qcp/verified/f32-vadd/.build/full-pwarla4l/coq`；所有本地模块仍须fresh重编译，不复用vo。

首次整批每命令120秒导致NEON实际C生成超时；第二次1200秒已重生成全部26个实际C单元、10个策略，随后因隔离PATH缺coqdep而停，日志完整保留。已补统一Coq8.20.1的coqdep入口，并对该批全部源码做coqdep预检成功。第三次完整门禁正在重新fresh运行，每命令1200秒、单进程16GiB，没有更改kernel/spec/VC以绕过失败。

统一入口：`neon-minimal-audit/runtime/{qcp,qcp-env,coqc,coqdep,StrategyCheck}`；config.json固定QCP2.1.4 dune库和Coq8.20.1 flags。`qcp-env`仅exec统一PATH，不混入主树.local旧库。

qs8-vcvt已把同一处unsigned取负的大小写/空格对齐donor，两个主C现与donor字节一致；证明源包已移植。其full runner的并行准入仅从jobs==16收紧为jobs==1，冻结自身hash已更新，未删任何规格/VC/闭包/最终门禁检查。尚未运行该项full gate。

其他原结构候选的generator正在接线；遇前端或证明困难必须保留精确日志，不能修改运行helper或循环迁就证明。普通helper须body证明，intrinsic列明公开信任边界；既有receipt只能作历史出处。

## 额度和续跑

最近官方实时查询2026-11-02T12:20:42Z，周窗剩81%；每新证明批次前及持续工作最多5分钟刷新`python3 research/project-plan-20261102/read_quota.py`。沙箱内账户连接关闭时仅为只读查询申请升级。任一适用窗remaining<=55或未知即停止新批、保存交接，至少为用户保留50%；不创建子agent/外部模型进程/消费reset。

当前无需用户决定。确切运行目录和后续命令见隔离树RESUME.md；尚未完成的证明继续处理，不能报阶段成果或组件报喜。

## 2026-11-02 20:12Z 接续结果

qs8-f32-vcvt现已完成最小修复后的新完整C-shim部分正确性及NEON/RVV等价验证：fresh full-f770isxz、26实际C单元、1337义务、全部普通helper/kernel/caller/最终gate闭合；只读准入审查通过，未签发、未改verified、未push。完整结果见该候选proof/minimal-status.json及minimal-admission-final.json；其他10项仍未完成。以上早先“0项”与进行中描述为历史快照。

平台中断后用户最新范围：仅继续Coq/QCP完整证明与结果核对，不再运行大规模内存诊断或构造错误触发案例。20:11:41Z实时周窗剩75%；额度每新批及最多5分钟查询，<=55%或未知停止新批。先前session19973已结束成功，下一项qs8-vcvt。

20:14Z：qs8-vcvt fresh full已启动（session47759），全程单进程16GiB/命令1200秒。首次因沙箱继承未映射文件组导致GNU patch元数据失败；仅将本轮临时patch输入组改为当前组，随后精确patch/hash检查通过，未修改kernel/spec/VC。其余fresh证明进行中。实时quota剩74%。


## 新 thread 交接（当前最高优先级）

用户要求提供独立prompt接续。根代理已中断旧NEON子agent，旧agent不再自行推进。完整验证仍确认1/11：qs8-f32-vcvt。qs8-vcvt最后记录为session47759正在执行；中断agent后的工具进程是否仍运行、是否已产出最终结果尚未核实，新thread先检查该候选最新.build日志/status及进程，不得直接重复启动。session ID不保证跨thread可用。上文“正在运行”的描述是最后观测，不是交接时确认。

新thread启动prompt：/zp_vegeta/scratch_sb/ycsun/verus/research/project-plan-20261102/NEON-NEW-THREAD-PROMPT.zh-CN.md。保持模型gpt-6.1-sol、既有工作树与50%保留/55%收尾规则。四端vabs任务继续由原聊天管理，不在此次交接范围。

## 2026-11-02 20:49Z 本聊天接续（覆盖旧进程推测）

完整通过仍为1/11：qs8-f32-vcvt，其fresh full-status与只读admission摘要SHA已核对匹配。qs8-vcvt旧full-6tflg27m宿主PID1588729仍在运行，Coq子进程持续推进；没有重复启动。旧session47759在本聊天不可用，应读实际宿主进程及该run/status.json；proof/full-status.json仍是此前失败轮次，不能用它替代正在运行轮次。

九个待接续候选已补齐缺失donor证明源码和注释/清单（每项proof/donor-proof-import.json记录）；不覆盖已有最小修复文件、不复制vo，不给历史passed记录新增证明信用。qu8-f32-vcvt已准备proof/check_minimal_full.py：保留原for增量调度，fresh实际C/全部helper/两kernel/caller/策略/本地依赖与最终typed门禁，尚未运行、不能计为完成。其他候选仍需实际生成与闭合。没有修改任何impl/spec、正式verified或四端vabs。

20:48:20Z官方实时周窗剩73%；沙箱内账户接口关闭，授权的只读沙箱外查询成功。继续每批及最多5分钟刷新，<=55%或未知停止新批、保存状态。详细过程：候选neon-minimal-audit/continuation-20261102.log、live-run.json与process-current.json。当前没有需要用户决定的问题。

## 2026-11-02T22:33:38.789877+00:00：完整通过2/11

qs8-vcvt的旧full-6tflg27m运行已成功结束，随后保留全部检查的只读准入审查通过；新完整结果为26实际C单元、1672 C义务、15策略字段、240 fresh本地模块，包含全部普通helper、两侧kernel、caller及最终门禁，1687份假设报告无新增项目公理。没有重复启动旧证明，没有签发/改verified/push。当前完成：qs8-f32-vcvt、qs8-vcvt；其他9项未完成。22:33:09Z实时周窗剩72%；继续按每批及最多5分钟查询，<=55%或未知停止新批。下一项使用下文/前文的qu8-f32-vcvt check_minimal_full.py命令。
