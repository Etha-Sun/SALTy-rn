RVV点式证明完整依赖诊断已通过：main172/172，全部global13/13，总185/185。原RVV向量值目标与prefix保持同时闭合。五private pre、实际helper body2/2、15RTE、所有新增循环/assigns/终止依赖均纳入本轮。此范围排除了旧NEON/harness值断言，尚非整核通过。

仅使用普通C不变的ghost点循环、入口slope快照；helper实参读取当前真实input[j]，不在ghost C中重算size_t地址。原prefix保持按任意lane是否为当前j分支，当前lane由helper post+Qed闭，旧lane由官方Wp.instance实例原prefix；最终forall也显式实例prefix。每条分支都有真实检查。

与merged-v02相比：rvv-only-from-merged-v02.patch只含RVV注释，shared-helper-hints-from-merged-v02.patch含一个已证source lemma、实际检查的ghost helper及策略。若NEON已导入同名同内容helper/lemma，合并时各保留一次。不能覆盖signed/store/caller既有策略。完整差异delta-from-merged-v02.patch。

sourceguard5740tokens通过，spec/ordinary C/shim/model/driver/checker不变，controls正通过负不通过，原solver30s/1GiB、par64、明确独立depth16配置。review.json内保存全部依赖/两真实TIP脚本及raw哈希。Gateway类别字符串匹配的missing提示不代表VC遗漏，root需独审实际命令与172raw。
