# qu8-rsum

完整 fresh 门禁已通过：21 个实际 C 单元、890 个 C VC、2 个策略字段；257 次普通 Coq 编译、892 项最终假设审查及 463 个外部 Coq 依赖身份复核均通过。正式发布及全局计数由 leader 处理。原 RVV C 文件逐字保留；NEON 只为适配固定版本 QCP 删除局部表的 `static` 和最后一个初始化元素后的可选逗号。32 个表元素、运算顺序及输入域均不变。原件、真实 0 VC parser 失败、精确补丁和原因保存在 [repair.json](proof/repair.json) 及 `proof/history/`；这两项是工具语法兼容问题，没有虚构语义反例。

[公开契约](spec.c) 比较两个实际 C-shim kernel 与共同的 modulo32 整数和：输出为 `u32(初始输出 + 所有输入字节之和)`。初始输出覆盖全部 uint32，输入覆盖全部 uint8；`0 < n <= UINT64_MAX - 15`，输入包含 15 字节已初始化 padding，输入、输出、params 持有分离的内存资源。输入、params 和其余 frame 保持。公开 wrapper 实际调用两侧 kernel 并比较输出。

RVV 固定 VLEN=128，e8m2/e32m8 的 VLMAX=32，e32m1 的 VLMAX=4，选择 `min(AVL,32)`。原程序中唯一 `vadd_tu(vacc,vacc,vt32,vl)` 使用单份累加器资源的实际 C adapter；[作用域审计](proof/frontend-scope.json) 固定了重复的两个实参均为同一个无副作用 lvalue。结论限定于这里公开的 scalar-field C-shim、QCP 内存契约和部分正确性；不声称 ISA、物理 ABI 精化或额外的终止定理。

完整 inventory 为 21 个实际 C 单元、890 个 C VC、34 个唯一函数 body，另有 2 个 byte strategy 字段。最终门禁会重新生成每个实际目标、验证声明与 body 合同及完整调用闭包、从源码普通编译全部必要 Coq 模块，并对全部字段做全限定 `VC_Correct` 类型检查与 `Print Assumptions`。历史组件证据不替代这个完整门禁。

独立原生 oracle 对同一组 21 个 actual C 单元在 UBSAN 和 ASAN 下各检查 990 个有限用例（33 个长度，1..8193，6 种输入模式、5 种初始输出）、每侧 1075860 个输入 lane，覆盖多种初始输出及边界、输入/params/canaries 保持；两个错误输出负控均按预期中止。ASAN 在真实 16 GiB cgroup 中运行。这些有限测试不代替全契约域的形式证明；形式证明来自完整 Coq 门禁。

已配置 QCP 2.1.4、Coq 8.20.1、`qcp-env` 和 GCC 后，可执行：

```sh
python3 proof/check_full.py --config /path/to/coq-flags.json --jobs 16 --timeout 7200
python3 proof/record_status.py --dry-run
```

检查器仅编译当前实际 typed roots 所需的源码，不引入未使用的 BASE87 模块。完整门禁成功后，`record_status.py` 校验证书与 14 项固定继承假设白名单，归档源/目标/日志及历史失败；`audit_relocation.py` 再检查迁移后的实时 CPP 身份，不冒充第二次 Coq 重放。
