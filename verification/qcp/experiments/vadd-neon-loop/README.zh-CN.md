# 原始 NEON 完整循环的 QCP 证明

`proofs/neon_full_checked.v` 实现真实完整 body 生成的 `VC_Correct`：**101 / 101 个 kernel 验证义务**及三组 checked 分离逻辑策略均通过 Coq 编译。另有 5 个 lane=0 specialization 的实际 body VC 通过；runner 的 26 是顺序重编译的 proof 文件数，不是新增 VC 数。49 个 safety、14 个 entail（包括循环初始化、每轮四个元素的维护与尾部合流）、4 个 return、34 个 partial/call 义务均已实现，没有 Admitted 或新增 axiom。该结论是当前 lowered C 与 QCP 内存/浮点模型下的部分正确性；ISA 语义对应、终止性和最终跨 ISA 无条件等价不在此模块结论中。

公开 kernel pre/postcondition 与 `experiments/vadd-proof/neon_kernel.c` **逐字相同**：输入各拥有 n+3 个 fp32（允许原始 NEON 的 padding 读取），输出拥有 n 个结果。所有 fp32 值都保留，包括 NaN、无穷和正负零。`--no-float-finite-vc` 关闭前端额外的 finite 限制。fp32 运算遵循既有 QCP/Flocq 模型；硬件 NaN payload 等对应关系仍是独立问题。

实际生成与检查的 goal 哈希是 `f0ea799e867cc68dde721aea07c76ad49abf4dbd0e7c757304184a409ec578be`。来源为 `neon_loop_lengths.c` 和新实际生成的 `results-bound-inputs/`；生成器完整执行所有循环和 tail body，没有跳过 body。原始控制流保持不变。

循环不变量以 k 表示已经处理的元素数，拥有输入 prefix 与剩余带 padding 的数组、输出 `vadd_values(k,A,B)` prefix 与 undef 后缀。两条输入列表总长事实来自原始 `FloatArray.full` 资源，未新增调用者前提。剩余 byte batch 的五个分支把 0、4、8、12、至少16 分开，避免无关析取形成路径笛卡尔积。`fp32_length` 只是 Coq `Zlength`。

旧 lane 调用的 With z 推断失败已被一个已证明的 literal lane=0 契约替代。`lane0.c` 保留原 `vst1_lane_f32` 的同一实际 C body（包括两个 if），仅针对本 kernel 的字面量 lane=0 调用给出更容易匹配的合同；它自身的 5 个 body VC 已实际检查。`run_full.py` 对同 body、公开 contract、lowered kernel body 和生成 goal 的哈希做检查，不能仅声明 callee 而漏掉 callee body 证明。

完整重放（需要本机已配置 qcp-env，以及 shared/vadd 和 vadd-neon 的已编译依赖）：

```sh
python verification/qcp/experiments/vadd-neon-loop/run_full.py
```

仅核对来源守卫：

```sh
python verification/qcp/experiments/vadd-neon-loop/run_full.py --guards-only
```

默认 runner 重放已经保存的 reviewed VC，不重新生成 VC。它必须读取 `results-bound-inputs/generation.json`：检查真实生成前后保持一致的 15 个源码/header/策略文件与 3 个工具文件身份，并用相同 gcc 参数重新生成输入，与实际传给 QCP 的预处理文件逐字节对比。该守卫绑定实际输入文件，不声称捕获 QCP 内部预处理后的 token 流；外部工具环境完整性由独立环境检查负责。

重建真实 VC（240 秒预算，自动模板不算证明；生成前后记录依赖，goal 与 reviewed copy 的一致性由 runner 检查）：

```sh
python verification/qcp/experiments/vadd-neon-loop/attempt.py --lane0-contract --compact-invariant --with-lengths --timeout=240 --record-inputs
```

`checkpoint-full101.json` 保存稳定状态和源码哈希；`coqc-neon_full_checked.json` 记录实际编译命令、源码哈希及退出码，`results-full/replay.json` 记录重放结果，日志位于 `results/`。标准 QCP 布局、地址解释、Coq/Flocq 假设保留在 Print Assumptions 日志中。

历史 `checkpoint-tail6.json`、`coqc-result.json` 和旧失败目录保留原有含义：当时只有 3 个引理与 3 个策略通过，整核 body 仍未闭合。`results-bound-lane/` 的显式 where 尝试失败记录保留。不要把这些历史失败当作当前完整模块的结果。自动生成含 Admitted 的模板、Goal/Abort 探针、临时脚本及编译缓存由局部 .gitignore 隐藏；可审阅、可重放的目标与证明位于 `proofs/`。
