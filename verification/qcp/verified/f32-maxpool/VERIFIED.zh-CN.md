# F32 Maxpool：完整验证结果

本案修复后的实际 NEON/RVV、全部普通 helper、公开 caller 与统一 fresh 门禁已经通过：**11个实际C单元、857项C验证条件、26个普通C函数体、31个intrinsic调用规范视图**。本案310个本地模块全部从源码普通编译，未复用组件对象；最终1020项假设报告包括857项实际C义务与163项数学支持。13项继承框架/经典数学假设已完整列出，没有新项目公理。

观察覆盖每个实际写入地址的完整binary32位模式（含NaN payload及正负零），并保留每侧自身未写地址的原有值；初始未写frame一致时给出完整最终map等价。保留全部FP32、无序bounds与K=0九输入fallback。固定RVV VLEN128/SEW32/LMUL8/VLMAX32，覆盖所有合法VL与任意inactive值。精确公开前件、内部栈数组/地址模型边界及原始实现修复原因见 `README.zh-CN.md`、`spec.c`、`proof/repair.json` 与反例记录。intrinsic规范的最终人工审查仍待进行；没有形式ISA/ABI/编译器精化或独立终止性结论。

完整门禁 `full-zee1_487` 的336条命令全部成功。原始 `README.md` 是冻结H中的早期候选说明，保留原字节作为历史输入；当前结果以本文、`proof/status.json` 与绑定的完整重放证据为准。

- full-status SHA256：`eadce8b0bb35b570799faddca9f1c20f318a3bc4ac7708d3ff05bf962045a095`
- 冻结H SHA256：`79e67963c8a037a819519712983dedbd24224f41aee19487243723a497155592`

这份说明在完整Coq门禁通过后新增，不修改冻结证明输入，也不提供额外证明信用。
