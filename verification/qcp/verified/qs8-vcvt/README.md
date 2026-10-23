# qs8-vcvt

本案验证修复后 NEON/RVV 的完整 C shim 调用链与公开比较入口。最终结果以 `proof/full-status.json`、`proof/assumption-audit.json` 和归档的普通 Coq 门禁为准。

共同规格覆盖所有 `int32_t multiplier`（包括 `INT32_MIN`）与所有 `int16_t` 输入、输出零点。对满足公开内存合同的长度 `1..2^64-8`，输入包含 7 字节可读 padding；两侧输出相同的逐字节量化结果，并保持输入、参数及空间 frame。固定 LP64、小端和 VLEN=128；RVV 三种向量类型的 VLMAX 均为 32，选择 `min(AVL,32)`。

修复记录在 `proof/repair.json` 和 `proof/repair.patch`：用无符号取负及明确的有符号16位截断消除 `INT32_MIN` 取负 UB；RVV 对精确乘积直接执行 RNU/15 位舍入，消除先倍增再截断32位的溢出。原件、原版反例、UBSan 结果与历史 Frama-C 的较窄参数范围均保留，不继承历史证明信用。补丁已按零模糊应用并逐字核对两份实现。

全部闭包包含 26 个实际 C 单元、72 个实际函数、1672 个单元 VC 字段和 15 个策略字段。字段数按翻译单元的 `VC_Correct` 接口计数，不等于独立语义义务数，也不等于新增 kernel 数。最终门禁从全部实际依赖 `.v` 源重新编译，不复用组件 `.vo`，不导入 VADD/BASE 证明；每个单元都显式检查 `Qs8I8Cvt.<actual_goal>.VC_Correct`，并输出全部字段的 `Print Assumptions`。本次普通 Coq 源编译共 240 个模块（239 个实际依赖模块，加最终门禁）；1687 项最终假设报告仅含已披露的继承假设。

NEON 的三个尾部表达式只接受冻结源码中的纯变量 `output`/`vy`/lane0 形状。实际适配 C 借用一次 `&vy`，逐字段复制八个有符号字节，再执行原始嵌套 reinterpret/store 表达式；原叶子函数、三个实际适配函数、六条通用字节数组/单元等价桥均进入门禁。旧的间接适配和直接按值调用版本因生成同址已初始化/未初始化重复资源而被拒绝，源码、目标哈希及诊断保留于 `proof/history/`。额外的语法筛查能抓住这些已知重复；它不构成通用 heap 可满足性定理。

独立 `__int128` oracle 同时测试原始嵌套前端和当前实际字段前端：每种 27496 次完整公开调用、每侧 1998725 个输出字节，含全部尾部边界、完整参数端点、随机参数、padding、输入/参数保持和 canary。两侧乘法同时改零的私有负控会使比较器同意错误结果，仍被独立 oracle 拒绝。本轮另重跑了 157155328 次标量检查；实际字段前端也已在实际 16 GiB cgroup（swap0）下通过 ASan/UBSan 和共错 oracle 负控；有限测试不代替全域 Coq 证明。

结论是显式内存条件下的 C-shim 部分正确性。未证明通用源码 AST、ISA/ABI 编译精化或终止性，不比较 QC/vxsat；未观察的 inactive C-shim 字段具体化为零，不宣称 ISA 尾部策略精化。

复现入口：

```sh
python3 proof/check_full.py --config <coq-flags.json> --jobs 16 --timeout 7200
python3 proof/record_status.py --dry-run
python3 proof/audit_relocation.py --proof-run <completed-full-run>
```

`record_status.py` 和 relocation audit 仅核查、归档已完成证据，不是另一次证明运行。

2026-10-23 类型宽度更正：旧 `unsigned long size_t` 在 QCP arch64 下实际被降低为 UINT32，与 native LP64 的64位不符。旧准入已撤回、所有原记录保留；本次正式使用 `unsigned long long`，native 下以 `QCP_NATIVE` 选择系统 stddef.h 的无符号64位 size_t。八个真实 sizeof C 函数已纳入统一普通 Coq 门禁，另在两个 native 预处理分支检查全部使用类型和 unsigned64 值域；未限制长度到32位。本次重新生成全部 C、策略、调用目标并统一 fresh 编译，不转移旧32位 C 证明信用。该类型投影不声称已经证明物理 ABI/ISA 编译精化。详见 `proof/type-width-repair.json`、`proof/type-width-status.json`、`proof/type-width-resolution.json`；旧失效记录见 `proof/model-width-invalidation.json`。
