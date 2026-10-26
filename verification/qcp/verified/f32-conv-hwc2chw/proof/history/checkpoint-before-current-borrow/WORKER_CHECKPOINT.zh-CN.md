# HWC接续（root，尚未整核验证）

- 原NEON/RVV与catalog哈希一致，NEON impl仍为原版，RVV已有99c6a41b...草稿修复（未native/正式证明）；原件不可覆盖。
- Frama-C修复参考保存到proof/reference，历史raw6/6但whole=false/exit1，不能计入QCP结果。
- DW迁移的6个FP源+HwcArithmeticModel/Facts共8个，fresh ordinary全0，见proof/fp-arithmetic-status.json。仅数学，没有actual C/helper/loop/caller证明。
- 后续：建立与原NEON27次FMA精确顺序对应的tap列表（左零填充仍做FMA，奇右缺列原程序跳过FMA），公共共享只读Float map+任意None输出frame；修RVV unmasked越界load、第二行缺upper clamp、NaN与32位index截断。保持全部合法VL/e32m1/VLMAX4及公开valid-footprint尺寸，不能用int32域限制掩盖问题。
- 先复现精确反例并保留patch/reason，再提取实际普通pixel/helper以缩主C证明；所有普通helper仍须actual C body证明，native intrinsic只spec-only但须原spec逐项source/config ledger。
- 所有8数学源已通过，勿修改。可新增后续消费者；RVV已修改但未native/actual C证明，不可宣称修复后整核。

当前草稿：proof/repair-draft.json、proof/repair-rvv.patch；prepare_hwc_current_repair.py是one-shot，断言impl仍原版才运行，禁止直接重复。新RVV scalar helper2个仍需C证明，局部32位阈值仅0..4，全局索引/offset unsigned64；右边界masked FMA保留旧acc（左边界仍做0*weight）。check_current_sdk.py当前真实两SDK源码编译仍待运行/通过；支持宏仅固定q4的round_down与doz实际shim/support.c，必须后续正式证明它们body。
