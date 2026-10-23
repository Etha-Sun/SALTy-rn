# u8-vclamp：无符号字节整核验证

2026-10-23 完整公开包 fresh 验收通过。16 路普通 Coq 重编 458 个必要模块，Coq 阶段 2115.51 秒（35 分 16 秒），包含原生回归和 C 生成的总检查时间为 2261.03 秒（37 分 41 秒）。本轮摘要见 [summary.json](proof/evidence/package01/summary.json)。

本案是 `u8-vclamp`（uint8，0..255），与目录中的 `s8-vclamp`（int8，-128..127）是两个独立 kernel。主版本保留两侧原始源码；另附 RVV 的两处 AVL 上限修改。两个版本共用一个 catalog 条目，不能重复计数。当前验收入口为 [status.json](proof/status.json)，完整记录为 [full-status.json](proof/full-status.json)。

[公开规格](spec.c) 的 `equivalent` 实际调用 [NEON](impl/testNEON.c) 和 [RVV](impl/testRVV.c)，逐字节比较，并保证返回 1、两侧输出符合共同函数、输入与参数保持。令 `p=floor(n/64)*64`、`lo=RawLo mod 256`、`hi=RawHi mod 256`，前 p 个字节输出 `min(max(x,lo),hi)`，其余输出 `max(min(x,hi),lo)`。不要求 lo≤hi，不能交换两阶段的运算顺序。数学定义在 [U8Logic.v](proof/coq/FullU8/U8Logic.v) 与 [U8KernelLogic.v](proof/coq/FullU8/U8KernelLogic.v)。

合法域为 `0<n<=18446744073709551608`；输入有 n+7 个已初始化、可读 uint8 字节，两个输出分别有 n 个可写字节，参数两个字段覆盖完整 uint32。输入、输出与参数按公开分离逻辑合同提供资源，额外 frame 保持。n 是字节数，不限制为测试长度。尾部使用真实 byte store，不向输出增加 2/4 字节对齐条件。

模型固定 64 位指针、小端、RVV VLEN=128、SEW=8、LMUL=8、VLMAX=128、vstart=0、无 mask；选用 `vl=min(AVL,128)`。32 个 uint32 字段编码的是 **128 个字节 lane**。load 的 inactive lane 在此 C 模型中置零，算术保留 inactive lane，store 只写 active lane；这些选择及来源逐项列在 [语义台账](SEMANTICS.md)。证明范围沿用 verified 的 C-shim 模块化等价／部分正确性标准；ISA/物理 ABI 精化、任意 VLEN 和额外终止定理不计入本案结论或准入要求。

| 实际 C 单元 | 原版 VC 字段 | AVL128 版本 VC 字段 |
|---|---:|---:|
| 原始 NEON kernel 与其真实 shim | 400 | 400 |
| RVV controller 与 assert | 54 | 88 |
| 9 个 RVV helper 单元、17 个实际函数 | 474 | 474 |
| 实际公开 caller 与比较循环 | 11 | 11 |
| 每个版本合计 | 939 | 973 |

每个版本覆盖 12 个实际 C 单元；两版本联合重放 13 个。字段数不是去重后的数学命题数，939 与 973 不相加。三套内存／复制策略共 31 个字段另计。完整重放从当前 `impl/spec/shim` 生成 C，重跑 QCP 与策略生成器，逐字节核对原始目标；原始源码与加入证明注释的源码经同一 frontend 预处理后，执行 token 相同。17 个 RVV helper body 与 87 处外部声明精确绑定，调用图没有未证明 callee。

必要的 458 个本地 Coq 模块由源码普通编译，最终门禁明确实例化各实际单元的 `VC_Correct`：[原版](proof/coq/U8CaseClosure/CaseChecked.v)、[AVL128 版](proof/coq/RvvRepair/CaseChecked.v)。包内有 460 份 `.v`；未使用的 `FullU8/MemoryAllBytes.v` 与 `OriginalU8Joint/JointChecked.v` 不计编译成功数。原版 939 份 Print、替代 controller 88 份 Print 和共享依赖覆盖两版完整 C 字段；策略 31 份及 VL 数学引理 6 份另核对。没有复用旧项目 `.vo`，没有新增项目公理或 Admitted。安装好的外部 QCP/Coq 库仍为记录的环境依赖；本轮不声称重建外部库或重新执行递归 coqchk。

假设审核分别保留 C 字段与策略报告：C 字段观察到 13 个既有地址／布局／外延性依赖，完整数组策略还显式列出 Coq 标准库的 `Classical_Prop.classic`、`ClassicalDedekindReals.sig_forall_dec`、`sig_not_dec`。二者合并为 16 个继承依赖；这是完整报告范围，不是新增证明公理。机器清单保留全限定名称及日志中的原名。

原生回归分别运行原版和 AVL128 版的 65536 个实际公开调用，以独立逐字节标量 oracle、原版另一种合法 VL 策略作对照，并开启 ASan/UBSan。错误 phase 输出、源码篡改、False 目标分别作为负控制。有限回归不并入 Coq 字段数。修改原因、精确补丁与历史失败统一写在本案唯一的 [修复日志](repair.md)。

从仓库根目录配置固定 QCP 2.1.4、Coq 8.20.1 环境后重放：

```sh
QCP_HOME=/path/to/QCP-V2.1.4 \
QCP_COQC=/path/to/coq-8.20.1/bin/coqc \
QCP_LAYOUT=in-place \
python3 verification/qcp/verified/u8-vclamp/proof/check.py --jobs 16 --name fresh01
```

输出写入新的 `.build/fresh01`，同名目录会拒绝覆盖。按 [QCP 并行规定](../../AGENTS.md)，新批次默认并且至少配置 16 路；每个证明进程上限 16 GiB，16 路需安排 256 GiB 总预算，并先协调共享资源。实际并发受依赖就绪数量限制。QCP 每单元 CPU 900 秒／wall 915 秒；Coq 每模块 CPU 1800 秒／wall 1815 秒，整批编译 wall 14400 秒。历史 4 路记录保留在 [pre-package 证据](proof/evidence/pre-package/status.json)，不改写成 16 路结果。

`proof/c` 只有 Inv/Assert/where 的插入位置；kernel 前后置条件只从当前 spec.c 读取。`proof/input-lock.json` 锁定运行输入，`proof/manifest.json` 记录发布文件及证据身份。迁移审计重渲染当前公开文件并核对 CPP／Coq 源身份，不冒充另一次完整 Coq 重放。

只读核对已发布文件和当前输入身份：`python3 proof/publication/audit.py verify`（在本 case 目录运行）。完整运行后用同脚本的 `archive --run .build/<name>` 保存原始日志，迁移后运行 `relocate --name <新审计目录>`，最后 `record` 封存本地验收入口；这些发布命令不启动另一次 Coq 编译。
