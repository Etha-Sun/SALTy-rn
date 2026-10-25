# F32 SpMM 接续入口

本包已完成完整准入与递归检查：4实际C/788字段（NEON443、RVV335、caller6、ordinary4）、19策略、9共享探针字段、835fresh模块、956假设报告。以proof/status.json、full-status.json和manifest.json为准；sealed文件不可原地覆盖历史证据。新验证使用新的run名，配置32并发，普通16GiB/7200秒、生成64GiB/21600秒、递归32GiB/14400秒，协调共享预算。

证明覆盖完整M/N/稀疏循环、NEON4/2/1行路径、RVV128/e32m8全部合法VL及任意inactive值；allbinary32，numeric-or-both-NaN，显式循环打包和容量。26条intrinsic采用来源审阅合同，最终人工语义审核pending；无ISA/ABI/完整终止性/任意硬件VLEN声明。原始文件与两侧兼容改写/RVV FMA+NaN修复只在repair.md记账。

优先复用Model/StepFacts/GeometryFacts/MemoryStore/FinalStore/Observation/ActiveClamp与NeonClosure/ColumnFrame，证明源均已在本案fresh检查。生成目标永不手改；注释必须保留入口@pre联系与do-while第一轮n>0，循环底仍允许0。成功对象若续跑，源/对象/依赖必须逐项保持，更新仅限明确失败/未编译模块，新增依赖也须在同环境fresh编译。

本会话另已完成QS8-QC8W GEMM。更上层矩阵路线的状态在matrix-kernel-closure的STATE.json。HWC→CHW新候选已完成原始反例、初版RVV修复、双VL原生回归与11个共享证明组件fresh编译；完整实际C尚未证明，不得计入verified，勿重复其他owner的PackW/DWCHW/Argmax/QS8Mul。未来如修改本包输入或语义，需新完整准入，不能沿用本次成功。
