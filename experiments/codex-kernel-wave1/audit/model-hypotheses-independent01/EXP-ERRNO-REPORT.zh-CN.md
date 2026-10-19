# exp/v68：errno alias 配置域诊断

已确认标准 `-wp-alias-vars __fc_errno` 能消除该候选的额外 errno 分离条件，同时保留完整目标清单；同source控制与真实FMA leaf局部重放通过。没有完成或宣称 exp 整核证明，没有修改主证明或正式manifest。

## 冻结及协作边界

与 core_numerical_finish 协调后采用不可变 `core-float-wave2/f32-raddstoreexpminusmax/v68`，其源冻结SHA `23dc8d444f233bbac297fea9f375a9acd2762143d8814734e67e359d57cbb23a`，proof SHA `c106f4efe670733e52f909081d16a9a112947250ee4aae77c4e0933e6fba410e`。没有接触其后续v69/v70主proof。

新隔离候选：`audit/model-hypotheses-independent01/exp-errno-v68-config01`。

- 候选冻结SHA：`f9517cf71f79d6500a0532bed90e695a09aafbf4d19266320500e3a210f0bc77`。
- 纯生成计划冻结SHA：`87ccb18eef3fd1f054e4ef2bd8ae686fc1a5de3e3950e89d6b34e19692d36dc7`。
- 模型仍为原native32 Bytes + 原FMA组合，模型锁SHA `c28d0c61221396d3c86df380aab14ef399e93a64a349ea0df84ae97332401779`；入口仍为 `core-float-wave2/model-native-bytes32-v5-fma/frama-c.py`，没有新建或修改codec/driver/binary。

所有C/spec/proof及既有prepared annotated副本逐项精确匹配原guard；plain/annotated普通token及14879个完整预处理token相同，公开spec字节相同。模型锁全部输入与runner在执行前锁定、执行后再次核对；new candidate的 `frozen.json` 包含具体SHA。旧frozen/proof/guard备份在archive，原source和旧日志保持原样。

## 全部目标、函数及模型条件对照

`logs/baseline-generation02.log`、`alias-generation02.log` 均使用无筛选的完整unit、原NEON/RVV内联配置、`-wp-prover none`，各约18.9秒正常退出；没有选择子函数、属性或skip函数。

| 检查 | 原配置 | 加alias配置 |
|---|---:|---:|
| 唯一生成目标 | 1441 | 1441 |
| WP函数/ghost集合 | 72 | 72 |
| global lemma集合 | 33 | 33 |
| 未映射目标 | 0 | 0 |
| Memory-model hypotheses块 | 1 | 0 |

所有1441项goalID多重集合精确一致，两边均覆盖同72个WP函数/ghost及33个global。NEON/RVV两体按原流程内联进入equivalent，不是跳过它们；这72个名称是WP中的函数/ghost集合，不把已内联两体重复计数。完整名称集合及映射记录在候选 `review.json`，完整目标清单分别保存在两份generation02-summary.json。

原配置仍逐字打印六条与__fc_errno分离的额外requires（input/left/right/sum和无界base区域），alias配置不再打印；未使用关闭warning或check-memory-model选项，其他missing-assigns和RTE警告仍原样存在。两份实际pretty-printed CIL C字节相同，保存在 `logs/*generation02-cil.c`。因此额外条件的消失来自标准Var→heap建模选择，不是改spec、删assert或过滤目标。

`-wp-prover none` 纯生成不输出raw证明JSON，这是预期行为。完整生成目标不等于这些目标已证明，尤其33个global这里只比较集合，不冒称在新配置下重证了全部global。

## 同配置控制和真实局部重放

所有局部运行保持已由root使用的numeric-support诊断profile：原front/share/config/driver，Bytes、RTE、par2、每solver1024MiB、solver timeout20s、tip/z3/cvc5、标准auto-depth30、dry session。基线与alias仅相差标准 `-wp-alias-vars __fc_errno`，输出/session各自隔离。

- `logs/alias-control01.json`：实际4项raw，3通过；唯一未证为故意false ensures，positive ensures通过，两assigns通过，无model hypotheses。控制include同一个annotated unit，仅诊断命令选两个control函数，控制源不并入原kernel源或proof。耗时42.28秒。这只是拒绝回归门，不是模型一致性定理。
- core_numerical_finish 推荐的真实 `__riscv_vfmacc_vv_f32m4`，其实际FMA调用可改errno；没有选一个不涉及errno的空辅助函数。`logs/baseline-leaf01.json` 实际21/21，22.051秒；`alias-leaf01.json` 实际21/21，21.697秒。两边goalID集合相同，pending为空，无model hypotheses。真实body、loop/assigns、memory/RTE和调用义务按完整该函数选集检查。

没有新增axiom、assume、helper合同或lemma；原proof精确相同，模型锁也相同。所谓“没有引入未证抽象”仅指这项配置变化没有新增抽象性假设或未证辅助契约，不表示原exp其余helper/全global/whole-kernel已闭合。

## 保留的超时与诚实结论

最初两次generation01使用仅Qed简化归档完整1441目标，均在180秒预算到达后退出124，没有raw JSON；旧记录完整保留，不计0/0通过。之后另冻generation02计划，显式改用none只列目标，未减少目标或改proof。主核没有执行完整SMT campaign。局部leaf每轮180秒总预算、control90秒预算；所有输出限定审计目录。

两项配置拥有相同goalID，不表示公式或旧证明结果相同：errno从独立scalar转回Bytes heap后，读写别名和frame义务的公式可能改变。若主证明任务采用该配置，需要为新候选锁定该标准选项并实际重证整核、callee/global/call/termination和所有支持的RTE；不得把现有局部绿色或原配置结果移植为通过。尤其原public Bytes有效域没有自动证明有效类型/errno分离，本诊断也不替代这个新内存域下的整核证明。

WP仍不支持alignment/valid_function两类RTE，FMA/libc语义、native32 Bytes模型、工具链/SMT以及ISA到普通C的对应仍属既有TCB与范围。模型警告消失不是全部严格ISO C语义完备性证明。

完整机器可读最终状态、冻结SHA、CIL身份、所有证据SHA、控制、leaf和保留超时记录均在 `exp-errno-v68-config01/review.json`。所有实际命令均保存在相应log首行和summary，root可以据此在新名字/新日志位置独立重放；本次不自动推进正式收录。
