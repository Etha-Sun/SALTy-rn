# k 建立公式审查

k-why3-export03 使用 -wp-gen + print-generated 只生成Why3，exit0，没有solver。Globals里kc=9217、KC=9228、nc=9216、tmp=9235；memaddr.mlw 的 global(b) 定义为base=b,offset=0 record。因此相异槽地址的事实已经存在，不能归因模型缺该公理。旧打印目标跨Mint_8与Mint_0更新，可能是大上下文简化/实例化或cast，尚未确定。

k-smt01的-wp-gen没有SMT输出：ProverWhy3在Generate分支提前return，未到driver。k-why3-export02因误把debug类别传给整数-debug选项失败，记录保留；03改msg-key后成功。不能把Why3打印称为SMT。若正常root求解再加 -wp-debug 1 -wp-msg-key prover:pp_task -wp-out 新目录，会在solver启动前导出真实SMT。旧模型/driver未改。
