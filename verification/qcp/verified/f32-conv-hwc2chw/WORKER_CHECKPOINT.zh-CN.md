# HWC2CHW 继续检查点（2026-10-25）

候选仍为 **0 个完整主核/0 个完整 case**。完整证明尚未通过，不能计入 verified。

- 当前实际实现：NEON `bf4d00fb6e972ab8ce10fd5d1d1ebf1187dc71f9167f1115ffc19e4cafbb4307`，RVV `ef6bcc7679166fb52911e762f62ee7cdcb9d90f66aa11c81cb8ff958687dfc61`。
- 保存原 NEON/RVV、Frama 参考和实际整核反例。NEON 已抽取普通三 FMA helper；RVV 修复 masked load、第二行上界 clamp、NaN、右端跳过 FMA、64 位全局索引和别名覆盖顺序。额外 pointer-borrow/临时变量抽取均保留旧版本与源码操作台账。
- 当前源码：双 SDK 真实编译通过；UBSan 与 ASan（真实16GiB cgroup、swap0）分别通过两侧各307800次调用/14040000个 lane。错误单侧和双侧相同错误均被独立标量 oracle 拒绝。这是有限测试，不是形式证明或真实 ISA 执行。
- 已通过普通 C 组件：support5、float-copy1、NaN helpers38、三 FMA helpers60、scalar-reader2、两半向量 store helpers12，共118实际C义务/12普通函数；每组件完整 typed interface、第二接口和逐字段 Assumptions。assert额外1字段正在检查，不预计通过。
- NaN helpers 已按显式 active mask0/1 guard 重生并重新证明38字段；旧 mask 目标的历史证据不能混作当前证明。
- 8个原 FP 数学模块保持冻结；新 source-pixel 模型及 root 交付 HwcSourcePixelFacts 已 checked（任意 FP32、unordered bounds）。当前 RVV/NEON record/load/store 模型通过 fresh Coq，尚待逐项 ISA 来源 ledger/人工审核，不声明正式 ISA 精化。
- root 独占新增 HwcTileFacts*.v，负责精确 row1→row0、lane0→3 的完整 outmap 写回。HwcProgressModel/HwcProgramModel 为只读依赖。
- 当前实际 RVV main 生成使用 `proof/prepare_rvv_kernel.py`：同 raw C tokens/同 frontend CPP tokens，完整 outer/channel/width/dx/ci/ky 前缀状态；600秒有限诊断，不盲目重跑6小时。初轮 opaque-domain assert 匹配失败和 do-while annotation 位置错误均保存为生成诊断，不是 C 反例。

公开域：正整数 H/W/channels、0或1 top padding；中心行有效 `2*(end-1)+1-top < H`。输入、给定 zero row、packed weights 和 params 共享单一 RO map，可完全或部分重叠；zero row 不假定为零。输出采用标准互不重叠逻辑 CHW 窗口及任意 stride gaps/初始 Some/None frame，内部 clipped row 和末 channel alias 按原写序保留。64位范围由可见内存 footprint 限定，不增32位尺寸截断；固定 VLEN128/e32m1、VLMAX4，所有合法VL及 inactive任意值。

恢复入口：`proof/check_modules.py`、`proof/check_coq.py`、`proof/check_native.py`、`proof/check_current_sdk.py`；原始日志与 failed 证据均在 `.build`/`proof/history`。当前遵循 root 借用2槽、我方最多4实际进程；默认32 configured，普通16GiB/7200s、生成32GiB且有限预算；开启新批前检查 quota state。

## 最新暂停点：优先 Argmax（用户2026-10-25新指示）

HWC所有活跃有限任务均自然终结；当前不再开新HWC批次。普通NEON27-FMA helper的396个actual字段已分别普通Coq证明通过（379调用/安全+16前缀+1返回），**完整396 VC_Correct/second/统一Assumptions尚未运行，不能称组件完整或主核通过**。完整逐字段provider与真实成功叶来源在`.build/neon-pixel-all396-provider-map.json`，部分来源整批false仅其已成功leaf有效；旧54失败调用模板仍须历史保存后切换已证Second providers。

新RVV普通三行FMA helper81.5秒生成336个actual目标并fresh普通编过goal；其body义务未证明。两旧main均600秒自然预算终结0goal，不是C反例。219行NEON兼容主核计划尚未采用，原24个output调用顺序逐字相同；prospective版本已独立双SDK+UBSan/真实16GiB ASan全307800case/14040000lane及wrong-one/both通过，完整证据在`.build/neon-rows-main-validation-4tkbtvn6/`。当前公开impl仍bf4d00fb/ef6bcc76不变。root/spmm的精确8write→progress15源fresh/17Print数学也完整交付，当前32原ISA views仍人工审核pending。恢复状态为`.build/worker-state-argmax-priority-20261025.json`。
