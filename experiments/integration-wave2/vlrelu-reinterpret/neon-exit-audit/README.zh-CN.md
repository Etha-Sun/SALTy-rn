这次只读导出了 v14 的四个实际目标（无 solver），未修改 NEON worker 目录，未启动完整 WP。`provenance.json` 固定源 proof/frozen SHA，`command.json` 保存真实命令，`sequent.log` 保存完整上下文。

第一处是 NEON2 到 tailprefix 的标量投影。sequent.log:280 的真实退出界为：

```
to_uint64(2 + to_uint64(T - to_uint64(B/4))) <= k
```

但 :288 现有 extent cut 只有：

```
T = (B%8)/4 + to_uint64(2 + to_uint64(T - B/4))
```

这里额外的 `to_uint64(B/4)` 还需正规化。B=8/12 时 B/4=2/3；最小建议先加入局部 **checked** `(size_t)(batch/4)==batch/4`，再复用现有已证明纯整数 lemma。另一个可选办法是将 extent lemma/cut 写成精确的嵌套投影形式，并重证该 lemma 与 cut。不需添加 memory 公理。注意 sequent 中出现某条 cut 只表示当前目标会使用它，不能替代它自己的 VC 结果。

第二处是最终 `values_neon_all` 的 NEON1 ghost 循环。:1026 退出界仍为 `to_uint64(1 + to_uint64(T-1)) <= k1`，而 :1016–1024 给出 `k1<=T` 和最终内存 `mem3=mem0` 的输出 prefix。公开条件可推出 `0<T<=SIZE_MAX`，因此可以先检查一个局部 `(size_t)((size_t)(total-1)+1)==total`，再显式实例化现有 prefix 到目标下标。若投影已被别的策略闭合，就只做实例化，无需新增 lemma。

官方 `Wp.instance` 的 P1 参数已在固定本地 TacInstance.ml:25–26/129 核实。RVV v03 的两条真实脚本已证明同类实例化可用；下面是建议的 NEON 内存读取模式，**仅为未运行的模板**，应在真实 C 分支暴露后匹配实际同一 memory 的 prefix：

```c
\tactic("Wp.instance",
  \ingoal(P_same_value(repr_decode32(read_uint32(M,shift_float32(P,J))),T)),
  \when(Fact:(\forall integer K; 0<=K && K<N ==>
    P_same_value(repr_decode32(read_uint32(M,shift_float32(P,K))),E))),
  \select(Fact),\param("P1",J),\children(ValuesSMT))
```

最后的目标横跨 tail 分支；不要把未进入分支的 prefix 直接视为无条件前提。可按真实 tail 分支做官方 CASES，再在相应分支实例化。所有新增 cut/lemma/分支及原 high-lane transfer 依赖仍需实际闭合。本报告不声称 NEON 已验证通过。
