# QCP-002：数组字段 struct 之间的整体赋值 `*r = *a` 无法符号执行

- **版本：** QCP 2.1.4。2026-11-05 由 E1 worker W4 发现。
- **最小复现：** `build/e1-workers-20261104/w4-s8-vclamp-fixed/repo/verification/qcp/candidates/e1-s8-vclamp-fixed-pair/proof/probes/copy_struct.c`。`struct { signed char s[N]; }` 在 N=128、256、512 下都报 `record assignment: no target storage found`。对照：只含标量字段的 struct 赋值可以生成 VC 并证通。
- **处理：** shim 中的拷贝适配器改用逐 lane 循环并证明其函数体，见 `build/e1-workers-20261104/NOTE-copy-adapter.zh-CN.md`。
- **状态：** 尚未报告给 QCP 作者。
