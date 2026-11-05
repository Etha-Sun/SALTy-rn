# QCP-003：do-while 循环体中 `unsigned long long` 的 `--n;` 导致前端异常

- **版本：** QCP 2.1.4（symexec SHA256 `0e74c446…1032`）。2026-11-05 由 E1 worker W9 在 qu8-rsum 上发现，并缩小到最小例。
- **最小例：**
  ```c
  void probe(unsigned long long n)
  /*@ Require 0<n && n<=100 Ensure emp */
  { do { --n; } /*@ Inv Assert 0<=n && n<100 */ while(n>0); }
  ```
  报错 `SimpleCtypeDeepCopy: unknown type tag <数字>`。对照：`n -= 1;`、while 循环体中的 `--n;`、`int` 类型的 do-while 都正常。另外，表达式中的前置自增/自减（如 `while (--n != 0)`）和内联 asm 无法解析，这两类已由 R14、R15 处理。
- **处理：** 规则工具 v1.2：R15 生成 `n -= 1;`；新增 R16，把 do-while 循环体内单独成句的 `++v;`/`--v;`/`v++;`/`v--;` 改写成 `v += 1;`/`v -= 1;`。复现脚本在 `build/e1-workers-20261104/w9-qu8-rsum/repo/verification/qcp/candidates/e1-qu8-rsum-pair/proof/reproduce_r2.py`。
- **状态：** 已用工具绕开；未向 QCP 作者报告。
