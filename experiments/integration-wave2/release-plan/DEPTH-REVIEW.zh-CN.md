# 完整 WP 内部搜索耗时：只读判断

714 scheduled 只表示公式已生成，并不表示完成。单核持续占用且几乎没有外部 solver，与内部 Qed 简化、策略匹配/展开耗时都相容；尚不能仅凭这一现象把原因确定为某个 tactic。

有充分理由另冻一个 **depth8** 的完整比较 profile：proof、C、公开 spec、shim、driver、模型和 checker 全部不变，只调搜索深度并记录新 wrapper SHA，保留原 depth16 运行和结果。不能把搜索深度降低后的未证项删除或继承旧绿灯。

直接递归检查已保存的成功 TIP script，最长实际 tactic 子树路径如下：

| 已检查来源 | 最长成功路径 |
|---|---:|
| vlrelu-memory/v13 | 7（RVV input separation、harness final read） |
| harness-values-v04 | 3 |
| rvv-values-v03 | 6 |
| v19-neon1-point | 4 |
| neon-exit-tactic-v04 | 2 |

因此 depth8 能容纳这些已记录路径，depth16 并非已知必需。但是路径计数不是新配置的完整证明；完整714集合可能触发局部 scope 没有暴露的新搜索分支，必须新跑并检查全部 raw。

具体风险来源是原 proof 的 `VmemAddress` 同时递归展开 goal 和 context 的 `shift_float32`，且 `VmemIncluded` 绑定整个 equivalent 和所有 requires。完整集合中某些目标可能反复扫描/展开大量历史上下文。depth16 允许比8更长的尝试，增加单进程搜索工作；改 prover 并行数无法加速这一串行阶段。

本地官方源码 `src/plugins/wp/wp_parameters.ml:890–922` 将 auto-depth 定义为嵌套策略层数限制，默认5；width默认10、backtrack默认0。`ProverScript.ml:171–177` 直接在搜索入口检查 depth 与 pending width。暂不建议同时改 width/backtrack：降低 width 可能截断合法 CASE 树，backtrack 默认已关闭，多项参数一起变不便判断。

建议最小实验只将 depth16 改为8，保留 par128、每 prover30秒/1024MiB与完整选择。需要逐目标进度用新冻结的 progress wrapper（`-wp-msg-key shell`）；verbose2只给概览。所有 proof 内显式 `\prover` 顺序保持原样，不能假定修改外部 prover 列表顺序就会替换策略内部次序。若要分片，必须先生成可比的完整目标清单，证明每个目标无遗漏地被覆盖；枚举不算证明结果。

本审查未启动、修改或取消任何完整验证进程。
