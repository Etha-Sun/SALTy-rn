# Byte35 地址层独立审计

状态：UNQUALIFIED。审查者 environment_rebuild。本审计未修改模型、锁或普通 kernel C，未运行 solver。此前排队的文档写入不算完成；本文件是重新核对磁盘后的独立记录。

## 证据核对

独立重读并核 SHA 的源码为 MemBytes.ml、MemAddr.ml、CodeSemantics.ml、Cvalues.ml、MemVar.ml，均匹配 v35 source-audit.json 的 after 记录；前后完整清单记录仅 MemBytes.ml 改变，patch SHA 匹配。没有将清单比较冒充重新 hash 全源码树。详见 INDEPENDENT-SOURCE-CHECK.json。

独立读取原清单中的 472 个原始 SMT task，全部 SHA 匹配。逐个提取包含 int_of_addr/addr_of_int 的 assert，得到 21 类；其中仅两类包含 forall：静态 inverse，以及 framed 的定义。未发现被删的全称位宽条件在这批任务中以匿名等价 assert 回流。见 INDEPENDENT-TASK-SCAN.json。有限任务扫描不证明任意未来任务或整个工具的一致性。

## 已知全称矛盾及 v35

旧 pointer_type 和 ranges() 生成非定义型 Admit 范围事实，已删除。旧范围与 static inverse 的组合将无界 offset 地址单射进有限 64 位范围；static 的 base=0 分支已经提供无限地址族，所以旧组合在数学上不一致，负例未被自动证明不能挽救它。

v35 memaddr.mlw:128-145 保留 static 定义、valid_rd 正长度到 static 的原 lemma、encode(null)=0 和 static 左逆。地址为无界整数 base/offset，shift 不截断。此片段可满足：用 Z↔N zigzag、Cantor pairing 和反解构造 encode/decode 双射，令 null=(0,0) 对应0。即使加入原简化器的右逆，该无界双射仍可满足。该见证不覆盖整个 memory/Bytes 理论，也不提供任何有限位宽或 affine 桥。

## ground uint64 H 的准确源码来源

- CodeSemantics.ml:271-272：pointer→integer cast 调用 M.int_of_loc。
- MemVar.ml:484：转发到底层模型。
- MemBytes.ml:848-851：忽略目标 integer kind，直接返回 MemAddr.int_of_addr，没有显式 downcast 或范围证明。
- 对普通局部变量，MemVar.ml:521-522 可直接读取 SVAR 的表达式。
- CodeSemantics.ml:299-307：读取 C 左值时调用 Lang.assume(Cvalues.is_object obj data)。
- Cvalues.ml:289-302：整数 is_object 就是 Cint.range；pointer 本身的 is_object 为 true。

因此 `uintptr_t x=(uintptr_t)p; return (float*)x==p;` 中，读 x 可以把类型假设作用到替换后的原始 encode(p)，产生 ground is_uint64(encode(p))。它不是 checked_step_bits 的形参事实，也不是由新 helper body 证明出来的 encode 范围，更不能据此声称所有静态地址均在64位内。MemAddr.ml:300-304 另有 encode(decode(i))→i 的原简化器规则，这是旧 TCB，不是 Why3 文件中新增的公理。

C 的实际 uintptr_t 值确实有范围，但“读取 C 整数的类型事实”不能代替对 pointer-cast 抽象编码的正确性证明。这里存在应明确审查的边界：无界 encode cast 的赋值表达式若不先规范化，后续读类型假设会过滤不满足范围的抽象状态。必须论证这种过滤只排除不可表示的抽象状态、保留所有合法实际执行，且与对象布局和 C pointer conversion 一致；当前未完成这种 refinement 证明。反过来，仅看到这条 ground H 也不能推出 v35 整个模型不一致。

## 最小可运行诊断

`ground-type-control01/controls.c` 对照纯逻辑范围、cast初始化但不读、读取 uintptr 局部。另提供带 oversized-encoding guard 的两项抽象状态过滤诊断，以及不带该 guard 的真正 false_control。guarded pair 不声称其输入是实际可实现的 C 指针，不是 kernel 反例。

