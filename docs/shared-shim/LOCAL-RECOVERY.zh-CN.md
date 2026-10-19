# 当前机器的独立环境恢复

接手基线为 `feat/shim-c` 的 `f2f8d2c`。原服务器 `/zp_vegeta/...` 不在当前机器，主目录仍保留研究分支；本分支独立工作树位于 `/srv/home/yuechunsun/tools/lean/build/shim-c`。

环境恢复已完成，并已实际复验一个完整已通过案例。证据入口为 [ENVIRONMENT-ACCEPTANCE.json](../../experiments/shim-c-v2/handoff-local/ENVIRONMENT-ACCEPTANCE.json)。这没有新增已证明 kernel，原正式收录仍为11项。

- 原 manifest 及两个转换案例的354项源码、证明和证据 SHA 全匹配；四份原模型锁 SHA 全匹配。缺失的工具资产在独立目录重建，旧锁、checker、源码、公共 spec 和 canonical 日志没有修改。
- 实际构建 Frama-C33、OCaml4.14.2、Why3 1.8.2；官方源码和四个 patched 源 SHA 匹配原记录。依赖包版本与原 export 相同。恢复 Z3 4.12.5、CVC5 1.2.1；来源、二进制 SHA 与依赖检查独立记录。
- 新 front 语义控制：10个正确后置条件通过，3个故意错误结论未证明。新 plus 控制：raw18项中16项通过，两项故意错误结论未证明。完整 Cint 54/54 Valid。
- `f32-vadd` 新完整复验：571/571，`complete=true`、pending为空、全部源码/模型/覆盖守卫通过。主 agent 独立检查原始报告和证明/模型 SHA。报告在 `experiments/shim-c-v2/handoff-replay/f32-vadd/logs/local-smoke-01-summary.json`。

当前入口为 `experiments/shim-c-v2/handoff-model-front/frama-c.py`；转换案例使用 `handoff-model-plus/frama-c.py`。`--framac` 必须绝对路径。solver 位于 `experiments/shim-c-v2/handoff-solvers/.build/bin`。这些都是当前机器的新环境版本，不能用于宣称旧绝对路径环境已恢复。

构建过程见 [environment-recovery-local](../../experiments/shim-c-v2/environment-recovery-local/README.zh-CN.md)，新 front 的独立封装配方为 `handoff-local/prepare-front.py`，plus 见 [handoff-plus-evidence](../../experiments/shim-c-v2/handoff-plus-evidence/README.zh-CN.md)。配方拒绝覆盖已有目录；不要在活跃模型上重跑或改锁。锁中的 qualification 保留冻结时状态，当前验收结果单独记录，不为更新状态修改锁。

首轮普通沙箱语义控制因 Why3 IPC 的 `Operation not permitted` 达到180秒预算；失败日志保留在 `handoff-local/semantic-local-01.*`。获授权的本机 IPC 环境中 `semantic-local-02` 正常完成。此前的 opam网络与本地GMP检测失败也保留；它们不是 proof 失败。

二进制、opam、wp-share和编译缓存仍不在 Git。这里记录的是当前机器实际执行的恢复，不承诺任意机器一键成功。固定VLEN128、RNE、原合法域以及数值相等或双方NaN的观察保持不变；ISA→shim和工具链仍属于TCB。下一步继续两个转换案例的独立proof补充与完整验收。
