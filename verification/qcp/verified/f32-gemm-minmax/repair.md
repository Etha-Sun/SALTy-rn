# 唯一修复与兼容记录

原始来源与当前 SHA、精确两侧 patch 见 [source-identity.json](proof/source-identity.json)。锁定上游 kernels/source、kernels/target 保留，所有修改只在本案 impl 中。

1. **原 RVV 的 NaN clamp 不等价。** 合法输入 mr=N=K=1、kc=4；A[0]=0x7fc00000、bias=0、weight=1、lo=-1、hi=1，仍完整分配NR8 panel及4行输入/输出。NEON输出NaN，原RVV输出1，实际caller返回0。本次 `.build/admission02/negative` 重新执行并复现。RVV修复为bounds NaN时广播NaN；否则先保留accumulator NaN mask，运行原RVV min/max后merge恢复NaN。intrinsic自身仍保留原RVV minimumNumber/maximumNumber语义。
2. **NEON前端兼容。** 仅外层do→while，入口公开N>0保证首次进入；原do版本曾触发QCP139。当前实际while源码完整生成并验证，未声称原do→while的单独C语义refinement定理。
3. **RVV前端兼容。** 四处`*p++`拆成load和指针增量；两处NaN自比较通过实际已证明的identity helper表达。保留原向量声明初始化、do/K循环、累加顺序和尾部；不改变公开K/N、mr、内存或浮点域。
4. **本次完整重放的import绑定。** 新RVV生成器正确输出`From FullCleanupV2 Require Import ...`，历史目标用Root wrapper再export同一策略。仅两行import做显式限定，391个公式逐字未改；原失败和原目标保存于proof/evidence/import-binding，新目标与受影响消费者重新编译。没有把环境/身份差别称为程序反例。

NaN代表和inactive lane是公开抽象边界，相关支持定理见F32Admission/Boundary.v；不把canonical NaN或8槽struct宣称为完整硬件位行为。没有移除loop、变更FMA顺序或缩小输入域来取得通过。
