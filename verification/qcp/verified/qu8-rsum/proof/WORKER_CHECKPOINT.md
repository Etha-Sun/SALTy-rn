# QU8-RSUM checkpoint

2026-10-23T12:49:10.190078-07:00

- 当前 actual C：21 单元、890 VC、34 body；Byte strategy 另 2 字段。调用闭包、声明/body 合同、当前 CPP 身份预检通过。
- 18 helper 的 713 C VC、wrapper 5 VC、RVV 完整 46 typed/Print 已通过。NEON 117 调用及 9 个循环/返回已在同一 fresh DAG 完成完整 126 typed/Print；713 helper +5 wrapper +126 NEON +46 RVV =890 actual C VC 组件齐全。
- 原 RVV 保持逐字不变；NEON 仅为 pinned QCP 兼容去掉 static local 和末尾可选逗号。原件、0 VC parser 失败、精确 patch 保留；没有虚构语义反例。
- 原生 actual C 21 单元、35 递归输入：UBSAN/ASAN 各 990 cases、1075860 lanes/side，两个 oracle 负控按预期 abort。输入、params、canaries 保持。
- all uint32 初始 output、all uint8 输入、n>0 且 n+15 不溢出、padding15、fixed VLEN128。结果为 modulo32 精确值；不声称 ISA/physical ABI 精化或终止定理。
- 完整 full-t8v8ndjs 门禁已通过：21 actual C/890 VC/34 body +2 strategy，256 必要源码模块+Final共257次 ordinary Coq，892 FinalPrint，463 external.vo递归身份匹配。record dry-run已通过，证书与迁移审计处理中；全局计数由 leader 发布后更新。