worker 的 print01 在90秒后退出124，日志为空、inputs=true，尚无解析/目标证据。这是启动未完成记录，不是 proof timeout。独立 runner 只读取35锁并把日志写在审计目录。root 可执行 print-root01/solve-root01，旧失败保留。

`inverse-controls.c` 是待验证的普通 ghost helper 方案：无 requires、空 body、条件 ensures 为 valid_read(p) ⇒ (float*)((uintptr_t)p)==p，必须先完整证明 helper body，再验证 caller。它拟实例化原 static inverse，不新增公理；是否实际产生 raw inverse 而不是截断 inverse，尚需 none 公式核对，未运行 solver。

## 控制与资格边界

七组统计保存在 CONTROL-COVERAGE.json，来源为 root 运行；address39/45 仍有四个真阳性未证（pointer_roundtrip、zero_step、target_uintptr_step、address_roundtrip），另两项为预期负例。未证负例不等于 SAT 证据。

原任务加两条已有全称公式的具体实例后 UNSAT，只支持该任务的实例化诊断，不是 Frama-C raw 验收，不会消除 ground Type H 的语义审查。

Byte35 未恢复 SPMM 的 pointer 能力，更没有非零 affine 桥。knowncase 即使完整通过，也不能单独资格化这些地址操作。分配/valid/static、cast 简化器、pointer序列化、alias/wrap、工具链/solver 的 TCB 边界继续保留；不得通过新 requires、assume 或替换旧锁消除债务。

## 后续已独立复核的 root 控制

`ground-type-control01/solve-root01` 正常完成8/12：pure logic 与 cast初始化不读均未证明 raw_range，读取uintptr局部后证明该范围；带 oversized guard 的 false 也仅在读取后证明；正常合法域 unguarded_false 未证明。这直接展示 Type H 对抽象状态的过滤，不是 encode 范围的 body 证明；guard 的实际C可实现性仍不得假定。

`inverse-print-root01` 确认 ghost helper 的目标为纯 valid_rd⇒decode(encode(p))=p，没有 uintptr range H；`inverse-helper-root01` 正常1/2，assigns通过但 inverse ensures未证。因此尚无可采纳的body桥。原始root结果与本次独立读文件SHA见 GROUND-TYPE-RESULTS-REVIEW.json。

## 既有实例化证据的来源更正

独立读取 `address-instance-diagnostic01/result.json` 确认：两个 UNSAT task 的直接 source 是 `drop-only-address02/0/subset.smt2` 与 `1/subset.smt2`，即先删除部分假设的较强目标，再加入两条剩余已有全称假设的 ground 实例；不是“完整 original.smt2 仅加两个实例”。这些已有假设实例不加强逻辑前提，且较弱假设集 UNSAT 可支持原任务同一目标，但仍不是 Frama-C raw/整核验收。旧记录未覆盖。

`address-trigger-diagnostic02` 在两个真正完整 original.smt2 上只修改两个 forall 的 pattern 元数据，保留所有 assertion 与原 goal，并核对反向替换恢复原字节。两种pattern×两task均10秒timeout。valid_rw 为 define-fun，作为pattern宏展开后产生新 invalid-pattern 警告；select+offset+n multi-pattern没有该新增警告，但仍未闭合。原完整任务本身其他理论的pattern警告也保留，不能归因于本次新元数据。

`address-trigger-diagnostic03` 仅对同一既有 drop-only subset 做公平对照，不再删除或新增任何assert，随后停止扩量。无新模型/share/锁生成。标准35 strict结果为556/571，不能qualified。

公平对照已完成：diagnostic03 两个既有 subset 均 exit0、stdout=timeout、stderr为空，单项预算10秒。仅pattern元数据未能替代 ground 实例；此结果不证明触发器路线不可能，只说明本次两个选定pattern策略未闭合。停止进一步solver扩量，不建立触发器模型版。
