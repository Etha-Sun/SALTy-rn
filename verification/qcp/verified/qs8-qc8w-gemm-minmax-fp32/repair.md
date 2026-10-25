# 修复日志

当前未完成整核验证，不计入verified。原始两侧源码在proof/original，原NEON逐字节保持。

1. 原版量化反例：mr=nc=kc=1，bias=0，A=1、W=0，scale位0xffc00001（负quiet NaN），magic_bias位0x4b400000、offset=0x4b400000、bounds[-128,127]。实际原始两份C通过分别模拟NEON DN=0与RVV canonical NaN的intrinsic执行，NEON=-128，RVV=127，独立scalar oracle=-128。ASan/UBSan原生有限重放通过：私有wave2/budget/qs8-original-native02；这不是硬件执行或形式证明。首次01仅输出目录缺失导致链接失败，记录保留。

2. RVV修复：保留原整数K循环、乘法/加法、饱和减与窄化；在mul和add后用真实RVV位操作与merge恢复ARM DN=0的NaN符号/payload/quieting优先级。scale NaN在乘法后恢复；已quiet的乘积NaN优先于quiet magic，signaling magic优先于乘积。finite/Inf产生的invalid结果仍为canonical NaN。原输入域不排除NaN/Inf/subnormal，不固定magic常数、不加ordered bounds。补丁proof/rvv-repair.patch。修复版数值与整核证明正在执行。

3. 迁移记录：复用QC8W GEMM原4份IntegerFold/CastModel/PhaseModel源，FP16 case浮点位模型删除一个未使用loop导入，重新编译。support01的5继承模块通过，新Quantization因漏导入Reals失败，support02补导入；均不计整核成功。

4. actual01前端适配：QCP拒绝`(int16_t)*a0++`的嵌套postincrement语法，RVV显式拆为`va0=*a0; a0+=1;`，保留读取地址、扩展及更新次序。NEON首个by-value调用缺参数地址注释，用已有自动绑定经验补`where`，不改普通C。原始失败snapshot/log保留。

5. native04 对当前源码的原版反例、修复版 15600 组与双方同错负控均按预期通过，哈希稳定。生成器 actual03 NEON / actual04 RVV 均已走到真实输出 store；失败源于 `qs8_output_prefix` 尚无展开到 `qs8_write_state` 的策略，新增定义相等的策略15并单独用 Coq 检查，不修改输出契约。caller03 已过28/29项，剩余一项补实际两数组拆分，继续fresh重放。

6. actual05 RVV 完整生成240项实际C义务（417秒），全部输入哈希稳定；rvvbase01按源fresh编译13/13。nanbits05已证明实际 signed32 AND/OR/merge 序列恢复 ARM DN=0 的完整浮点链，11/11模块新编译；这仍不代表整核结束。NEON actual05/06分别在tail store参数与vext合法参数析取的前端分支选择失败，未修改原NEON。尾部macro增加where注释；vext自连接借用合同按真实合法立即数0..7统一表示（原仅列2或4导致生成器选错分支），结果仍为精确8字节旋转。

7. actual07 NEON在尾部写入位置 `done+4` 与 `done+(nc&4)` 的前端匹配失败。保留原策略14/15快路径，新增策略16将两种索引的相等及列表相等送入实际Coq义务；16项策略typed接口已fresh通过，actual08正在生成。RVV迁移QC8W的局部字段地址同余和forgetcells后47项内存义务通过；任意K循环、实际量化链和输出拼接亦已分别检查，目前正在rvvfull01按32并发fresh验证全240字段接口。运行器新增要求fresh.vo存在且budget正常完成，拒绝中止任务产生的伪exit0。历史失败、手动中止原因和输入快照均保留。

8. 复用已验证 QC8W 的 K8／1–7 尾部递推、内存 frame 和本核 RVV 的输出前缀证明；当前 75 项 NEON entail 义务已新编译通过。第一次批量迁移错配的 32 个证明分支编号已按原生成器位测试顺序修正，原失败记录保留；原 C、规格域和生成公式均未改变。补齐读取与 4/2/1 写入边界单独证明。原始大目标以 gzip 无损归档，分块重组仍逐字节校验。当前尚非整核验收成功。

## 9. 尾部内存证明规则迁移（2026-10-25）

已将已有 QC8W 的地址归一化与分离逻辑 frame 证明迁移到本案，并独立证明 padded 8-byte 读取边界和 `nc & 4/2/1` 的精确分支值。实际尾存储目标需要先用分支等式改写偏移，再取消相同的输出前缀资源；这属于证明脚本修复，不修改 C、生成公式、公开输入域或内存容量前提。失败批次和试验记录保留于 `.build/neonretry*`、`.build/neon*dev*`，最终计数只取源码与传递依赖哈希一致的新编译对象。

## 10. 完整接口与有限预算续跑

首轮完整编译在663个模块成功后，因 safety248 的60秒战术超时而停止。终态和全部日志保留。静态接口检查另发现 NEON 汇总模块需要显式 Include 已证明的16条策略；当时编译尚未运行到该汇总模块。之后仅修改未成功/未编译的证明脚本：555个自动脚本将战术预算改为300秒，汇总模块接入现有策略。已经成功的663个模块源码、依赖和对象保持不变，续跑器逐项验证其身份；没有导入其他run的本地对象。

最终完整接口、递归coqchk、假设清单、来源绑定和负控均已通过。以上条目保留各阶段当时的状态；最终范围及完整续跑谱系以 proof/status.json 和 proof/full-status.json 为准。C 程序、公开输入域、生成公式及观察关系未因这些证明工具修正而改变。
