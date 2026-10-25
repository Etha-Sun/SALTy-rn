# 原版反例与修复记录

## 1. 原版差异，2026-10-25

mc=16字节、nc=1、nnz=1、dmap=[0]、bias=-1、A=1+2^-23、W=1-2^-23、bounds=[-Inf,+Inf]。NEON vfmaq单次舍入得到-2^-46（0xa8800000），原RVV先mul再add得到+0。该例满足循环打包约定，原始完整C在迁移host模型上经ASan/UBSan重现；不是硬件执行。已验证F32 GEMM的FmaModel.v也包含同一位级数学反例，将在本包重新编译。

另一个dmap=[+4]的例子体现不同M分块时游标积累不同，虽在额外分配内存下raw C内存安全，但不符合上述循环打包约定，不能据此宣称合法XNN packing输入存在该游标bug。保持该历史记录，不把它并入有效域反例。

计划先恢复原NEON的FMA与NaN传播语义，保留原RVV分块/游标结构；尚未修改当前impl。任何后续实际修改在本日志追加，并重跑实际C完整门禁。

## 2. RVV 修复候选

将单条嵌套vfadd(vacc,vfmul(vi,vw))替换为vfmacc(vacc,vw,vi)，保持累积次序并改为一次舍入；标量/向量乘数次序的NaN观察兼容性仍需证明。随后沿用已verified F32 GEMM的NaN检测与merge修复，上下界NaN直接传播NaN，vfmin/vfmax本身语义不变。qcp_identity是原值返回的普通helper，需要实际C body证明，不能登记为免证intrinsic。

M分块、vsetvl、游标reset与全部稀疏循环保持原结构；NEON不改。当前仅候选修改，正式等价性仍待完整C与内存证明，原始反例及所有原SHA保持。

## 3. 浮点记录数组的证明表示

vld2q_dup_f32原调用及NEON代码不改。前端对float32x4_t[2]记录数组输出的Coq模板错误使用R字段与Int存储；原文件封存在proof/evidence/tuple-frontend，不纳入证明依赖。公开TupleMemory.v显式使用fp32/Float及原结构步长，给出数组元素和全部字段的内存解释。生成C目标保持不变，策略、复制初始化和局部释放均需闭合，不能仅以生成成功计通过。

## 4. 返回临时对象的完整记录绑定

只给intrinsic返回数组子字段的合同会使前端在函数返回处残留retval数组资源。spmm-tuple05与其失败Coq目标均保留。spmm-tuple10改用完整StructPredfloat32x4x2_t记录谓词；其公开定义恰为原来的两元素数组，新增策略仅展开/折叠该相同内存。前端由此识别返回临时对象的生命周期，严格原post的新C目标不再残留该资源。NEON代码、输入域和输出/内存要求均不改；这次修正还需全部12策略及5个实际C目标通过。

2026-10-25复查：tuplecheck12的8个模块全部fresh通过，包含12条策略、5个原C目标和通用地址恢复数学。使用已verified F32 GEMM相同的局部字段地址同余引理完成typed/untyped字段表示转换。原NEON代码、输入域和post不改；仍只是共享能力，不是SpMM整核。

## 5. 原无符号指针恢复及容量边界

unsignedproof01实际C四个目标完整通过：stride*count-16与其后地址恢复均按模2^64运算，不添加乘积不回绕或stride*count>=16前提。注释语言%映射Z.rem，负数结果不同，因此公开word64明确使用Z.mod；原错误探针保留为诊断。Model.capacity草案改为约束最后实际写入列的末地址out+stride*(N-1)+4*M，而不约束最后一次未解引用的跨列游标。此修改扩大草案允许域，原C未改。完整内存分离、每次访问范围和循环证明仍须实际验证。

## 6. 两侧公开 C 的表达式兼容版

实际整核rvv04因前端不接受嵌套*nnzmap++而终止，错误记录保留。现在两侧公开impl把*ptr++拆为读取旧ptr后ptr+=1，把while(--counter!=0)拆为循环体末counter-=1和while(counter!=0)。RVV bias的*w++先完成broadcast调用，再单独推进本地w；该intrinsic的参数只含读取的标量和vl，无法访问本地指针变量w。本例每个完整表达式无其它同一游标修改；内存访问顺序、循环次数和算术/FMA顺序保持。

