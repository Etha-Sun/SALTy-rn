# VLReLU 发布打包计划：尚未执行

两个完整候选 `vlrelu-reinterpret/merged-values-v02` 和 `merged-values-v02-independent` 正在运行。本文件只是交接步骤；不创建 verified 条目，不修改 manifest，不变更它们的任何冻结输入。局部 201/201、3/3 等结果不能拼成完整通过。

参考 `verified/f32-vmin-v2` 的组织：普通 `neon.c`、`rvv.c`、独立公开 `spec.h` 与 `harness.c`；唯一 `proof.patch` 放全部证明；共享 shim 源码按本次版本一起冻结。VLReLU 应使用自己的 qualified native-v6 Bytes profile、driver 和 v4 checker，不能复制 vmin 的 Typed 模型或旧 v2 checker。

1. 等待两个完整运行产生实际 main raw 和 summary。记录同一运行的不可变 `attempts/0001/proof.patch`、`frozen.json`、模型锁、driver、工具 SHA、所有 raw、模型控制及 actual commands。检查全部 caller/helper bodies、全部21条唯一 globals、私有前件、RTE、assigns、loop variants/termination、direct/ghost closure。不能只检查日志中的百分比；必须确认无缺失目标、导出错误或未关闭的 CASE 分支。
2. 审查已验证来源的普通 C token 与公开 spec/shim/driver/模型身份，并对同一合并版本执行完整 LLVM 身份检查。观察仍是数值相等或双方 NaN，允许符号长度，固定 VLEN=128、该 RVV e32m8 capacity=32；不比较 NaN payload、零的符号位或 FP flags。保留未支持 alignment/valid_function 等实际工具边界，不把 LLVM 身份当作 ISA intrinsic 到 C shim 的证明。
3. 在独立暂存目录复制 `frozen.json.files` 中列出的**原始未注释输入**，核对每个 SHA。另复制实际通过的 attempt proof 快照为唯一 `proof.patch`；不要把 annotated 实现和同一 patch 同时打包，避免二次应用。对本地源码重写 frozen 路径，模型/checker等外部路径保留原 pin 并提供环境说明。仅路径变化不改变文件内容或 proof 内容，记录源/包 SHA 对照。
4. 对准备发布的包生成新的 frozen SHA。使用同一 qualified profile、相同 driver、v4 checker、单目标30秒/1024MiB、完整无函数/属性子集，执行**新的 packaged canonical01 全量验证**。打包可能改变路径/组织，不能复用实验目录的通过记录。保留 canonical 的新 guard、model controls、globals/main raw、actual commands、完整 closure 与 LLVM 身份证据。
5. 仅当 packaged canonical 全部通过且 root 独立审查后，才建立正式 verified 条目并修改 manifest；README 引用确切 SHA 和实际 canonical 结果，不把 scheduled 当作 proven。若某次运行只因预算到期未生成 raw，原样保留为无完整结果。

用于最终重放的命令结构沿用现有 checker：

```bash
python3 tools/shim_c_campaign_v4.py <package> \
  --frozen-sha256 <new-package-frozen-sha> \
  --name canonical01 \
  --framac <pinned-native-v6-depth16-frontend> \
  --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin
```

这是命令模板，尚未执行；资源并行覆盖继续用既有 Gateway 固定调度，禁止为打包新增 skip 或缩小验证范围。需要逐目标进度时另冻 `frama_depth16_progress.py`（追加 `-wp-msg-key shell`）；verbose2 本身只给概览，不能声称逐目标输出。新 wrapper 也必须 pin SHA，不能修改正在运行的 profile。
