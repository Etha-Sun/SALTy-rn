# f32-vmul 已验证包

来自已检查 VADD 形状的明确算术实例：`fp32_mul`，C 运算符 `*`。
`impl/` 两个文件逐字节复制原始 kernel；证明只插入注释，保持原调用和控制流。
`shim/` 是独立且需审查的运算特定实现及契约，不修改公共 shim。
历史 `vadd_values` / `rvv_add` 文件名保留，但模型定义实际使用 `fp32_mul`，
不是把减乘除解释成加法。RVV 非活动通道仍返回 +0。
公开后置条件仍是相同运算模型的输出等价性；完整 binary32/NaN/Inf/±0，
无有限值、除数非零或新的公理前提。保留 VADD 的内存、VLEN 和 store 宏左值边界。

生成不等于验证。运行 `python3 proof/check.py --jobs 32`，只有新生成 VC 与本包
实例化目标严格一致、全部本地 Coq 依赖重新编译及 FinalCheck 通过，才算检查成功。
`python3 proof/native.py` 是另行有限回归，不替代证明。

完整检查已通过：11个C单元、8组策略、87个本地Coq模块及FinalCheck，32并发；native430例通过。
证据见 `proof/status.json`、`proof/native-status.json`；入库身份核对见 `proof/relocation-audit.json`。
真实ISA与shim对应及终止性未在本包证明。
