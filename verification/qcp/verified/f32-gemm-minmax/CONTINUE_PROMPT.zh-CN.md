# 本案已完整发布；继续矩阵 kernel 工作

f32-gemm-minmax 已通过完整准入并物理进入 verified。证据以 proof/status.json、proof/full-status.json 和 proof/publication-audit.json 为准：895 C字段、1063 Coq模块、923假设报告；intrinsic来源审查spec，人工语义复核pending。保持冻结输入与历史记录。

继续工作入口：/srv/home/yuechunsun/tools/lean/build/qcp-worker-local/matrix-kernel-closure/CONTINUE_PROMPT.zh-CN.md。优先完整 QD8 QC8W IGEMM 与 QC4W GEMM；二者仍在 candidates。所有新批配置32并发，有限单进程预算，共享内存池。不要把支持组件或native通过当作整核完成。
