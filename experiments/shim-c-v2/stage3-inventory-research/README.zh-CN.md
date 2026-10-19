# WP 全部义务清单的低成本生成

本调查不修改冻结 proof、前端、模型或 checker。只读当前 Frama-C 33 源码，并对一个带真实 `\wp::strategy` / `\wp::proof` 的 2 函数小控制实际执行三种命令；命令、退出码和原始输出均在同名子目录。

推荐保留原候选的绝对前端、machdep、model、share、driver、include、输入 C、RTE 和原有语义参数，只将证明执行参数替换为：

```
-wp-why3-config <绝对why3.conf> -wp-no-why3-detect
-wp-prover qed -wp-no-qed -wp-no-clean -wp-par 1 -wp-cache none
-wp-report-json <全新raw.json> -wp-session <全新session目录>
```

保留 strategy-engine 默认开启，不指定 `tip`、`script`、`-wp-auto`、`-wp-strategy`。无需改 proof 或删除策略。原策略仍解析、类型检查，但不会执行；配置仍须能找到策略中命名的 prover。完整可执行最小例子见 `qedfast/command.json`；`run.py` 已实际执行过，不要覆盖同名日志重跑。

| 小控制 | 退出码 | raw | 结果 |
|---|---:|---|---|
| `-wp-prover none` | 0 | 无 | 仅打印 goals，不能作为 JSON 清单方法 |
| `-wp-prover qed -wp-no-qed -wp-no-clean` | 0 | 4 条 | 3 valid、1 故意错误 ensures unknown；仅 qed，无外部 prover |
| 再加 `-wp-no-strategy-engine` | 1 | 无 | 未注册 strategy/proof，注解解析错误 |

`-wp-no-qed` 关闭主要 sequent 预处理，`-wp-no-clean` 关闭其退路清理。它们不关闭所有构造期化简、WP 传播、内存模型生成、公式关闭等成本，不保证任意大 kernel 秒级完成。此清单配置的绿色数量不能与原完整证明配置混同；未知项是“本次清单生成未证”，不是已执行所有 solver 后失败。没有降低原合同或删除义务，仍需独立完成原配置验收。

源码依据（均位于 `stage3-unary-front/.build/source/src/plugins/wp/`，SHA 见 source-evidence.json）：

- `register.ml:748-766`：只有 prover/script 非空时，才登记 session、执行、收集和输出 JSON；none 走仅显示目标分支。
- `register.ml:584-620`、`prover.ml:174-205,231-232`：qed 是非空 prover，但不启用 Tactical 或策略执行；只有 script 路径才执行 hints。
- `ProverTask.ml:147-185`：过滤 qed 后无外部 prover时执行 simplify 并提交结果。
- `wpo.ml:155-180`：Qed=false 跳过 introduction/simplify/filter/pruning；Clean=false 再跳过清理，保留基本收尾。
- `ProofStrategy.ml:332-345`：strategy-engine=false 不注册扩展，解释解析失败。
- `register.ml:335-346,507-512`：JSON 在该批证明收集完成后一次写出，不是增量日志；kill/超时后无 JSON 不代表 0 个目标。原有全局 lemma 批次 JSON 不代表后来 main 批完成。

完整覆盖和分批：

1. 最可靠的整单元清单使用 `-wp -wp-rte`，无 `-wp-fct/-wp-skip-fct/-wp-prop/-wp-bhv` 限制，保留原输入、宏和模型，干净进程/独立session。若原任务有固定选择集合，必须显式记录并核对覆盖真实 kernel、callee、wrapper、ghost/helper、全局 lemma；清单生成不是自动补足无 body 合同的检查。
2. 若按函数分批，使用 `-wp-fct <确切函数名>`，每批新日志/raw；不能由顶层 wrapper 递归调用推定所有 callee 已生成 body 义务。必须枚举所有实际定义并对照预期清单。`cfgGenerator.ml:179-191` 的全局 lemma 仅在 fct=Fct_all 且 bhv为空时自动加入，因此函数批次之外独立运行不带 fct/bhv 限制的 `-wp-prop @lemma` 批。
3. 函数仍很大时可按 `-wp-prop` 名称/类别进一步拆分，但类别覆盖易遗漏 RTE、call requires、assigns、variant、termination 等；优先先获得全单元 raw 作为分片集合基准。不要只计 ensures 或只收集绿色函数。每次不完整生成均明确标未覆盖。
4. raw 的 `goal` 是该冻结输入/配置下的主要标识；同时保留 `property,file,line,function,behavior,smoke`。一个 property 可产生多条 goal，不能仅按 property 去重；匿名全局 lemma 可能没有 function 字段。跨版本/参数生成的编号不得直接认作相同公式证明；保留 source/proof/model SHA 和完整参数。策略子义务汇总在父 goal 统计，不是所有 tactic leaf 的平面清单。
5. 核对退出0、该批末尾完整日志和 raw、无跳过验证/解析错误，逐批比较预期函数/lemma集合；按 goal 合集去重并保留来源。`register.ml:443-469` 的人类摘要还加入 unreachable/trivial terminates计数，不能用它替代 raw 条数。

本次只执行小控制，尚未声称9项完整清单已经生成，也没有运行9核重型任务。

## 不求解的流式观察插件（最终版冻结）

Frama-C33 已移除 `-load-script`，使用独立编译模块：

```
WP_OBSERVER_JSONL=<全新绝对输出.jsonl> <绝对frama-c.py> \
  -load-module /srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-inventory-research/.build/observer.cmxs \
  <原模型/输入参数> -wp-prover none
```

`observer.ml` 注册 modified hook，每条写出并flush；末尾 Boot.Main 回调遍历全部WPO，写 final 和 normal_exit marker。只用 `get_gid/get_target/get_index/get_results/is_smoke_test/is_trivial`，不调用resolve/compute或修改WPO/prover。`is_trivial` 在wpo.ml:717只读取已有sequent，不作证明预处理。输出以独占创建方式打开，禁止覆盖旧文件。

`build-observer.py` 使用本地恢复的OCaml及新前端接口，全部编译产物写入忽略的`.build`。源码/二进制SHA和控制结果见`observer-final-validation.json`；最终固定observer04版本。none和qed正反控制均exit0；qed有无插件的4项raw goal/property/passed/verdict一致，false保持unknown。none的结果为空不是false已被证明。最终遍历8项包含4项CFG自动exits/terminates；这些CFG-only项单列，不能混入通常4项raw分母。普通候选中按gid及property/file/line/function/behavior/smoke匹配，无法匹配项保留差异，不能臆造raw。modified事件可重复，最终记录以final集合为准；中途被杀只有已观察集合，不能冒充完整清单。marker需配合进程退出0及无错误日志，单一末尾callback不是所有后续插件执行成功的保证。

历史observer01为不支持load-script的失败；observer02使用Json浮点导致标准JSON解析不兼容，不能使用；observer03已修复格式，源码原样保留`observer03-source.ml`，对应observer-validation.json旧SHA。最终observer04新增get_target/smoke/trivial，未改计算语义。编译失败首记录与旧控制均保留。插件未修改旧toolchain/checker，也不是严格kernel验收替代品。
