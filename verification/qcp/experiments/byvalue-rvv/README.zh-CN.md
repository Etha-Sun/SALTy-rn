# 原 RVV VADD 的值接口验证

保留 `kernels/target/f32-vadd.c` 的全部可执行 C token，只插入契约、循环不变量、
中间断言和 `where` 注释。`generate_kernel.py` 将生成的函数与原函数去注释后的
 token 序列逐一比较；原文件只读。shim 和宏也是证明输入，不能只审查 kernel。

## 实际通过的范围

- `shim.c` 的三个按值外壳共 11 个 C VC 已通过 Coq；load/add 在正式混合方案中使用，
  共 8 个；纯按值 store 的 3 个作为探针保留。
- `macro_rvv.c` 保留原 RVV 循环、声明、赋值和 intrinsic 调用。新生成 45 个 C VC，
  其中 `test_rvv` 40 个，assert/vsetvl 辅助实现 5 个，均由
  `MacroKernelChecked.v` 实现完整 `VC_Correct`。
- 数组拆分、拼接、输出模型和循环回边的 5 个证明，直接复用旧证明文本，
  只修改生成目标的导入；其余证明复用旧 pure 定理与 `FastFrame`。
- 同一个 store 返回证明，对正确实现通过；删除实际 store 调用的 no-op 版本失败。
- 本轮没有重新检查旧 primitive 和策略证明的整个依赖闭包，也没有重新组合
  跨 ISA 的公开等价性 wrapper。因此不是本轮端到端等价性接受记录。

运行：

```sh
python3 verification/qcp/experiments/byvalue-rvv/run.py
```

`replay-status.json` 记录原函数、shim、宏、生成器、Coq 文件和直接旧依赖的哈希，
以及实际命令。Coq 使用当前环境已有的 QCP 模型和已编译依赖；这不是可独立安装的包。

## shim 的实现与边界

load/add 的按值外壳内部调用旧的、已有具体 C 体证明的指针 primitive，
再返回局部结构体。kernel 继续使用：

```c
vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);
vfloat32m8_t vacc = __riscv_vfadd_vv_f32m8(va, vb, vl);
__riscv_vse32_v_f32m8(output, vacc, vl);
```

`shim.h` 把 load/add 名称绑定到按值外壳。`macro_shim.h` 将 store 定义为
取局部向量地址、调用既有只读向量参数的 pointer-store 的宏。它没有修改 kernel 文件，
但预处理后 store 确实具有地址参数；这是 shim 的展开，属于需要审查的证明输入。

**这个 store 宏只支持当前 kernel 中的向量左值 `vacc`。**
它不能直接处理 `store(p, add(a,b), vl)` 这类一般表达式；目前没有提供通用转换。
宏内向量地址只供读取，契约保持向量值，且要求输出缓冲区与该向量存储分离。
使用场景的局部向量与外部数组满足这项要求。

仍固定 RVV VLEN=128、e32m8 容量 32、VL=min(n,32)、LP64、小端、既有
binary32/舍入和非活动通道模型。没有限制输入为有限浮点数，也未新增公理或 Admitted。
这些 C shim 语义与真实 ISA 的对应仍是既有边界。

## 纯按值 store 的工具障碍

`rvv.c` 尝试 load/add/store 全部采用按值外壳；QCP 可生成 45 个 VC，
但循环回边的前件同时出现同一输出 chunk 的
`FloatArray.full output vl ...` 和 `FloatArray.undef_full output vl`。
标准分离合取下这份资源表示有重复；旧 pointer-store 路径没有该重复。

直接复用正确数组证明后，剩余目标恰好要求丢弃额外的 `undef_full`。
我们没有从这个异常前件推导矛盾来强行完成证明。
`.build/debug-memory.log`、`.build/rvv_unit_goal.v` 和 `kernel-proof-status.json`
保留失败记录。混合宏方案消除了这项重复；它不证明 QCP 的一般按值调用处理无误。
