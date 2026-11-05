# XNNPACK min/max 的 NaN 差异与契约核查

结论：XNNPACK 当前 NEON 与 RVV 的 vmax/vmin 确实有相同的 NaN 输出差异，已用原始 microkernel 文件复现。但已有维护者说明明确不保证 min/max 的 NaN 行为，当前测试也保留相应豁免。因此不能把这个差异计为新发现的 XNNPACK bug。

## 版本与实际执行

本轮查询 google/XNNPACK 的 master，固定为 `82be86388c131862c3673c177d9dbcd5d3e3844d`。不是只看之前的 Keagan 译文。

下载并运行以下四个原始 kernel，不修改源码或计算函数体：

- `src/f32-vbinary/gen/f32-vmax-neon-u8.c`
- `src/f32-vbinary/gen/f32-vmin-neon-u8.c`
- `src/f32-vbinary/gen/f32-vmax-rvv-u8v.c`
- `src/f32-vbinary/gen/f32-vmin-rvv-u8v.c`

四个文件与本地 `867d5a344790802ee067be62f572c2e2722bf6fb` 中对应文件逐字节相同。构建使用本地该版本的 XNNPACK 头文件和 Zig 0.15.2，O3、关闭 fast-math 和 FP contraction。测试入口通过宏绑定到原始符号；没有重命名原文件里的函数。

| 操作 | 输入 A | 输入 B | XNNPACK NEON u8 | XNNPACK RVV u8v |
| :--- | :--- | :--- | :--- | :--- |
| vmax | qNaN `0x7fc12345` | 1.0 `0x3f800000` | NaN `0x7fc12345` | 1.0 `0x3f800000` |
| vmax | 1.0 | qNaN | NaN | 1.0 |
| vmin | qNaN | 1.0 | NaN | 1.0 |
| vmin | 1.0 | qNaN | NaN | 1.0 |

最小输入长度为 1 个元素，提供 NEON 尾部读取所需 padding，输入输出分离。运行覆盖 15 个长度与四类输入，包括双方 NaN 和有限值对照。ARM 使用 AArch64 QEMU、FPCR=0；RVV 使用 QEMU VLEN128/256/512。共 480 次 kernel 调用，结果均符合上表及对照预期。这里是已编译指令的模拟器执行，不是完整 XNNPACK operator/runtime 测试、硬件实验或全输入证明。

当前 [binary 配置](https://github.com/google/XNNPACK/blob/82be86388c131862c3673c177d9dbcd5d3e3844d/src/configs/binary-elementwise-config.c#L845) 在 ARM64 选择 NEON u8，在 [RISC-V Vector 路径](https://github.com/google/XNNPACK/blob/82be86388c131862c3673c177d9dbcd5d3e3844d/src/configs/binary-elementwise-config.c#L900) 选择 RVV u8v，vmin 有对应选择。说明这些文件属于实际配置路径，并非无引用的历史 demo；本轮未执行整个调度器。

## 已有的政策说明

已有 [issue #441](https://github.com/google/XNNPACK/issues/441) 专门询问 min/max 的跨架构 NaN 差异。维护者的[回复](https://github.com/google/XNNPACK/issues/441#issuecomment-611173104)明确写道：

> XNNPACK provides no guarantees about NaN handling in min/max operations.

该回复还指出统一跨架构行为会带来成本。这个 issue 已关闭，不能把此次复现描述为首次报告。

这不是仅依赖历史口头说明：当前 [FP32 microkernel tester](https://github.com/google/XNNPACK/blob/82be86388c131862c3673c177d9dbcd5d3e3844d/test/vbinary-microkernel-tester.cc#L113) 在参考输出为 NaN 时没有检查实际输出，并注明并非所有 kernel 都输出 NaN。[Subgraph 测试](https://github.com/google/XNNPACK/blob/82be86388c131862c3673c177d9dbcd5d3e3844d/test/subgraph/binary.cc#L265) 也有类似分支。

查看的公开 API 说明没有给 maximum/minimum 增加统一 NaN 传播保证。说明中的 numpy broadcasting rules 指张量广播规则，不能据此推定与 NumPy 的 NaN 行为一致。测试豁免本身不等于完整形式契约，此处与维护者的明确说明结合判断。

## 对 Vekto 的影响

- 对“保留具体 NEON 源程序在全部 binary32 输入上的输出”这个任务，NaN 反例依旧有效。原 RVV 与 NEON 不等价，不能把两侧 intrinsic 都建模成同一种行为来消除差异。
- 对“符合 XNNPACK 的 min/max 保证”这个任务，仅凭这个 NaN 差异不能判为库缺陷。库契约符合性与具体程序等价性是两个不同结论。
- “NaN 输出没有保证”不等于“NaN 输入不可能出现”。不能用这个 issue 把 NaN 标成 infeasible，再声称证明了原来的全域等价性。
- 如果选择只证明非 NaN 输入，应明确这是验证范围的选择。没有必要顺带排除无穷大；对于逐元素 min/max，finite-only 比 non-NaN 更窄。这里没有新完成这一范围上的形式证明。
- 也可以按库的较弱关系检查契约符合性，但允许 NaN 情况输出不同后，不再是我们原先“数值相等或双方 NaN”的严格观察关系。
- 前一轮 vmax 的修复性能开销应称为“保留 NEON NaN 传播行为的成本”，不能称为“修复 XNNPACK 自身 bug 的成本”。

因此 E3 的报告必须区分：已复现的语义差异、契约允许的差异、真实契约违反、模型错误。该案例属于已知 NaN 行为未统一的情况，不应列入新 bug 数量或直接草拟修改 RVV 的 bugfix PR。

后续寻找可行动的新问题，应优先检查明确受保证的有限输入、尾部读写、布局、量化舍入和溢出条件。已找到的 [RVV rounding issue #8087](https://github.com/google/XNNPACK/issues/8087) 讨论过 int32 范围外浮点数等问题，但其讨论中已有合入修复的说明；这里只将其视为历史线索，不当作新发现或当前未修复缺陷。

## 复现工件

- [运行脚本](run.py)、[测试 harness](harness.c)、[版本、哈希、命令与结果](results.json)。
- [NEON vmax 输出](runs/vmax-neon/vlenNone.jsonl)、[RVV vmax VLEN512 输出](runs/vmax-rvv/vlen512.jsonl)。
- [NEON vmin 输出](runs/vmin-neon/vlenNone.jsonl)、[RVV vmin VLEN512 输出](runs/vmin-rvv/vlen512.jsonl)。
- [issue 原文快照](issue-441.json)、[评论快照](issue-441-comments.json)。当前源码及测试快照保存在 `upstream/`。
