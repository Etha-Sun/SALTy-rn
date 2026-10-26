本案区分实际 C 的 opaque 接口与使用自动 record 布局的单元。两类都使用公开 canonical Coq 模型，并保留完整 binary32 bits、uint32 索引、原输入域和 C 函数体；人工 ISA 规格审阅仍 pending，物理 ABI/编译器/ISA 对应和终止性没有在本案建立。

`neon_unit` 与 `borrowed_consumers` 是 **opaque/no-emit**：实际 C 没有 `.sN`/`->sN` record 字段访问，实际 QCP 不生成它们的 `*_def.v`，实际 goal 直接导入 `ArgmaxPool.BorrowedKernelModel`。这不表示 canonical 模型没有 record 类型；只表示该 C 单元没有独立自动布局文件。禁止人为补一个 alias 冒充 emitter 产物，禁止意外 raw/compiled def，禁止实际 goal 导入任何 `*_def`，并要求直接 canonical model import。

`annotated`、`block32`、`rvv_update_into`、`rvv_record_consumers` 是 **record/required-emit**：四者都必须有真实 QCP raw `*_def.v`，实际 goal 必须只导入该单元自身的 `*_def`。raw emitter 的浮点字段是 `R`/`Int` 且默认 `naive_C_Rules`（Arch32/BigEndian），不能作为本案 fp32/Float、UInt、Snaive64LE 表示编译。runner 必须先逐字保存为 `*_def.emitted.v.txt`，记录原SHA，再用公开透明的 canonical model exports 编译；issuer 独立核对 raw 存在、SHA、compiled source 与 goal import。不能因为 opaque 单元无 emit 而放松这四项的 raw 产物检查。

其余 `read_previous`、`read_table`、`control_unit`、`public_caller` 是 **scalar/no-emit**：同样拒绝意外 raw/compiled `*_def` 及 goal 的 def import；不要求它们导入与自身无关的 BorrowedKernelModel。

每单元策略写入 H 的 `definition_emission_policy`，全局映射为 `definition_emission_policies`，并由 builder、runner、issuer按冻结源码重新计算核同。实际 C/CPP、goal字节、字段、模型、原件与repair都没有改变。移除的只是两个未被 goal 引用且未由 QCP 生成的 alias 编译节点：own DAG从630变628，含完整总接口、第二类型接口、16报告分片与最后门禁共647 ordinary模块；实际10TU/14普通body/2362C字段与4950最终Print（含226数学）不变。

H1长生成已自然9072.5s导出1949目标、原始goal SHA完全一致，随后旧runner把opaque无emit误当缺失record raw而拒绝；这是表示/清单工具错误，不是C/Coq义务失败。历史脚本及旧H均保留。H2仍是独立有效长生成，不修改/取消；H3不借H1/H2生成或VO取得fresh信用。轻量probe、CPP/调用闭包和身份预审不是H3整案证明，完整新H及整案运行由root另行审阅启动。

原先普通helper及所有实际循环/内存/caller仍需实际C函数体证明；原生单指令规格的source/contract/model ledger公开供人工审阅。原始失败/超时/工具诊断保留，修复版不冒称原件形式精化。

补充历史区分：H1另有独立read_previous单元缺失原逻辑/typedef前缀的frontend失败，该记录原样保留；H2已校正前缀，10个QCP均实际0，随后仅同一opaque-def后处理断言失败。两批NEON目标都是5526ae…原字节，但均不给H3 fresh信用。
