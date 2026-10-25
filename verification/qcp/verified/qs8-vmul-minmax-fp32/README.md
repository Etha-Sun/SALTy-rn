# QS8 乘法与 clamp

当前为完整门禁候选；最终状态以 `proof/status.json` 和全局 verified 清单为准。24 个实际 C 翻译单元的871条义务已分别通过组件证明，另有两组策略共7字段；完整 fresh 门禁仍须通过才计入 verified。

唯一公开契约是 [spec.c](spec.c)：长度为正 uint64，两个输入各有N+7字节可读空间，允许部分或完全输入重叠；输出恰N字节，与只读输入和参数资源分离。Scale覆盖全部binary32，输出零点为signed16，clamp边界各为signed8，允许无序边界。

原NEON不变；RVV修复为magic-bias加法、位重解释、饱和减法，并在最后一次浮点运算之后恢复NaN scale符号。单独证明的位分类和record输入、浮点消费者、计算helper都是实际C函数；没有用普通helper冒充免证intrinsic。当前40个普通函数体包括27个helper、两侧kernel、比较/公开caller和9个宽度探针。

[原件身份](proof/originals.json)、[完整精确补丁](proof/repair.patch)、[修复记录](proof/repair.json)及[实际反例](proof/original-counterexamples.json)保留大有限scale差异及旧Frama-C修复对负quiet/signaling NaN的差异。完整补丁从原RVV及空shim目录重建当前主核与46个支持C/头文件；[旧主文件补丁](proof/repair-rvv.patch)作为旁证保留。当前RVV SHA为59799e1d640d7dde442b0260fa86a067c16e0b35f1ab5e2553b118a6b2f2483f；语义和repair记录中较早load-into阶段的50052…等SHA属于明确保留的阶段历史，不能作为当前实现身份。

[语义说明](proof/semantics.json)及[intrinsic台账](proof/intrinsic-ledger.json)公开62项记录，其中57个原生intrinsic调用视图采用源审spec边界；每个视图必须对应单一原生指令语义、精确合同、Coq定义、原规范及配置。Arm/RVV NaN算法分别建模；RVV固定VLEN128/VLMAX32，保留全部合法VL及保守任意inactive lane。人工语义审核待进行；没有真实ISA、物理struct ABI或独立终止性定理。

四组当前native覆盖独立ISA数组视图和实际scalar-field helper/caller视图的UBSan与实测16GiB/swap0 ASan。每组278016次调用、每侧12804556个元素，含全部65536 byte对、38类scale、全部65536 signed16输出零点、输入别名及无序clamp；独立oracle拒绝单侧错误和双侧共错。有限测试不代替kernel证明。

运行和审查：

- `python3 proof/build_full_handoff.py --prepare-only`：当前24单元CPP、原C token、合同/调用闭包预审。
- `python3 proof/record_status.py --preflight`：原件、完整patch逐文件零模糊重建、反例与四组native身份审查。
- `python3 proof/build_full_handoff.py --freeze`：只接受全部组件完成并固定H；拒绝任何pending或身份变化。
- `python3 proof/check_full.py --config <coq-flags.json> --jobs 32 --live-jobs <协调槽数>`：当前实际C/策略全部重新生成、全部本案依赖从源编译、各VC_Correct、独立第二接口及完整Print Assumptions；不复用组件VO。
- 全案通过后先 `python3 proof/record_status.py --dry-run`，再正式签发；不会自行改变全局数量。
- `python3 proof/audit_relocation.py --proof-run <原完整运行目录>`：搬迁后重建CPP及核对归档身份，明确不冒充第二次证明。

配置32并发准入，普通进程16GiB、重型32GiB；生成21600秒、普通7200秒、重型14400秒。实际同时准入受全队已协调的有限总内存预算约束。原命令、日志、目标、所有继承假设和source-to-model边界保留。
