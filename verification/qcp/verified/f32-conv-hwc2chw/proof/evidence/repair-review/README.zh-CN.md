# HWC whole repair 只读审计交付

本目录独占私有文件；没有修改 K/public，没有运行新 QCP/Coq/native/SDK。旧有限 Channel04 作业保持原状。

Root 可审阅 `proposed/REPAIR.zh-CN.md`、`proposed/repair.json` 及六份精确补丁。拟合并根目录是 `proposed/`：四份 repair 补丁恢复 catalog 原始两C到 NEON219/RVV162，并添加完整 shim；两份 compatibility 补丁单独解释上次修复版本到新主函数。`proposed/history/` 保存旧 repair/patch及早期收据。实际原件和本次 K C/header 快照见 `original/`、`snapshot-K/`；未复制任何VO或复用旧原生运行作新形式信用。

`input-snapshot.json` 绑定审计读入时的 source/model/history 与原件三方核验、0fuzz双向字节inventory；`semantic-source-status.json` 仅逐源码结构检查参数、两kernel Require、packed权重/9组/3行/写序，不是新语义定理。`review-status.json` 另外强核四份 Root当前 native/SDK 的run/status、输入、log/object。完整实际 body/caller/sourcefresh门禁仍须Root签发。

整合 scaffold 当时尚未把 HwcRvvPixel9Model.v 和 spec直接导入的HwcPublicObservationModel.v 放进 K/proof/coq；这是最终 sourceDAG待填项，不是模型反例，也不由本审计擅自补源。具体可恢复阶段见 `resume.json`。

旧Channel04有限作业已自然ordinary0/3753.86s，所有actual槽已归还。其mutable pool终态更新后，先前geometry61收据绑定的中间status已在history/source-proof-status-snapshots/按原SHA逐字节精确恢复；冻结收据/源均未改。该恢复只保全历史状态身份，不增加proof信用。
