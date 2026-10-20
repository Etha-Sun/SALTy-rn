# 最终统一候选 v02：已冻结，完整检查与准入完成

Agent先提交未冻结草稿；root复核后已建立 `task.json`、`case/frozen.json`，并启动全新full。single proof `31eda107…`，frozen SHA `818e5caf…`。当前**两次完整重放及打包canonical均770/770通过，已准入verified/f32-vlrelu**；最早的 `merge-audit.json`/`run-proposed.json`是冻结前历史，当前冻结/运行以task、attempt和root审计为准。

精确基底仍为 merged-values-v02 实际 proof `d5b18b2b...`。继承 v01 已检查的主prefix名字/MP4Filter与read helper/caller，再叠加 conv actor 明确确认的稳定 v07-exact-instance 来源：case/proof.patch `d63b30dd...`、最小delta `767a33b4...`、case/.build/guard01/annotated。完整确认和 SHA 见 actor-confirmation.json、merge-audit.json；没有采用未运行的 v08。

相对基底只改变 extensions.h、neon.c、harness.c：保留一个 read helper，增加两个实际检查过的 store-point ghost helpers；在 NEON 的4/2lane分支加入对应点实例化、transfer调用和已检查的index/frame cuts，并给四个原匿名目标命名。原主prefix名字和read caller不丢失。harness保留全部原策略、prefix/read策略和精确v07末尾策略。

首次直接应用delta时，已有MP4Filter占用了原文件EOF，harness追加hunk被拒；原始reject与原因保留在merge-attempt01/。最终harness严格取v01源加v07相对d5b18的逐字后缀，没有猜测或手改策略。extensions与neon分别同actor实际源码逐字一致（neon只多既有prefix名字）。最终single patch已由 GNU patch --fuzz=0 实际应用到原冻结输入，20个工作文件全部roundtrip逐字一致。

所有原冻结源文件SHA已核；19个C/H普通token不变，公开spec/shim/driver原字节不变，其余17个文件只移除#line后同字节；模型/checker原pin未改。全局引理仍为21个唯一名字。唯一完整证明文件为 draft/proof.patch，审核差异见 review-from-d5b18.patch。

来源局部证据为同v07快照 caller64/64（36RTE、18privatepre、10assert）、helper body6/6、globals21/21和正常正负模型控制；这些数字**不继承**为新合并候选通过。四个旧frame/value目标映射到 mainframe4_store/value、mainframe2_store/value，全部公式保留。MainFGFilter 对 values_transfer_source/value 的晚绑定也影响其它旧transfer调用，因此新完整运行必须复查所有调用，而不只新调用。

冻结前run-proposed.json记录拟定full；正式task现已pin depth16_progress、shell逐目标日志、par128、每solver30秒/1024MiB、行政3600秒；没有函数或属性子集。root已完成精确read依赖审计并冻结，正在重新检查全部caller/helpers/globals、RTE/前件/frame/assigns/termination、直接与ghost调用闭包、controls和实现身份。局部数字不能拼成整核通过。

同一proof的独立完整重放在 `../v02-independent/`，原进程和独立进程各有自己的不可变attempt。独立无prover枚举为749个main ID，见root-full-enumeration；最终raw必须逐个ID一致且全valid，另核21globals和controls。枚举和局部计数都不是整核通过。

最终：两次candidate及fresh packaged canonical均770/770；model/source posthash、36body/21global覆盖、全部749main ID和controls通过；原生C有限8256组也通过。原始草稿/拟定配置和失败记录均保留，不反写历史。最终规格/实现/单proof及审计见verified/f32-vlrelu。
