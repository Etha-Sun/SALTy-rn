# PR2 环境评审回应与当前接受记录

本候选基于集成`3cf03900827fa82bdeae670714b9c8ee220a9fee`新增环境能力，不覆盖leader当前README/CHECKPOINT，不改verified的checker、C、spec或Coq证明源。旧ENV工作树`feat/worker-environment@d337cd2f`及其dirty修复全部保留；这里是另行整理的本地patch，尚未提交或发布。PR2旧published HEAD30235127不代表本次候选已发布。

两条review所要求的实现已完成：显式in-place/dune布局、每namespace唯一物理目录、缺选定依赖不fallback并实际import检查；Git同时核HEAD-index和HEAD-worktree、拒绝相互抵消及untracked/ignored可导入源码；archive锁由原始来源核实生成，源码身份、工具binary身份、compiled artifact身份与真实build来源分开陈述。

本机新控制使用当前代码：13项layout/source正负控制、5项source-pin控制、真实in-place检查全部通过。原archive重生的manifest与当前锁逐字相同，SHA256为`bd00cd7ce164fef314d41a6f708ebc6a5b7baa049542f3b7bf19cccd095e8c1b`。源码2992项、现有产物429项分别登记。历史controls03的12项是旧代码证据，不改写成当前13项。

当前完整原调用VADD包**已经独立重放通过**：固定集成3cf03900的隔离源码，11实际C单元新生成、8组策略、87本地Coq模块＋FinalCheck共88条ordinary Coq命令成功，总758.75秒。未导出/使用旧project或experiment.vo；123项manifest源、原始/加注释CPP、公开契约与冻结goal一致。首次NEON QCP生成240秒超时及0模块状态保留；重试用独立adapter将QCP/Coq wall提高到900秒，原checker/manifest/C/Coq源码不变。checker输出status与输入分开守护，其余源身份不变。

仓库可读机器证据保存在[worker-current](../experiments/environment-replay/evidence/worker-current/README.zh-CN.md)：acceptance、完整结果/终态审计、120条实际命令、88份Coq日志及13＋5控制摘要/工具hash；原private路径只保留provenance，不是PR唯一证据。[协调评审记录](https://github.com/Etha-Sun/SALTy-rn/pull/2#issuecomment-6359208633)已报告此状态。该接受结果不等于空环境重建，也不增加已验证kernel数或GEMM VC。

新增薄`setup_package_environment.py`只调用原load_environment、写external config和白名单tool forwarding；不改原checker。它用真实import/config一致性smoke单独验收，不冒充再次完整87模块检查。运行路径均由本机QCP_HOME/QCP_COQC确定；生成物留在用户指定的新runtime目录，不提交本机凭据。

**仍未完成**：真实Dune安装只做过布局fixture，需leader在真实环境执行`environment.py --check --layout dune`；外部source-to-vo build history未知；ISA对应和独立终止性不由本次环境修复推出。此patch的基线/输入身份审查与`git apply --check`也不能自动授予PR可merge状态，发布仍由负责人处理。

新增公开run_package_check.py严格固定f32-vadd87/11与checker SHA，只给原CLI传入config/jobs并显式采用900秒wall预算；不改checker/C/Coq/manifest。它的--help及既有99次成功调整规则映射已验收，不声称其新增后再次完整重放87模块。原始成功、首次超时与新增helper的验收范围均在仓库证据中分开。
