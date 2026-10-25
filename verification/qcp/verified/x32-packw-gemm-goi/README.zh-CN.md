# x32-packw-gemm-goi：验证对象与证据边界

本包验证公开的模块化 SIMD 修复版。最终验收入口为 `proof/status.json` 与 `proof/full-status.json`；只有全案 fresh 检查通过，才具有整核信用。普通小组件、数学引理、native 回归或已生成目标均不能代替该门禁。

参数域保留正 UInt64 的 `g/nc/kc`，`nr=2/kr=1/sr=1`，所有 raw UInt32，四字节倍数 `extra_bytes`，以及合同列出的有效、有界、对齐实际存储。`scale/params` 不被解引用，可取任意指针值。可选 bias 允许与 weights 只读别名：一个 owned input map 共同拥有两者，输出与该 map 空间分离。输出 state 的 `None` 表示可能未初始化；未写 holes、extra_bytes gaps 和外部 frame 保留各自原状态。每次实际读取必须有已初始化 map 项，不以默认零补缺失。

NEON 使用原生二 lane load/store；原始 LD2 lane 拆为两个原生 LD1 lane 的点值桥单独保存。原 KC 循环和 bias header 因子化为有实际 C 函数体证明的普通 helpers，正入口 do 循环改写为 while；额外 group/tile 计数只承载有界进度。NEON pair helper 的所有被写 lane 在 store 前均由原输入 load 覆盖。RVV 保留 VLEN=128、SEW=32、LMUL=4、VLMAX=16 及 v1.0 所有合法 VL 选择；header 为 m1/VLMAX4、实际 VL2。原 vcreate+vsseg2 分解为两条步长8的原生 vsse32，严格数学桥和实际普通适配器体另行检查。全部原件、精确零 fuzz patch、原因、旧变体与失败记录保存在 `proof/original/`、`proof/repair.*`、`proof/history/`。

共同后状态 `pw_program F G OLD` 是逐个实际字写入的有序 fold，包含 optional bias、pair/odd 权重、所有未写 option 值。两侧实际 C 的完整 VC 接口分别绑定到该状态，观察关系为逐位 UInt32 完整状态相等。普通公有 caller 在同一 live buffer 上先执行 NEON 并保存一个实际读取值，再执行 RVV 并比较第二次读取；它明确要求所观察字在首次执行后已初始化。全状态幂等定理同时保留未写 `None`，无需重置输出或读取未初始化字。

原生 intrinsic 的信任边界公开于 `proof/intrinsic-ledger.json`：12 个 view 逐项绑定原指令语义、合同、Coq 定义和锁定的一手来源；这些是 source-reviewed specifications，无 intrinsic C body 信用。普通 helper、kernel loops、memory 和 caller 必须有实际 C VC 证明。人工规格复核仍 pending，形式 ISA/ABI/编译器 refinement 与独立终止性证明均未建立；也不宣称原始 C 已被完整形式精化。历史 scalar projection 的 883 VC 不属于本包的实际 SIMD 证明。

两侧真实 SDK 编译、有限 UBSan 与实际 16GiB/swap0/LSan ASan、原版/兼容版独立 indexed oracle、三种合法 VL/两种 inactive 模式、只读 alias、全部 OLD holes/gaps/guards 以及 one-side/common-wrong 负控分别记录，不作为无限域形式证明。当前有限矩阵每种 sanitizer 含 41,184 个用例和 41,184 次实际公有 caller 调用。

全案 replay 使用 `proof/build_full_handoff.py --freeze`、`proof/check_full.py --config <bootstrap>/coq-flags.json --jobs 32 --live-slots 8`，随后由 `proof/record_status.py` 独立审核并归档，`proof/audit_relocation.py` 核对迁移后的当前 CPP 与封存证据。32 是 configured workers；局部准入当前为8个16GiB地址空间名额，重型32GiB任务占两个名额，有限7200/14400秒，生成上限21600秒。运行前读取共享 quota/memory 状态，严格超过95%开始收尾。
