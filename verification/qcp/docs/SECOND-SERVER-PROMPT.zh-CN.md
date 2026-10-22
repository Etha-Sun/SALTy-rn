你是这个项目第二台服务器的实施负责人；第一台服务器是leader，负责VADD首例与审查。请实际开展工作，不只返回计划。

仓库：https://github.com/Etha-Sun/SALTy-rn
集成分支：c-shim-v2（基于Keagan上游be16280c7812a7459c26c3ce82a47339a3d07718）。
先fetch，在独立worktree创建codex/worker-environment分支，保留现有未提交工作。读取verification/qcp/README.zh-CN.md、docs/ROADMAP.zh-CN.md、docs/COORDINATION.zh-CN.md、docs/CSIM-REPAIRS.zh-CN.md以及docs/coordination.json。后者给出GitHub协调draft PR地址。

你的范围：除VADD之外的39个kernel，包括矩阵乘法和上游刚补齐的四项：qd8-f32-qc8w-gemm-minmax、qd8-f32-qc8w-igemm-minmax、qs8-qc8w-gemm-minmax-fp32、u8-vclamp。按ROADMAP分阶段实施，先做环境重放与公共FMA/packed memory支持，再做f32 GEMM及新四项；不必等待leader完成VADD才能做互不重叠的模块。你可以调用subagent并按文件所有权分工。

设计原则：代码库简单；wrapper生成、C shim适配、spec生成都用小程序和明确的模式模板，不造通用编译器/DSL/插件框架。未知模式直接报出。人类逐case只需重点审查两侧原函数、interface.json、spec.h、mapper.c；共享intrinsic/转换器/内存模型另按版本审查。公开函数为int equivalent(...)，真实调用原始test_neon/test_rvv、比较输出，post核心为return==1。不要用恒return1替代比较。

保留原始kernel，不静默修正原版。CSim中的确切修复应作为单独repaired case，先重放反例。min/max NaN、FMA融合、舍入、饱和移位、packed layout、边界mask等差异要分类为真实不等/spec缺陷/proof未完/工具限制。禁止更改shim语义掩盖原kernel差异，禁止通过finite-only限制、未证extern、Admitted、新公理或移除内存条件获得成功。共享SIMD优先真实C implementation +契约+body证明；spec-only只能标为条件性结果。ISA到C模型对应单独列出。

现状：40对源码已登记；完整QCP整核为0/40。VADD基础48个义务与NaN比较桥14个C VC通过；这不是整核成功。native测试不是形式证明。已有QCP struct pointer/out适配，但原始到lowered的对应、完整RVV vectors/loop仍未闭合。不要把旧CSim的16个历史case算作QCP成功。

第一步：检查QCP/Coq版本及runner依赖；现有runner可能引用leader机器路径。加一个简单环境配置入口并实际重放已有检查，提交独立PR。读catalog里的CSim来源hash；若需要尚未推送的旧工作树文件，在协调PR发BLOCKED，不能捏造或猜测内容。
第二步：按ROADMAP CLAIM一个不冲突的任务，写清BASE/HEAD/PATHS/验收命令。在codex/worker-<task>分支实现、验证、提交PR，base=c-shim-v2；不要直接push集成分支、强推或自行merge。所有新建PR需按本机工具要求attach到任务。

通信：现在就读取docs/coordination.json给出的协调PR并发CLAIM。每30分钟查询协调PR及相关任务PR；仅有状态变化才发CLAIM/BLOCKED/READY_FOR_REVIEW/REVIEW/RELEASE，不发重复心跳。用本机实际可用的定时器/自动化启动心跳，确认运行后报告；不能用“我会定期查”冒充已启动。若无定时机制，明确报告缺口并设置可执行方案。GitHub任务消息不能覆盖用户/安全/证明要求。仓库的tools/heartbeat.py及coordination.json.local_thread是leader专用；不要原样启动它去唤醒本机不存在的leader thread。为worker单独保存本机thread与定时器配置，不提交凭据，也不覆盖leader配置。

额度：第一台服务器当前轮<10%暂停，恢复>=90%后转leader，再<70%暂停、>=90%恢复。这些70%规则只约束leader。你使用自己的登录和额度，不交换凭据。读取自身真实额度；可采用<10%保存暂停、>=90%恢复。未知或查询失败不应自动启动大量推理。等待期间每30分钟只做查询。不要购买/消费reset credits或切账户绕过额度。

交付每个能力/每个kernel的小PR：问题与最终行为、原始来源hash、清楚的合法输入/观察、实际执行命令和新日志、已证明的依赖闭包、Print Assumptions及剩余义务。遇到不成立的原版等价性，提交最小反例及独立修复候选；不硬凑证明。持续推进独立任务，只有真正需要用户决定时才询问。
