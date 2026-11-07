# E2/E3 worker ledger（自动生成，勿手改；null = 未知）

| worker | runs | 失败/错误 | 墙钟 s | 输入 tok | 输出 tok | cache 读 tok | 费用 USD | 监督者审批 |
|---|---|---|---|---|---|---|---|---|
| w00-smoke | 3 | 0 | 81.2 | 40 | 5909 | 349517 | 0.9946 | 未审 |
| w01-v2-template | 1 | 0 | 5687.5 | 466 | 213251 | 22760776 | 20.885 | approved (template) |
| w02-avx-probe | 2 | 0 | None | None | None | None | None | 未审 |
| w03-hvx-probe | 1 | 1 | 17954.7 | 2142 | 799979 | 103258108 | 95.6624 | approved (probe result, conditional): HVX s8-rmax fixed variant V-007 fully proven |
| w04-e3-s8rmax | 3 | 1 | None | None | None | None | None | 未审 |
| w05-tool-v15 | 4 | 0 | 17023.6 | 1172 | 579908 | 56012662 | 56.3217 | approved, v1.6.0 merged into tools/rvv_ptr_lower (uncommitted) |
| w06-e2-x8lut | 1 | 0 | None | None | None | None | None | 未审 |
| w07-e2-qs8vprelu | 2 | 1 | None | None | None | None | None | 未审 |
| w08-e2-f32ibilinear | 2 | 0 | None | None | None | None | None | 未审 |
| w09-e2-f32velu | 2 | 1 | None | None | None | None | None | 未审 |
| w10-e2-f32vsigmoid | 2 | 1 | None | None | None | None | None | 未审 |
