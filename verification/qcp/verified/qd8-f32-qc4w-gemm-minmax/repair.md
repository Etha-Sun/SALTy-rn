# QC4W GEMM 修复日志

当前完整验收已通过，见[统一状态](proof/status.json)与[完整证据](proof/full-status.json)。下文按时间保留诊断和修复经过，其中“尚未完成”等文字描述当时状态。最终native重放包含同一原版反例，公开结果见proof/evidence/full-run/native.json；私有失败实验继续保留在原工作区。

原版来源/当前SHA和精确补丁见[身份记录](proof/source-identity.json)。本次原始实际C的native反例保存在`.build/original01`：mr=N=K=1，K上取偶数为2，A分配8字节，完整W panel208字节；ksum/权重/bias/zero_point为0、filter scale=1、inv_scale=0x7fc00000、lo=-1、hi=1。NEON输出NaN、RVV输出-1。该反例属于本案全binary32候选域，尚不声称所有上游调用器都允许这些参数，native不是硬件执行证明。

仅在本案RVV的clamp段增加bounds NaN分支及accumulator self-NaN mask/merge，保留原RVV min/max语义。该修复复用已检查QD8 GEMM的max→min NaN恢复经验，不改变NR16 packed布局、K上取偶数、nibble展开、wrap32 MAC、算术右移4或浮点累加顺序。原上游两侧文件不改，原RVV副本仍可重放。

当前整核QCP证明未完成，不能进入verified。需要单独处理4位signed解码、192+8*roundedK权重panel、输入ceil(roundedK/8)*8可读范围和所有循环/尾部。

2026-10-24：实际QCP `actual11` 与压缩trace `actual12-trace` 在完成全部clamp/store、`nc -= vl`后以SIGSEGV退出。将本案RVV外层 `do { body } while (nc != 0)` 改为 `while (nc != 0) { body }`，guard与body顺序保持；公开Require已有`0<nc`，故第一次guard必真，之后每轮检查与原版相同。没有缩小N/K域或改变intrinsic、内存访问、累加顺序。注释从末尾guard重新绑定到开头guard，后续需重生成并检查全部新VC。该修改用于避开工具崩溃，不将崩溃宣称为程序反例。

同日shim乘法使用透明Coq别名 `qc4_fp32_mul := fp32_mul`，等价引理以reflexivity通过；最小对照表明原模型符号触发复制策略失败、别名可继续。没有改变乘法语义或增加参数存储资源。此前会产生重复heap资源的参数post实验已回滚，详见rejected证据。

后续记录：`actual13`的while版本仍在约200秒时SIGSEGV，循环写法不足以解决崩溃。`actual14-gdb`确认同一工具进程崩溃（strip后二进制地址0x10c5420），不是Coq证明失败。正在检查外层不变量中的冗余ghost别名；把`exists wp cp, w=wp && c0=cp && P(wp,cp)`等价改写成`P(w,c0)`，只改证明注释，实际C行为不变。最终入库前只保留经完整重放的版本。

生成器诊断续记：actual15 与 scopeprobes01/02 均仍 SIGSEGV；actual17 将两处 void 指针偏移写成 pointer_offset(...,char) 后仍失败。actual18-gdb 显示空间谓词参数列表含 NULL。actual19 在 inner invariant 中保留真实局部 vksum 的16个字段后越过 SIGSEGV，但报 c0 退出作用域权限缺失；actual20 恢复 outer invariant 无条件 c0==cp、w==wp 的局部值绑定（包含 nc==0 分支）。这些是内存不变量修正，不增加公开前提，也不改变算术或 kernel C。完整闭合仍待新结果。

actual20：在补齐 vksum 字段和所有退出分支局部指针值的不变量后，完整当前 RVV 符号执行以0退出，348.18秒，生成274字段，goal SHA985de70e914449bb146704812fb6fa17db4d8a672deb39a7fc74a10c7fcea43e。没有删除分支或缩小N/K；这仍是生成成功，274字段尚须Coq证明。

