# 两批证明材料的第二轮整合

从 `integration-review-v1` 的审计结果继续：DeepSeek 16 项与
`origin/handoff/shim-c-root10@101fc27d` 的 9 项去重，共 17 个 kernel。
本目录只收证明候选和新的实际运行记录，不继承任何旧通过计数。

## 分工与边界

- `vlrelu/`：主审负责位选择、浮点位表示 helper，然后重跑整核。
- `noncomplex/`：sqrt、round、complex multiply、f16 conversion、量化 multiply、packw、transpose。
- `gemm-sparse/`：GEMM、IGEMM、QC4 GEMM、SPMM。
- `conv-pool/`：CONV、DWCONV、DWCONV2D、MAXPOOL、ARGMAXPOOL。

每个候选的 `task.json` 指向独立的 `case/frozen.json`；每 kernel 的证明仍为
一个 `draft/proof.patch`，提交验证时复制为不可混淆的 `attempts/<编号>/proof.patch`。
草稿可能继续修改，判断某次结果必须看该次快照，不能套用到后来的草稿。
`work/` 等目录只用于编辑或审阅，实际检查入口是 runner 应用 patch 后的 annotated C。

冻结普通 C、公开 spec/wrapper、shim、driver、模型和 checker。只补证明注释及
有实际函数体、接受 WP 检查的 ghost helper。原有修复 target 保留其冻结版本。
本轮不修改模型，不引入未证明的假设，不加强公开前置条件。

## 并行与额度

`run_candidate.py TASK_ROOT --mode full|focus --seconds 1200` 复用已有隔离 Gateway。
共享 16 个进程锁；历史任务多使用 `-wp-par 16`，随后重点任务提高到64或128；
主机 CPU affinity 为 128 核。最初使用 8 个任务槽，实测许多任务仍在单线程
生成公式，主机尚有大量空闲 CPU，因此增加任务槽以重叠生成和求解阶段。
这不代表有 256 个物理核；同时全部求解时由操作系统调度。
单目标的时限、内存、模型及 prover 保持各 case 的冻结配置。
任务总运行上限从取得共享槽后计算，排队不消耗此 CPU 运行预算。
新的完整批次可使用用户此前允许的3600秒总任务上限，避免完整 raw 落盘后审计被行政截止截断；旧任务预算/结果不反写。单目标仍30秒/1024MiB。

用户随后授权继续提高 CPU 使用。主机实测 affinity 为 128 核，可用内存约
741 GiB；最新重点整核候选使用单任务 **128 路**，包括 caller、signed reinterpret 和
值关系证明。已运行的历史任务配置保持原样。调度配置写入 task 与实际命令，
未增加单目标时间/内存或改变证明范围。增加 CPU 只能加速可并行的求解，
无法把每个 Frama-C 进程内部串行的公式生成直接变成并行。

`quota_watch.py` 每 1800 秒调用用户 shell 中的 `codex_quota -j`。
PATH 中另一个名为 `cq` 的程序是旧 AWS 工具，不用于这里。
只保留脱敏的剩余额度。低于 55%、额度查询失败或服务不再允许普通用量时，
写入 `QUOTA-STOP.json`；runner 不再接受新任务，排队任务取消。
已经运行的 CPU 验证可以自然结束；主审通知各 agent 保存证明与结果并收尾。
因此这是协作收尾门禁，不是供应商计费的硬上限。
结束整轮工作时创建 `MONITOR-DONE`，让监控退出。

## 结果的解释

`root-input-audit.json` 检查冻结输入和任务 manifest 的哈希，不能单独证明程序正确。
`root-prior-pin-audit.json` 还把新 manifest 的内容 SHA 与上一轮的固定版本比较，
避免仅修改源和新 manifest 就被当作“仍然冻结”；ARGMAXPOOL 四份独立复制另有
`root-argmax-copy-audit.json` 逐字核对旧导入版本。
`attempts/*/logs/verify01.json` 是实际原始 VC 报告，`status.json` 记录执行范围。
`focus` 通过只表示所选义务通过。解析失败、模型编码异常、运行超时、未证 VC
分别记录，均不自动解释为 kernel 的功能反例。

