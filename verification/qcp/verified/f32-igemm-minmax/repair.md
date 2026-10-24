# 唯一修复与兼容日志

原始源码、当前SHA及精确两侧patch均在proof/source-identity.json和proof/evidence中保留。

1. 原RVV的NaN clamp存在实际反例：mr=N=K=entries=1，kc=4、ks=8，输入0x7fc00000、bias=0、weight=1、lo=-1、hi=1；完整NR8 panel分配。original01在ASan/UBSan下执行原两侧得到NEON=0x7fc00000、RVV=0x3f800000。此处zero指向同一合法输入窗口、offset=0。
2. 修复仅增加NaN恢复：任一bound为NaN时广播NaN，否则保存原累加器NaN mask，按原min(hi)→max(lo)顺序执行，再恢复NaN lane。intrinsic的原RVV minimumNumber/maximumNumber语义保持。FMA、packed布局和间接输入选择不变；没有把输入限制为finite。
3. 沿用IGEMM前端兼容经验，两侧仅移除表回退cast内部restrict（参数/局部restrict仍保留）；RVV的读取后递增拆成两句。未声称原版到兼容改写的独立C语义refinement定理。

上述初始修复记录形成时整核尚未形式验证；原生回归及模型迁移不能计入verified。最新完整检查结果见文末与proof/status.json。

4. 2026-10-24：当前NEON do外循环在actual06目标生成中触发QCP SIGSEGV（不是反例），原CPP、失败记录与gdb回溯保留。参照已验证F32 GEMM的相同兼容处理，将**仅外层**do-while改为同条件while；公开nc>0确保首次进入，循环体及FMA次序不变。新实际源码须重新生成、证明和原生回归；这不声称另有原do源码到新源码的C refinement定理。
5. actual07外层while仍触发SIGSEGV；neontrace02保留13MB执行轨迹，崩溃前最后处理为第二个entry中的k尾部条件。继续把内层p的do-while改同条件while；ks>0保证首次迭代，循环体与算术次序不变。原版/中间版及精确patch保留，此项仍待实际生成与整核检查。

6. 2026-10-24最终检查：RVV317/317、NEON229/229实际义务闭合，caller40与普通helper7一并绑定完整接口；wholeclosure01在同一次新运行中从源码编译全部687个本地模块，604份最终报告核对通过。admission01重新生成4个实际C单元，与所检查目标逐字哈希一致。当前两侧SHA仍为source-identity.json中的记录；此处验证的是上述完整修复/兼容版，不将原版NaN反例改称通过。
