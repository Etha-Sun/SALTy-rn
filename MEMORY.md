# QCP 工作记忆入口

先读本文件，再读 [PROGRESS.md](PROGRESS.md) 和 [.build/memory/STATE.json](.build/memory/STATE.json)。
机器状态由 `python3 .build/memory/checkpoint.py` 刷新；重要变化另加 `--event '简单说明'`。
旧状态保留在 `.build/memory/history/`，事件只追加到 `.build/memory/events.jsonl`。
`.build/` 是本机私有工作记录，不是已发布证明；源码另有 `.build/private-source-backups/`。

## 用户当前要求

- 目标：至少 **11 个完整 verified kernel**。从简单到难，积极并行推进。
- 新验证批次默认 **16 并发、每进程 16 GiB**，按复杂度设置有限时限；结合服务器可用内存和其他 worker 的实际占用安排多个批次。
- 可主动修改实现，参考 Frama-C 与 Arcadia-y 修复，无需再批准；保留原因、原始身份、补丁和相关反例，证明修复后的等价性。
- 完整验收后先 fetch，直接提交并 push 到 **`c-shim-v2` 的 `verification/qcp/verified/`**；不开 PR，不 force push。
- 大进展用简单语句更新 PROGRESS 和已验证列表。零件/数学/条件 caller 通过都不能单独增加 kernel 数。
- 保留全部相关源/目标/日志身份，不引入 axiom/Admitted，不暗中限制 NaN/Inf/零、移除内存条件或放松观察关系。

## 工作区和分工

- 我们的主工作树：`/srv/home/yuechunsun/tools/qcp-simple-kernels`，分支 `codex/worker-simple-kernels`。
- 专用发布工作树：`/srv/home/yuechunsun/tools/qcp-simple-integration`。fetch 后核对实际 HEAD，保留别人的新增提交。
- `/srv/home/yuechunsun/tools/lean` 和 GEMM/ENV 其他工作树保持原样。
- `neon_kernel_resume`：s8-clamp 128-lane RVV 实际 C/body/kernel 支援；字节尾部支持已闭合。
- `minmax_repair_finish`：监控冻结的 FMin 全案重放；推进 s8-clamp。
- `rvv_kernel_resume`：独立 qs8-f32-vcvt；FMax full 已通过并交 root 发布。
- root：验收、record_status/audit、发布、progress/memory、Arcadia 修复来源审查。
- worker-server 已拥有 u8-clamp 整案和 `u8-tail-memory`，只读复用并通过 PR1 协调，禁止重复领取。

## 证据和恢复

当前正式数量以 [verified/manifest.json](verification/qcp/verified/manifest.json) 为准；先核对它引用的 status 哈希。
2026-10-23 当前已验收 **9/40**；前一项 VLReLU 直接发布为 `bf106ba73e3c0b417c1d0532d13c32cd4108ceb0`（VLReLU）。

正在运行的全案输入必须冻结：

- VCMUL 已通过：`verification/qcp/verified/f32-vcmul/.build/full-_e5udkje`，原始实现，旧批次 jobs4；11 C 单元/629 字段，123 本地源 + 最终门禁。完整 661 项 Assumptions 已归档。
- FMin 已通过：`verification/qcp/verified/f32-vmin/.build/full-xlbp0zhc`，RVV 修复版，jobs16；12 C 单元/1188 字段，140 本地源 + 最终门禁。1216 项 Assumptions 已归档。
- FMax 已通过：`verification/qcp/verified/f32-vmax/.build/full-wghluc3i`，RVV 修复版，jobs16；12 C 单元/1188 字段，146 本地源 + 最终门禁。1216 项 Assumptions 已归档。

恢复时检查真实进程和 run/status.json，不因历史 `passed`、单项 Qed 或模块比例推断全案完成；超时/环境错误与反例分开。
已配置工具 PATH：`.build/simple-kernels-bootstrap/bin:/tmp/qcp-coq820-install/bin:$PATH`；Coq 配置 `.build/simple-kernels-bootstrap/coq-flags.json`。
VADD 已完成的独立依赖重放：`verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq`。
所有编译在私有 `.build/.../jobs/`，不写共享库、工具链或其他 worker 的缓存。

全案真正通过后：先由 root 运行该 case `proof/record_status.py`，检查最终全部 Print Assumptions；归档完整目标/CPP/日志/组件状态。
然后执行 `proof/audit_relocation.py`，移动到 verified 后重新核对 live CPP/已编译源身份并跑 native。
`.build/prepare_direct_case.py <kernel>` 可在已 fetch 且干净的发布工作树准备复制/身份/native/清单更新；它不会 commit/push。
审查具体结果，再普通 commit/push，确认远端 SHA，更新 PROGRESS 和 checkpoint。

Arcadia 只读来源：`refs/remotes/arcadia-y/verification`，固定 `4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca`。
它的 `verification/REPAIRS.md` 和 Lean 规格可供参考；其 S8Clamp Entry 有 ordered 条件，不得把该结论解释为覆盖无序 bounds 的 QCP 证明。
