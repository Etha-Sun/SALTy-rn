# uintptr 地址桥有限诊断

固定 `handoff-model-front`，没有修改任何模型、checker、普通 kernel 或公共规格。单 worker，每 solver/VC 10 秒，整个诊断180秒预算内完成（exit0）。`probe01.json` 原始16项中11项通过，5项未证；故意 false 没有获证。运行后完整模型输入 SHA 无变化。

| 函数 | 功能结论 | 解释 |
|---|---|---|
| same_pointer | 通过 | 直接嵌套 roundtrip 被 CIL 在进入WP前消除 |
| zero_offset | 未证 | `addr_of_int(to_uint64(int_of_addr(p))) = p` |
| one_offset | 未证 | 还缺整数地址加4与 `shift_uint32(p,1)` 的联系 |
| pointer_probe_false | 未证，预期 | false控制 |
| saved_roundtrip | 未证 | 存到 uintptr 局部变量后不再符合嵌套cast消除规则 |
| zero_with_local_equalities | 整函数未证 | integer_zero通过，pointer_roundtrip断言未证；最终ensures依赖该断言，即使局部显示通过也不能验收 |
| pointer_arithmetic_control | 通过 | 直接 `p+1` 的已有指针语义正常 |

具体证据：

- 原 Frama-C `src/kernel_services/ast_queries/cil.ml:5744` 的 `castReduce` 对整数类型能容纳 pointer 的嵌套cast直接去掉两层cast。因此直接roundtrip绿色不代表WP有一般桥。
- `src/plugins/wp/MemTyped.ml:927–928` 把 pointer→integer 编译为 `Cint.of_integer` 作用于 `int_of_addr`，再从整数以 `addr_of_int` 返回。unsigned范围cast表现为 `to_uint64`。
- 冻结 `memaddr.mlw:143` 仅有旧的未截断逆映射 `addr_of_int(int_of_addr(p)) = p`（带静态分配条件）。这里未添加任何公理；现有定义没有建立整数地址加offset与pointer shift的对应。
- `MemAddr.in_uintptr_range` 定义存在，但源码实际调用点在 `MemBytes.ml`；Typed没有对应连接。上述内容均有SHA与摘录记录在 `summary.json`，不是新工具修复。

当前尝试的局部桥没有完整证明。不能把未证assert后的ensures绿色作为成功，更不能将其加入kernel当已证支持。

可审查的下一步是单独研究 CIL 对整数 `+0` 的规范化，使当前已合法消除的直接roundtrip规则也能匹配等值表达式：先证明该规范化保持C整型提升、结果类型及副作用，再建立独立工具版本和正反控制。该方向最多解决 `+0`，并非一般uintptr地址桥，不能用于 `+sizeof` 或带offset的kernel。后者仍需明确审计地址编码/范围/溢出/对象布局与shift关系，不能添加未经证明的桥或加强原合法域。本轮只建议，未实施工具或模型修改。
