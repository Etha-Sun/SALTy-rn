# Bytes memcpy 定义修复候选（尚未验收）

本目录保留旧结果，候选副本只改 LE、BE 两个 `memcpy` 定义，未增加公理：

```text
to_seq(source, source_offset, source_offset + size)
bwrite_seq(old_destination_block, destination_offset, ...)
```

旧版把 size 当作结束偏移，同时以 source block 作为未写区域的基底。字面定义的独立 Why3 重现构造了两个明确错误结果；修复版的非零 offset、跨 block 保留、同 block 非重叠、零长度均通过，三个故意错误结论均未通过。详见 `proposal-evidence.json`、`memcpy-definition-isolated-v2.mlw`。

这只是对候选定义的控制实验，不是已验证 kernel，也不代替完整 WP 模型验证。原版与修复版完整 C 控制各 69/74：frame 正例已证，offset 与 alias 的内容正例尚 timeout；三个 `ensures false` 仅为负控制，均未证。C 原生三个正例经 ASan/UBSan 执行通过，见 native-controls02/03.json；沙箱 ptrace 不兼容 LeakSanitizer，所以单独关闭 leak 检测，保留 address/UB 检测。

旧 Bytes kernel 结果全部隔离。禁止把 Bytes+float 当作已支持的浮点语义；其 FLOAT codec 另有未修复的问题。本候选仅用于纯整数后续审计。
