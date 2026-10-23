# s8-vclamp：修复后的 C shim 等价验证

完整门禁验证原始 NEON 实现与修复后的 RVV 实现，在公共入口契约下产生逐字节相同的输出。`RawLo`、`RawHi` 覆盖所有有效 int32 参数，使用其截断后的有符号字节值，不要求 min≤max。完整记录为 `proof/full-status.json`（运行 `.build/full-r8b58urd`，SHA256 `45f3dd5b2088152a2f0f8d666f212025df282cfb56e369e309867f67c44e9124`）；当前验收状态由 `proof/status.json` 记录。

共同契约要求 `0<n<=18446744073709551608`，输入有 n+7 个可读有符号字节，两个输出各有 n 个未初始化字节，参数字段为有效 int32 对象；这些内存按分离逻辑契约提供。输入和参数保持不变。模型固定 64 位指针、小端、RVV VLEN=128、SEW=8、LMUL=8、VLMAX=128，选用 `vl=min(AVL,128)`、vstart=0。

原 NEON 的前 `floor(n/64)*64` 个元素按 max→min 处理，剩余元素按 min→max 处理。原 RVV 始终按 max→min，因此 n=1、输入0、min=1、max=0时，NEON输出1，原RVV输出0。修复将 RVV 的 bulk64 和尾段顺序与 NEON 对齐，保留原始 NEON 字节及完整公共参数范围。原实现 SHA、修复 SHA、精确补丁、修复来源和反例保留在 `proof/repair.json`、`proof/repair.patch`、`proof/originals.json` 及对应 history 记录中。

`repair.json` 中的 `qcp_verified:false` 保留修复创建时的历史状态；完整验收后的当前状态以 `proof/status.json` 和其绑定的完整门禁记录为准。

| 实际 C 单元分组 | 字段数 |
|---|---:|
| 标量 min/max、截断、setvl | 9 |
| NEON 向量、EXT、读写及真实尾部 byte-view/store | 293 |
| 128-lane RVV 算术、读取和写回 | 1431 |
| 原 NEON kernel / 修复 RVV kernel | 248 / 63 |
| 公共 comparator、caller、assert | 16 |
| 合计 | 2060 |

统一检查覆盖12个实际 C 单元、41个真实函数体，声明、签名和 Require/Ensure 完全一致，调用闭包无缺失 callee。六种本案策略共16个字段单独检查。所有161个本案模块、87个 BASE 依赖模块和最终门禁共249个普通 Coq 模块，从 `.v` 重新编译；最终门禁显式使用 `S8Clamp.<actual_goal>.VC_Correct`，打印全部2060个 C 字段和16个策略字段的 Assumptions。本案没有新增 axiom、Parameter 或 Admitted。QCP、Coq、SL/Flocq 等外部安装库属于记录的环境依赖。

有限原生回归每个版本检查19044个完整调用样本、每侧3667557个 lane；原版重现6420个差异，修复版为0。另检查16777216个标量字节三元组、错误 comparator 负控及输入/参数/输出 canary。实际 scalar-field RVV shim 还通过8454144个算术、99072个内存和136192个完整修复 kernel 调用；尾部 byte-view/store 检查262144个样本，覆盖2/4字节、偏移1/2及表达式单次求值。这些有限回归保留为独立证据，不加入 Coq VC 数量。

证明范围为上述固定 C shim 与公共内存契约的部分正确性。硬件 ISA/ABI 与 scalar-field shim 的精化、任意硬件 VLEN，以及独立终止定理仍为后续工作。Char/UChar 的未初始化 byte permission 换型与初始化值的有界 roundtrip 分别证明；尾部通过真实逐字节写入，输出不需要新增 word 对齐条件。

重放使用配置完成的 QCP 2.1.4 / Coq 8.20.1 环境：`python3 proof/check_full.py --config <coq-flags.json> --dependency-dir <f32-vadd checked coq directory> --jobs 16 --timeout 3600`。脚本重新生成全部实际 C 目标、从源编译并运行全限定 typed 门禁，前后核对冻结输入、原件/补丁、工具和配置身份。`build_full_handoff.py --freeze` 只接受全部组件已通过且输入 SHA 匹配的状态。
