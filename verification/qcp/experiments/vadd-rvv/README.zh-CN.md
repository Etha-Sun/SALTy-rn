# RVV32 vadd primitive：已检查的完整 load/add/store

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

`rvv_add.c` 含完整32字段实际实现、f32_add 和 lane helper 真实定义；合同逐 lane 为 `vadd_active_add(i,vl,xi,yi)`，允许全部 fp32 输入。**101个 C VC 已在完整 module 中通过 coqc（14.55秒）**，重新生成的目标与审定目标逐字一致。调用框架义务的左右空间断言完全相同，直接按断言语义保留 frame，避免通用 entailer 反复展开浮点值。当前证据为 `add-proof-result.json` / `add-timing.log`，原180秒超时证据保存在 `history/add-timeout-180s.*`，不将超时解释为语义反例。

```sh
python3 verification/qcp/experiments/vadd-rvv/run.py --add --store
```

Store 的真实 C body 已检查：`qcp_rvv_get32` 实际 switch 读取32字段，`qcp_rvv_store_next` 实际执行 `p[i]=value`，`__riscv_vse32_v_f32m8` 的真实 for 循环逐个写入前缀。完整 module **75个 C VC + 5条资源策略**通过 coqc（完整 C module 15.52秒）。前置只要求 `FloatArray.undef_full(p,vl)`；不要求32个目的 cell。循环不变量保留 `[0,i)` 已写段和 `[i,vl)` 未初始化段，退出时得到精确 `rvv_take(vl,L)`，输入vector所有字段保持。VL=0 不解引用 p，任意外部 frame 由分离逻辑保留。

`native_store_check.py` 另跑396个 case（全部33种 VL），将实际 store 与原 runtime 逐 bit 比较，涵盖NaN/Inf/±0、前后canary、输入vector不变、VL0空指针。结果在 `native-store-result.json`。完整 VADD kernel、mapper/比较器接线、通用表示转换及实际 ISA 关系仍未证明。

`Print Assumptions` 保留 QCP 布局/地址模型参数与标准 Coq/Flocq 经典实数及外延性假设，没有新增 axiom/Admitted。当前 load/add/store 证明是 C 表示层的 primitive body 证明，不是完整跨 ISA kernel 结论。
