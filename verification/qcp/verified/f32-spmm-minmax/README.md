# F32 sparse matrix multiplication and min/max verification

Complete actual NEON/RVV kernels, loops, memory, caller, ordinary helpers and both strategy interfaces passed full admission and recursive Coq checking. See [the Chinese review and replay guide](README.zh-CN.md) and [checked status](proof/status.json). All binary32 values, cyclic sparse packing, explicit capacities, fixed RVV VLEN128/e32m8, all legal VL choices; numeric equality or both NaN. Formal ISA/ABI correspondence, full termination and arbitrary hardware VLEN are not claimed.
