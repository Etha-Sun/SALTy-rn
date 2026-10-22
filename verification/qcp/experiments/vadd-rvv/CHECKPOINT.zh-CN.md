# RVV32 primitive checkpoint

- 完整 load：100 C VC + 3 数组策略已检查，输入只需 VL 个元素。
- 完整 add：101 C VC 已检查；2026-10-22 完整 coqc exit0，14.55秒，fresh goal 一致，见 add-proof-result.json。
- 原180秒超时记录：history/add-timeout-180s.log/json。
- 全域 fp32（含 NaN/Inf/±0），0<=VL<=32；inactive 字段精确 +0。
- store：完整真实body的75 C VC +5条资源策略通过coqc（15.52秒）；输出只需VL个可写cell，精确写前缀，输入vector保持。
- native：load/add396 cases及store396 cases，各全33种 VL。不是通用 lowering 或 ISA 正确性证明。
- full kernel：尚未证明；原始 kernel loop 尚未接线。
