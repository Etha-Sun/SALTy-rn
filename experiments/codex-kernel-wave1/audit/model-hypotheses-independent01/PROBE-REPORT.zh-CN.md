# 两项 rsum 的隔离 alias 配置有限诊断

这是域审计完成后，经 root 追加授权执行的新诊断；不属于前一份只读源码审计。没有改动已收录包、公开 spec、proof、模型或旧结果，没有 Git 操作。所有副本和输出都位于当前审计目录。没有运行 exp/errno 的 WP。

结论：对两个原 rsum 包，仅增加标准 `-wp-alias-vars test_neon_onemask_table` 后，原模型的表分离警告均消失，全部原义务仍生成，原 spec 字节保持不变，控制准确仅 false 未证。它证明这个标准模型配置可以消除之前的额外表分离适用条件；没有完成新配置下的整核重证，不能用旧579/579或567/567替代新配置义务的实际证明。

## 实际证据

| 包 | 原配置生成的义务 | alias配置生成的义务 | 原配置额外hypothesis | alias配置额外hypothesis | alias同上下文控制 |
|---|---:|---:|---|---|---|
| qs8-rsum | 579 | 579 | 有 | 无 | 3/4，true确保通过，false确保未证 |
| qu8-rsum | 567 | 567 | 有 | 无 | 3/4，true确保通过，false确保未证 |

qs8 证据目录：`qs8-rsum-probe02/`，qu8：`qu8-rsum-probe02/`。

- `baseline-generation01.log` 的完整命令、逐个 goal 名和最终 warning；qs8 warning 在630行，qu8在618行，均复现 `input+(..)` 与 `test_neon_onemask_table+(..)` 分离要求。
- `alias-generation01.log` 完整命令、相同数量的逐个 goal 名、正常结束且无 memory-model warning。该配置没有新增 requires，没有 `-wp-check-memory-model`，也没有关闭 warning。
- `baseline-cil01.c`、`alias-cil01.c` 是实际 Frama-C 处理后的 CIL C；两配置字节相同。qs8定义在925行，qu8见 coverage-review.json 的 cil_table_lines，实际提升后的变量名确为 `test_neon_onemask_table`。因此没有凭源文件中的局部拼写 `onemask_table` 猜测选项名。
- `coverage-review.json` 保存逐个生成目标列表：两配置 goal 名集合各自与旧正式 admission raw 完全相同。这只是 coverage 检查；同名目标的公式可以随正确的内存建模改变，不表示新目标已证。
- `alias-control01.log` / `.json` 是实际调用旧 Z3/CVC5/Alt-Ergo 的4个raw目标：两边都是 positive ensures、positive assigns、negative assigns已证，negative ensures未证。控制来源 include 同一个 annotated unit，只选择两个诊断函数；它不声称 kernel body 已被验证。
- 两包各 `inputs.json` 保存冻结源、原 proof、重建 annotated 和工具二进制 SHA，以及旧完整命令；`probe-summary.json` 保存每轮实际命令、退出码、耗时和范围；`probe-environment.json` 保存原bundle二进制/WP插件/423个share文件、solver及gcc的路径、版本、SHA和脚本SHA。

## 如何保留旧环境和证据

两个包均从原冻结 plain 源和原 proof 复制到审计目录，再应用原 patch，逐项生成SHA与原 admission guard一致；7/15 个 annotated文件与旧证据一致，Clang完整预处理 token分别2552/3003，plain/annotated普通token相等，公开 spec逐字节相同。qu8还保留原 base-proof.patch、rsum-proof.patch，没有用 qs8 单包模型替代共享模块。

使用的确为旧命令中的原bundle `research/frama-c-qs8-rsum/toolchain/bundle/bin/frama-c`，版本33.0 Arsenic、二进制SHA `03f393e273b6e6cd7fb1648b6c464bdc05068ec30d6ed3791279deeb1321a4d5`；未切换为新的 Bytes 或浮点模型。qs8保留旧 machdep=x86_64，qu8保留旧 machdep=gcc_x86_64；都保留默认Typed、inline配置、RTE、wp-par2、wp-memlimit1024 MiB、cache none。原分发bundle只有wp.cmxs而无OCaml源，已明确记录而未伪称它的源码文件可独立逐项重查。

原 manifest 中两包所有 source_and_evidence_sha256 在诊断后重新核对全部相符，包括原源码、spec、proof和admission日志。旧日志和正式数量没有更新。

最初 probe01 的沙箱 GNU patch 在设置临时文件owner时失败（Invalid argument），未运行WP；两份失败副本均保留。随后新建 probe02，在正常权限/IPC的已授权提升执行中重建成功，没有覆盖probe01。

## 预算与证明边界

每包独立总预算180秒，按45秒原配置生成、45秒alias配置生成、60秒控制划分并施加剩余总预算；两包顺序运行，par2、1GiB/solver起步。实际各约24秒，精确值见probe-summary。

为了保持这次为小诊断，两次完整义务生成均显式使用 `-wp-prover none`；Frama-C将全部目标名及trivial/not tried状态打印到日志，但不生成相应raw JSON。不能把生成阶段的 raw 缺失或0计数称为通过。控制则使用原三prover，实际生成4行raw。除此以外只有输出/会话路径和print输出位置重定位到隔离目录，模型差异只有 alias选项。

下一步若要解除旧两项的额外域边界，需要另冻结这个标准配置的完整候选，并在原公开域下真正证明所有579/567项、检查所有helper/call/RTE和同profile控制；还应复查最终完整日志的模型hypotheses为空。当前诊断没有执行该整轮，因此旧两项仍应如实保留“历史收录，额外模型条件待复核”。
