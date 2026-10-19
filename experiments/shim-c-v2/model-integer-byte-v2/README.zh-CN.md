# 第二版：memory-level 字节/字整数辅助证明

这是 model-integer-byte 的独立重建版本，旧模型、旧结果和活跃 proof 不变。增量仅在 LE/BE MemBytes 模块末尾添加三个有实际 body 的 helper：uint16/32 按端序拼接，以及 bytes(m) 前提下 signed/unsigned8 投影。复用已检查的 ValueBlockRW 定理，没有导入试验失败的 global trigger rule。

每端序原始 6 个 body VC：4 个由 Why3 的 checked inline/compute 化简关闭，2 个 Z3 Valid；两端序共 12 个，root 已独立重放。精确命令、原始与化简后 SMT、依赖 SHA 在 `../integer/byte-model-support/memory-view-proof-evidence.json`，root 记录在 `../integer/byte-model-support/root-memory-view-replay.json`。

实际 `controls01` 的 24 个目标中 23 个通过，包括任意 int8 数组的 pack16/32 完整功能 post 与全部 RTE；唯一未证是故意 false。memcpy 常数控制 71/76，offset/alias 内容正例和三个故意 false 仍未过。整个 memory model 及 C→WP 对应仍为 TCB，局部 helper 的检查不是全模型正确性证明。

`guard-controls01.json` 记录 wrapper 拒绝 Bytes+float；wrapper Bytes 的真实浮点 bitcast，以及绕过 wrapper 的新 binary Bytes+float，都在 CODEC_FLOAT.compile 入口失败，不生成有问题的浮点 codec 公理。适用范围只包括 qs8-vcvt、qs8-vlrelu、qs8-vadd-minmax、qu8-vadd-minmax。

以上是初始 model_lock 的四项范围。后续两个纯 uint32 案例 x32-packw-gemm-goi、x32-transposec 的独立范围审计、冻结与完整尝试见 `../complex-byte-v2/` 和 `../complex-v3-next/final-source-hash-audit.json`；没有放开浮点 codec，也没有整核通过。初始模型锁及 qualification 记录原样保留。

修改后的完整 LE/BE 源在 `why3/frama_c_wp/`；Cint 使用 model-plus 已重放的 54 个目标版本；前端只增加禁用 codec 的补丁，新的独立安装由真实执行过的 rebuild.py 产生。生成的 wp-share/.build 不入 Git。

环境恢复见 `../model-integer-byte/README.zh-CN.md`。准备已审计 toolchain-build 与 model-plus 依赖后，在新的 sibling 目录重建：

```sh
python3 experiments/shim-c-v2/model-integer-byte-v2/rebuild.py
```

脚本拒绝覆盖已有目录。外部工具缓存不随 Git 提交；fresh clone 不是已经配置的证明环境。重新构建后须重跑正反控制、重收输入 SHA 并独立冻结，才可进行正式 kernel 重放。
