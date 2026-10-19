# 已检查的共享整数模投影证明

`cint_mods.mlw` 62 行，在原 Cint 定义之上，用有实际递归 body 和终止 variant 的 lemma 证明 uint/sint 16、32、64 位投影等于 Euclidean modulo；第七个结论是 centered16 包装恒等式。范围是任意数学整数，未限制 kernel 参数来换取通过，未新增公理。

`check01.jsonl` 七项全部 Valid；`tasks/` 保存对应原始 SMT 目标，`evidence.json` 锁住源码、工具、依赖与命令。

`cint-extended.mlw` 将这七项添加到官方 Cint 完整模块。`extended01.jsonl` 对整个模块重新检查 54/54 Valid（原定义/引理与新增结论都包括）；摘要与 SHA 见 `extended-evidence.json`。root 已另行重放并将此候选复制进冻结 model-plus，旧模型树保留。

这些只证明共享整数数学结论，不等于任何 kernel 已完成。每个 kernel 仍须闭合自身的完整内存、循环、函数合同和最终输出相等目标。
