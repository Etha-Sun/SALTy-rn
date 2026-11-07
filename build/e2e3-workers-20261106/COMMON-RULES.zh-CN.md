# Vekto E2/E3 worker 共同规则（v1，2026-11-06）

你是 Vekto 项目的一个 worker，独立完成 BRIEF 中的单项任务。监督者（主 agent）会独立复检你的结果，复检通过才算完成。用中文写报告。

## 项目与路径
- 仓库：`/srv/home/yuechunsun/tools/lean`，分支 `vekto`。规划文件在 `research/project-plan-20261102/`，必读：`EXPERIMENT-DESIGN.zh-CN.md`（E2/E3 两节）、`INTRINSIC-REVIEW-AND-E2-E3-PLAN-20261105.zh-CN.md`、`LESSONS.zh-CN.md`、`CONDITIONS.zh-CN.md`。
- XNNPACK 固定版本：`benchmark/XNNPACK`（`867d5a34`），只读。
- 参考资产（只读）：`build/qcp-kernel-framework/verification/qcp/`（旧 40 项 QCP 包、共享 shim `shared/c-shim/`，以及 f32-vadd v1 包）；`research/project-plan-20261102/rvv-array-vector-probe-20261104/`（RVV 数组字段 probe）；`tools/rvv_ptr_lower/`（规则改写工具 v1.4）。
- **你只能在当前工作目录（`work/`）内写文件。** 不修改仓库中的其他任何文件，不 git commit，不 push，不切换分支。需要改共享内容时，在报告里写建议。

## 工具
- QCP 2.1.4 与 Coq 8.20.1：`/srv/home/yuechunsun/tools/lean/.local/qcp/env-exec.sh <cmd>`。它会把 `qcp`、`qcp-env`、`coqc` 加入 PATH；`$QCP_COQ_FLAGS` 是 coq-flags.json，`$QCP_HOME` 是 QCP 发行目录。
- 交叉编译与运行：`research/sol-pipeline-comparison-20261030/tools/` 下有 `ziglang/zig`（clang 20.1.2）、`qemu-riscv64-static`、`qemu-aarch64-static`、`qemu-hexagon-static`。
  - HVX：`zig cc -target hexagon-linux-musl -mcpu=hexagonv67+hvxv66+hvx_length128b -static`，运行 `qemu-hexagon-static -cpu v67`。QEMU 7.2 不支持 v68 及以上。另有 QEMU 11.1.3：`research/sol-pipeline-comparison-20261030/tools/qemu-11.1.3-dl/x/usr/bin/qemu-{hexagon,riscv64,aarch64}`（hexagon 支持 `-cpu v68..v73`，但没有实现 HVX qf32/IEEE sf 指令；riscv64 也可用于交叉核对 7.2 的偶发段错误）。
  - 本机 CPU 支持 AVX2/AVX-512/FMA，x86 代码可以直接用 gcc 或 clang 编译运行。
- 内存：你的进程在 128 GiB 的 cgroup 内。Coq 并发 `--jobs` 按 32 配置（用户规定）；如果出现 OOM，在报告里说明，不要自行降低。
- 运行时间可能超过 2 分钟的命令，放到后台执行，并把日志写进 `work/logs/`。

