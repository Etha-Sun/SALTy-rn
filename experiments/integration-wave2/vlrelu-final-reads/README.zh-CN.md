本轮只处理 merged-values-v02（proof SHA d5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9）harness.c:28 的 vmem_final_reads。

三个独立候选仅增加 harness 末尾官方 proof-search hints；公开 spec、普通 C、shim 实现、模型、driver、checker 均未变。每个候选保留单目标30s/1024MiB、wp-par128，分别420/300/240s行政预算。冻结配置差异仅 proof_patches 与行政 wp_budget，sourceguard 均通过。

实际全局引理每版21/21，模型控制每版3/4，其中唯一未证是预期的 false negative control。主5条 scope（该点权限及whole_reads/whole_sep不变量建立保持）没有在行政截止前落盘 raw；不能据此称为4/5、VC反例或任一旧目标关闭。本轮无可推荐合并的正结果。

sequent01/sequent.log 是无solver的精确导出，不是证明。它明确包含整段输入/输出可读权限、数组起点相等与0<=k<n，目标是两个4字节点权限。三个策略尝试分别为递归valid/地址展开、目标array-base精确匹配、valid展开后filter；均保留负记录和最小补丁供审计。

权威状态及逐版证据见 handoff.json、v*/evidence.json。不修改或继承原完整验证记录，不启动后续 WP。

后续 helper 轮（2026-10-20）：以 checked empty ghost permission helper 隔离caller context，在精确 c4e76461... proof 上实际关闭原 vmem_final_reads。全部相关14条raw（helper body/frame2、新callpre6、n+3投影1、原point1及whole invariant4）与21globals实际通过；终止额外在native日志有Terminating1。最小delta及逐goal报告映射见 helper-handoff.json。旧三版timeout历史及本轮195宽scope timeout均保留，不代表整核通过。
