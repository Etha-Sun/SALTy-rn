# 发布审计工具路径修复

整核原始运行 `.build/full-xc0sasbm` 已通过。独立发行器首次执行时，在读取不存在的 `proof/intrinsic-ledger.json` 处失败；真正的24项 intrinsic 清单一直在 `proof/semantics.json`，冻结准备器和整核检查器均读取它。

为保留原始证据，冻结的 `record_status.py`、`audit_relocation.py` 及所有257项输入原字节保留。新增 V2 仅修改清单路径，以及 relocation 的发行器导入路径；不修改任何证明、目标、spec、实现、全量结果或日志，不重新声称一次形式验证。精确补丁、原版/修正版SHA和失败记录见 `proof/admission-repair.json`。

使用 `python3 proof/record_status_v2.py --dry-run` 完成原始运行的独立审计，去掉 `--dry-run` 发行证书；迁移到 verified 后使用 `python3 proof/audit_relocation_v2.py --proof-run 原始运行目录`。`README.zh-CN.md` 中原版命令属于历史冻结输入，发行流程请使用本说明的 V2。
