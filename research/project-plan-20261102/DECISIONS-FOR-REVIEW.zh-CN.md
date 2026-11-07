# 待用户审核的决定（用户休息期间由监督者自行判断）

2026-11-05 起，用户休息期间：能按 LESSONS L1–L3 和已有决定清楚判断的事，我先执行，逐条记在这里，等用户起床后审核；实在拿不准的不做，列在文末的"搁置"中。

每条写明：时间、事项、我的判断与依据、已执行的动作、如何撤回。

## 已执行

| 时间（UTC） | 事项 | 判断与依据 | 已执行 | 撤回方式 |
|---|---|---|---|---|
| 11-05 09:00 | qu8-vadd 输入域（C-003） | L1 第 1 步：XNNPACK 的 init 只会产生 shift 13..30 等取值 | 让 W18 在 init 能产生的参数范围内证明 | 删除该条件，原始 A ≠ Bopt 照旧保留 |
| 11-05 09:05 | qs8-rsum/rdsum 累加溢出（C-004/C-005） | 有符号溢出是 C 未定义行为；XNNPACK 的标量参考也会溢出 | 让 W20 在"累加不溢出"的条件下证明；rdsum 的 rows 截断另按 L1 判断 | 同上 |
| 11-05 11:10 | 工具 v1.4 新增 R19：GNU `__restrict`/`__restrict__` → C99 `restrict` | 语义相同；QCP 只认 `restrict`（W19 在 vmin 上发现）；s8-vclamp 的证明前端当时用宏做了同样的替换 | 工具升级；vmin、s8/u8-vclamp、vadd 的差分测试都通过 | 回退到 v1.3 |
| 11-05 11:10 | igemm、qd8-gemm 在 harness 中失败，不是 Bopt 的 bug | W13：harness 按 VLMAX 打包权重，而 Bopt 固定用 NR8/NR16 的布局；改用正确的打包方式后，A、Bopt、改写版都通过 | 列入待证明队列 | — |
| 11-05 11:10 | qs8-rsum/rdsum 的条件改为与求和顺序无关（修订 C-004/C-005） | W20 指出"数学和不溢出"仍允许中间部分和溢出；新条件 `Init − 128·n ≥ INT32_MIN` 且 `Init + 127·n ≤ INT32_MAX`（rdsum 按每个通道、n=rows）保证任意顺序的部分和都在范围内，是简单、可审核的充分条件 | 续上 W20 | 改回原条件，或改成按 A 求值顺序的精确条件 |
| 11-05 11:10 | x32transpose 要求宽、高都 ≥ 1（C-006） | L1 第 1 步：XNNPACK 对零维张量直接跳过，不会以宽 0 调用 kernel（W21 已核实调用路径） | 续上 W21 | 删除条件；原始 A ≠ Bopt 保留 |
| 11-05 11:10 | qu8-rdsum 中 A 把 rows 截断成 int | 按 L1：如果 A 与 XNNPACK 源码逐字相同，且 XNNPACK 可能传入 rows ≥ 2^31，就是 XNNPACK 的 bug（记为 XNN-002），做 A_fixed；否则改为加 rows 上界的条件 | 让 W21 先核实，再按结果执行 | — |
| 11-05 11:10 | qs8/qu8-f32-vcvt 的 zero point 限定为 init 的参数类型范围（C-007） | L1 第 1 步：XNNPACK 的 init 函数接收 int8_t/uint8_t 类型的 zero point，不会产生 128 这样的值 | 续上 W22：在这个输入域内证明；如果仍不相等，按 L1 分析 | 删除条件 |
| 11-05 11:10 | qs8-vlrelu、qs8-vcvt 是 Bopt 的 bug（BOPT-004/005），需要修复 Bopt | W23：XNNPACK 真实 init 产生的参数（如 pm=32768、m=256）也会让 Bopt 出错，A 与 XNNPACK 标量参考一致 | 先登记；受 Codex 额度限制，修复和证明排在后面 | — |
| 11-05 11:15 | 再次修订 C-004/C-005：加上 n ≤ 2^24（rdsum 中 n = rows） | W20 R3 给出反例：kernel 先从 0 开始累加，最后才加 Init，所以从 0 开始的部分和也要在 int32 范围内。新条件取"XNNPACK 标量参考实现本身无 UB"的输入域，参考实现也是先从 0 累加、最后加 Init。附带观察：n > 2^24 时，XNNPACK 自己的参考实现和 A 都会有 UB，这是库本身潜在的未定义行为，不是 A 偏离参考语义，不登记为 bug | 续上 W20 | 回退到上一版条件 |
| 11-05 13:30 | qs8-rsum 在 C-004 下通过，启动独立复检 | W20 R5：三种 VLEN 的完整检查都通过（245 条命令，没有新增公理）；不需要修复 rows（XNN-002 只涉及 rdsum） | 复检已启动；qs8-rdsum 仍因 QCP-004 暂停 | — |
| 11-05 13:37 | Codex 额度降到 30% 储备线，守护脚本停止 W17、W18、W22 | 遵守"保留 30%"；三者当时都已完成开发闭包，正在跑最终 `proof/check.py` | 不再启动新 worker；会话 thread 已记录，可用 `codex exec resume` 续上：W17 `01a1aadc-bfa9-7cd3-a74e-89430aea92dc`，W18 `01a1aadd-3535-7a12-9f60-1822a2ec9e7e`，W22 `01a1aae6-efef-7f00-83ba-fe6a9266eeeb` | — |
| 11-05 13:40 | 由监督者代跑被打断的最终入口（f16 修复配对、qu8-vadd 修复配对、qs8/qu8-f32-vcvt 配对） | `check.py` 是确定性的 QCP+Coq 脚本，不消耗 Codex；worker 已声明不再修改受检源码。通过即算入口验证通过（worker 的最终报告和成本记录待额度恢复后补）；失败则留给 worker 续做 | 四个 16G scope，日志 `w*/supervisor-final-*.log`，结果写入 RECHECK-RESULTS | 不计入通过即可 |
| 11-05 13:40 | qu8-rsum 独立复检通过（rc=0） | — | 计为监督者复检通过的完整配对 | — |