另用 `audit_controls.py` 独立审查模型控制。原 checker 可能把 Why3 导出异常导致的
“false 未证”也记作 accepted；这种结果只能算控制不确定，不能作为资格检查通过。
根审计据日志及 raw 拒收这种上下文，保留原 checker 与原始结果，未更改冻结工具。
`root-control-audit.json` 是额外门禁，不是模型一致性证明。

v4 runner 在异常退出时也可能往 `verify01.json` 追加已经完成的 global rows。
若 `main-report.json` 不存在，绝不能将这个 global-only 文件的计数解释为整核分母。

收录新 kernel 必须完整检查所有 helper/global/caller、内存安全、调用前件、
assigns、终止与输出等价，并经主审独立复验、source/LLVM 身份检查及模型控制。
整核未通过就不修改 `verified/manifest.json`。

`root-model-lock-audit.json` 另核对四份模型 lock 所指的 34307 个不同文件，
本轮审计时未发现内容改变。锁定和控制测试都不能代替模型正确性论证。

`root-llvm-identity-audit.json` 按 proof SHA 匹配实际 guard 快照，17 个候选的
普通 C 与加注释 C 生成的 host LLVM IR 都逐字相同。原有 identity checker
还要求 llvm-diff 返回 0，其中九项未满足；结果原样保留。独立 self-check
表明 llvm-diff-14 对这些相同 IR 的自身比较也返回 1，不能把它误称为 C 改动，
也不能改写旧 checker 的 passed 字段。字节相同证据单独记录，既不是完整
ghost noninterference 定理，也不是原始 ISA 与 shim 对应的证明。

## 当前 vlrelu 收尾

最新冻结 proof 为 `merged-values-v02`，SHA256
`d5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9`。
两个独立 depth16 全量检查都得到 **729/735**：主目标708/714、全局引理21/21。
714个主目标与单独无prover枚举的清单完全匹配，没有遗漏函数/属性。
第一次完整运行完成；第二次在post-audit阶段触发supervisor截止，但实际main raw已经完整落盘，
因此保留原`timeout`状态与完整raw，不将它宣称为成功canonical。
depth8完整检查为727/735，额外两条RVV输入内存义务未闭，最终完整profile继续使用depth16。

六项未证均是实际报告中的timeout/unknown，不是C功能反例：

- NEON主4lane输出prefix保持；`vlrelu-mainprefix/v02-filter-depth8`已在同谓词上加稳定名字，
  仅用filter及地址展开，实际2/2+21globals闭合。仍要与其它修订一起全量复验。
- NEON4/2各一条写回`same_float`和逐点`same_value`，共四项。
  精确位置、失败策略及新候选在`vlrelu-mainframe/`；这些匿名前件曾被局部focus漏掉，不能由尾部通过推断已闭。
- harness最终两点读取权限`vmem_final_reads`。小context permission helper的实际body已2/2，
  正在检查其全部caller前件与原目标；未完成前不计入通过。

普通C token、公开spec、source guard、主版本LLVM identity均通过审计；
四份model lock的34307个不同文件再次检查无漂移。控制检查通过也不等于模型一致性定理。
目前manifest仍为15项，本轮新增整核通过0项。其它16个kernel见`STATUS.zh-CN.md`逐项表。

历史阶段全部保留：signed reinterpret v09为36/36+12globals；完整`merged-v02`为559/569；
RVV v03为172/172+13globals、harness v04为36/36+18globals；
NEON v19为201/201+18globals，CASES v04为3/3+18globals。
旧`merged-values-v01`在1200秒截止时无完整main raw，不能计算整核分母。
不同快照计数不相加；判断当前运行始终使用不可变attempt proof SHA与raw报告。

`frama_depth16.py`仅调整搜索深度；`frama_depth16_progress.py`额外开启官方
`-wp-msg-key shell`。日志含终止/不可达辅助消息，不能直接按`[Valid]`行数计算主目标数。
raw JSON才是最终计数来源。`audit-receipt.json`保留summary结果及原SHA，仅省略重复model_inputs；
完整清单在本机原始summary，模型另由固定lock和root独立审计保护。缓存与临时数据不提交。
