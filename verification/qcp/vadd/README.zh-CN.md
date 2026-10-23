# VADD：实现、审核规格与证明分离

```text
vadd/
  impl/
    testNEON.c             原始 NEON C 文件，逐字保留
    testRVV.c              原始 RVV C 文件，逐字保留
  spec.c                   审核入口：比较函数、equivalent、前后置条件
  proof/
    coq/                   全部本地 Coq 源依赖，按命名空间分组
    c/                     shim、证明注释模板、策略及模型导入头文件
    prepare.py             从 spec.c 提取函数，附加证明注释
    check.py               生成实际 VC，重新编译本地证明依赖
    native.py              原始 C + spec.c 的有限运行回归
    manifest.json          依赖顺序、来源与文件哈希
```

审核先读两个 `impl/*.c` 和 `spec.c`。`Require` 是前置条件，`Ensure` 是后置条件。
`spec.c` 中可以看到所有比较 helper 的实际函数体，以及 `equivalent` 的完整调用过程。
两侧 kernel 的声明包含各自的输入输出契约，最终公开后置条件要求返回 `1` 并保留数组资源。

前置条件要求正长度、两个输入各有 `n+3` 个可读 float、两个输出各有 `n` 个可写 float，
四个缓冲区互不重叠，并受代码中明确的地址/长度上界约束。
输出相同指逐元素数值相等或双方均为 NaN；`+0` 和 `-0` 视为相同，NaN payload 不参与观察。

## 原始 C 兼容性

两个实现与仓库 `kernels/source/f32-vadd.c`、`kernels/target/f32-vadd.c` 逐字相同。
证明用注释副本位于 `proof/c/ByValue/neon.c` 和 `proof/c/ByvalueRvv/macro_rvv.c`。
检查脚本核对其函数的普通 C token 与原始实现相同，并核对 kernel 契约与 `spec.c` 一致。
原始函数的 intrinsic 调用、赋值、循环和分支均保留；intrinsic 的解释由 shim 提供。
store 的 shim 宏内部借用局部向量地址，目前仅适用于本例使用的局部向量左值。
这证明 VADD 可兼容当前方式，不代表所有 40 个 kernel 的类型和 intrinsic 已全部支持。

## 检查

在仓库根目录执行：

```bash
python3 verification/qcp/vadd/proof/check.py --review-only
python3 verification/qcp/vadd/proof/check.py
python3 verification/qcp/vadd/proof/native.py
```

第一个命令只检查审核文件的比较函数、wrapper 和其依赖；它不单独构成 kernel 验证。
第二个命令还重新生成两侧 kernel、shim 及 RVV primitive 的 VC，检查策略，
并从空输出目录按依赖顺序编译全部 87 个本地 Coq 模块；不会读取旧实验目录中的 `.vo`。
`spec.c` 是实际输入：准备脚本从这里提取函数体和契约，不使用旧 wrapper 替代它。
循环不变量和中间断言取自 `proof/c/`，只添加注释，提取前后会检查函数的普通 C token 一致。
函数外的类型和导入骨架由 `proof/spec-preamble.txt` 固定，额外宏、声明或 include 会被拒绝，
避免直接编译的入口与拆分的证明输入出现语义差异。
第三个命令直接链接 `spec.c` 与两个原始 C 文件，使用共享 C runtime 做有限回归。

需要已配置的 QCP 2.1.4、Coq 8.20.1、`qcp-env`、GCC。
本机检查默认复用已有 `research/qcp-shim-vadd/results/coq-flags.json`；
其他环境可通过 `check.py --config /path/to/coq-flags.json` 提供外部库路径。
外部 QCP/Coq/Flocq 库仍使用已安装的编译产物。

历史证明内容保持不变，以便复用；87 个文件包括模型、生成目标和旧 NEON 引理依赖，
不是 87 份需要手工审核的 kernel 规格。旧 `experiments/` 保留历史记录，新入口不依赖其本地证明文件。
其中 `QcpVadd`、`NanBridge` 和 `relations` 存放公共模型与关系；
`QcpNeon`、`QcpNeonLoop`、`ByValue` 存放 NEON 证明；
`QcpRvv32`、`ByvalueRvv` 存放 RVV 证明；`VaddComparator`、`VaddWrapper` 存放比较与组合证明。
新运行位于 `.build/`，结果见 `proof/review-status.json`、`proof/status.json` 和 `proof/native-status.json`。

本机已完成：审核入口21个模块、完整本地依赖87个模块全部重新编译通过；
11个实际C单元与已证VC一致；原始C直接链接新spec通过430个native回归，且拒绝不等输出。
额外宏与错误return0负对照均被拒绝。`proof/source-audit.json`核对当前源文件与完整检查输入一致。
这一结果可计为当前C-shim语义下的模块化等价性1/40；真实ISA对应不包含在这个计数中。

后续 kernel 采用同样的 `impl/`、`spec.c`、`proof/` 审核边界；
公共 intrinsic 模型应复用，当前整理不宣称通用规格生成器已经支持全部 kernel。

通用内存tactic的可运行原型及逐项分类见 [proof/automation](proof/automation/README.zh-CN.md)。
同一个tactic已替代验证39个既有内存VC；主证明保留为基线，自动化试验独立检查。

结论范围是所列前置条件下、当前 C shim 语义中的部分正确性；
固定 LP64、小端、binary32/RNE、RVV VLEN=128/e32m8、容量 32。
硬件 intrinsic 与 shim 的对应、终止性、浮点异常标志不在该证明结论内。
