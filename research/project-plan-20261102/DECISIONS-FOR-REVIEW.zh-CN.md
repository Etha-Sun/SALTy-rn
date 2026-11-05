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
