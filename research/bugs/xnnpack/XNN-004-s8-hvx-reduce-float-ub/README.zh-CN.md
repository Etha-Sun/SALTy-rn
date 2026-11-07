# XNN-004：s8 HVX 归约辅助函数返回 float，赋给 int8_t 时越界转换（UB）

> 监督者收录（2026-11-07）。发现者：E2/E3 worker W03（HVX probe，`build/e2e3-workers-20261106/w03-hvx-probe/`）。未对外报告。

## 事实
- XNNPACK `867d5a34`，`src/xnnpack/simd/s8-hvx.h:39-48`：`static XNN_INLINE float xnn_reduce_max_s8(xnn_simd_s8_t v)` 经蝶形归约后 `return *((uint8_t*)&v);`。返回的是 lane 0 的**无符号**字节值（0..255），转换成 `float`。`xnn_reduce_min_s8`（:50 起）结构相同。
- 调用方 `src/s8-rminmax/gen/s8-rmax-hvx-u256-acc2.c:54`：`int8_t max0 = xnn_reduce_max_s8(vmax0);`。
- 当归约结果为负（lane 字节 0x80..0xFF，即 float 值 128..255），float → `int8_t` 的值超出目标类型范围，按 C11 6.3.1.4 是未定义行为。**任何最大值为负的合法输入都会触发**，XNNPACK 对 batch 和元素值没有排除这种输入。
- 实测（W03，`difftest/err_hex_ubsan.txt`）：zig cc hexagon -O0 默认带 UBSan，报 `238 is outside the range of representable values of type 'signed char'`；关闭 UBSan 的 -O0 和 -O1/-O2 实际按回绕得到正确值。即目前编译出来的结果是对的，但依赖未定义行为。
- 同一辅助函数还用于 `s8-rmin-hvx-u256-acc2.c`、`s8-rminmax-hvx-u256-acc2.c`（未逐一验证）。

## 判断（L1）
输入合法；偏离方是 XNNPACK 的 HVX 辅助函数（UB），不是规格。不加输入条件。

## 修复变体 V-007
把辅助函数的返回类型改为 `int8_t`（或 `int`），并按有符号字节读取 lane 0，使转换总在范围内。W03 的规则 H7（返回类型 float → int）正是这个效果；它不作为通用工具规则，而登记为程序变体：被证程序是"修复版"，原版在负最大值输入上是 UB，不能声称与规格等价。

## 影响
W03 的 HVX s8-rmax 证明是对 V-007 的证明。论文中作为 E2/E3 的发现，与 XNN-003 同类处理。