## 搁置（拿不准，等用户决定）

| 事项 | 为什么拿不准 |
|---|---|
| x32-packw-gemm-goi：Bopt 把 NR2 尾块中的填充区写成 0，A 保留原值（W13） | 填充区算不算可观察输出，要看 XNNPACK 的 packw tester 是否比较填充区，以及后续 gemm 是否读取它。没核实之前，不确定是该修 Bopt，还是该放宽观察关系 |
| qs8-vmul 的 ±1 容差验证（R-001，W24 卡住） | 原因还没细看；Codex 额度紧张，暂缓 |
| x32transpose、qu8-rdsum：生成 NEON 侧 VC 时 QCP 崩溃（QCP-004） | 根因未定位。旧项目在 igemm/gemm 上手工把外层 do-while 改成 while 绕过了类似崩溃，但同样没有确认原因。可以试一条规则：`do S while (c);` → `while (1) { S if (!(c)) break; }`。只要 S 中没有 continue，这个改写就与原程序等价，不需要额外的入口条件。但它是否真能消除崩溃，要先做实验才知道。等用户决定，以及 Codex 额度恢复 |

## E2/E3（gpublaze，2026-11-06 起，监督者判断，待用户审核）

| 时间（UTC） | 事项 | 判断与依据 | 已执行 | 撤回方式 |
|---|---|---|---|---|
| 11-07 00:45 | W02（AVX probe）请求批准的规则和假设 | ① R17 的被调名白名单加 `_mm`：与 `__riscv_` 同理，intrinsic 不保留指针。② R20：删除预处理后单元中未被引用的顶层 `static inline` 函数，迭代到不动点。依据：内部链接且未被引用的函数没有可观察行为。③ 调用点的 `/*@ where p=&v */` 注解：只插注释，并校验 C token 序列不变，属于证明层。④ 全局 `static const` 表"内容等于初始化器"：C 语义保证，登记为环境前提。⑤ 新规则 R21：同一按值向量变量在一次调用中作为多个实参时，先拷贝到临时变量。依据：按值传参本来就是拷贝。不采用分数权限 | ①②⑤ 交给工具 worker W05，实现为 `rvv_ptr_lower` v1.5（增加 `--isa x86`），附确定性、幂等性和差分测试；W02 用 v1.5 的输出继续做，不再用自己的草稿脚本 | 规则从 v1.5 移除，回到 v1.4 |
| 11-07 00:45 | AVX 的表示方案 | 采用 W02 的方案：按值 `__m256` 用逐字段表示（8 lane，规模小，不触发 QCP-001），只对"按值入参并写堆"的情况用 shim 宏和 `where` 注解。不像 RVV 那样全面指针化，因为 XNNPACK 的 AVX kernel 通过按值的 `xnn_*` wrapper 调用，全面指针化需要改写 wrapper 的签名 | 继续 W02 | 改为全面指针化 |
| 11-07 01:10 | **用户审核（11-07）** | 用户批准 R21、`where` 注解、AVX 逐字段表示。R20 和 R17 原则上批准，前提是 v1.5 实现补上两条限制：R20 必须保留（或拒绝）带 `constructor`、`used` 等属性的函数和被取过地址的函数，并在预处理之后判断引用；R17 不能只看 `_mm` 前缀，还要确认被调函数是 `immintrin.h` 中声明的 intrinsic 或内建函数。全局常量表"内容等于初始化器"作为新增建模前提登记，写进论文的前提列表；复检时检查 `equivalent` 中表的内容精确等于初始化器 | W05 第 2 轮按此补齐；登记为 G-005 | — |
| 11-07 02:10 | 规则工具 v1.5 合入 `tools/rvv_ptr_lower`（未提交） | W05 实现了 `--isa x86`、R17（AST 确认被调函数是系统 intrinsic）、R20（保留带属性和被取址的函数）、R21（只对 x86 生效）、R22（`where` 注解，自检 C token 不变）。监督者独立复检：35 个 RVV 输入与 Keagan 清单的 blob 一致；v1.4 与 v1.5 共 308 个输出文件逐字节相同；15 个规则夹具全部通过。已知限制：QEMU 7.2 riscv64 偶发段错误，没有一次 35 个全绿的运行，单独重跑都通过，原版 ELF 也会偶发崩溃 | 合入工具；验证记录放在 `rvv-ptr-lower-20261104/validation-v1.5-*.json` | 用 git 恢复 v1.4 |
| 11-07 02:30 | W04（E3-33 s8-rmax）的反例 | 按 L1：XNNPACK 对 `batch` 没有限制，是合法输入；参考语义下 A 正确，偏离方是 XNNPACK 自己的 RVV kernel。登记为 XNN-003，修复变体登记为 V-006（改用 `_tu`，与 XNNPACK f32 模板一致）。没有加输入条件。监督者独立复现：`rvv_ta_all_1s=true` 时 9 处不一致，QEMU 默认策略下 0 处 | 写入 bug 记录和 CONDITIONS；未对外报告 | 删除 V-006 和 XNN-003 |
| 11-07 02:30 | 新规则 R23：`T v = *p++;`（以及 `x = *p++;`）→ `T v = *p; p += 1;` | C11 6.5.2.4：后缀 `++` 的值是自增前的 p，副作用在完整表达式结束前完成。适用条件：p 是普通局部变量，语句的其余部分不再出现 p，语句是复合语句的直接子语句。NEON A（XNNPACK 原版）里有这种写法，QCP 2.1.4 不接受 | 交给 W05 实现为 v1.6 | 撤回规则 |
| 11-07 02:30 | 公理白名单新增 `CNotation.rvalue_expr_equiv` | QCP 自己的 C 语义参数，与已有的 `CNotation.*` 同类，属于 QCP 的信任基础 | 暂时接受，列入用户审核 | 从白名单移除 |
| 11-07 02:30 | **隔离漏洞（监督者失误）** | worker 启动时用 `--add-dir <仓库>`，在 acceptEdits 模式下 Write/Edit 工具可以写整个仓库（沙箱只管 Bash）。W04 曾误写 `build/qcp-kernel-framework/.../qs8-rsum/spec.c`，已自行恢复，git 状态干净 | 改为只用 Read 权限规则授权读仓库，写入只限 `work/`，已实测。W02、W03 的当前运行仍是旧设置，结束后检查 git 状态 | — |
| 11-07 02:35 | **用户授权监督者自行判断 R23、`rvalue_expr_equiv`、XNN-003/V-006** | ① R23：批准。依据是 C11 6.5.2.4；工具只在 p 是普通局部变量、且在语句中只出现一次时改写，否则拒绝；要求带 QEMU 差分测试。② `CNotation.rvalue_expr_equiv`：批准加入白名单。它是 `Parameter`（未解释的符号，不附带任何性质），不是 `Axiom`。依赖它的结论对它的任何取值都成立，不会引入矛盾。以后白名单只自动接受 QCP 的 `Parameter`；遇到新的 `Axiom`，一律上报给用户。③ XNN-003/V-006：维持判断。输入合法，偏离方是 XNNPACK 的 RVV kernel；修 B，不加输入条件；原始的 A ≠ B 作为 E3 发现保留 | 定稿，以后按此执行 | 撤回对应条目 |
| 11-07 04:10 | 规则工具 v1.6（R23）合入 `tools/rvv_ptr_lower`（未提交） | 监督者独立复检（`build/e2e3-workers-20261106/rechecks/w05-v16`）：45 个规则夹具全部通过；v1.5 和 v1.6 在 35 RVV + 40 NEON 上各跑一遍，284 个文件逐字节相同，6 个 kernel 有差异，每个都有 R23 事件，没有意外差异；目标 `s8-rmax-neon-u32-acc2` 的 QEMU 差分通过，负控（删掉 `input += 1;`）被抓住；读过 R23 代码，条件与已批准的口径一致。变体测试和全量 QEMU 差分只有 worker 的日志，没有重跑 | 合入；仓库原 v1.5 备份在 `rechecks/w05-v16/repo-v15-backup` | 用备份恢复 v1.5 |
| 11-07 04:10 | v1.6 拒绝 4 个原本"原样通过"的 kernel（RVV `f32-gemm-minmax`、`f32-igemm-minmax`，NEON `f32-maxpool`、`f32-argmaxpool`） | 接受拒绝。这些 kernel 里的 `*p++` 出现在多声明符、调用实参或三元运算分支中，以前只是原样留在输出里，并没有被证明能进入 QCP。E1 的包各自记录了所用工具版本，不受影响。扩展规则 R23b（调用实参、多声明符）等到 E2/E3 有目标确实需要时再做；三元运算分支需要另外设计 if-conversion。保持"不满足条件就拒绝"，不改成原样放行 | 写入 W05 的 APPROVAL.json | 改为批准 R23b |
| 11-07 04:40 | **用户决定（11-07）：intrinsic 不需要 C 实现及其证明** | 用户原话："intrinsic 我从来没说必须要有 C impl 解释吧？intrinsic 只要是 reusable 便于审计的就可以"。监督者据此把调用闭包门禁改为：被调函数要么有证明过的函数体，要么是来自共享 intrinsic 合同库的 intrinsic。为防合同空洞或写错，加三条落实要求：每个 ISA 一个共享合同库并记录 sha256；合同写成"输出 lane = 具名 Coq 函数(输入 lane)"的函数式（不能写 False 或松散的存在式）；每个具名函数对真实指令做差分测试。XNNPACK 的 `xnn_*` wrapper 和 static inline 函数不算 intrinsic，仍要证函数体。W02 提的 `f32_to_bits` / `bits_to_f32` 信任基问题因此消解：它们按 intrinsic 合同处理 | 更新 `build/e2e3-workers-20261106/COMMON-RULES.zh-CN.md`（旧版备份 `.bak-20261107`）；W02、W03、W04 下一轮恢复时通知 | 恢复旧门禁 |
| 11-07 05:00 | **用户决定（11-07）：QCP 的 do-while 崩溃不设计工具规则，改为人工审核的兼容改写** | 已确认受阻的有 4 个：E1 的 x32-transposec、qu8-rdsum、qs8-rdsum（NEON 侧，QCP-004/C-005），E2/E3 的 s8-rmax HVX（W03）。E1 源码中有 17 个 NEON 文件、7 个 RVV 文件含 do-while，后面可能还会增加。流程：worker 只提交补丁，`impl/` 保留原版；每个补丁附一句等价理由和 QEMU 差分；监督者预审后交用户签字；论文单列为"人工审核的兼容改写（绕开 QCP 崩溃，不是修复）"。如果受阻案例超过五六个，再做成工具规则，已审过的补丁作为规则的测试用例 | 更新 COMMON-RULES；W03 下次恢复时按此执行；DECISIONS"搁置"栏的 QCP-004 一项按此处理 | 改回工具规则方案 |
| 11-07 05:20 | **用户批准公理白名单（11-07）** | 5 个 Coq 标准库公理（classic、functional/propositional extensionality、sig_not_dec、sig_forall_dec）和 QCP 的 C 语义公理（`eval_addr_expr_congr`、`LE_arrow_field_congr`、`RE_addr_of_congr`、`Snaive_C_Rules64.eval_addr`、`addr_of_LE_var_not_zero`），以及 QCP 的 Parameter。监督者的相容性论证：取 `rvalue_expr_equiv` 恒真、`eval_addr_expr` 恒为 1，上述 QCP 公理全部成立 | 统一白名单 `build/e2e3-workers-20261106/assumptions-allowlist.STANDARD.txt`（sha256 `46d3357c…`），所有新包使用 | — |
| 11-07 05:20 | **用户决定 HVX 范围（11-07）：best effort，整数类优先，浮点能做就尝试；允许 W03 联网** | 用户允许下载后，监督者获取 Debian qemu-user 11.1.3：支持 hexagon v68–v73；实测 v73 整数 HVX 正常，qf32 指令报 illegal instruction（QEMU 未实现 HVX qfloat），且没有 v79/v81。浮点 HVX 因此没有可执行的差分对象 | `launch.sh` 增加按 worker 开启的 WebFetch/WebSearch（`ALLOW_WEB` 文件），W03 已开启，Bash 网络仍在沙箱内；QEMU 11 哈希记入 `DOWNLOADS.sha256` | 删除 `ALLOW_WEB` |
| 11-07 05:30 | **用户采用方案 (b)（11-07）：平凡转发的 `xnn_*` wrapper 进合同库** | 条件：在预处理之后，由脚本机械检查函数体恰好是一条形参按原顺序的 intrinsic 调用（不能有常量、类型转换、实参调换），检查写进 `check.py` 门禁，头文件 sha256 记入 ledger；其余 wrapper 照常证明函数体。已向用户说明：能否因此去掉 R24 尚未确定，要由 W02 实测；信任基础的增量只是"单条转发 wrapper 的合同 = intrinsic 合同" | 更新 COMMON-RULES；W02 下一轮先实测 `xnn_storeu_f32`，R24 暂缓审批 | 回到方案 (a) |
| 11-07 08:10 | W03 的 H7（"UB 精化"）改为 bug XNN-004 加修复变体 V-007 | 按 L1：负最大值是合法输入，原版 `xnn_reduce_max_s8` 返回 float 再赋给 int8_t，越界转换是 UB，偏离方是 XNNPACK。改变语义的改写不能作为通用工具规则（规则工具只做保持语义的改写），所以登记为程序变体，与 XNN-003/V-006 同样处理：被证的是修复版，原版不声称等价。H7 在最终包里改成 `manual-rewrites/` 形式的修复补丁 | 写入 bug 记录和 CONDITIONS；未对外报告 | 删除 XNN-004/V-007 |
| 11-07 08:12 | **E2 启动（用户 11-07 同意"现在启动"）：冻结 5 个 op 及目标范围** | x8-lut：RVV + HVX（必做，HVX 主要成功例子）；qs8-vprelu：RVV + HVX（尝试，唯一满足严格条件，单独标注）；f32-ibilinear：RVV + HVX（best effort，源是 SSE 不是 AVX，需说明）；f32-velu、f32-vsigmoid：只做 RVV（HVX 除法是近似的 `fast_inverse`，qf32 没有可执行对象）。生成规则：目标由 worker 新写，逐操作沿用 x86 源的算法（同常数、同顺序、同 FMA 选择），使源 ⇔ 目标逐位相等；差分测试后冻结 sha256，记录生成尝试次数和失败原因；冻结后适配 QCP 仍只能走规则工具。本轮不测性能。intrinsic 合同各 worker 按 ISA 分文件写，监督者之后合并为共享库 | 公共说明 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`；启动 W06–W10（W06–W08 允许只读联网） | 停止对应 worker |
| 11-07 08:20 | **用户授权监督者自主运行（11-07）** | 用户原话："后面我就不管你了……你后面就自己盯着点，然后有些跑完了就自己加新的 worker，额度应该够"。监督者据此：复检并审批完成的 worker，按计划自行启动新 worker（XNN-003/004 同类排查、合同库合并、E3 扩充），保留 85% 额度软上限和"同时 8–10 个"的规模。仍需用户的事项（新 Axiom、补丁签字、对外报告、削弱规格或缩小声明）记入 `PENDING-USER.zh-CN.md`，不阻塞其他工作 | 新监视脚本 `build/e2e3-workers-20261106/watch.py`（结束 / 做完但进程未退出 / 卡住 都会唤醒） | 用户收回授权 |
| 11-07 08:46 | 新规则 R27：删除空 asm（`XNN_FORCE_REALIZATION`） | 模板为空、无输出、只有输入操作数、无 clobber 的 asm 不改变 C 可见状态；XNNPACK 在非 GNUC 下本来就把该宏定义为空。影响 f32-velu、f32-vsigmoid 等 AVX2 源 | 排在 W05 的 v1.7 之后实现（v1.8）；W09 先做 RVV 侧 | 撤回规则 |
| 11-07 08:46 | W08、W09 的候选条件 C-008、C-009 | 都按 L1：条件只排除 XNNPACK 调用路径上不可达的输入，原始反例或差别保留。因为属于缩小 ukernel 层输入域，列入 PENDING-USER 等用户最终确认，worker 先按条件继续 | 登记 CONDITIONS | 用户否决时撤回 |
| 11-07 08:46 | W07 qs8-vprelu：条件 C-010（zero point 在 int8 内），HVX 不做 | C-010 由 XNNPACK `tensor.c` 的 `check_zero_point` 直接支持，不缩小 XNNPACK 可达域，所以不列入 PENDING-USER。HVX：算法含 fp32 乘法和 magic-bias 舍入，没有整数路径，qf32/IEEE sf 不可执行 | W07 恢复，做完 RVV 侧全部证明 | — |
| 11-07 09:55 | **每周额度成为约束：暂缓新开 worker** | 09:52 时每周额度 32%（08:15 为 24%），约每小时 5%；照此速度约 23:00 UTC 用完，而重置在 11-09 02:00。5 小时窗口只有 33%，不是瓶颈。规则：每周额度超过 70% 不再新开 worker，超过 85% 不再恢复已有 worker（正在跑的让它跑完本轮）；用完前要留出余量，因为监督者自己也用同一额度，且 vegeta 恢复后 E1 还要用。XNN-003/004 同类排查（原定 W11）暂缓到有余量时；用户 11-07 确认此规则 | 未启动 W11；W04 完成后不补位 | 用户放宽 |
| 11-07 10:20 | W04 审批：E3-33 s8-rmax（NEON 原版 ≡ RVV 修复版 V-006）完成 | 监督者独立复检 rc=0，10 门禁、96 模块，公理在标准白名单内；spec 覆盖全部 int8 输入。接受 RVV load/归约合同中"尾部 lane 存在某值"的写法（tail-agnostic 的忠实刻画） | APPROVAL.json；CONDITIONS 的 V-006 更新 | — |
| 11-07 10:20 | 规则工具 v1.7（`--isa hvx`、R25、R26）合入（未提交） | 监督者复检：73 夹具通过；对 v1.6 的 RVV/NEON 输出在版本串归一化后全部相同。v1.7 的决策项：wrapper 当作操作不内联——HVX 的 `xnn_loadu_s8`（`*((HVX_UVector*)p)`）、`xnn_set1_s8`、`xnn_reduce_max_s8` 都不满足方案 (b) 的"单条 intrinsic 转发"条件，要证函数体，函数体里有按值向量参数，需要 F1–F3（与 W02 的 R24 是同一问题）；F1–F3 等 W02 的实测结果再定。R26 维持严格（不接受 `signed char` 空格拼写）。其余（Q6 宏只接受平凡转发、解析标志、向量类规范化、R25 保守性）接受 | 合入；v1.6 备份在 `rechecks/w05-v17/repo-v16-backup`；W05 下一轮做 R27 | 用备份恢复 |
