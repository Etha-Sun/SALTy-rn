# 2026-10-20 当前整合检查点

工作分支为 `feat/shim-c`。本轮去重处理17个kernel；`verified/manifest.json`仍为原15项，新增候选整核通过1项（f32-vlrelu已两次770/770，打包canonical未完成前manifest不变）。逐项结果在[STATUS](STATUS.zh-CN.md)，不能把不同proof快照的局部计数相加。

## VLReLU

- `vlrelu-reinterpret/merged-values-v02`与`merged-values-v02-independent`同一proof `d5b18b2b…`的完整raw均为729/735：主目标708/714、globals21/21。第二次supervisor在最终post-audit阶段截止，保留其timeout状态；已落盘raw不丢弃，也不称为成功canonical。
- 主目标与无prover独立枚举714项逐个ID匹配。source guard、第一份完整model post-audit和LLVM identity通过；root另复查四份model lock的34307个不同文件，无漂移。
- `merged-values-v02-depth8`完整raw为727/735，额外两项内存义务未闭。最终整核继续用depth16；实时`[Valid]`行含终止等辅助消息，不是主目标计数。
- 六项原缺口中的主4lane prefix，在`vlrelu-mainprefix/v02-filter-depth8`实际2/2+globals21/21通过。只给原谓词命名并加过滤策略，未增加语义假设；root已审。
- 最终读取权限在`vlrelu-final-reads/v04-helper-order-callers`的exact proof `c4e76461…`闭合。独立窄scope13项加同snapshot的frame1项，合计14/14；含空ghost helper body/frame、六个调用前件、n+3无wrap cut、原point以及四条whole range invariant。globals21/21、模型控制合格。旧195项broad scope超时记录保留，不冒充通过。
- 四个frame/value缺口在 `vlrelu-mainframe/v07-exact-instance` 的同一 proof `d63b30dd…` 实际关闭：caller64/64（36RTE、18privatepre、10assert），helper body/frame6/6，globals21/21，正负控制合格。新增两次transfer调用的6条参数RTE都通过。Root复核raw、命令、artifact SHA和sourceguard；旧v06和未运行v08均不冒充成功。
- 最终合并 `vlrelu-final-merge/v02` 冻结为唯一 proof `31eda107…`。新full完整 **770/770**（main749/749+global21/21），36个body coverage齐全，model/source posthash、control、LLVM与749独立ID清单均通过。36函数体不是36条义务，其RTE/callpre/frame也在749中。
- 同proof `v02-independent` 第二次完整 **770/770**，1519.905秒；所有770目标ID与第一份相同，root复核posthash/control/LLVM均通过。第一份1478.463秒。此前d5版本的timeout和失败不改写。
- `vlrelu-mainframe/shards-v03` 是额外8片实际诊断，749/749无重复遗漏，globals21/21引用相同snapshot，root独审通过。它不替代完整或打包canonical；旧两个CLI负参数调用错误保留，不是模型/证明失败。
- 新包 `verified/f32-vlrelu` 是23个冻结原文件的逐字复制，加单一 `proof.patch`，frozen SHA `06c50d51…`。两次整核已通过，但manifest尚未准入；`vlrelu-final-merge/v02-canonical` session71394正在对打包源做fresh完整检查，128路/30s1024/admin3600。启动前漏放Gateway要求的draft副本的两次环境错误已记录，未启动WP、不算proof失败；已补齐精确SHA副本后正常运行。
- Git检查点 `bc0fb840`、`91b5d55a` 均已推送 `origin/feat/shim-c`；完整raw和新包在后者之后，待下一次提交。额度16:22UTC检查为57%，下一轮16:52UTC；低于55%停止新补证、保存收尾，既有有限CPU检查可以完成。

## 其它本轮补证

`qs8-vmul-minmax-fp32/v12-byte-bounds`实际body14/16，新caller pre2/2；精确关闭原4条索引义务及新增循环义务。两条byte memory RTE仍未证；没有重新整核，旧825/877计数不改写。Root已核对同proof与控制。

`vrndne-proof-pass`没有可接收的原待证净关闭：两个join虽显示passed，但依赖尚未证明的新cuts。其余候选的真实结果与失败原因全部保留；未把它们选作已完成实现。

## 运行与准入

普通C、公开spec/wrapper、shim、driver、模型、checker冻结。只补proof和实际接受WP检查的ghost helper；本轮不调用DeepSeek API。Gateway仅用于本地验证进程管理。

用户允许充分使用CPU。重点任务`-wp-par 128`，单目标仍30秒/1024MiB；新完整批次的行政预算可取原用户允许的3600秒，旧profile不反写。WP内部仍有串行阶段，增加solver并行数不能消除它。模型/工具安装在外部缓存，fresh clone不是已配置环境。

`quota_watch.py`每1800秒查询用户的quota函数。低于55%或查询失败即关闭新任务门禁，agent保存工作收尾；已运行的有限CPU检查可自然结束。监控session48514，实际结束整轮后才创建`MONITOR-DONE`。

最终必须对统一proof做新的完整检查和独立审计，再对打包版本做fresh canonical。全部caller/helper/global、调用前件、RTE、frame、循环/终止检查通过前不改verified清单。检查的是声明的C模型，不能据此宣称ISA到shim已经证明。

Checkpoint只选择本目录和`checkpoint-dependencies.json`列出的必要文件；保留根`.gitignore`、maxpool provenance及其它历史本地工作，不使用`git add .`。
