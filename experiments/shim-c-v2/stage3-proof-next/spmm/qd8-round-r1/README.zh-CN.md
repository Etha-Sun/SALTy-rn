# QD8 round/count 最小候选

严格基于 stage3-gemm/qd8-f32-qc4w-gemm-minmax-r2；原 target/spec/shim/model 文件与SHA不变，唯一 proof.patch。utils.c 的真实 round_up_po2 body 未改，仅增加四个条件后置，条件 q==2 且 n<=SIZE_MAX-2（positive 另含n>0）。无新增 requires/assigns/terminates；条件不是输入域限制，公共原 k<=SIZE_MAX/64 能满足此条件。

两个原 inner loop 各新增整数 count 不变量；原 range/even 不变量只命名便于定点选择。无新的地址frame断言，无ghost helper，无跳过真实callee。四个body ensures必须自身过；两个新不变量各有建立/保持债务。若选定变绿但body未证，不能算闭合。源guard通过，尚未运行solver。

根执行：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-single.py qd8-round-r1 round-body-root01 fct:round_up_po2 180
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-single.py qd8-round-r1 selected-root01 qd8_round_range,qd8_round_even,qd8_round_count,qd8_round_positive,qd8_neon_even_kc,qd8_neon_k,qd8_neon_count,qd8_rvv_even_kc,qd8_rvv_k,qd8_rvv_count 600
```
预计body四个ensures、selected十六个raw，实际枚举为准，CFG另记。此候选有意保留原函数缺assigns问题，不靠新增合同掩盖；若造成调用后内存havoc，会如实报告。
