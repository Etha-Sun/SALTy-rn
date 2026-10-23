# VADD：实现、审核规格与证明分离

```text
vadd/
  impl/
    testNEON.c             原始 NEON C 文件，逐字保留
    testRVV.c              原始 RVV C 文件，逐字保留
  spec.c                   审核入口：比较函数、equivalent、前后置条件
  contracts/               本 kernel 的观察关系、wrapper 契约及模型绑定
  proof/
    coq/                   全部本地 Coq 源依赖，按命名空间分组
    c/                     只有 Inv/Assert 注释 JSON 和证明策略，无 C 函数体/契约
    annotations/           两侧内核的注释插入位置；不包含可执行 C
    prepare.py             从 impl/ 和 spec.c 生成验证输入，只插入证明注释
    check.py               生成实际 VC，重新编译本地证明依赖
    native.py              原始 C + spec.c 的有限运行回归
    manifest.json          依赖顺序、来源与文件哈希
```

每个 kernel 审核两个 `impl/*.c`、`spec.c` 和 `contracts/`。
公共审核入口是 [共享 shim](../shared/c-shim/f32/README.zh-CN.md)，包括类型、宏、intrinsic 实现和契约；
它们需要随共享库版本统一审核，不能视为无需审核的证明内部细节。
`Require` 是前置条件，`Ensure` 是后置条件。
`spec.c` 中可以看到所有比较 helper 的实际函数体，以及 `equivalent` 的完整调用过程。
两侧 kernel 的声明包含各自的输入输出契约，最终公开后置条件明确要求 `outputs_related(L,R)`、返回 `1` 并保留数组资源。

前置条件要求正长度、两个输入各有 `n+3` 个可读 float、两个输出各有 `n` 个可写 float，
四个缓冲区互不重叠，并受代码中明确的地址/长度上界约束。
输出相同指逐元素数值相等或双方均为 NaN；`+0` 和 `-0` 视为相同，NaN payload 不参与观察。

## 原始 C 兼容性

两个实现与仓库 `kernels/source/f32-vadd.c`、`kernels/target/f32-vadd.c` 逐字相同。
检查时直接读取这两个原始文件，按 `proof/annotations/*.json` 中的位置插入 QCP 注释，
函数契约实时取自 `spec.c`；完整验证副本只输出到 `.build/<run>/units/`。
不存在另一份需要手工同步的完整内核 C 副本。
检查器既检查注释插入前后的普通 C token，也用同一份共享 frontend/shim 对两路分别预处理，
检查预处理后的普通 C token 一致。共享 frontend 的宏本身仍须人工审核。
原始函数的 intrinsic 调用、赋值、循环和分支均保留；intrinsic 的解释由 shim 提供。
store 的 shim 宏内部借用局部向量地址，目前仅适用于本例使用的局部向量左值。
这证明 VADD 可兼容当前方式，不代表所有 40 个 kernel 的类型和 intrinsic 已全部支持。

## 检查

在仓库根目录执行：

```bash
python3 verification/qcp/vadd/proof/check.py --review-only --jobs 32
python3 verification/qcp/vadd/proof/check.py --jobs 32
python3 verification/qcp/vadd/proof/native.py
```

`--jobs` 是 Coq 编译并发上限；`coqdep` 提取真实依赖，依赖未完成的模块不会启动。
每个编译进程使用独立工作目录，避免共享 `.lia.cache`。本机使用 32；不传则默认 1。
中断续跑可加 `--resume-run /absolute/path/to/vadd/.build/full-...`：重新核对源、CPP、VC 和编译参数，
只保留该次运行记录中已经成功编译的模块，不凭 `.vo` 文件存在就跳过。

