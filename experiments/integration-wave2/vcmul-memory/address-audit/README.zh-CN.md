# 非零地址偏移：实际模型审计

当前问题是固定 Typed+raw 模型未表达非零整数地址加法与 typed pointer shift 的对应，不是 kernel 数学上永远不可验证。未修改任何生产 C/spec/shim/model/driver 或引入 bridge 公理。

`address-probe.c` 是独立诊断源：输入 float 指针有 8 个有效元素，要求 `(float*)((uintptr_t)p+sizeof(float)) == p+1`。当前相同模型、原 30 秒 / 1024 MiB 下，raw 为 0/1，CVC5 超时，Z3 Unknown。**超时本身不是不可蕴含证明。** command/raw/打印目标已保存。

更关键的检查是实际导出的 1146 行 Z3 SMT：`smt-export/typed_raw_fma_complex_fp/address_step_ensures_Why3_Z3_4_12_5.smt2`。物理地址函数在全部上下文仅有声明、`int_of_addr(null)=0`、受 statically_allocated 条件限制的 roundtrip 约束；其余出现是在待证目标。没有另一个隐藏 affine/offset 桥。实际完整 vcmul Why3 common clusters 与所有已锁定模型 .mlw 也已逐文件记录 SHA，见 actual-import-audit.json。

这里 typed 地址单位为抽象对象单元：实际 Compound 定义 `shift_float32(p,k)=shift(p,k)`，所以 typed `p+1` 是 `(base,offset+1)`，C 的 uintptr 加法仍是加 4 字节。

`countermodel.py` 给出对所有数学地址的总解释：先用整数 zigzag + Cantor pairing 得到地址 `(base,offset)` 与整数的双射，再用有限整数换位保证 p=(1,0)、r=(1,1)、q=(2,0) 的整数代码分别是 1、5、9。随后交换代码 5 与 9，同时共轭修改 int_of_addr 与 addr_of_int。零代码固定；所有 roundtrip 仍成立（甚至比生产模型的有条件 inverse 更强）；然而 p 的代码仍为 1，加 4 得 5，逆映射却是 q 而不是 typed p+1=r。

为什么其他模型约束保持：在实际导出的上下文中，除了那两个 inverse/null 约束，没有其他约束涉及这两个物理地址函数。换位只改这两函数，其余地址 record、shift、malloc、validity、separation、浮点函数等解释保持原样。因此这是物理地址部分的不足：若其余已导入理论一致，这种地址重标号仍满足它们，但破坏待证 affine 关系。这里没有声称已构造整个浮点/分配模型的一致性证明。

`preservation.smt2` 用固定 Z3 检查任意地址的 roundtrip 和 null 在上述换位后保持，两个 negated preservation 目标均 UNSAT。Python 的有限样本仅检查实现，没有被当作全称证明；全称构造理由是双射与其逆的复合及有限换位。

后续证明应保留这三条未证起点 VC，同时独立补 input/output separation、入口只读输入快照、两半 store frame 关系。不能增加未经证明的 affine bridge，不能把缺口塞进公共 precondition，也不能把 C 指针 cast 改写掉以获得绿色。
