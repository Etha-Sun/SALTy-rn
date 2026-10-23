# qs8-rsum

候选：完整门禁尚未通过，暂不计入 verified。当前各项证明与 native 结果不能替代最后的全案重跑。

验证对象是修复后的 NEON/RVV 实际 C kernel、具体 scalar-field C shim、完整实际被调函数和会真正调用两侧的 `spec.c`。输入为任意有符号字节，长度 `1..2^64-16`，另有 15 个已初始化 padding 字节；两侧初始输出相同，可取任意 int32。输入、输出和 params 满足公开合约的有效性与分离要求。共同结果是初始输出加全部有效输入之和，按 32 位补码取模；padding 不影响结果。输入、params 和 frame 保持不变。

原件两侧的 `*output += final_sum` 在 `n=1, input=[1], output=INT32_MAX` 时均触发真实 UBSan 有符号溢出。两侧改为 uint32 加法后再显式转回 int32，保留全部初始 int32 域；原件、SHA、精确 patch 和反例保存在 `proof/original/`、`proof/originals.json`、`proof/repair.json`、`proof/repair-*.patch`、`proof/evidence/original-native.json`。NEON 私有 mask 表另做两处工具兼容修改：static const 改为 automatic const，并去掉初始化列表最后的可选逗号；32 个值和算法不变。这两处是已复现的 QCP parser 缺口，不是原件语义反例。

固定 64 位指针、小端、VLEN=128；e8m2/e32m8 的 VLMAX=32，e32m1 的 VLMAX=4，setvl 取 `min(AVL,32)`。RVV TU 调用以同一个无副作用 `vacc` 同时传入 passthrough 和 accumulator，具体 C adapter 使用一个 accumulator 资源并保留全部 inactive lanes。硬件名字与内部 signed provider 的映射及严格调用形状见 `proof/check_frontend_scope.py`、`proof/frontend-scope.json`。

结论范围是明确内存前提和固定配置下的 QCP/C-shim 模块化部分正确性，使用 QCP 已选定的整数转换语义；不包含终止性、任意 VLEN、实际 ISA 或 ABI refinement。

`proof/formal-native-status.json` 记录实际 21 个 C 单元、35 个递归输入文件的有限对照：每侧 990 个样例、1,075,860 个有效输入元素，分别通过 UBSan 和 ASan，并检查输入、params、输出 canary 与真实 public caller。ASan 的实际 cgroup 上限为 16 GiB；两个错误结果 negative control 均被拒绝。它们是有限运行证据，完整形式化门禁须独立重生成所有实际 C 目标、策略，并从源码编译整个 Coq 依赖图。
