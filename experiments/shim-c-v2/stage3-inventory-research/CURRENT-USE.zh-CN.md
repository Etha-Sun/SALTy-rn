# 后续实际使用说明

README 和 evidence-sha256.json 保留早期小控制调查的原样记录。随后真实 GEMM 的 Qed 盘点仍超时，失败记录位于 ../stage3-inventory/f32-gemm-minmax/enumerate01。九核实际诊断采用最终 observer04 + none（不调用求解器生成完整清单），再以独立阶段短时求解。实际结果、预算和边界见 [九核报告](../stage3-inventory/REPORT.zh-CN.md)。早期小控制中推荐的 Qed 方法不是本轮九核盘点方法。
