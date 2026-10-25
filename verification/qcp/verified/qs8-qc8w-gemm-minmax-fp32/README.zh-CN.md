# QS8-QC8W GEMM FP32 验证

两侧完整 C、普通辅助函数、实际 caller 与策略接口均已通过完整检查；状态见 [status.json](proof/status.json)，完整记录见 [full-status.json](proof/full-status.json)。原始NEON保持，RVV修复与原反例见[repair.md](repair.md)。公开入口[spec.c](spec.c)，实际程序[NEON](impl/testNEON.c)、[RVV](impl/testRVV.c)，规格语义[Model.v](proof/coq/Qs8Gemm/Model.v)、[量化](proof/coq/Qs8Gemm/Quantization.v)、[浮点位语义](proof/coq/Qs8Gemm/FloatBits.v)。

沿用MR1/NR8 GEMM，正uint64 N/K，contiguous output cn_stride8、padding至8ceil(K/8)，每panel为32-byte i32bias +8K-byte权重 +32-byte scale。硬件语义配置为AArch64 little-endian、FPCR DN=0/FZ=0/AH=0、RNE；RVV固定VLEN=128，e32m2/e16m1/e8mf2各8lane，AVL预先限制为min(nc,8)，不观察flags/traps。所有binary32 bitpatterns、raw int32 magic offset、int8 bounds包括无序值；内存分离、有效性和非回绕容量公开。最终比较精确int8字节。union成员按单个命名struct表示，仅此成员被访问，不声称物理ABI。

当前源码绑定的原生 native04 已通过：修复版 15600 cases / 148800 outputs，经 ASan/UBSan、原 NEON 与独立 scalar oracle 检查；原版 NaN 反例也重现。另将两侧输出同时改错，二者仍相等，但独立 oracle 拒绝（exit 21）。输入和快照哈希保持，归档记录见 [native.json](proof/evidence/full-run/native.json)，原运行目录为 `.build/native04/native/result.json`。有限回归不计形式证明。现有 QC8W 整数 fold/Cast/内存策略与 FP16 位模型按源迁移并新编译，来源与修改见 proof/reuse-provenance.json；所需本地闭包均已新编译并递归检查。

新批固定32并发，普通16GiB/7200秒，生成64GiB/21600秒，使用共享512GiB资源池。已完成两侧全部实际C目标、caller、ordinary helper、全部策略和52个活跃intrinsic来源/定义绑定、完整Coq检查与负控。intrinsic规格来源审阅、人工复核和ISA/ABI/终止性边界单独保留。


## 整核证明与续跑记录

全部实际目标为 NEON 1261、RVV 240、caller 29、普通 assert helper 1，共1531项，另有16条实际策略义务。它们属于同一个 kernel，不按义务或组件增加 kernel 数。完整接口是 [FinalCheck.v](proof/coq/Qs8Admission/FinalCheck.v)；内层 NR8 是源码的 tile，公开 N/K 没有固定成一个测试矩阵。统一环境中的3051个模块、1874份假设报告和递归 coqchk 均已通过；原始失败与同环境续跑谱系见完整证据。

第一次完整重放在663个模块成功后，因一个原有安全证明的60秒战术预算触发超时而停止。保留所有成功源码与对象，仅将尚未编译或尚未通过的555个自动脚本预算改为300秒，并在 NEON 汇总模块显式接入已证明的16条策略。续跑保留旧 manifest、结果、失败日志和被更新源码；不引入其它 run 的本地对象。所有通过对象已在同一个依赖环境中接受完整接口与递归检查，只有14个既有框架假设，无新增项目公理。失败快照、源变化与保留对象身份已封存于 proof/evidence/full-run/。

可迁移部分包括 [NeonMac.v](proof/coq/Qs8Gemm/NeonMac.v) 的8步与1..7尾部累加、[NeonMemory.v](proof/coq/Qs8Gemm/NeonMemory.v) 的padded读取及4/2/1分支边界、[KernelFrame.v](proof/coq/Qs8Gemm/KernelFrame.v) 的地址归一化和分离逻辑内存拼接。它们迁移了已有 QC8W 与浮点位模型的源码和证明；来源哈希见 proof 下各 provenance JSON，最终一并新编译。

## 重放

环境需要既有 QCP 2.1.4、Coq 8.20.1、Flocq 与共享有限预算运行器。环境库存记录工具与外部输入的身份，不表示重新构建了工具链。使用唯一运行名：

```sh
python3 proof/check.py --run replay-UNIQUE --jobs 32 --budget-runner /path/to/budget_run.py
```

默认完整重生成与重放；只有显式选择已有记录并通过当前源码、快照和对象身份检查时，才采用已完成的生成或同环境编译续跑。见 [接续说明](CONTINUE_PROMPT.zh-CN.md)。正式准入状态由 [proof/status.json](proof/status.json) 给出。

完整准入 `wholecase02` 已通过。统一编译（含一次显式续跑）实际累计3222.138秒；后续完整准入阶段4554.233秒，其中递归coqchk为4454.201秒。时间不含更早开发、失败、排队和等待间隔，不能据此反推token用量。完整核共52个活跃intrinsic规格，定义和来源审阅见 [intrinsic-review.json](proof/intrinsic-review.json)；最终人工语义复核仍pending。
