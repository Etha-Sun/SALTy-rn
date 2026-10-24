# QU8 RDSUM 修复版

目标是验证两侧 C-shim 实现都产生同一列归约结果：每个输出等于其初值加上该列所有无符号 8 位输入之和，再按 32 位无符号取模。原始实现、逐侧精确 patch 和反例保存在 `proof/original/`、`proof/repair*.patch`、`proof/original-counterexamples.json`。完整验收状态以 `proof/status.json` 为准；分项通过不等于完整通过。

修复将行数与剩余行数保留为无符号 64 位，避免 `rows=2^31` 被截断成负数后跳过全部计算；NEON 的向上取整使用商和余数；原无符号标量累加本来就有定义明确的模 32 位行为。内层块仍限制为 252 行。另将有入口保护的 NEON do-while 改写为 while，以绕过已复现的验证前端崩溃；该兼容改写与真实语义反例分别记录。

公开范围见 `spec.c` 和 `proof/semantics.json`：正的 64 位行数、正且不超过 `2^62-1` 的通道数、无符号 64 位 stride，均须满足原有可读内存与输出所有权条件。输入每行需要 `channels+8` 字节。单个 `RDMap` 允许输入行重叠、stride 为零、zero 与输入别名。行数不是被限制在 `2^31` 以下。

逐原语的类型、实际 C body、Coq 绑定和语义来源记录在 [intrinsic-ledger.json](proof/intrinsic-ledger.json)。NEON 参考 [Arm ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)，RVV 参考 [Vector v1.0](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)。非活动 lane 的零值是本 C-shim 的补全约定，不代表真实 RVV tail-agnostic 必须写零；ledger 明确保留该 ISA 对应边界。

`rd_inputs` 的地址公式是未取模的整数 `base + row * stride + col`，其字节必须存在于实际拥有的 `rd_mem` 中。因此，本结果要求每行读取范围不跨越 64 位地址边界；不覆盖依赖地址回绕形成的循环布局。行数和 stride 的数值上界不能独立于该内存条件理解。两侧可写输出与只读 map 分离，公开比较入口还要求两份输出互不重叠且初始内容相同。

当 `rows % 7 != 0` 时，zero 指向同一 map 中的零字节：`channels>=32` 时需要 40 个，否则需要 `max(8,channels)` 个；整除时允许 zero 不被拥有。params 未被读取。所选 RVV 模型固定为 VLEN=128、e8m2/e16m4/e32m8 的 VLMAX=32，并采用该 C-shim 的活动 lane 与非活动 lane 约定。

证明范围是上述显式契约下的 C-shim 部分正确性。真实 ISA、物理向量结构 ABI 与源代码到硬件模型的精化、完整终止性均不在结论内。继承的逻辑假设由最终 `Print Assumptions` 审计逐项记录。

完整验收会重新生成每个实际 C 翻译单元的目标，从 `.v` 重编全部本地依赖，检查完整的 `VC_Correct` 接口、实际 helper/公开入口的调用闭包，并逐项输出假设；不复用组件 `.vo`。整案配置为 32 个 worker：普通 Coq 与小型生成使用 16 GiB / 2 小时，两侧主 kernel 生成使用 32 GiB / 6 小时；选定重型调用模块和最终接口/假设聚合使用 32 GiB / 4 小时。独立的 `--live-jobs-file` 可按整机内存控制实际同时运行数，记录每个执行的真实预算与排队情况。控制文件格式为 `{"jobs":16,"memory_budget_gib":256}`，32 GiB 任务占两个普通内存槽；调整资源不会重启已有工作，等待内存槽不占用子进程时限。既有组件保留其实际 16 并发记录。有限 UBSan 与实际 16 GiB cgroup 中的 ASan+UBSan 回归包含独立逐列 oracle、helper oracle 和两侧同错负控，只作为补充证据。

在已配置 QCP 2.1.4 / Coq 8.20.1 的环境中运行：

```sh
python3 proof/build_full_handoff.py --prepare-only
python3 proof/build_full_handoff.py --freeze
python3 proof/check_full.py --config /configured/coq-flags.json --jobs 32 --timeout 21600 --coq-timeout 7200
python3 proof/record_status.py --dry-run
python3 proof/record_status.py
python3 proof/audit_relocation.py
```

冻结要求两侧完整组件接口已通过；已有冻结输入不能静默覆盖。记录器只在完整 fresh 门禁、逐项假设和全部身份核对通过后签发结果。

生成证明注释曾把一个 `uint32_t` 输出单元写为有符号 `int`；现按实际 C 类型修正为 `unsigned int`。原注释、原目标和差异诊断单独保留；此修正不改变实现或公开输入域，全部新目标仍须重新检查。