2026-10-24 NEON接口迁移：新增QC4W.NeonModel及完整调用声明，沿用已检查QC8W接口的逐lane读写与MAC形式，并改为16列QC4 packed layout及显式nibble/ASR语义。vmov_n_s8的shim接收原C整型实参后用signed8(u8 value)显式包含到int8_t的转换，0xF0变为-16；原NEON源码token未改。SHL/SSHR/DUP对应已核对Arm ACLE aef52c2 https://arm-software.github.io/acle/neon_intrinsics/advsimd.html 。这仍是待最终人工审阅的intrinsic spec边界，不是ISA refinement。新增NEON接口尚未完成kernel检查。

2026-10-24 13:22 UTC：当前RVV实际274项义务全部闭合，并在rvvclosure01一次重新编译385个本地模块，完整QC4RvvClosure.RvvChecked.Checked接口通过，约373.7秒。32路假设分片共274报告，仅14项继承基础依赖。补齐的是循环/内存证明和算术化简，未再改变kernel C、输入域或intrinsic语义。NEON及最终全案验收仍待完成，尚未入verified。

NEON neonactual02完整生成约3375.14秒后在首个vld1q_f32前置条件失败：保留了k非零且小于2、同时k为偶数的不可达尾部分支，无法推出packed scale地址。增加一条which-implies证明注释，把循环出口已有0<=k<8且k%2==0转换为k=0或2或4或6；此新增事实本身生成Coq义务，通用qc_tail_even_cases引理已经检查。没有把该事实加入公开Require，也未修改NEON C或intrinsic合同。旧305条注释及完整失败输出保留，当前306条注释重新生成。

尾部诊断对照：tailprobe03/04在保留typed pointer_offset形式及原嵌套尾部指针递增时，去掉新增分类事实复现同一vld1q_f32前置条件失败，加入该待证明事实则生成成功。普通整数地址表达式的tailprobe01/02均成功，未复现问题。该对照仅定位生成器的地址/尾部分支匹配，不能算整核证明；完整neonactual03继续运行。

2026-10-24 14:58 UTC：neonactual03在4157.24秒后以1结束，已越过scale加载，在首次qcp_vst1q_f32写回前置匹配失败；不是超时、OOM或Coq失败。storeprobe01/02确认done与done+0无法直接匹配；06/07确认连续写回的加法分组也影响匹配。已从verified/QC8W IGEMM迁移qc4_write_state相等参数匹配策略（新第12条，真实DSL重新生成），strategy12check01以32路全新检查15模块、约53.7秒通过。10/11与01/06相同C，增加已证明策略后生成通过；完整列尾部还需mask加法/边界推论，13通过而12缺这些推论失败。以上仅诊断，不计整核通过。

当前308条NEON证明注释包含新增位掩码推论，以及深度尾部后完整Kr累加器/指针状态的Assert汇合；每条incoming蕴含均须由Coq证明。Assert机制依据本地QCP教程T3-5。NEON C、intrinsic合同、公开输入域均不变；只扩充已证明策略及证明注释。旧306条注释和11策略源完整保存在私有qc4-before-write-strategy12，旧实际运行日志保留。整核neonactual04现以64GiB/21600秒重跑，不能把旧neonactual03称为成功。最终共享策略验收从11项更新为12项。

## NEON 公共目标编译资源（2026-10-24）

完整生成的88MiB目标在neonbase01的16GiB地址空间限额下，普通coqc运行769.46秒后报`Fatal error: out of memory`（exit134，最大RSS14721624KiB）。其他19个依赖模块通过；这不是C义务反例，也没有进入字段证明。保留失败目录和目标原字节；新neonbase02仅把>=64MiB源码模块提升到有限32GiB，普通模块仍16GiB、7200秒，32配置workers通过共享512GiB池协调。新运行是否成功以实际结果为准。

发布前补丁检查：旧rvv-repair.patch未正确记录文件末尾缺少换行，标准patch无法完整应用；保留旧补丁，按同一原版/当前版重新生成含No-newline标记的精确补丁，临时目录应用后逐字节等于当前RVV。仅修补丁工件，当前C、合同、Coq目标及已有native输入hash均不变。

最终完整验收：5个实际C单元/1531字段、12实际共享策略、1610fresh本地Coq模块和1567假设报告通过，32配置并发。NEON原C保持，RVV修复与公开域如上；仅14继承依赖，无新项目公理。完整证据以proof/status.json和full-status.json为准；intrinsic来源审查边界与人工review pending保持。
