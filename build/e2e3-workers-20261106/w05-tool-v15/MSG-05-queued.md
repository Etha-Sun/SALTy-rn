监督者追加（v1.7 之后的下一项，等你本轮结束后发送）：

**新规则 R27（已批准）：删除空 asm。** 形式：`__asm volatile("" :: "m"(x));`（以及 `asm`/`__asm__`、带或不带 volatile），条件：模板字符串为空、没有输出操作数、没有 clobber、没有 goto 标签，只有输入操作数；其余 asm 一律照旧拒绝。依据：空模板不执行指令，没有输出/clobber 就不改变 C 可见状态；XNNPACK `src/xnnpack/common.h:413-426` 在非 GNUC 编译器下把 `XNN_FORCE_REALIZATION` 定义为空。注意它通常来自宏展开（`XNN_FORCE_REALIZATION(x)`），工具现在对宏内站点报 MACRO 拒绝；R27 需要在宏展开内也能处理这一种形式（只删整条 asm 语句，不动其他宏内容）。测试：正例和"只关一个条件"的拒绝夹具；对 v1.7 的回归逐字节不变（除新增 R27 事件的 kernel）；在 `f32-velu-avx2-rr1-lut4-p4-perm-u32.c` 和 `f32-vsigmoid-avx2-rr1-p5-div-u*.c` 上用 `--isa x86` 跑通，并对原版做本机差分。版本串 1.8.0。
