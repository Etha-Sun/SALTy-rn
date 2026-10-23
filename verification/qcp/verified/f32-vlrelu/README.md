# f32-vlrelu：完整 C-shim 验证

原始 NEON/RVV 实现已在公开契约及指定 C-shim 模型下完成模块化部分正确性验证。
本案不是任意硬件上的 ISA 等价或完整终止性定理。

完整门禁检查了 **14 个实际 C 单元、958 个单元 VC 字段、124 个 fresh 普通本地 Coq 模块**
（123 个依赖/证明模块及 `FinalCaseCheck`），10 组策略也重新生成并检查。
958 是各单元接口字段的总数，含公共 `qcp_assert` 在两个单元中的重复检查；
不能将其称为 958 个语义唯一义务。实际包含 49 个 C body 出现位置、48 个不同函数名。

审核入口为 `impl/`、[spec.c](spec.c)、公开 `shim/` 及引用的 `proof/coq/` 语义定义。
`impl/testNEON.c` 和 `impl/testRVV.c` 保留上游字节，来源与 SHA256 见
[proof/originals.json](proof/originals.json)。没有改写原循环或运算顺序。
`proof/c/` 只放证明注释和策略，验证副本从当前公开输入生成到 `.build/`。

| 组成 | 实际 C VC 字段 | 完整接口 |
| --- | ---: | --- |
| 位转换 helper | 19 | `BitsChecked.CheckedBits` |
| 新 NEON 原语/helper | 61 | `NeonPrimitives.CheckedNeonPrimitives` |
| 新 RVV 原语/helper | 347 | `RvvPrimitives.CheckedRvvPrimitives` |
| 原 NEON kernel 单元 | 135 | `NeonChecked.CheckedOriginalNeon`，另有两条新策略 |
| 原 RVV kernel 单元 | 47 | `RvvChecked.KernelChecked`，另有四条新策略 |
| 公共 helper、比较器和 caller | 36 | 四个完整接口；kernel 合同已在整案门禁连接到实际 body |
| 既有 load/store 等共享单元 | 313 | 五个实际 C 单元，沿用 reviewed VADD 源并重新生成/编译 |

最终 gate 为每个实际 C 单元实例化 fresh `VC_Correct`，检查全部 C callee 的真实 body、
精确声明/定义合同及公开规格绑定。124 个本地模块在统一环境从源码编译，没有复用组件 `.vo`。
外部 QCP/Coq/Flocq 库沿用已记录环境，未宣称从源码重建或完成全部外部库的递归检查。

证据入口：

- [proof/status.json](proof/status.json)：当前正式状态。
- [proof/full-status.json](proof/full-status.json)：原完整重放的原始记录，保留当时路径、命令和哈希。
- [proof/evidence/full-run/FinalCaseCheck.v](proof/evidence/full-run/FinalCaseCheck.v)：实际检查的完整 gate。
- [proof/evidence/full-run/FinalCaseCheck.log](proof/evidence/full-run/FinalCaseCheck.log)：全部 958 个字段的 `Print Assumptions`。
- [proof/relocation-audit.json](proof/relocation-audit.json)：迁入 verified 的身份审计；**不是第二次形式证明**。

迁移保持 C、spec、shim、Coq 和历史记录字节；仅适配 runner 对历史 artifact 路径的读取。
14 份迁后 live CPP 与原检查输入逐字一致，123 个编译源及最终 gate 的哈希一致。
完整 `.build/` 随目录移动，历史 JSON 中的旧路径没有伪装为迁后执行记录。

## 公开域与边界

`batch` 的单位是字节，`equivalent` 的 `n` 是 float 元素数。`n` 是满足公开整数/地址上界的
任意正数，覆盖向量循环和 1、2、3 元素尾部。输入需要 `n+3` 个可读 float，允许原 NEON
完整尾部向量读取；两侧输出各需 `n` 个可写元素。输入、参数和两侧输出的分离资源、
输入保持与允许写入区域在公开契约中明确。没有排除 NaN、Inf、正负零或 subnormal，
也没有给 slope 添加 finite 条件。

RVV 固定 **VLEN=128、SEW=32、LMUL=8、VLMAX=32**，选择 `vl=min(AVL,32)`；
任意总输入长度不代表任意硬件 VLEN。形式 shim 对未观察的 inactive lane 选择正零，
native runtime 单独选择 agnostic all-ones；最终只观察 active store。

[proof/semantics.json](proof/semantics.json) 分别列出 Arm/RVV 的官方来源、舍入/状态设置、
reinterpret、符号比较和 mask/merge 规则。native 数组表示与形式 scalar-field 表示之间尚无
形式化精化定理，也未建立真实 ISA 到全部 shim 的形式对应。

特别需要保留的边界：继承的 QCP `fp32_mul` 将算术 NaN 固定为 sign=false、payload=1，
与 Arm 的传播和 RVV 的 canonical NaN 不是精确位对应。本 kernel 使用原输入符号位选择分支，
乘法结果只到最终观察，而公开关系接受双方均为 NaN；这个 ISA/观察精化桥仍未形式证明。
浮点 flags/traps、完整终止性和任意硬件配置均不在已完成范围。
继承的 QCP/Coq/Flocq、类型/地址及经典逻辑假设保留在报告中；没有新增公理不等于整个环境没有公理。

## 重放

需要先配置本机 QCP 2.1.4、Coq 8.20.1 和对应库，并完成独立 VADD fresh replay。
Git clone 不会提供工具链和 `.build/`。`CONFIG` 指向本机 Coq flags JSON，`VADD_COQ`
指向该次 VADD 完整重放的 `coq/`。从仓库根目录运行：

```sh
python3 verification/qcp/verified/f32-vlrelu/proof/check_full.py --config "$CONFIG" --dependency-dir "$VADD_COQ" --jobs 4
python3 verification/qcp/verified/f32-vlrelu/proof/native.py
```

配置工具链并完成 VADD fresh replay 后，完整门禁可直接从当前公开输入重建全部 C/策略目标，
以归档的完整目标 SHA 校验身份，并从源码编译全部证明；不依赖本案历史 `.build/` 或 `.vo`。
组件脚本可单独用于诊断；历史 passed JSON 本身不能充当新执行。
`record_status.py` 是历史组件记录工具，不能用它替代完整 gate 的正式状态。

迁后 native 已重新运行：2872 个样本、每侧 196492 个 active lane、2559 个原语检查，
包含 ASan/UBSan、独立 scalar oracle、源篡改拒绝、错误输出及双方同错模型的负控制。
另有位转换 131096 次独立 `memcpy` 位读写对照。这些有限测试不计入形式 VC 数量。
