# 最终收尾合并草稿 v01：未冻结、未验证

本目录没有 task.json、正式 frozen.json 或 verified 条目；没有启动 WP。`run-proposed.json` 只记录下一完整运行拟定参数：depth16、shell逐目标日志、par128、每solver30秒/1024MiB、行政3600秒、无函数/属性子集。

以 `merged-values-v02` 实际运行 proof **d5b18b2b...** 为精确基底，使用 `vlrelu-final-reads/v04-helper-order-callers` 的实际 annotated（proof **c4e76461...**），保留其真实 read helper、count cut 和两个 caller ghost call；再合入已经 root 检查的主4lane prefix 名字和 MP4Filter 策略。helper 本来位于 harness.c，不移动定义顺序。

`merge_draft.py` 只进行固定来源的离线合并，可从仓库根目录执行。所有 proof 身份来自 `attempts/0001/proof.patch`，同时检查对应 fresh source guard、attempt frozen 和每个 annotated 文件 SHA。只去除完整 #line 元数据。`merge-audit.json` 保存来源证据、root检查记录、全部21条唯一global清单和输出 SHA。

相对 d5b18 基底只改变 neon.c 和 harness.c，其余18个 C/H/driver文件在移除#line后逐字一致。全部冻结原文件 SHA 已核对；20个工作文件中所有 C/H 普通 token 不变；公开 spec、shim、driver 与原冻结文件逐字相同。唯一 `draft/proof.patch` 对原冻结源码生成；`patch-roundtrip.json` 记录以 fuzz=0 真正应用后，20个文件与work逐字一致。这些离线检查不能代替新候选的正式 source guard、LLVM 和全部证明。

已有局部来源证据不继承为新合并证明：prefix 2/2；同 read proof 的新依赖 raw 13/13（whole-valid/separated不变量、count、两个caller六个前件、点read断言、helper ensures）。该13项未穷尽新helper/caller的frame、assigns、termination及RTE，最后精确补验仍由另一worker进行；旧195项broad运行超时没有完整结果，不能补成成功。

完整运行已知的四个待证断言 **assert11/12/21/22** 均保留原样，等待 frame/value 最小delta，不删除任何假设或义务。root 合入稳定delta、核对所有新增依赖后，才能冻结新完整profile并重跑所有实际caller/helper/global/control/closure及实现身份检查。