原始两侧在proof/original永久保留，兼容前工作副本另存私有.build/before-sequencing-compat。新增neon-repair.patch与更新rvv-repair.patch、source-identity记录当前版本。后续正式证明针对公开兼容版，不再声称NEON源码逐字原样；这里的C语义等价解释及native回归不另冒称已完成一个形式source-to-source编译器定理。此前NEON未改的条目是当时状态。所有主核目标必须由当前impl重新生成；旧native成功保留历史，新版须重跑。

7. 参数 tuple 读取采用明确的字段内存视图：原 `vld2q_dup_f32(&params->scalar.min)` 调用不变，intrinsic 合同把该已知 `scalar_bounds` 的相邻 min/max 字段读出并分别广播。AAPCS64 2025Q1 与 ACLE aef52c2 来源对照、native GCC / AArch64 Clang 静态 layout 检查见 `proof/evidence/params-layout/`。这是公开 intrinsic-spec 的内存解释边界，没有新增 kernel 输入条件或 Coq 公理；不是形式 ABI 对应定理。Clang 首次因无关 prefetch 声明不兼容而失败，诊断中仅重命名该声明，结构定义保持不变；旧通用连续地址合同的 QCP 字段匹配失败保留在私有 spmm-params01。

8. RVV 的局部指针 `in` 改名为 `input_cursor`，其作用域内所有引用同时替换。`in` 是 Coq 关键字，原 QCP 导出器生成 `(in : Z)` 后无法解析；保留 rvv13 原始生成目标与失败日志，重新从可见 C 生成目标，不修改 VC 公式来通过。此改动不改变任何运算、控制流、内存范围或输入域。

9. NEON完整目标沿用条目3的binary32 tuple解释：新增neon_def.v仅re-export已检查TupleMemory，生成的R/Int记录模板原件保存在proof/evidence/neon-record-frontend。neon_goal.v逐字保持neon02输出；没有将浮点字段解释为整数，也没有跳过实际C目标。


## 10. 完整循环注释与当前实际 C 目标

整核生成发现两处注释遗忘事实：do-while 第一轮入口只有 `0<=n`，不足以证明已知的 `n>0`；初始 Assert 没有保留九个参数与 `@pre` 的等式，导致后续字段地址被当成独立变量。只补回这些入口事实，循环底部仍允许 `n=0`，实际 C、公开输入域、输出与内存要求均未改变。原始失败目标和输入在私有 `.build/before-do-entry-positive`、`.build/before-entry-pre-links` 保留。

最终采用 NEON04 / RVV16 的原始目标，SHA256 分别为 `d2333385746d1e372372646f8e4df177b630e202cd37c715de0cdabddb512f50` / `88abb75340b5d6072ec9416789f93ac484f0e91381269c925ae410a7f43eff77`；二者都从当前完整 C 重新生成，目标文件逐字节采用，取代条目9中较早的neon02。两端443/335字段已经全部Coq闭合；当前正在完整依赖环境复核与最终准入，尚未计入verified。

迁移包括任意稀疏深度的单次舍入FMA递推、负稀疏偏移、uint64模运算指针回退、输出列strip借还、NEON 4/2/1路径及RVV全合法VL活动前缀。没有新增输入上界、缩小浮点域或引入项目公理。曾经的ActiveClamp展开耗尽16GiB后改为已证单lane引理的向量组合，保留失败记录，未改变语义或资源政策。


## 11. 最终完整准入

wholecase01完整门禁通过：835个同环境fresh模块、788实际C字段、19策略、956假设报告及完整递归coqchk；两个源码/CPP身份、26项intrinsic逐调用与定义绑定和三类负控全部通过。原始生成目标、C、公开输入域与输出观察未因证明补全而改变。上文“候选/尚未完成”保留历史阶段的含义，最终范围与已验证结论以proof/status.json及full-status.json为准。
