f32-vlrelu：候选完整检查770/770通过，打包canonical待检查，尚未准入manifest。

neon.c、rvv.c为冻结实现，spec.h为公开规格，harness.c为冻结比较wrapper；唯一证明文件proof.patch。ghost helper位于patch中，无额外proof helper文件。原版本及全部历史失败记录保留在experiments。

固定VLEN=128，RVV e32m8 capacity=32、VL=min(remaining,32)。公开spec允许任意合法size_t长度，输入另有3个float padding，输出不重叠。比较数值相等或两边NaN，不比较正负零位、NaN payload、FP flags或errno；不声称任意VL调度或二进制等价。

当前模型为已冻结native32 Bytes-v6。ISA intrinsic到C shim对应、Frama-C/WP/Qed/strategy、Why3/driver/浮点与内存模型、标准库合同、求解器、ABI和检查器仍为TCB；控制测试不是模型一致性定理，未支持alignment/valid_function等RTE，不能声称穷尽ISO C UB。模型/工具链安装依赖外部缓存，fresh clone未必可直接重放。
