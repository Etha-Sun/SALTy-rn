# 真正内联vld2q的独立执行候选

proof与v5完全相同。inline列表只新增真实vld2q_dup_f32，remove列表保持两kernel；helper定义保留。body为两个vdupq_n_f32调用，无自身循环，其vdupq循环已有原proof。

range-print01无solver退出0：原mc/mod4与MC现在同Mint_0，v5的入口havoc消失；尚不声称VC通过。实际body的两个p读取RTE须在调用点上下文检查。独立无requires的vld2q body对任意p可能不能证明read有效，不能将此隐瞒或补新requires。

下一命令：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/neon-frame-v6/run.py neon-frame-v6 range-root01 spn_mc_range 180
```
其他缺frame纯函数待逐个审计：vld2_dup_f32是当前未选中的非ARM64分支；prefetch已inline。不能把所有共享无assigns函数一口气inline掩盖范围。
