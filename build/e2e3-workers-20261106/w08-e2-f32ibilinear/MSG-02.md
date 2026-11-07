监督者回复（第 1 轮报告已阅）：

目标生成和差分测试做得好（12000 例 0 不一致，两个负对照都被抓住），目标冻结有效。但"阻塞"里大部分是工作量，不是阻塞：**工作量大不是停下的理由，请继续把证明做完，分阶段推进，每阶段更新 REPORT.md。** 只有需要监督者或用户决定的设计问题才停下来问；问之前先给出你的推荐方案。

## 裁定
1. **输入内存模型（别名/重叠）：** 不要缩成"四行互不相交"，也不要另造一套受信的抽象内存模型。监督者查了调用路径：XNNPACK 的 `resize-bilinear-nhwc` 经 `src/indirection.c`（`xnn_indirection_init_resize_bilinear2d_hwc_*`）构造的每个指针都是 `input + 偏移`，行列坐标夹在 `input_height-1`/`input_width-1` 内，没有零缓冲区。所以按 L1 采用候选条件 **C-008**：四个行指针加 `input_offset` 后的窗口（含 `XNN_OOB_READS` 允许的越界读范围）都落在**同一个**只读 float 数组 `FloatArray::full(base, len, F)` 内。窗口之间可以重叠、别名（它们只是同一数组中的不同偏移），这正是 XNNPACK 实际传入的情形。在 `spec.c` 里用 `/* [VEKTO-C-候选] C-008 ... */` 标出，写进 `ledger.json` 的 conditions，并在报告里写明它相对 ukernel 层任意指针的差别（多个互不相关的分配不在本证明范围内）。
2. **SSE 前端错误 `record initializer: local address not found`：** 这和 QCP-004 的最小例（不可达分支里的 record 初始化）是同一条错误信息，可能同源。先读 `research/bugs/qcp/QCP-004-neon-target-crash.zh-CN.md` 和 W02 的探针（`build/e2e3-workers-20261106/w02-avx-probe/work/REPORT.md` 第 15 条：未被引用的 static inline 函数中"struct 局部变量由调用初始化"会触发同一错误，规则工具 R20 已能删除这类函数）。请把最小例缩到能确认触发条件为止。如果确认是 QCP 缺陷且只能靠改写绕开，按 COMMON-RULES 的"人工审核的兼容改写"流程提交补丁（现在只限 do-while 相关；如果绕法是别的形状，先报告，不要自行改）。
3. **`_mm_loadl_pi`/`_mm_storel_pi` 经 `(const __m64*)` 转换：** 按 intrinsic 合同处理（intrinsic 不需要 C 函数体），合同直接说"从 float 指针 p 读 2 个 float 到低两 lane"，在规则工具输出层面看实参是什么形状；如果工具需要新规则（例如去掉指针转换），在报告里提出，附语义依据。
4. **按值向量参数（R24 问题）：** W02 正在实测"平凡转发 wrapper 进合同库"之后是否还需要 R24。SSE kernel 直接调 intrinsic，intrinsic 合同可以写成方便 QCP 的形状；先试这个方向。
5. **优先级：** 先完成 RVV 侧（目标）的全部证明和三个 VLEN，因为它前端已经通过；同时推进 SSE 侧。HVX 本轮不做。
