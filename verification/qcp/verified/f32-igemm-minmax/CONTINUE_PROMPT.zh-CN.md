# 本案续接与复核

先读README.md、proof/status.json、proof/full-status.json、proof/intrinsic-ledger.json和repair.md。本案完整当前C在公开intrinsic-spec边界下通过；人工语义复核pending，ISA/ABI/终止性未证明。原版存在已记录NaN反例，不混淆原版与修复版。

正式准入为wholeclosure01统一687模块、admission01四个C单元593义务重新生成、7策略字段、604最终假设报告、14继承假设、无新增公理；32配置并发。使用proof/dependencies.json的精确源码闭包，不能把历史试验或未选中的脚本混入新运行。

用户当前任务仅收尾已开工的矩阵kernel后停止。本案完成后，剩QD8-F32-QC4W GEMM；其状态以工作区build/qcp-worker-local/matrix-kernel-closure/STATE.json为准。不要因为本案完成而将QC4W计入verified，也不要新增kernel。

私有续接入口：/srv/home/yuechunsun/tools/lean/build/qcp-worker-local/matrix-kernel-closure/CONTINUE_PROMPT.zh-CN.md。大型缓存、完整失败轨迹和探索proof保留在该工作区归档，不作为本案成功证据。
