# qs8-vlrelu

本案验证修复后 NEON/RVV 的完整 C-shim 调用链和公开比较入口。最终证据为 `proof/full-status.json`、`proof/assumption-audit.json` 与 `proof/evidence/full-run/` 中的普通 Coq 源和日志。

公开域保留全部四个原始 `int32_t` 参数：输入零点、输出零点、正 multiplier、负 multiplier，包含 `INT32_MIN`。长度为 `1..2^64-8`，输入包含 7 字节可读 padding，两个可写输出各有 n 字节，并满足公开分离内存合同。两侧得到相同逐字节激活结果，保持输入、参数与空间 frame。固定小端、64位指针和 VLEN=128；e8m2/e16m4/e32m8 的 VLMAX 均为32，VL 选择 `min(AVL,32)`。

两侧原实现对正、负 multiplier 无条件执行有符号取负，`INT32_MIN` 在窄化前已触发 UB。修复用无符号32位取负和明确的有符号16位窄化，保留完整参数域；四项真实原版 UBSan 反例、原件身份、零模糊精确补丁和修复后重放全部保留于 `proof/repair.json` 及相关 evidence。NEON 另把两次纯常量 `vmovq_n_s16(0)` 提升为同一个 const 局部变量，解决 QCP 嵌套结构体返回时的 With 参数推断缺口；该记录与语义反例分别标明。

类型使用明确的 `unsigned long long size_t`，native 的 `QCP_NATIVE` 分支使用系统 stddef.h 的无符号64位 size_t。八个真实 sizeof C 函数纳入完整门禁；另检查两个 native 预处理分支的使用类型和 unsigned64 值域。旧 `unsigned long` 被 QCP 降低为32位的历史目标及失效记录仍保留，不复用其证明信用，也不把公开长度缩到32位。

完整闭包包含34个实际 C 单元、85个实际函数体、2192个单元 VC 字段和5组策略的15个字段。字段数按翻译单元的 `VC_Correct` 接口计数，不等于独立语义义务数，也不等于新增 kernel 数。所有296个依赖模块和最终门禁共297次普通 Coq 编译都来自本轮新目录，没有复用组件 `.vo`；每个实际 C 单元都有显式 typed Module 检查，全部2207项 `Print Assumptions` 只含已披露的14项继承假设，没有新增项目 axiom。

NEON 尾部只接受冻结源码中三个纯变量表达式形状。实际适配 C 借用一次向量地址，逐字段复制八个字节，再执行原始嵌套 reinterpret/store；叶子函数、适配函数与数组/单元桥都进入门禁。语法重复资源筛查针对已知问题，不构成通用 heap 可满足性定理。

独立 `__int128` oracle 测试实际31个字段 provider、两侧修复实现与公开比较器，并另测数组 runtime。每个前端分别在 UBSan 与 ASan 下通过17940个用例、每侧7187700个输出元素及33280次标量检查，检查输入/参数保持、padding 和 canary。ASan 使用实际16 GiB cgroup、swap0。两侧同时算错的私有负控仍被独立 oracle 拒绝。另有真实 C 的错误 sizeof=4 后置条件被普通 Coq 拒绝，以及正确 sizeof=8/不等于4、私有源码篡改身份拒绝的控制记录；这些有限控制不代替全域证明。

结论为显式内存条件和固定配置下的 C-shim 部分正确性。终止性、通用源码 AST、物理 ISA/ABI 编译精化和 QC/vxsat 不在结论内；未观察的 inactive shim 字段具体化为零，不宣称 ISA 尾部策略精化。

复现入口：

```sh
python3 proof/check_full.py --config <coq-flags.json> --jobs 16 --timeout 7200
python3 proof/record_status.py --dry-run
python3 proof/audit_relocation.py --proof-run <completed-full-run>
```

`record_status.py` 与 relocation audit 仅核查、归档已完成证据，不是另一次证明运行。完整门禁默认16并发、每进程16 GiB；有限 native 测试和发布迁移检查也分别保留身份及日志。
