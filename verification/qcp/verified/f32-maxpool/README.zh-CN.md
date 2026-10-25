# F32 Maxpool：修复实现的跨 ISA 验证

本目录验证修复后的 NEON/RVV Maxpool。最终完整验收以 `proof/status.json` 的 `whole_kernel_verified` 和绑定的完整重放记录为准；组件证明、源码检查和有限测试各自保留范围，不单独计为已验证 kernel。

观察是所有实际写入地址的 binary32 位模式，包括 NaN 符号、payload、quieting 和正负零。两侧分别满足同一完整输出状态合同；`StateObservation.mp_kernel_posts_written_and_frames` 覆盖任意实际写入地址及各自未写 frame，`TraceLookup.mp_kernel_posts_full_state` 给出未写 frame 一致时的完整最终 map 等价。公开 C 比较器只是一处任意 written probe 的实例，不把结论缩成最后一个像素。

保留完整 FP32 域及无序 min/max bounds。`kernel_elements=0` 仍执行原始首读和九输入 fallback；不增加 K>0。原来的有符号截断计数改成防下溢的 uint64 剩余计数。RVV 保持 NEON 原九输入树、操作数和 previous-pass 的结合次序，普通 C 辅助函数按原四阶段优先级恢复 NaN。原件、实际反例、精确 patch 和修复目的见 `proof/repair.json` 与 `proof/original-counterexamples.json`。

新的 NaN 辅助实现明确初始化三个 32-word UInt32 栈数组，再只处理活动前缀。`mp_restore_lane`、`mp_array_read`、`mp_array_write`、`mp_propagate_nan` 都有实际 C body 目标和完整类型检查；四个原有 FP 包装函数保持原样。两份被拒绝的循环不变量记录在修复 history：先前缺少 VL 保持关系，随后遗漏已有的三个参数指针局部资源。这些是注释/状态模型缺口，不是新的 C 反例。

逻辑内存采用 QCP 的整数地址模型。`mp_array_read/write` 是本案内部、仅由三个新建且存活的 32-element 栈数组调用的适配器；其合同保留 `UIntArray.full`，不宣称任意 ISO C 指针的通用 API 已获证明。框架的 UIntArray 地址模型不在这里被解释成允许 C null 解引用；本地对象的分配、有效生命周期和 formal/native 对应属于源到模型的显式边界。公开 table-reader 的非空前件仍然保留。完整 callee 审计绑定每一处实际数组调用及其对象，未增加公开 kernel 参数限制。

Intrinsic 采用公开的、逐项绑定的原 ISA 规范边界，见 `proof/intrinsic-ledger.json`。固定 RVV VLEN=128、SEW=32、LMUL=8、VLMAX=32、vstart=0；Arm DN=FZ=AH=0。尾部向量值保持任意，不能把 C 栈初始化的零解释为 ISA tail-agnostic 固定零。ISA/compiler/ABI 精化、FP flags/traps 和独立整机终止性不在本证书范围内。继承的 QCP/经典数学假设在完整 Print Assumptions 中列出，没有新项目公理。

完整重放会从当前 C 重新生成 11 个单元，检查所有 ordinary helper/kernel/caller、签名/合同/callee 闭包，并从 `.v` 重新编译本案全部依赖和最终全限定 `VC_Correct`，再并行输出完整假设报告：

```sh
python3 proof/check_full.py --config /path/to/coq-flags.json --jobs 32 --live-slots 16
```

冻结清单生成器 `proof/build_full_handoff.py` 用于维护者在原组件及迁移记录齐备时创建新 H；已有 H 的重放不依赖这些私有组件对象。

UBSan、实际 16 GiB/swap0 cgroup 下的 ASan、真实 NEON/RVV SDK 编译，以及两侧共同出错但独立 oracle 拒绝的负控，均是单独的执行证据，不代替上述完整证明。普通验证进程上限 16 GiB/2 小时，重型 32 GiB/4 小时，长生成 6 小时；实际并发按共享机器预约额度调度。
