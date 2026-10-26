# f32-conv-hwc2chw（候选）

正在证明当前修复/兼容实现，完整主核与完整 case 尚未通过，不计 verified。

已保存原件、实际反例、修复历史、普通 C helper 证明及两种 sanitizer 的有限 oracle 结果。准确范围和继续入口见 [当前检查点](WORKER_CHECKPOINT.zh-CN.md)。intrinsic 规格来源与 physical ABI/ISA 对应仍需最终人工审核。
