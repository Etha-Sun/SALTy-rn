# 第三阶段独立检查

`native.py` 使用当前冻结 `unit.c` 中的真实模块化 shim、NEON/RVV 和公开 `equivalent` wrapper，进行有限原生反例搜索。没有使用历史单体 `native_fp.h` 替代冻结 shim。原始测试布局来自 `experiments/shared-extension/complex/native_wide.py`，但改为调用公开 wrapper，并收紧多项分配大小到公开合法域的最小范围；SPMM 权重补足公开要求的预取空间。

第一轮结果在本目录各 kernel 下，第二轮在 `stress01/`。9项均编译并实际执行，退出0，ASan/UBSan无报告、wrapper未发现输出差异。第二轮增加浮点整数位模式、量化极端 zero_point/ksum，池化测试1至3个pixel。使用RNE、禁止fast-math与隐式FMA收缩；真实FMA shim继续使用fmaf。

这是有限样本，不是形式证明、不是ISA原生执行，也没有覆盖所有合法输入。打印的 cases 是比较计数，SPMM每列单独计数，不能当作全部wrapper调用次数。尚无本轮新target错误据此修复；未证VC和超时也不能作为改实现的理由。

源文件SHA、测试源码SHA、完整编译命令、编译/执行退出码与日志逐项保存。原始日志保留；复跑使用新的目录：

```sh
python3 experiments/shim-c-v2/stage3-audit/native.py --out replay02
python3 experiments/shim-c-v2/stage3-audit/native.py --out replay03 --stress
```

`.build/`下二进制不提交。运行器增加了拒绝覆盖已有结果的保护；第一轮和第二轮的实际生成源码已独立保留，后续改动不回写已有结果。

`address-diagnostic/`隔离了uintptr字节偏移问题：原样往返和typed指针加法通过，整数加字节偏移再转指针仍未证；包含故意错误负控制及只读模型源码定位。它不是新桥模型或kernel证明。
