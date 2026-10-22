# 已检查的 NaN 比较桥

结论：不修改已安装 QCP、不限制 NaN 合法域，使用真实 identity C 函数及已证明契约，可以避开当前 QCP 对语法自比较 `x!=x` 分支生成的 False safety VC。

## 实现与证明

`bridge.c` 含三个实际 C 函数，而非仅有外部声明：

- `preserve_float(x)` 的实现为 `return x`，契约为 `bit_same(__return,x)`，其中 `bit_same` 是 Coq 相等，已检查实际函数 body。
- `check_observation(x,y)` 取得 `xc=preserve_float(x)`、`yc=preserve_float(y)`，然后真实执行 `x==y` 或 `x!=xc && y!=yc` 比较。其前提是 `same_value(x,y)`，后置 `returned_one(__return)`；`returned_one(r)` 定义就是 `r=1`。
- `same_lane(x,y)` 调用上面的 checker，公开后置直接为 `__return==1`。它的前提仍为 `same_value(x,y)`。

所有 14 个生成 VC 均在 `bridge_checked.v` 中用 Coq 完成，包括 identity body、两个失败返回分支不可达、实际比较器及公开 return1 包装。**形式化 checker 证明只保证满足 same_value 的输入返回 1**；没有将它描述为任意不等输入返回 0 的完整规格。

`BridgeLogic.identity_comparison_preserves_observation` 对任意 x、y 成立：只要 xc、yc 分别满足已证明 identity 契约，用它们替换自比较的一侧后，原 C 观察条件与改写后的观察条件等价。该纯 Coq 定理为 closed。它与 identity 的实际 body 证明一起构成原观察表达式到 QCP 友好表示的桥；没有用未证明的 extern 函数契约替代 implementation。

`ListBridge.v` 另提供泛型 `related_nth`、`related_nth_error`、`related_Znth`：从任意 Forall2 R 关系取索引仍满足 R。这些定理全部 closed，可用于 vadd 比较循环，不绑定本目录的 same_value 名称。

## 复现与证据

运行 `python3 verification/qcp/experiments/nan-bridge/run.py`。它重新生成实际 C 的 VC，要求与已检查原始目标逐字一致，拒绝手写证明中的 Admitted/axiom，再编译四个 Coq 文件并执行原生比较。

`status.json` 记录成功结果、命令、日志及 source hashes。本次 14 个 VC 通过；5264 对原生输入的改写结果与原表达式一致，包括 NaN、无穷、±0、次正规数及随机 bit patterns。将 identity 实现改成返回零的负对照，在不等有限值输入上被检测。

纯桥接引理及大部分返回 VC 为 closed；使用栈模型的 safety/partial VC 保留 QCP 的 eval_addr_expr 参数与标准函数外延公理，详见 Print Assumptions 日志。没有新增 axiom/Admitted。

## 原始阻塞的定位边界

`qcp` 是直接指向官方 release symexec 的符号链接，不是附加错误 flags 的脚本。`isnan32.c` 的最小自比较在正常、legacy、reserved、conassertion 模式仍产生 False safety VC；`mode-results.json` 保存命令。full-auto 模式不输出可检查 Coq 工件，其“automation success”消息不计入证明证据。

通过 identity helper 将语法上相同的两个操作数改成具有已证明等值关系的独立符号后，所有 NaN 路径可正常生成并用 Coq 处理。该受控实验表明桥接确实解决了当前表达式表示的兼容问题；本目录不声称已定位或修复 QCP 内部具体源代码。官方仓库公开的说明列出预构建 executables 与证明库，当前安装包也未附带 symbolic executor C 源码：[官方仓库](https://github.com/QinxiangCao/QualifiedCProgramming)。

此成果不等于 vadd 两个 kernel body 或公开 equivalent 整个比较循环已经证明。数组读取/重组策略、循环不变量、kernel body 契约与原始 mapper 到 QCP 表示的其余对应关系仍由上层框架分别处理。浮点异常标志不在原观察规格内。