第一个命令只检查审核文件的比较函数、wrapper 和其依赖；它不单独构成 kernel 验证。
第二个命令还重新生成两侧 kernel、shim 及 RVV primitive 的 VC，检查策略，
并从空输出目录按依赖顺序编译全部 87 个本地 Coq 模块，最后编译 `FinalCheck.v`；不会读取旧实验目录中的 `.vo`。
`spec.c` 是实际输入：准备脚本从这里提取函数体和契约，不使用旧 wrapper 替代它。
spec 单元从 `spec.c` 直接提取函数体、声明、契约和首个函数前的完整前缀。
`manifest.json` 只列出每个验证单元使用哪些函数、哪些作为定义/声明、哪些策略和证明注释；
没有保存另一份 C 签名、函数体或契约。函数之间/之后出现未处理的宏、声明或逻辑导入会被拒绝，
避免把有位置含义的全局文本搬到前面。`proof/spec-preamble.txt` 已删除，类型和导入前缀也只在公开 spec 中维护。
不变量/Assert 取自 `proof/c/` 下的 `*.annotations.json`（按命名空间分目录），内核注释取自 `proof/annotations/`。
插入后检查 C token 一致；spec 注释只允许单个 `Inv` 或 `Assert`，拒绝可执行代码、契约及 Coq 导入。
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

本次删除重复模板后的完整检查已通过：从空目录重新生成核对 11 个 C 单元、8 组策略，并用 32 并发编译全部 87 个本地 Coq 模块及 `FinalCheck`，约 380 秒。
没有中断续跑，也没有复用旧实验 `.vo`。四份 spec 目标只增加 live 前缀带来的 Coq 导入，证明义务未变；没有修改任何手写 Coq 证明。
独立空目录审核检查：21 模块加门禁通过，约 37 秒；430 个 native 回归通过，且拒绝不等输出。10 个来源/注释/覆盖负对照均被拒绝。
完整命令记录见 `proof/status.json`、`proof/review-status.json`；来源审核与负对照见 `proof/layout-audit.json`。
旧 `proof/source-audit.json`、`negative-status.json` 保留整理前快照的证据，不作为本次新运行结果。
当前可计为 C-shim 语义、既定前置条件下的模块化等价性 1/40；真实 ISA 对应另列。

后续 kernel 采用同样的 `impl/`、`spec.c`、`proof/` 审核边界；
公共 intrinsic 模型应复用，当前整理不宣称通用规格生成器已经支持全部 kernel。

通用内存tactic的可运行原型及逐项分类见 [proof/automation](proof/automation/README.zh-CN.md)。
同一个tactic已替代验证39个既有内存VC；主证明保留为基线，自动化试验独立检查。

结论范围是所列前置条件下、当前 C shim 语义中的部分正确性；
固定 LP64、小端、binary32/RNE、RVV VLEN=128/e32m8、容量 32。
硬件 intrinsic 与 shim 的对应、终止性、浮点异常标志不在该证明结论内。

## 审核与防止 reward hack

需要审核。Coq 通过说明实现满足所输入的契约，不自动保证契约有意义或 shim 等同真实 ISA。
审核分为：

- 每个 kernel：原始实现、`spec.c` 的前置条件/输出观察关系、`contracts/` 的逻辑绑定。留意不可满足前置条件、忽略输出或仅检查部分元素。
- 共享版本：`../shared/c-shim/f32/` 的类型、宏、intrinsic 函数体和契约，以及该目录 README 列出的 Coq 语义定义。留意错误浮点模型、被换掉的函数和过弱后置条件。
- 验证工具版本：`proof/prepare.py`、`proof/coverage.py`、`proof/check.py` 和 manifest。生成目录无需逐份人工重读，但生成和覆盖检查本身必须可信。

本次还把 `outputs_related(L,R)` 显式加入 `equivalent` 的最终后置条件：等价性结论不能只靠比较器返回 `1` 来表达。
`compare_outputs` 的契约仍是“输入已等价则返回 1”，没有宣称它已证明任意不等输入都返回 0。
最终输出等价性来自两个真实 kernel body 满足共同结果模型的证明，独立于比较器是否能识别所有不等输入。

完整检查固定要求 11 个验证单元和各自的实际函数体；声明与实现的签名/契约必须一致，
每个 C 调用都必须有已验证函数体。`FinalCheck.v` 强制所有最终 checker 实现对应 `VC_Correct`，
避免只编译目标定义却漏掉完成证明。该闭合检查只处理当前简单 C 子集，不是通用 C 链接器。
`--review-only` 明确仍以两个 kernel 契约为条件，不能算完整等价性证明。
源文件对应检查、调用闭合检查和有限 native 回归能拦截具体绕过方式，不能消除规格及硬件模型的审核责任。
