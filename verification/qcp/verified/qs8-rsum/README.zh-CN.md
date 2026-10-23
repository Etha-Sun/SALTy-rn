# qs8-rsum

完整 fresh 门禁已通过：21 个实际 C 单元、890 个 C VC、34 个唯一函数 body，另有 2 个 byte strategy 字段；256 次普通 Coq 编译（255 个必要源码模块及最终门禁）、892 项最终假设审查、463 个外部 Coq 依赖身份复核均通过。观测到的继承假设正好是已审核的 canonical14；没有新的项目公理。正式发布与全局计数由 leader 维护。

[公开契约](spec.c) 的共同输出为 `s32(Init + 所有输入字节之和)`，即先按数学整数求和再取 modulo 2^32 的 signed32 代表。Init 覆盖全部 int32，包含负数、INT32_MIN/MAX；不把初始输出设为零，也不缩小输入字节域（全部 int8）。`0 < n <= UINT64_MAX - 15`；输入包含 15 字节已初始化 padding，输入、单个输出、params 及其余 frame 持有分离资源。输入、params 和 frame 保持。公开 wrapper 实际调用两侧 kernel 并比较输出。

两份原件的最后一步 `*output += sum` 在合法的 `Init=INT32_MAX, n=1, input[0]=1` 上发生 signed32 C overflow；真实原版 UBSAN 反例、原件 SHA、精确逐侧补丁和原因见 [repair.json](proof/repair.json) 与 `proof/original/`。修复先做 unsigned32 加法，再显式转为 signed32，覆盖完整原始 Init 域。NEON 还删除局部表的 static 及最后一个可选逗号，以兼容固定 QCP parser；这些语法问题有真实 0 VC 失败记录，没有虚构语义反例。

RVV 固定 VLEN=128：e8m2/e32m8 的 VLMAX=32、e32m1 的 VLMAX=4，选择 `min(AVL,32)`。唯一 `vadd_tu(vacc,vacc,vt32,vl)` 使用实际 C 单资源 adapter；[frontend 作用域](proof/frontend-scope.json) 固定了重复实参为同一个无副作用 lvalue。结论限定于公开的 scalar-field C-shim、QCP 内存契约及部分正确性；不声称 ISA/物理 ABI 精化或额外终止定理。

完整门禁重新生成了每一个实际 C 与策略目标，核对当前 CPP、原件/补丁及全部声明/body 合同和调用闭包，从源码普通编译全部必要依赖，再做全限定 `VC_Correct` 类型检查与全部字段的 Print Assumptions。没有复用组件 .vo，也没有引入未使用的 BASE87 模块。

旧的 117 字段部分调用接口曾覆盖完整聚合文件，导致一份“完整126”组件收据写得过早。完整门禁真实拒绝了它；旧收据已 invalidated，源码、日志和拒绝原因保存在 `proof/history/rejected-partial-neon-interface-44a1a34f67a0a2ae/`，两次旧 whole 失败也保留。本次恢复了真正的 126 字段接口（117 调用及 9 个循环/返回），经独立精确 typed gate 及整案 fresh 重放通过；旧 partial 收据不作为准入证据。

独立原生 oracle 对同一组 21 个 actual C 单元在 UBSAN/ASAN 下各检查 990 个有限用例（33 个长度，1..8193，6 种输入模式、5 种初始输出）、每侧 1075860 个 lane，并核查输入/params/canaries；两个错误输出负控按预期中止。ASAN 使用真实 16 GiB cgroup。有限测试不替代全契约域的形式证明。

配置好 QCP 2.1.4、Coq 8.20.1、qcp-env 和 GCC 后，可运行：

```sh
python3 proof/check_full.py --config /path/to/coq-flags.json --jobs 16 --timeout 7200
python3 proof/record_status.py --dry-run
```

record_status.py 校验完整证明并归档原始源/目标/日志及全部历史失败；audit_relocation.py 对迁移后的实时 CPP 和已编译源码身份做独立核对，不冒充第二次 Coq 重放。
