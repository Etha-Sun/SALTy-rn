# 独立 model-plus 恢复与复验

`../handoff-model-plus/` 在已冻结的新 front share 副本上，仅用旧 `model-plus/cint.mlw` 替换 Cint。wrapper 与旧 plus 相比只重定位安装路径和 libc 路径，沿用旧 plus 的 math.h 和原 FMA driver；solver config 沿用已冻结新 front。旧目录和新 front 均未修改。

`prepare-plus.py` 首先验证 front 全部锁定输入，再新建独立 share 和锁。锁包含新 wrapper、旧 Cint/libc/controls、完整新 share 和 front 原完整输入。安装/solver/Why3/依赖均保留锁定。锁的 qualification 文本是冻结时状态，不为结果修改锁；当前新证据看 `summary.json`。

本次已实际执行：

- `controls-local-01`：原 controls.c 不变，raw 18项中16项通过；两个故意错误的 `wrong_false_ensures`、`wrong_nan_ensures` 均未证（timeout）。正控制与其余安全义务全部通过。WP 文本汇总20/22包含额外分类，不能用它替代 raw 数量。
- `cint-local-01`：对新 share 内完整 Cint 实际运行 Why3 1.8.2 / Z3 4.12.5，54/54 Valid；目标名称集合与原 root-extended01 完全一致。
- 运行后重新核对全部模型输入 SHA，无变化；原 Cint 内容 SHA 仍为 `04eb21eee70595bd097ee0693e4bd47e903b10aa5dc12f8f9284b912c504847c`。

运行采用已授权的本机 IPC，controls 最多2 workers，Cint顺序运行。命令、exit、raw JSON/JSONL和日志全部独立保存，没有覆盖历史结果。本目录只证明这些模型控制和 Cint 辅助引理，不是任何 kernel 通过，也不是整个模型/工具链一致性的证明。主 agent 仍需独立检查后冻结新转换 case 并运行全部 VC。
