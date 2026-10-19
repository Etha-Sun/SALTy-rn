# 独立 Bytes/IEEE v27 候选审核

本目录仍是**未资格认证候选**。未替换旧锁、canonical 模型或九项 kernel 的冻结输入。正式 v7 已知案例复验正在执行；只有最终全部 raw、控制与 guards 满足严格条件，才可另写资格结论。锁内的 pending 文字和旧失败记录保持原样。

本版本继承 v25，未导入 v26 的 unsigned read-join 扩展。新增 `readsignedjoin.ReadSignedJoin32` 的实际 body 将四个 signed-byte 观察连接到 uint32 读取；5 项 body VC 全部有效，源 SHA 与执行证据见 `stage3-proof-next/byte-fp-prototype/read-signed-join13/body-root01/`。没有增加 requires、无 body 合同或新 axiom/assume/admit。原因是实际 memcpy 合同提供 signed-byte 相等，v26 的 unsigned-byte 分解不足以直接连接这些观察，且导致一次循环控制退步。

原有新理论的传递 body 复验见 `stage3-proof-next/root-review/byte-dependency-replay01/ROOT-REVIEW.json`，14 组实际 solver 输入、30 个 valid 叶子均冻结。后续 read-inverse09、read-inverse-trigger10、copy-frame11 的源与真实 body 结果由本版本 experimental snapshot 递归锁定。native 仍为独立 v19 实际重编译的安装；没有用旧 observer ABI 冒充新运行。浮点值/字节编码保留独立 NaN 存储选择，读取不重新选 seed，memcpy 保留实际 bytes。

`CODEC-AND-OBSERVER-REVIEW-ROOT05.json` 核对完整 codec raw：482/488，唯一六个未过项精确为预设错误 post；所有正向义务和负函数内部的真实复制关系通过。`CONTROL-REVIEW-ROOT05.json` 核对 memory、highbits、IEEE、unary、FMA 五组：pending 精确为预设错误 post。有/无 observer 的 memory raw 逐项 function/property/passed 一致。负目标未过不是 kernel 反例。

两个 solver adapter 只移除完整假设，不改目标或伪造 solver 输出。可选裁剪只有真实 UNSAT 才用于接受；裁剪后的 SAT 不能作为原任务反例。v25 保留的是原任务已有的 `Q_memcmp_zero`，并非新增公理。实际 SMT、删减记录、stdout/stderr 与全部旧控制失败保留。

Frama-C 原有 memory/地址语义与工具链仍属于 TCB。Bytes 原生的地址范围声明不提供非零 affine 地址桥；不能将其移植到旧 Typed 模型或据此宣布 SPMM 通过。所有九项仍需保持原合法域、完整 callee 与 wrapper 义务，并独立执行严格验收。
