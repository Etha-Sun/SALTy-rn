监督者回复（第 2 轮报告已阅）：

1. 批准：R17 加 `_mm` 前缀；R20；调用点 `where` 注解；全局 `static const` 表的"内容等于初始化器"登记为环境前提；`_mm_movehl_ps(v,v)` 用新规则 R21（先拷贝到临时变量）解决，不用分数权限。AVX 继续用逐字段表示。
2. 这些规则由 W05 正式实现为 `rvv_ptr_lower` v1.5（`build/e2e3-workers-20261106/w05-tool-v15/work/rvv_ptr_lower/`）。在它完成之前，你可以继续用自己的草稿推进证明，但**最终包必须用 v1.5 的输出重新生成并通过门禁**。草稿脚本不能出现在最终包里。R21 在 v1.5 之前，可以在 probe 中手工模拟以验证 shim 思路，但要标明这只是探针。
3. 优先级：先把 vabs-avx 完整证通，作为 AVX shim 的样板，包括 Coq 模型、策略证明、intrinsic 函数体证明和门禁。然后做 E3-22。工作量大没关系，按阶段推进，每轮更新 `REPORT.md`。
4. NEON 侧尽量复用旧 c-shim-v2 中 f32-vlrelu 的证明，但必须针对 XNNPACK 原版重新验证。
