# 本包续接与重放

当前包已完成公开合同下的完整C-shim验证。先读README.zh-CN.md、proof/status.json和proof/full-status.json；逐项核对manifest及封存证据hash，保留历史来源，不把安装环境当作重新构建成功。

用户本轮要求完成已开工矩阵核后停止；不从本包自动扩展新kernel。新的重放使用proof/check.py、全新run名和32配置workers，通过共享有限预算runner协调。不得覆盖sealed证据、缩小公开域、删除义务或增加公理。intrinsic语义人工审阅pending与形式ISA/ABI/终止性边界保持显式。

主工作区的总任务状态和私有失败实验索引位于build/qcp-worker-local/matrix-kernel-closure/STATE.json与CONTINUE_PROMPT.zh-CN.md；公开完整证据在本包proof/evidence/full-run。
