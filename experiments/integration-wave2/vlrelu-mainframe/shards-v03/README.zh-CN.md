本目录是精确 final-merge/v02（proof SHA 31eda1076aa0da512a66fef8b8591d605f84b4c7bebb7f4914bb738a8cf79457）的分片诊断，不是准入结果。普通 C、spec、模型、driver、checker 未改。

官方 WP 参数来源是固定本地 wp_parameters.ml:64–111、wpPropId.ml:746–772，手册 wp_plugin.tex:885–929。-wp-prop 按源标签/类别过滤，不能用生成的编号 goal-ID 任意取模分片；正标签取并集，后续负标签排除。负开头参数必须使用单一 argv `-wp-prop=-...`。

8片是 requires、assigns、四个 mainframe 稳定标签、rte、排除 rte/四标签的其余 assert、invariant、variant、保留 ensures/exits/terminates 的剩余类；先各自 prover=none。coverage.json 已实际验证 105+167+4+77+86+174+52+84=749，ID Counter 与 root-full-enumeration 的749项精确相等且每项一次。枚举不计证明。全部原 skip-fct 保留。每片 command.json 与 source.json 固定命令/身份，session/output/report 独立。

执行 `python3 experiments/integration-wave2/vlrelu-mainframe/shards-v03/run.py solve`（已启动一次，不要重复）是8任务×每任务16 prover slots，总预算1200秒，单目标30秒/1024MiB。TIP/depth16 与原来相同。分片并行能重叠各个策略遍历，不能保证8倍加速。所有后台完整验证不受修改。全局21条独立原报告及 controls 绑定见 provenance.json；最终仍须原 whole full、闭包和 canonical 审核。

历史 shards-v01/v02 保留。两次尾片把负开头列表用分离 argv 传入，实际 exit1；v01 另错误要求 none 模式日志必须带 scheduled 总数。两者是本地调度脚本错误，不是模型/语义/证明失败。此前曾根据不完整 stderr 推测 target population 缺口，现已撤回；实际 v03 正确命令已完整覆盖749。

实际最终结果：8个进程全部 exit0、无行政超时；raw 分别105/105、167/167、4/4、77/77、86/86、174/174、52/52、84/84，合计749/749。独立 Counter 逐片等于各自 none inventory，并集精确等于完整749且无重复。review.json 记录每片 report/command/source SHA。全局21与controls仍以同snapshot固定原报告为准；这组结果不替代 whole+canonical，也不将kernel改为admitted。
