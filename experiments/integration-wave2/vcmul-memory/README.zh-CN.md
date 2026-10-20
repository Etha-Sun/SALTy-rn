# vcmul 主程序 memory / frame 审查

推荐最终 proof 种子仍是 `noncomplex/f32-vcmul/v07`，其 helper TIP 证明保持原样；**不整体移植本目录新增的大量未闭合不变量**。本轮没有新增整核通过。

所有版本只改 proof；普通 C、公开 spec、model、driver、checker 和 30 秒 / 1024 MiB 原限制保持。v01 独立保存 v07 种子并过 sourceguard；v02 加入口 label、两数组与输出 separation、只读输入、两半输出范围和 wrapper equality invariant，完整 raw 425/471；v03 再补真实入口有效性，针对 callpre/assigns/readonly 诊断 raw 148/174。两个结果范围不同，不能相减宣称净进步。

原核心 memory/caller/assigns 并未独立闭合。v03 第一侧入口有效性和简单 separation/origin 等关系可证，但第二侧入口有效性仍依赖第一侧未完成的 frame，四个只读保持目标仍欠；这批尝试作为后续诊断保留，不应给最终简洁 proof 增加无收益负担。

本轮最重要的可审查产物是 [address-audit/README.zh-CN.md](address-audit/README.zh-CN.md)：实际完整 Why3/context、1146 行 SMT、相同模型的最小 C probe、保持现有物理地址 inverse/null 约束的总双射反模型，以及 Z3 检查的换位保持性。它说明当前模型尚未表达目标 ABI 的非零整数地址加法与 typed shift 的对应，不能靠多写循环不变量补出这条规则；不是 kernel 的真实功能反例，也不是数学上永远无法证明。

三条最初的 ai/bi/oi 起点 VC 原样保留。之后的 array/store frame 若借助这些未证 cuts，只能视作条件性片段，不构成整核验收。

逐版本 SHA、实际 raw 路径与完整 pending 列表见 checkpoint.json。所有失败、超时、probe 与未采用 proof 均保留，没有添加假桥、公理或公开前置条件。
