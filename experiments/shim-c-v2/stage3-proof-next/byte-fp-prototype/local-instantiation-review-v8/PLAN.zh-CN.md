# 更正（以本段为准）

实际逐导出检查：10个目标仅canonical ensures保留4个FP支持forall，其余9个byte/frame目标不含这些事实。此前“所有导出带四个forall”错误，撤回。root同源canonical-same-source01为14/14，v2失败七项恰为v1的CVC5成功项；v2 Z3-only删除了CVC5的纯byte求解能力，这是有逐goal证据支持的退化原因，不能归因全局量词。assigns_normal/assigns_exit须按goal区分。

本地实例化仍是针对确实含FP支持事实的zero/store目标的独立性能实验，不能当作修复已定位的pure-byte后端缺失。恢复CVC5只支持的subset并拒绝fp.to_ieee_bv任务是另一条独立正确路线。

以下保留原计划及被上述更正取代的推断，供审计历史：

# 局部实例化建议（不改快照）

数学引理已证与导入后C验证性能是两项独立标准。v2 canonical7/14的7项未证为source-preserved、4byte copy cuts、copy-word、assigns-normal；最终NaN ensures仍通过。所有导出都无条件带四个32/64 FP全称事实，含纯byte/frame目标不需要的64位关系。这是确实存在的多余上下文；因果仍须同源同目标对照，不能凭观察认定唯一原因。

最小下一实验优先使用已有Why3证明变换，不先新增C内置API或改MemBytes：

1. 新独立执行诊断先保持v1不全局import支持。canonical这类常量decode/bytecopy目标不加入任何encode往返/范围事实，保留原字节切分证明。
2. 对确实含符号encode/decode链的单个已导出Why3 goal，显式选择已证32位事实与该goal中的实际值/seed项。Why31.8.2现有变换`instantiate`可生成实例，`inst_rem`生成实例并删除原全称前提；`remove`删除其余不需要的支持事实。多个真实store先instantiate各项，最后inst_rem去掉全称。原内存条件和目标不删不弱化；只删除多余支持前提是更强的任务，不能带来假证明。
3. 保留变换前后task/SMT及每个实例到已证body的来源映射。导出应只留下相关宽度、相关实际seed的ground等式/条件式，没有全局FP codec forall。非NaN逆仍保留范围/非NaN条件，不把条件当假设。实际跑对应正/负goal，检查性能和正确性后再决定是否需要小型可审查的WP策略连接。当前不建设自动profile/通用instantiation框架。
4. 不使用只隐藏名字但仍导入全部forall的wrapper module；Why3的use本身可能传播lemma事实。也不在driver中直接写ground axioms。只能通过已有proved lemma与可审计的正确实例化变换得到事实。

C ghost备选具有额外边界：普通C参数无法直接引用MemBytes内部fresh int seed；单纯ghost helper接收任意C seed可能证明一个无关实例，不能解决实际内存store链。若采用，需新版本显式native原语绑定、真实helper body与确切使用点的参数对应证明；无body合同禁止。当前优先Why3本地实例化，避免为性能引入新的模型原语或语义改动。

依赖链：4个decode/range body见checked-subset-v4实际重验；32组合6VC见compose32-cuts-v6/root01；64组合6VC见compose64-cuts-v7/root01。两种BV逆及接口由Z3，原IntRoundtrip64由CVC5纯整数driver实证；具体64native负控制的Why3日志为3项Unknown(unknown + incomplete)，没有parse error；root报告SAT需另附直接solver输出才能作为字面SAT证据。不得将这个数学闭合链直接升级为新共享内存模型已qualified，更不等于九核整核完成。
