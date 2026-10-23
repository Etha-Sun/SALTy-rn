# 原版 min/max：指定语义下的 C-shim 反例

本目录保存原始实现及可重复的反例检查。正式状态应为 `counterexample`：
反例针对下列固定语义配置中的可执行 C shim，**不是实际 Arm/RVV 硬件执行**。
完整 QCP kernel 证明数为 0。仓库原有已证明数量由公共状态统一管理，本例不增加该数量。

`impl/testNEON.c`、`impl/testRVV.c` 从当前 catalog 所指的原始 source/target 逐字复制，
身份记录在 `proof/originals.json`，来源提交为 `be16280c7812a7459c26c3ce82a47339a3d07718`。
重放同时核对原始文件、复制文件和固定 SHA256。
没有使用历史目录里改变 NaN 传播行为的 RVV 修复版，也没有改写原循环、tail 或 intrinsic 调用。

`spec.c` 是本目录的可执行审核目标：分别运行两个原版，再逐元素检查“数值相等或双方均为 NaN”。
它允许 `+0`/`-0` 相同、忽略 NaN payload，但不会把 NaN 与有限数视为相同。
这份目标不是已经生成并检查完的 QCP 契约。

配置为 LP64、小端、binary32；Arm AArch64 FMIN/FMAX，FPCR.DN=0、FZ=0、AH=0、RNE，
浮点陷阱关闭且不观察异常标志；RVV V1.0，VLEN=128、SEW=32、LMUL=8、VLMAX=32，
`vl=min(AVL,32)`。RVV FMIN/FMAX 遵循 F 扩展 2.2 的 minimumNumber/maximumNumber。
输入各有 `n+3` 个可读 float，输出各有 `n` 个可写 float，输入、两份输出及 params 互不重叠。

例如 `n=1`，左操作数是 `0x7fc12345`（qNaN），右操作数是 `0x3f800000`（1.0）：
Arm FMIN/FMAX 返回 qNaN；RVV vfmin/vfmax 返回 1.0。
交换操作数后仍存在差异，因此原版不满足完整 binary32 域中的上述观察关系。
这是 NaN 与数字的差异，放宽 payload 或零符号的观察无法消除它。
Arm intrinsic 到 FMIN/FMAX 的映射见 [ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)，
NaN 规则见 [Arm 官方指令手册](https://documentation-service.arm.com/static/67e40f3398aa3c3b6eea6a85)。
RVV 规则见 [V1.0 浮点 min/max](https://docs.riscv.org/reference/isa/v20240411/unpriv/v-st-ext.html)
及其引用的 [F2.2 min/max 规则](https://docs.riscv.org/reference/isa/v20240411/unpriv/f-st-ext.html)。

重放命令：

```bash
python3 verification/qcp/candidates/f32-vmin/proof/replay.py
```

每次在本 case 的 `.build/native-*` 新建运行目录，保留实际编译命令、输入 SHA、
完整输出、ASan/UBSan 日志、每个反例的输入/输出 bit 及状态。
`proof/replay-status.json` 是最近一次运行索引；没有运行就不能引用任何历史成功作为本次结果。

运行器真实链接 `spec.c` 和两份原始 C 文件。独立已知 bit 表提供两架构各自的预期结果，
不调用 shim 来计算期望。覆盖长度 1、2、3、4、5、31、32、33、63、64、65，
左右各向的 qNaN/有限值、负 qNaN、有限数、零符号、双 NaN、无穷及次正规数。
每例检查所有 active 输出、全部输入及 padding、params、输出前后哨兵。
输入严格分配 `n+3` 个 float，因此上界外读取会触发 ASan。

这些有限运行检查没有建立 ISA 到 shim 的形式对应，也没有完成完整 kernel 的 QCP 证明。
独立 runtime 分别实现两种 NaN 规则；将它们统一以获得通过会改变本例的审核目标。
