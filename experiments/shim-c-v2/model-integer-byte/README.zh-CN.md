# 仅纯整数的 Bytes 候选模型

本版只用于 qs8-vcvt、qs8-vlrelu、qs8-vadd-minmax、qu8-vadd-minmax 的独立实验。root-audit.json 记录独立核查；model_lock.json 锁住 13561 个实际输入。旧模型、旧证据和旧程序都保留。

修改来源：

- `why3/frama_c_wp/membytes_{le,be}.mlw` 是两个修改后的完整模型源码；相对标准版本修复 memcpy 的结束偏移与未写区域基底，并加入有实际 body、已检查的字节/字整数桥。
- `../integer/byte-model-support/byte-word-proof-evidence.json` 保存两种端序共 28 个 Valid 目标、实际命令、导出 SMT 与依赖 SHA；root 已独立重放。
- Cint 使用 `../model-plus/cint.mlw`，完整模块的 54 个目标重新检查全部 Valid。
- `mem-bytes-disable-float-codec.patch` 在新的独立前端源码中让 CODEC_FLOAT.compile 立即失败，阻止生成浮点 codec 公理。原有前端及安装目录没有修改。

完整 memory model 的定义和 C→WP 语义对应仍属 TCB，这些局部辅助定理不等于完整模型证明。`controls-results01.json` 保留实际控制：整数基本正例通过，故意 false 未通过；pack16/32 的功能 post 仍 timeout。offset/frame/alias 完整 C 控制也仍有未闭合功能目标。本版不是已完成资格认证的 C 验证工具，kernel 必须继续检查全部函数 body 和最终输出目标。

`reject-codec01.log` 和 `direct-reject-codec01.log` 记录：经 wrapper 使用 Bytes 的真实浮点 bitcast 会失败，绕过 wrapper 用新 binary 的 Bytes+float 也同样失败。wrapper 另外直接拒绝浮点模型选项、其他 share、额外 driver/library。qu8-rdsum 包含 floor，四个 FP 转换/乘法 kernel 也不在本版适用范围内。

重新构建时，先按 `../toolchain-build/README.zh-CN.txt` 恢复已审计的 OCaml/Why3/Frama-C 前端依赖，并恢复 model-plus 的已锁定 share。它们是外部工具缓存，不随 Git 提交；fresh clone 本身不是配置好的证明环境。

```sh
python3 experiments/shim-c-v2/model-integer-byte/rebuild.py
```

脚本在新的 sibling `model-integer-byte-rebuilt` 中复制已审计前端、应用禁用 codec 的补丁、复制这里的两个 Why3 源码与 Cint，独立编译和安装；拒绝覆盖已有目录。需要其他名称时使用 `--output experiments/shim-c-v2/<新名称>`。重建后须重新运行正反控制、收集新路径的输入 SHA 并独立冻结，才可用于正式 kernel 重放。生成的 wp-share、.build 不入 Git；源码、补丁、配方与证据应保留。
