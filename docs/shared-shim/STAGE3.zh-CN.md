# 第三阶段：九个复杂 kernel

本阶段从本地 `3b96d1a` 开始。用户授权尝试GEMM类3项、卷积类3项、池化类2项、稀疏乘法1项；允许本地commit，未经再次授权不push。原始target、公共规格、冻结模型、旧checker和历史结果保留。

| 组 | Kernel | 新证据目录 |
|---|---|---|
| GEMM | f32-gemm-minmax、f32-igemm-minmax、qd8-f32-qc4w-gemm-minmax | `experiments/shim-c-v2/stage3-gemm/` |
| 卷积 | f32-conv-hwc2chw、f32-dwconv-minmax、f32-dwconv2d-chw | `experiments/shim-c-v2/stage3-conv/` |
| 池化/稀疏 | f32-maxpool、f32-argmaxpool、f32-spmm-minmax | `experiments/shim-c-v2/stage3-pool-spmm/` |

三个worker分别拥有独立目录，每组串行执行，`wp-par=1`。首轮300秒用于识别具体目标；根据失败实际修正proof后，对重点候选另建冻结版本和run，将预算增至1200秒。独立执行适配器只调整并发度/资源预算，保留实际命令；不能凭自定义运行结果跳过正式严格验收。

当前工作是补真实FMA累加器关系、packed权重/输入游标、行/列/通道归纳、索引和loop assigns/frame，所有新lemma/helper仍必须证明。源代码守卫通过只表明没有改实现/公开规格，不等于这些证明注释已经成立。

`stage3-audit/`保存主agent的有限原生反例搜索。使用实际冻结的模块化shim及公开wrapper，9项两轮均未发现输出差异或ASan/UBSan报告。第二轮包含浮点位模式、极端量化整数及多pixel池化。这些测试不能替代任意合法输入的形式证明。

“未证”不等于“target错误”。只有可复现的实现错误才能据此另建修复target、重新冻结再证明；当前没有据本轮测试发现新反例，不修改冻结C来消除困难。当前Typed表示/地址缺口也不会靠增加假设、限制NaN或放宽输出关系绕过。

本阶段新增整核通过仍为0。完整尝试缺少body报告时，计数和pending保持未知，不记录为0/0；仅global或定点通过不计入整核。逐版本执行状态分别见三个组的RESULTS/STATUS；主agent的最终源代码、proof SHA和raw审计见 `stage3-audit/root-audit02.json`，阶段汇总见 `stage3-audit/RESULTS.json`。

局部证据（不是整核通过率）：

| Kernel | 已获得的局部证据 | 仍未完成 |
|---|---|---|
| f32-gemm-minmax | r4定点4/7：FMA同余、seed/step及NEON初始关系通过 | 累加保持、RVV关系、uintptr/frame及输出 |
| f32-igemm-minmax | r4定点4/7，含已证FMA同余 | indirection与两层累计、内存frame及输出 |
| qd8-f32-qc4w-gemm-minmax | r2选择5个真实helper body与RTE，66/71 | bits_i8及memcpy、移位溢出、vand前缀；下游仍依赖未证合同 |
| f32-conv-hwc2chw | 6个实际整数helper 91/91；主游标定点4/5 | RVV游标保持、halo/多层累计及输出 |
| f32-dwconv-minmax | revision5定点5/5；完整尝试仍属于revision4 | 权重地址与循环、完整输出 |
| f32-dwconv2d-chw | revision2定点6/9 | 滚动行缓冲、边界与内存关系 |
| f32-maxpool | 新增VL/减法/store游标切分点6/6 | 原游标保持尚未对照闭合，完整归并/clamp输出 |
| f32-argmaxpool | 修复工具后原raw配置定点1/6，不再报类型错误 | 其余5项及获胜value/index、tie和内存关系 |
| f32-spmm-minmax | 含errno的frame-v3定点4/6，内层delta步进建立/保持通过 | nnz界保持、weight及外层prefix游标；累加与输出 |

新增的FMA同余lemma、loop frame或helper合同均需自身验证；FMA同余已在r4局部检查通过，其他未证依赖仍保留。某个调用方VC通过不能替代这些依赖自身的证明。qd8追加r3/r4算术候选仍有未证全局引理，即使helper计数改善也不计有效提升，最佳可用局部证据仍为r2的66/71。1200秒长跑用于实际检查修订候选，不意味着未证目标只是算力问题。

## 独立工具修复

argmaxpool原始 `assert(!ab)` / `assert(!ib)` 触发了真实WP翻译错误：逻辑非结果是int，旧前端错误地据此把指针与整数0比较。缩减用例还复现了浮点逻辑非错误。新 `stage3-unary-front/` 仅修复值上下文的逻辑非类型选择及native IEEE零比较；旧源码/安装/锁全部保留。

修复经独立源码审查、raw/typed正反控制、IEEE/FMA回归及已收录f32-vadd完整571/571复验，详见其 `ACCEPTANCE.json` 和 `stage3-conv/unary-front-review.json`。这不证明整个工具链正确，也未解决uintptr或float/memcpy桥。真实argmaxpool新工具完整300秒仍超时，无body报告；global5/5不能当作通过。

原正式清单仍为已收录11、未证26、缺target3；`verified/manifest.json`和历史总表保持不变。本阶段允许本地commit，未获push授权。

## 地址桥的隔离证据

`stage3-audit/address-diagnostic/`在两种Typed配置中均证明了原样pointer/uintptr往返和普通typed指针加法；加字节偏移再转指针仍timeout，故意错误的往返目标未通过。只读模型定位显示，现有物理地址接口有原样往返关系，却没有直接连接整数偏移与typed shift的关系。此结果不等于已证明不可表达，但说明共享地址桥需要独立研究与验收，不能简单补未经证明的axiom或任意延长solver等待。

## 2026-10-19：完整义务清单与短时筛查

针对上述九个已补过 proof 的候选，新增独立只读 WPO 观察插件，先不求解生成完整清单，再分别短跑实际 helper、主 wrapper 和全局 lemma。完整清单已取得，合计 **10807 项逻辑义务**；CFG 自动项另列。conv-hwc2chw 首次180秒盘点超时，独立重试237.460秒成功，原失败保留。原 C、公共 spec/wrapper、proof、模型和旧 checker 均未修改。

结果和逐项状态见 [完整汇报](../../experiments/shim-c-v2/stage3-inventory/REPORT.zh-CN.md)、同目录 `RESULTS.json` 及各 kernel 的 `stream01/OBLIGATIONS.tsv`、`REPORT.json`。流式结果使后续整批超时也能保留已完成的 verdict；完整清单仍需正常退出与覆盖检查，部分事件不能当作整单。conv 两个无求解结果的事件存在属性名后缀差异，单列且不移植结果。

此处“完整”只指义务盘点，不是严格证明验收。短跑使用Z3单目标1秒，整体生成/化简和求解仍有外层预算；未完成求解的目标、timeout、unknown分别保留。通过项仍可能依赖未证的 callee 合同/全局引理，不能据此计整核通过。本阶段新增整核通过仍为 **0/9**，正式 manifest 不变；没有据这些超时认定 target 有错误。后续修改 proof 后必须重新生成、核对和实际复验，不能沿用旧绿色计数。
