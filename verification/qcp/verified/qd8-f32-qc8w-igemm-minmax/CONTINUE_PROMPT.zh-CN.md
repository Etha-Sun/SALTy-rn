# 已完成的 QD8 QC8W IGEMM

当前完整证据：proof/status.json → full-status.json → evidence/full-run。wholeclosure03通过1365个fresh依赖+33个最终模块、1381个实际C字段、15个真实策略字段、1409项假设报告。C生成admission01；scalar_nan/neon_basic由admissionhelpers02精确绑定，映射见proof/generation-runs.json。native41310cases/371790outputs及6负控制通过。

公开intrinsic spec下的C-shim模块化部分正确性；人工语义审核pending。保留全部binary32、合法正K/N/entries、重复和重叠只读窗口。固定VLEN128；无ISA/物理ABI、独立终止性或任意VLEN结论。不要覆盖sealed历史。复跑用proof/check.py --run 新名称 --jobs 32 --budget-runner 实际路径。
