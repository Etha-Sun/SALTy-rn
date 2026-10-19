# 真实 prefetch 内联诊断

proof.patch 与 column-v3 逐字节相同，冻结源、模型文件相同。独立 runner 只为 inline-calls 添加 xnn_prefetch_to_l1，remove-inlined 仍仅 test_neon,test_rvv，保留 prefetch 真实定义；runner SHA 另锁在 execution-config.json。不是旧 checker 验收，不宣称新的整核结果。

主 agent 串行运行：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/column-inline-v4/control.py controls-root01
python3 experiments/shim-c-v2/stage3-proof-next/spmm/column-inline-v4/run.py column-inline-v4 prefetch-root01 fct:xnn_prefetch_to_l1 180
python3 experiments/shim-c-v2/stage3-proof-next/spmm/column-inline-v4/run.py column-inline-v4 metadata-root01 spmm_map_local_disjoint,spmm_map_initial_value,spmm_inner_map_value,spmm_column_map_value 300
```
metadata 预期5条 raw；prefetch 无显式ensures，必须检查真实body被选择、终止/退出等观测，不把0/0称作功能合同证明。真假控制必须正过反拒。
