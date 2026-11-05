# RVV 向量数组字段表示：QCP 最小探测

2026-11-04。目的：判断 A 路线是否可行，即把 RVV 向量从"每个 lane 一个 struct 字段"改成"一个数组字段 + 列表谓词"，从而支持 VLEN512 及以上。

工具：本地 QCP 2.1.4（`symexec`，`--arch=64 --endian=little`），Coq 8.20.1。环境与旧证明相同：`coqc.sh` 读取 `research/qcp-shim-vadd/results/coq-flags.json`，并加入探测命名空间。QCP 发行包里的四个数组策略库没有预编译，本次复制到 `build/rvv-array-vector-probe-20261104/lib/` 单独编译，未改动 QCP 安装目录。

元素类型用 `int`，配合 QCP 自带的 `IntArray`。要回答的问题（数组字段、按值传递、资源处理）与元素类型无关；`float`/`FloatArray` 版本**尚未测试**。

## 结论

| 问题 | 结果 | 证据 |
|---|---|---|
| struct 内的数组字段能否作为数组谓词使用 | **能**。VC 中整个向量是一个 `IntArray.seg &(r->s) …` | p1 |
| VC 规模是否与 VLEN 无关 | **是**。128 lane 和 1024 lane 都生成 20 个 VC，goal 文件 15,820 对 15,878 字节（只差数字位数）；**同一份证明不改一字**两边都通过 | p1, p1b |
| 生成的 VC 能否在 Coq 中真正证完 | **能**。14 个 VC 全部手写证明，无 `Admitted`；与 QCP 策略证明组合后通过 `VC_Correct` 模块类型检查；编译约 3–8 秒 | p1 |
| 按值返回向量 | 符号执行**可以**，但 QCP 要求数组的每个 lane 都有定义 | p2 |
| 按值传入向量（只读运算） | **可以**，需要用 `where a = &v` 绑定参数地址 | p3 |
| 按值传入向量并写内存（store） | **不可靠**：调用后目标内存同时保留新旧两份资源，VC 左边矛盾，错误结论也能"证明" | p2 |
| store 改用借地址宏 `vse(p, &(v), vl)` | **资源正确**，没有残留 | p3 |
| 按值返回后的临时对象 | **数组字段会遗留**：临时返回对象一直留到函数末尾，而 QCP 的分离逻辑是精确的（`emp` 要求堆为空），最终 VC 无法证明。逐字段 struct 不会遗留 | p3, p4 对 p5 |

Probe 1 的假设报告只有 QCP 自身的布局与地址解释参数（`sizeof_*_type`、`eval_addr_expr`）和函数外延性，与现有框架的信任边界相同。

## 各探测的内容

- **p1**：`struct vint32m8_t { int s[128]; }`，`vload`/`vstore` 全部用指针参数。p1b 只把 128 换成 1024。
- **p2**：加入按值返回的 `vload_v` 和按值参数的 `vstore_v`，以及调用者 `copy_kernel`。
  - 第一次运行失败：尾部 lane 未定义，record copy 无法建立（`qcp-attempt1-undefined-tail.log`）。
  - 改为 shim 函数体把尾部写成 0，合同只承诺"存在长度为 128−vl 的尾部 T"。这样 kernel 证明不能依赖尾部取值，对应 RVV 的 tail-agnostic。
  - 最终版 `copy_kernel_return_wit_1` 的左边同时含 `IntArray.full dst …` 与 `IntArray.undef_full dst …`：这就是资源残留问题。与 vabs 任务复现的 QCP 缺陷相同（`build/four-isa-vabs/.../STRUCT-CALL-HEAP-AUDIT.zh-CN.md`）。
- **p3**：load 按值返回，`vmax_v` 按值参数和返回，store 用借地址宏。
  - 第一次运行用了 `vmax_v(v, v)`：QCP 的按值参数是借用调用者的存储，而不是拷贝，同一资源被要求两次而失败（`qcp-attempt1-aliased-args.log`）。kernel 中 `vfmul(v, v)` 这种写法需要单独的别名合同。
  - 换成两个不同的向量后通过；`dst` 资源正确，但三个临时返回对象遗留在最终 VC 中。
- **p4 / p5**：最小对照，形状相同。p4 用 4 个独立字段，最终 VC 干净；p5 用 `int s[4]`，临时对象遗留。

## 对 A 路线的含义（推断，待用户决定）

1. 数组字段加列表谓词**解决了规模问题**：VC 数量和证明都与 VLEN 无关，原逐字段方案在 VLEN512 下 23/35 个 kernel 需要 ≥128 个字段。
2. 剩下的障碍集中在 QCP 前端对"按值 struct"的两个处理问题：写堆时资源残留，以及数组字段临时返回对象遗留。两条出路：
   - **(a) 指针化前端改写（A-normal form）**：把 `vfloat32m8_t v = __riscv_vle32(p, vl);` 改写为 `vfloat32m8_t v; vle32(&v, p, vl);`，嵌套表达式先存入临时变量，所有 intrinsic 都走指针形式，也就是 p1 已经证通的形式。这是机械的源码改写，必须作为前端适配单独记录和审查；kernel 的控制流、运算和访存保持不变。它同时解决了 store 的向量参数是表达式的问题。（更正，2026-11-04：先前写的“162 个中 51 个”统计有误。按 `__riscv_vs{e,se,oxei,uxei,seg,sseg}*_v` 重新计数，35 个 Bopt 共 162 个 store，其中 34 个的向量参数不是变量名，全部在 `x32transpose.c`，形式均为 `__riscv_vget_v_u32m2x4_u32m2(tuple, k)`。）
   - **(b) 请 QCP 作者修复**这两个按值 struct 的问题。修复后可以保留原始调用形式，但时间不可控。
3. 尚未验证的部分：`float` 版本、RVV 特有语义（mask、widening、reduction、vsetvl 与 VLMAX 的关系）、真实 kernel 的循环不变量规模。

## 复现

```bash
REPO=/zp_vegeta/scratch_sb/ycsun/verus
Q=$REPO/.local/qcp/QCP-V2.1.4
cd $REPO/build/rvv-array-vector-probe-20261104
qcp --arch=64 --endian=little --no-exec-info --input-file=p1/p1_ptr.c --coq-output-dir=p1/out \
    --coq-logic-path=Probe1 -slp $Q/QCP_examples/QCP_demos_human/ SimpleC.EE.QCP_demos_human -I$Q/QCP_examples/QCP_demos_human
cd p1/out && ../../coqc.sh p1_ptr_goal.v && ../../coqc.sh p1_ptr_checked.v && ../../coqc.sh p1_final_check.v
```

本目录保存源文件、生成的 goal、手写证明和日志副本；完整运行目录（含 `lib/` 编译产物）位于 `build/rvv-array-vector-probe-20261104/`。
