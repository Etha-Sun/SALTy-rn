本目录完整门禁重新生成十个实际 C 翻译单元（十四个普通函数体、2362 个实际 C VC），并从 `.v` 重新编译完整本案依赖。既有组件收据仅用于确定目标与来源，不复制或加载组件 `.vo`。六个翻译单元的原始 generic `_def` 会保留为 `*.emitted.v.txt`，编译采用公开、透明的模型 export；实际 `_goal.v` 字节必须与归档一致。

在主仓库运行（先由协调者冻结输入并分配全队预算）：

```sh
python3 verification/qcp/candidates/f32-argmaxpool/proof/record_status.py --preflight
python3 verification/qcp/candidates/f32-argmaxpool/proof/audit_relocation.py --negative-controls
python3 verification/qcp/candidates/f32-argmaxpool/proof/build_full_handoff.py --freeze
python3 verification/qcp/candidates/f32-argmaxpool/proof/check_full.py --config .build/simple-kernels-bootstrap/coq-flags.json --jobs 32 --live-slots 18
python3 verification/qcp/candidates/f32-argmaxpool/proof/record_status.py --dry-run
python3 verification/qcp/candidates/f32-argmaxpool/proof/record_status.py
```

配置始终为 32 workers；`live-slots` 是每槽 16 GiB 的并发地址空间预算。普通进程 16 GiB/7200 秒，重型进程 32 GiB/14400 秒，QCP 生成最长 21600 秒。运行目录 `live-limit.json` 可由协调者按全队实际资源调整到 2..32 槽；重型任务占两槽。生成和编译都有有限限制，失败记录保留。

当前闭包为 630 个源模块，另有完整总接口、逐字段第二类型接口、16 个假设报告分片和最终程序观察门禁，共 649 个 ordinary Coq 模块。两个接口各完整检查 2362 个实际字段，外加 226 个数学声明的报告，共计划 4950 条最终 `Print Assumptions`；这些是清单值，必须等真实运行和独立签发核验通过才产生证明信用。框架库不重编，其递归加载对象和位置在前后分别盘点，所有本案逻辑模块必须来自本次 fresh 目录。

`--prepare-only` 只检查当前实际 TU/CPP/普通调用闭包，`--preflight` 只审查身份与有限原生证据，干净迁移检查仅重建源依赖和输入。它们都不证明整核。H 一旦冻结，输入保持只读；缺少完整运行或任一字段/日志/来源失败时签发器拒绝签发。超过 8 MiB 的归档源码和生成目标采用 gzip，记录原始 SHA/字节数并逐字节往返检查。

结论限于 README 所列 C-shim 模块化部分正确性、固定硬件配置、完整公开域和精确位/索引观察。三十个原生指令规格视图是公开的人工审阅边界，人工审阅仍 pending；普通 helper/caller 均要求实际 C 函数体证明。没有 ISA 对应、编译器、ABI 或终止证明信用。原件、反例和精确修复补丁保留，不能把修复版结论称作原件形式精化。
