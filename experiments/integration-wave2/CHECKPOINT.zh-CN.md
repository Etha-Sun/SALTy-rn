# 2026-10-20 当前整合检查点

工作分支为 `feat/shim-c`。本轮去重处理17个kernel；`verified/manifest.json`仍为原15项，新增整核通过0项。逐项结果在[STATUS](STATUS.zh-CN.md)，不能把不同proof快照的局部计数相加。

## VLReLU

- `vlrelu-reinterpret/merged-values-v02`与`merged-values-v02-independent`同一proof `d5b18b2b…`的完整raw均为729/735：主目标708/714、globals21/21。第二次supervisor在最终post-audit阶段截止，保留其timeout状态；已落盘raw不丢弃，也不称为成功canonical。
- 主目标与无prover独立枚举714项逐个ID匹配。source guard、第一份完整model post-audit和LLVM identity通过；root另复查四份model lock的34307个不同文件，无漂移。
- `merged-values-v02-depth8`完整raw为727/735，额外两项内存义务未闭。最终整核继续用depth16；实时`[Valid]`行含终止等辅助消息，不是主目标计数。
- 六项原缺口中的主4lane prefix，在`vlrelu-mainprefix/v02-filter-depth8`实际2/2+globals21/21通过。只给原谓词命名并加过滤策略，未增加语义假设；root已审。
- 最终读取权限在`vlrelu-final-reads/v04-helper-order-callers`的exact proof `c4e76461…`闭合。独立窄scope13项加同snapshot的frame1项，合计14/14；含空ghost helper body/frame、六个调用前件、n+3无wrap cut、原point以及四条whole range invariant。globals21/21、模型控制合格。旧195项broad scope超时记录保留，不冒充通过。
- 未冻结合并草稿在`vlrelu-final-merge/v01`，single proof `01bd477c…`。普通C/spec/shim/driver不变，patch roundtrip通过。尚无正式task/frozen，没有WP或verified准入记录。
- 剩四项是NEON4/2各一条store-read `same_float`和逐点`same_value`。`vlrelu-mainframe/v06-caller`及同source的`narrow01`正在检查两新point helper与caller；只有全部新增前件/RTE/frame和原目标实际关闭才允许合入。

## 其它本轮补证

`qs8-vmul-minmax-fp32/v12-byte-bounds`实际body14/16，新caller pre2/2；精确关闭原4条索引义务及新增循环义务。两条byte memory RTE仍未证；没有重新整核，旧825/877计数不改写。Root已核对同proof与控制。

`vrndne-proof-pass`没有可接收的原待证净关闭：两个join虽显示passed，但依赖尚未证明的新cuts。其余候选的真实结果与失败原因全部保留；未把它们选作已完成实现。

## 运行与准入

普通C、公开spec/wrapper、shim、driver、模型、checker冻结。只补proof和实际接受WP检查的ghost helper；本轮不调用DeepSeek API。Gateway仅用于本地验证进程管理。

用户允许充分使用CPU。重点任务`-wp-par 128`，单目标仍30秒/1024MiB；新完整批次的行政预算可取原用户允许的3600秒，旧profile不反写。WP内部仍有串行阶段，增加solver并行数不能消除它。模型/工具安装在外部缓存，fresh clone不是已配置环境。

`quota_watch.py`每1800秒查询用户的quota函数。低于55%或查询失败即关闭新任务门禁，agent保存工作收尾；已运行的有限CPU检查可自然结束。监控session48514，实际结束整轮后才创建`MONITOR-DONE`。

最终必须对统一proof做新的完整检查和独立审计，再对打包版本做fresh canonical。全部caller/helper/global、调用前件、RTE、frame、循环/终止检查通过前不改verified清单。检查的是声明的C模型，不能据此宣称ISA到shim已经证明。

Checkpoint只选择本目录和`checkpoint-dependencies.json`列出的必要文件；保留根`.gitignore`、maxpool provenance及其它历史本地工作，不使用`git add .`。
