你是本项目第二台服务器的实施负责人。请跟进 leader 已发布的进度并实际继续实施；保留你已有的分支、工作树、未提交成果和已领取任务，不要重新开一套平行框架。

仓库：https://github.com/Etha-Sun/SALTy-rn
集成分支：c-shim-v2
本轮证明基线：f8a284b85b4adc60590d4c5580cc0b5f50d96d2a
协调板：https://github.com/Etha-Sun/SALTy-rn/pull/1
已有环境PR：https://github.com/Etha-Sun/SALTy-rn/pull/2

本指令更新此前的交接：新的优先路线是保留原kernel的C调用、赋值和控制流，只改shim、加证明注释。旧pointer/out调用改写路线保留为历史参考，不要默认把kernel再改写一遍。

一、同步并理解当前成果

1. git fetch origin，核对 origin/c-shim-v2 已包含上述完整SHA；后续基于其最新已发布提交工作。已有worker分支先保存工作，再用正常merge等保留历史的方式吸收集成进度，不强推、不覆盖别人改动；没有工作分支才创建 codex/worker-<task>。不要直接推c-shim-v2或自行merge PR。
2. 先读 verification/qcp/CHECKPOINT.zh-CN.md，以及：
   - experiments/byvalue-vadd/README.zh-CN.md、replay-status.json、replay.py；
   - experiments/byvalue-rvv/README.zh-CN.md、replay-status.json；
   - docs/ROADMAP.zh-CN.md、docs/COORDINATION.zh-CN.md、docs/CSIM-REPAIRS.zh-CN.md、docs/coordination.json；
   - catalog.json 与你当前任务、环境PR的最新评论。
3. 最新已实际通过：NEON原调用形式118个kernel C VC、26个shim C VC；RVV原调用形式45个循环/helper C VC、11个按值外壳VC（正式load/add用8个）；已有equivalent调用方9个C VC；NEON430组native对照。统一入口6阶段全部退出0：
   python3 verification/qcp/experiments/byvalue-vadd/replay.py
4. 这是既定QCP/C shim下的模块化部分正确性。旧依赖闭包尚未全量重放，原公开mapper的内联比较到helper的程序对应仍未证明；真实ISA对应、终止性、任意VLEN都不在已完成范围。完整跨ISA验收仍为0/40，不能把局部VC数相加当作整核计数。

二、优先复用的实现与已知边界

- 原始两侧kernel、公开spec.h/mapper.c和冻结输入保持不变。注释副本必须复用既有freeze/token检查，确认只新增证明注释。不要修改普通C去消除证明困难。
- load/add/get可以保留struct按值接口；调用后的where是QCP注释。store采用shim宏，内部借用局部向量地址并调用已有pointer-store。原kernel继续写原intrinsic调用；不能声称shim内部完全没有指针。
- 当前store宏只支持局部向量左值，不能无条件处理store(p,add(a,b))等一般表达式。重复输入add(a,a)、mask/tuple、位重解释、不同元素类型及VL配置都需实际检查，不能从VADD推断所有kernel已兼容。
- 纯按值store在QCP生成的循环资源中出现同地址written与undef重复。失败记录已保留；不要利用矛盾前件强行闭合证明。优先复用已通过的宏方案；要扩展其模式时先给最小正反例。
- 复用 shared/vadd、vadd-rvv 的具体primitive、数组拆拼、循环模型、FastFrame，以及新byvalue目录中的复制/地址归一化策略。96字段的盲目entailer/setoid重写曾很慢；已有FastFrame直接构造分离合取证明。先归一化typed aggregate地址，并在必要时恢复纯条件的andp结合方式。
- wrapper/spec生成继续采用小模板与简单模式匹配，未知模式明确拒绝。不做通用编译器、DSL或复杂插件架构。人工审查面仍以原test_neon/test_rvv、interface.json、spec.h、mapper.c为主；共享shim/宏/模型需另行审查一次。
- equivalent必须真实调用两侧并比较输出，post核心为return==1，不能写恒return1。输入域、padding、允许alias和写入frame必须完整。

三、你的接续任务

A. 优先收尾现有环境PR #2。读取leader两条REVIEW，处理显式Dune/in-place布局选择、与固定HEAD比较并检测staged/untracked的Coq源变化、release归档的源清单/构建来源。覆盖新byvalue重放入口，但不要批量重写其C/proof。当前runner仍依赖leader路径与已配置QCP/Coq；环境失败不能记为proof失败。版本/工具与库源哈希必须准确，不能用一份.vo哈希替代依赖闭包证明。
B. 环境可用后，独立重放最新VADD统一入口，把新日志和环境身份放在你自己的run目录，保留leader历史记录。可提交最小移植补丁；未解决旧依赖/mapper边界时不授予整核成功。
C. 主实施范围仍为其余39个kernel；VADD case和leader的byvalue试点目录默认只读。继续你已CLAIM的M1-packed/FMA等独立任务，不必等leader再开工。按ROADMAP推进，优先u8-vclamp与新三个矩阵target：qd8-f32-qc8w-gemm-minmax、qd8-f32-qc8w-igemm-minmax、qs8-qc8w-gemm-minmax-fp32；同时规划f32-gemm-minmax。先明确packed布局/单位、整数wrap、FMA单次舍入、NaN/minmax及tail，再证明实际完整循环。
D. 在独立case/共享候选目录实施。共享库改动单独小PR；每个kernel单独PR，base=c-shim-v2。新case先给原始来源SHA、简单可审查的spec/mapper，再给primitive真实body、内外循环和实际比较器的证明闭包。CSim修复先重放反例，作为独立repaired版本，不能静默修改原版。

四、持续跟进与通信

现在立即读取协调PR #1和你自己的任务PR最新评论，发布一次CLAIM/进度回复：你读到的BASE、当前HEAD、拥有PATHS、下一步与验收命令。以后每30分钟fetch集成分支并读取协调板及相关PR，跟进leader新CHECKPOINT和评审；正在运行证明时先完成可保存的小步骤。无变化保持安静；仅任务领取、阻塞、可审结果或新评审时发CLAIM/BLOCKED/READY_FOR_REVIEW/REVIEW/RELEASE。

使用你服务器自己的真实可用定时器/自动化，并确认已运行；不能把“我会定期查”当作已启动。若已有worker心跳，检查并更新其prompt而非重复部署。leader的local_thread和heartbeat配置不适用于你的服务器，不覆盖它们。leader本机心跳已按用户要求停止，本轮quota<=60%时暂停；此前70%等待规则是历史配置。你遵循自己服务器最新用户设置与真实额度，不共享凭据或额度，也不假定leader会每30分钟回复。没有收到leader回复不阻塞你推进无冲突任务。

状态格式：
TYPE: CLAIM | BLOCKED | READY_FOR_REVIEW | REVIEW | RELEASE
TASK: 任务ID
OWNER: worker-server
BASE: 完整SHA
HEAD: 分支与完整SHA
PATHS: 拥有路径
EVIDENCE: 实际命令、结果文件、通过范围
OPEN: 剩余义务、显式假设、下一步

不要通过finite-only限制、未证extern、Admitted、新公理、删内存条件或放宽观察关系获得成功。区分spec问题、proof缺口、工具限制、环境失败与真实不等。不要购买reset credits、交换认证或换账户绕过额度。交付真实命令与新日志、源/工具/模型身份、Print Assumptions及未完成边界；不伪造已接收/已启动/已证明状态。现在按以上顺序开始，持续推进你拥有的工作。
