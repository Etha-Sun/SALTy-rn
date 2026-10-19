# IGEMM 算术实例化 r2

相对 r1 仅给真实 body 的无 requires helper 加非零四倍数下界后置，并把调用移到 before_sub 断言之前。依据 pending-print01 原WP的 `0<v` 与 `v%4=0`，目标只有 `4<=v`。新后置必须自身检查，预期 helper 原始3义务（两个ensures、assigns），不是未证断言替代。

原 k 建立仍有独立 kc/KC 跨 frame 关系缺口，全部保留。原选定15义务加新后置为16；无整核通过声明。source-guard.json 已通过。
