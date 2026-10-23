# f32-vmulc：已验证的广播乘法

`impl/testNEON.c`、`impl/testRVV.c` 逐字保留原始 kernel；`spec.c` 是唯一公开函数与契约入口。
输入 A 需 n+3 个可读 float，B 只需一个 float，两输出各 n 个 float，缓冲区互斥。
结果逐项数值相等或同为 NaN；全部 binary32 输入合法，包含 NaN、Inf、±0。
当前固定 binary32/RNE、LP64、小端及 RVV 32 个模拟 lane；真实 ISA 对应和终止性未证明。

审核本案 `shim/`、共享 [VMUL shim](../f32-vmul/shim/proof/)、公开 spec 和原始 impl；
契约引用的数学定义在 `proof/coq/Model.v`、`NeonResult.v`、`RvvResult.v`，不能只审核函数名。
`proof/c` 仅有 Inv/Assert 注释与策略，完整 C 验证副本从 impl/spec/shim 生成到 `.build`。

完整门禁已实际通过：12 个 C 单元、605 个 VC，全部调用合同和实际函数体闭合，
110 个普通 Coq 模块（87 个共享依赖、23 个本案模块）及两个最终 gate。
NEON 111、RVV 42、新 primitive 102 个 VC 均通过；wrapper 最终明确保证输出关系。
总并发预算32；原始 C 加最终 wrapper 的 native430例通过，B仅分配一个float。
权威入口是 `proof/status.json` → `full-status.json`，源码清单为 `proof/manifest.json`。

首次最终检查发现 FastFrame 编译实例不一致；在同一依赖环境重编译两个原有 primitive 模块后通过，
未改 C、spec 或证明内容。原失败与修复保存在 `proof/rebind-history.json` 和 `proof/evidence/`。
迁入 verified 后另查12份 CPP及112份实际Coq源码身份，并重跑native430；见
`proof/relocation-audit.json` 和 `relocation-binding-audit.json`。迁移身份审计不是第二次Coq重放。
历史命令保持原路径，检查器通过迁移记录解析已搬迁的历史工件。

配置好QCP/Coq环境后，按组件生成与检查脚本重建 `.build` 工件，再运行完整门禁：
`python3 proof/check_full.py --final-check --dependency-dir <fresh-VMUL-run>/coq --dependency-manifest ../f32-vmul/proof/manifest.json`。
仅审计模式会明确退出2；不代表已保存的完整通过证据被撤回。
`tools/vmulc_candidate.py` 仅是初始 scaffold，不声称逐字重建最终公开 spec。