## 硬性要求（违反即判不合格）
1. **原始源码不改。** `impl/` 放逐字节相同的原版，并记录 sha256。为适配 QCP 所做的改写只能由确定性的规则工具完成（例如 `tools/rvv_ptr_lower`）。工具不支持的构造，报告"需要新规则"，写清规则草案和语义依据，**不要手改源码**，也不要自己写一个临时改写脚本冒充工具。
2. **不得为通过证明而弱化规格。** 不缩小输入域，不放宽观察关系，不引入公理、`Admitted`、`Axiom`、`Parameter`，不把优化代码换成参考实现。
3. **出现反例时，按 LESSONS 的 L1 流程处理。** 先看 XNNPACK 是否接受该输入，再对照参考语义。补充的条件写在 `spec.c` 中，用 `/* [VEKTO-C-候选] ... */` 标记，并在报告里给出依据，交监督者审核。原始的不等价结论必须保留。
4. **包结构采用 v2（用户 11-06 批准）：**
   - `impl/`：原版，只核身份；
   - `spec.c`：只含 `equivalent`，即输入域、`outputs_related` 和调用过程；
   - `spec/observation.v`：观察关系的定义；
   - `proof/bridge/`：两侧合同、函数规格、比较器；
   - `proof/lowered/`：规则工具的输出；
   - `proof/check.py`：唯一的最终入口；
   - `ledger.json`：环境前提、条件、来源。

   门禁要包含三项：调用闭包检查（每个被调函数要么有经过证明的函数体，要么是 intrinsic，且来自经审阅的 intrinsic 合同库）；对最终定理运行 `Print Assumptions`，结果只允许出现白名单中的公理；非空性见证（至少一组具体输入满足 `equivalent` 的前置条件）。
   **intrinsic 合同（用户 11-07 决定）：intrinsic 不需要 C 函数体，也不需要证明函数体。** 要求的是可复用、便于审计：(a) 每个 ISA 一个共享的合同库文件（不按 kernel 复制），ledger 记录路径和 sha256；(b) 合同写成函数式：返回值或写出的 lane = 某个具名 Coq 函数作用于输入 lane，资源前后对应，不能写 `False`、不能写存在量词式的松散后置条件；(c) 每个具名 Coq 函数对真实指令（QEMU 或 gcc 真机 intrinsic）做差分测试，作为忠实性证据（不是证明），记录用例数和结果。kernel 里的普通函数（XNNPACK 的 `xnn_*` wrapper、static inline 辅助函数）不是 intrinsic，原则上仍然要有证明过的函数体。**例外（用户 11-07 采用方案 b）：平凡转发 wrapper 可以进合同库，不证函数体**，条件是在预处理之后（目标架构已固定）机械检查函数体恰好是 `return INTRIN(形参按原顺序);` 或 `INTRIN(形参按原顺序);`，其中不能有常量实参、类型转换、实参调换或重复，也不能有其他语句；该 wrapper 的合同就是 INTRIN 合同换名。检查要由脚本完成并写进 `check.py` 门禁，wrapper 所在头文件的 sha256 记入 ledger。不满足条件的（尾部掩码、查表、多条指令组合、带舍入常量等）照常证明函数体。已经写好并证明的 shim 函数体可以保留，不必删除，但不再是门禁要求。
   **人工审核的兼容改写（用户 11-07 决定，目前只限 QCP 的 do-while 崩溃）：** 如果 QCP 在 do-while 附近崩溃（段错误或前端异常），而规则工具没有对应规则，不要在自己的草稿工具里加规则，也不要直接改源码。做法：(a) `impl/` 保留原版，在 `manual-rewrites/NN-<名字>.patch` 里放补丁，作用对象是工具输出；(b) 每个补丁配一个 `.md`，写明等价理由（例如"S 中没有 continue，进入时条件已成立"）、QCP 崩溃的证据日志，以及原版与改后版的 QEMU 差分结果；(c) 报告中列为"待人工审核"，由监督者预审后交用户签字，签字之前这个包不能算完成；(d) `check.py` 必须从工具输出加补丁重新生成被证程序，并校验补丁的 sha256。其他种类的改写仍然只能走规则工具。
5. **RVV 用数组字段表示向量，float 用比特 lane 表示**（QCP-001）。每个 kernel 都在 VLEN 512、128、256 下检查。`vsetvl` 采用 RVV 1.0 的非确定三段模型，尾部是任意值。
6. **浮点观察关系默认为"数值相等，或两边都是 NaN"。** 涉及 NaN 转整数、copysign、按比特比较的 kernel，要按各 ISA 的 NaN 规则写语义，并在报告中说明。
7. **环境前提写进 `ledger.json`。** RVV：`frm = RNE`。NEON：AArch64，`FPCR.RMode = RN`，`FZ = 0`。x86：MXCSR 为 RNE，DAZ/FTZ 关闭。HVX：写明 `__HVX_ARCH__` 和向量长度。
8. 历史的 `Qed`、日志或旧包不能算作新结果的证据。只有本次从空目录运行 `proof/check.py` 并得到 rc=0，才算通过。

## 进程清理
长时间的 coqc/qcp 一律用 `timeout <秒数>` 包住再放到后台，日志写进 `work/logs/`。一次工具调用超时或被你放弃后，要确认它启动的 coqc/qcp 已经结束（`pkill -f <该文件名>`），不要让旧进程留在后台：W02、W03 都曾残留几十个 coqc，占用近 80 GiB 内存。

## 什么时候停下
工作量大不是停下的理由：分阶段推进，每阶段更新 REPORT.md，一直做到完成标准或真正的阻塞。真正的阻塞只有两类：需要监督者或用户裁定的设计问题（先给出你的推荐方案再停），或者工具/环境缺陷且已缩出最小复现。只做完差分测试就结束一轮，不算完成。

## 报告：`work/REPORT.md`（每轮结束前都要更新）
- **结论：** 完成、反例、阻塞或未完成，选一个，用一句话说清。不要用辅助引理的数量代替整体进度。
- 最终命令、退出码、运行目录，以及关键日志的路径。
- 修改清单：规则工具输出、新增条件（附依据）、新增 shim，每项都说明理由。
- 发现的问题（QCP 缺陷、bug 线索）和下一步。
- 时间和 token 由监督者从事件流统计，你不用估算。如果某一步失败后重试，在报告里写出来。
