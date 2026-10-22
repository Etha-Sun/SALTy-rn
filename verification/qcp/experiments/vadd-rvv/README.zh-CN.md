# RVV32 vadd primitive：已检查的完整 load

独立 namespace 为 `QcpRvv32`，只复用 `shared/vadd` 已有模型，不修改冻结 case 或旧证明。`generate.py` 生成固定32字段的 C 表示与合同，不是通用 C 转换器。

已完成 `__riscv_vle32_v_f32m8`：完整32字段函数实际调用32次 guarded read helper；两者真实 C body 的 **100个 VC** 已由 `rvv_load_checked.v` 完整实现，另有 **3条数组策略证明**。输入只要求 `FloatArray.full(p,vl,L)`，其中 `0<=vl<=32`；所有 i<vl 的结果为对应输入值，其余字段精确为 +0，输入资源保留。没有把 tail 前置加强成始终需要32个可读元素；VL=0 时函数不读取 p。

`RvvLogic.rvv_read_value` 使用 QCP 的完整 fp32 域，含 NaN、Inf、±0。活动值通过真实数组读取、missing_i/full 重组和默认值无关引理恢复，未将 IEEE `fp32_eq(x,x)` 当作 NaN 的反身性。生成器和已检查 helper 均有实际 body，不是 spec-only 声明。

运行已检查 load 的完整重放：

```sh
python3 verification/qcp/experiments/vadd-rvv/run.py
```

runner 重新生成源代码、StrategyCheck 和 QCP 目标，逐字核对已审定目标，拒绝手写证明中的 Admitted/Axiom/Parameter，再顺序 coqc 与 native 检查。依赖当前旧 workspace 的 QCP 2.1.4、Coq 8.20.1 和 `research/qcp-shim-vadd/results/coq-flags.json`，尚未做成可移植环境。命令和日志在 `status.json` / `logs/`；原始独立完整 load 编译记录也保存在 `load-proof-result.json` / `rvv_load_checked-coqc.log`。

`native_check.py` 对33种 VL、396个 case，将新的 load/add 表示与未改动 `shared/runtime/float_ops.c` 逐 bit 比较；包括 NaN/Inf/±0/次正规数/随机 bits，检查输入 frame 和 inactive +0，VL=0 的 load 使用空指针。全部通过。该有限回归不替代通用 lowering 正确性或 ISA 对应证明。

## Add 与 store 的准确边界

`rvv_add.c` 也已生成完整32字段实际实现，含 f32_add 和 lane helper 的真实定义；合同逐 lane 为 `vadd_active_add(i,vl,xi,yi)`，允许全部 fp32 输入。已生成101个 VC，但当前完整 module 的 coqc 尚未闭合；状态必须保持 pending，不能按 native 通过计作形式证明成功。

其证明脚本为 `rvv_add_checked.v`。主要时间消耗在96个 heap cell 的64个调用前件/框架义务：通用 entailer 随上下文增长较慢。初始检查超时并非已确认的语义反例。可用 `run.py --add` 要求同时完整检查 add；独立当前结果见 `add-proof-result.json` 和 `add-timing.log`。只有完整编译 exit0 并核对源/目标后，才能更新 add_proved。

Store 尚未实施。下一阶段应使用仅 VL 个可写 cell 的前置及分段/mixed-array 资源来证明写入前缀和外部 frame；不能为简化证明要求32个目的 cell，进而误称覆盖原始 tail 输入域。完整 VADD kernel、mapper/比较器接线、通用表示转换及实际 ISA 关系仍未证明。

`Print Assumptions` 保留 QCP 布局/地址模型参数与标准 Coq/Flocq 经典实数及外延性假设，没有新增 axiom/Admitted。当前 full load 证明是 C 表示层的 primitive body 证明，不是完整跨 ISA kernel 结论。
