# Intrinsic 规范边界

2026-10-23（洛杉矶），用户统一更新：

> 对于intrinsic，我们可以不必要建立c implementation，只需要你的intrinsic是和原始spec对应的就好。

后续 kernel 可以直接使用与原始 NEON/RVV 规范对应的 intrinsic spec，不要求为这些 intrinsic 另写 C 实现或证明 C body。可以保留 C 实现用于原生回归，也可以继续保存已有的 body 证明；二者都不是新增 intrinsic 的必选验收项。本规则覆盖旧文档中“每个 intrinsic 都必须有已证明 C body”及相关完整调用闭包条款。

这会减少 intrinsic 实现的生成、C VC 和实现到合同的证明义务。仍需完整证明实际 kernel、循环、分支、调用前提、内存所有权与 frame、普通 helper、比较器和公开等价性入口。intrinsic 的 load/store spec 必须准确给出活动 lane 的访问地址、范围和读写效果，kernel 调用者仍须满足这些内存前提。不能只证明一个假设两侧输出已经相等的 caller。

## 可直接审核的定义

每案在 `proof/intrinsic-ledger.json` 建立清单，并从 README 链接到公开合同和实际 Coq 定义。至少记录：

- 原始 intrinsic 名、NEON/RVV 来源、类型、lane 布局与调用形式。
- 官方规范链接、固定版本或 revision、章节；分别核查两侧语义。
- 公开声明/合同的文件位置和 hash，以及所绑定 Coq 定义的完整名称、源码位置和 hash。审查入口必须指向定义本身，不能只列 Import/Extern。
- 硬件与状态条件：VLEN、SEW/LMUL、VL/VLMAX、mask/tail/inactive lane、舍入与 VXRM，以及相关浮点状态。
- NaN/Inf/符号零/subnormal、NaN payload 或 quieting、FMA 单次舍入、整数 wrap/扩展/饱和等实际语义；只在公开观察中明确允许的差异才可忽略。
- load/store 的实际地址、长度、别名和 frame；存在宏或接口适配时，记录支持的源表达式、求值次数、类型及 lane 次序对应。
- 证据状态：`source-reviewed-spec` 表示已对照原始规范、作为本案采用的语义边界；`body-checked` 另有 C 实现证明；`ISA-correspondence-checked` 只用于确有形式化对应证明的部分。尚未核清的语义应标为待处理，不能用方便证明的定义代替。

RVV 非活动 lane 尤须明确：tail-agnostic 不能直接解释成所有非活动 lane 都写零。新 spec 保留原规范允许的行为，或采用明确的活动前缀抽象并证明未观察非活动部分。已有 C-shim 的零补全只是其表示约定，不是完整寄存器 ISA 对应证明；不能把它直接改名为原始 ISA spec。若后续代码会读取这些 lane，必须重新处理其语义。

用户将在最后审核 intrinsic spec 的具体定义。继续工作时不增加逐项请求批准的流程；先完成来源对照、公开定义、kernel 证明和可复查记录。最终人工复核的状态单独记录，不把尚未进行的人工复核写成已经通过。

## 完整验收与报告

调用清单分为实际验证的 C body 和已登记的 intrinsic spec。每个 intrinsic 调用必须精确绑定到清单中的声明、合同和 Coq 定义；普通 helper、适配器引入的实际 C 逻辑、比较器和 wrapper 仍需相应证明。不能把任意未知 extern、普通 libm 调用或整个 kernel 改名为 intrinsic 来跳过义务。

完整门禁仍从当前实际 C 生成目标，从源码编译必要 Coq 依赖，检查全部 kernel 与非 intrinsic C 单元的完整接口及最终等价性，并核对所有 intrinsic 绑定。spec 定义也纳入冻结、hash 与重放身份检查。只生成 VC、只声明 ModuleType、仅跑 native、未闭合 kernel 或缩小公开输入域，均不算完成。

README、status 和 manifest 明确写明“在列明的 intrinsic spec 和公开契约下的模块化部分正确性/等价性”，列出该语义边界。C body 计数只统计实际检查的实现，不能将 spec 条目记为 C VC 或额外 kernel。`Print Assumptions` 之外仍须列出 intrinsic 契约和显式定理参数；报告闭合不能消除这层语义边界。

不新增未证明 Coq 公理或使用 Admitted。采用可审核的语义定义和公开 intrinsic 合同，不意味着已经证明真实 ISA 到模型的形式对应，也不意味着任意 VLEN、物理 ABI 或完整终止性已经成立。

已有发布结果、失败记录和更强的 C body 证明保持原样。正在运行或已经冻结的验证保持其原始输入和实际范围，不为了减少义务中途改写证书。新规则用于后续未冻结的工作；若切换一个尚未完成的 case，先保留旧证据，明确记录新边界并重新运行受影响的完整门禁。规则更新本身不增加 verified 数量。
