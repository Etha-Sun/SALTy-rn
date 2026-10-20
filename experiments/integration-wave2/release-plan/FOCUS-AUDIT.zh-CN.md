# NEON 出口局部审计

已直接读取不可变 attempt proof、source guard、main/global/control raw、实际命令和保存的 TIP JSON scripts，未重新运行证明。

| 来源 | 实际主目标 | 独立 globals | CASE 树核对 |
|---|---:|---:|---|
| neon-exit-tactic-v03 | 4/5 | 18/18 | 四个成功 CASE 节点的八个分支全部关闭；tailprefix、prefix建立/保持、finalall通过；唯一 NEON1 lane 仍 unknown，不能计为通过 |
| neon-exit-tactic-v04 | 3/3 | 18/18 | 三个成功 CASE 节点的六个分支全部关闭；仅选择 prefix建立/保持和finalall，未重新选择lane或tailprefix |

两个 run 的模型 falsity 控制均未证明 false，positive control 已证明；日志未见 Why3 导出、Invalid_argument 或类型错误。控制合格只是拒绝明显矛盾，不是完整模型一致性定理。成功树里有早先失败/超时的 SMT 尝试，后续实际 CASE 子树已分别关闭，不能把这些早先尝试当作最终分支仍然失败。

各目录新 `root-checked-focus.json` 记录每个 script 的原始 SHA、逐 CASE 分支关闭情况、失败目标原行、实际30秒/1024MiB资源，以及 frozen/proof/guard 身份绑定。main raw 已内嵌18条 global 行，报告按函数目标和独立 global 清单拆开，未重复相加。

这些是局部结果；不能与 NEON v19、RVV 或 harness 的不同快照拼成整个 kernel 通过。两个 merged-values-v02 完整运行和未来 packaged canonical 仍须各自生成新完整证据。
