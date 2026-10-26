本轮使用显式 record 表示减少 QCP 的逐字段 ghost 匹配。原实现、公开输入域、19/9 个原始 intrinsic 的语义、精确浮点 bits 与索引观察均保持不变；整核目前仍未通过。

`VectorRecords.v` 的四路浮点字段是 `fp32`，空间谓词使用 `Float`；`RvvVectorRecords.v` 的 32 路字段同样如此。掩码字段为 `Z`/`UInt`。两文件显式导入 `Snaive_C_Rules64`，对应实际 QCP 的 `--arch=64 --endian=little`。所有单元的 `*_def.v` 仅导出同一公开 canonical 模型，避免不同单元各自定义不兼容的 Record 身份。实际生成 goal 保持原字节。

自动 emitter 的原始 def 已保留并明确拒绝：它把浮点字段生成为 `R`/`Int`，且导入默认 `naive_C_Rules`（Arch32/BigEndian）。这些原始定义没有编译，也没有用于取得证明信用。

四个新增普通 C helper 先复制借用的局部向量，再调用原始 intrinsic，保留全部输入字段资源。NEON 比较、NEON select、RVV 比较和 RVV merge 分别已有实际 5、7、6、7 个 C 义务的完整 ordinary Coq typed 检查。两个 RVV helper 的后置只约束 active lanes，inactive 内容仍为任意值。NEON select 的后置是完整 record 相等，包含 signaling NaN、payload、符号和正负零，未弱化为 numeric-or-bothNaN。

这些 helper 是实际证明过函数体的普通 C 函数，不能列为 intrinsic 免证项。原始 ISA 规格仍按既有 ledger 等待最终人工审核，不声称已有 ISA 形式精化或物理 ABI 证明。精确源哈希、typed provider、原始 intrinsic 与配置映射见 `record-view-ledger.json`。

原先两条长生成任务、各短时诊断、超时、工具崩溃及 frontend 注释错误均各自保留。小组件和有限 native 回归不能替代两侧完整 kernel、循环/内存及最终 fresh 全案门禁。
