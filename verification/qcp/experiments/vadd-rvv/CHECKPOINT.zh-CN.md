# RVV32 primitive checkpoint

- 完整 load：100 C VC + 3 数组策略已检查，输入只需 VL 个元素。
- 完整 add：101 C VC 已检查；2026-10-22 完整 coqc exit0，14.55秒，fresh goal 一致，见 add-proof-result.json。
- 原180秒超时记录：history/add-timeout-180s.log/json。
- 全域 fp32（含 NaN/Inf/±0），0<=VL<=32；inactive 字段精确 +0。
- store：完整真实body的75 C VC +5条资源策略通过coqc（15.52秒）；输出只需VL个可写cell，精确写前缀，输入vector保持。
- native：load/add396 cases及store396 cases，各全33种 VL。不是通用 lowering 或 ISA 正确性证明。
- 公开跨 ISA 等价与 ISA 对应：尚未闭合；原始 RVV C loop 的接线与证明见下文，不改变全局验收计数。

## 原始循环接线

见 [LOOP.zh-CN.md](LOOP.zh-CN.md)。原始 RVV while 控制流经审定 lowering 后，只加证明注解；完整 unit 签名为37个 kernel VC +5个 helper VC=42，另有2条策略与chunk9。正式路径完整模块已通过，统一重放记录由 loop-status.json / loop-logs 管理。这是 C 表示层部分正确性，不自动改变公开跨 ISA 等价或全局40个 kernel 的验收计数；旧 primitive status 的 full_kernel_proved=false 保持其原范围。
