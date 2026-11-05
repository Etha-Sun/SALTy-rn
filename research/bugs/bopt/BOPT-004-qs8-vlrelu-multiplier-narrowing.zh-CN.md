> 监督者审核后收录（2026-11-05 11:15 UTC，用户休息期间，待用户审核）。原草稿：`build/e1-workers-20261104/w23-requant/repo/verification/qcp/candidates/e1-qs8-vlrelu-pair/proof/bugs/BUG-DRAFT.zh-CN.md`。

# qs8-vlrelu：32768 合法倍率被截成负数，输出符号翻转

状态：已确认具体不等价；修复决定待监督者审核。

## 发现途径

E1 验证原始 NEON A ⇔ 最终优化 RVV Bopt 的准备阶段，复用清单提供边界/算法疑点，辅助手段（真实 init + intrinsic 差分测试）首先给出并确认反例。不是 Coq 证明失败产生的反例，未将其计为已完成配对证明。

## 固定版本、触发条件和最小反例

- A：SALTy-rn `be16280c7812a7459c26c3ce82a47339a3d07718`；Bopt：optimized-rvv-kernels `80feb4564cb470de301062109b6f89db672bdf9d`。本记录编号暂为 **BOPT-TBD（W23-lrelu）**，交监督者分配。
- 最小非空 batch：n=1，input=[1]，input/output zero_point=0，input_scale=128，output_scale=1，negative_slope=0.5。
- 真实 `xnn_init_qs8_lrelu_scalar_params`（`src/microparams-init.c:674–704`）生成 `{izp=0, pm=32768, nm=16384, ozp=0}`；正 scale 范围 [2^-8,128] **包含** 128；正 multiplier 上限为 **32768**。
- A=127，scalar reference=127，Bopt=-128，v1.2 Bopt=-128；三个 VLEN 相同。差 255，超过 `test/unary-ops.h:302–328` 的 qint8 容差 1。
- 对负分支也有独立 n=1 反例：input=[-1]，input_scale=output_scale=1，negative_slope=128；init 得 `{izp=0,pm=256,nm=32768,ozp=0}`。A/scalar=-128，Bopt/改写版=127。

## 偏离方与原因

Bopt 偏离。`impl/testRVV.c:32–33` 把合法的 32768 截成 signed16 的 -32768，却继续采用 `x-izp`（如 60 行）及 vsmul（63 行）的乘法方向。正反例中：输入差为 1，左移后 128，乘 -32768 并 RNU 除 2^15 得 -128，最终截窄得 -128。

A 用 `izp-x` 和 **取负后的** multiplier，正反例对应 -128×-32768，经 SQRDMULH 得 128，再窄化到 127。这个双取负关系在 multiplier=32768 的边界不能只取消两侧取负：signed16 无法表示 +32768。

XNNPACK 的 scalar-andxor-u1（`src/qs8-vlrelu/gen/qs8-vlrelu-scalar-andxor-u1.c:32–46`）使用 int32 原始倍率，计算 `clip8(floor(((x-izp)*m+128)/256)+ozp)`。tester 的 LeakyReLU 参考在 `test/unary-ops.h:310–312`，符合该语义。两种参考都支持判定 Bopt 的符号错误，不是允许的舍入误差。

## L1：真实调用路径与输入可行性

固定 XNNPACK 为 `867d5a344790802ee067be62f572c2e2722bf6fb`。下述位置均相对 `benchmark/XNNPACK/`；这部分是源码追踪，不宣称已动态执行整套 XNNPACK operator/runtime。

1. API：`include/xnnpack.h:2627` 的 `xnn_create_unary_elementwise_nc` 接收输入/输出 datatype、量化参数和操作参数；`src/tensor.c:50–79,318–344` 对 qint8 零点检查 [-128,127]，scale 必须有限、正规、正。本记录所有零点、scale 都满足，input/output 是不同数组，输入另有足够已初始化 padding。
2. 子图：`src/subgraph/unary.c:372–459` 的 `xnn_define_unary` 对 leaky_relu 要求非空 params，未排除本反例 slope；`create_unary_operator`（281–307）直接把张量 scale/zero_point 传给 create API。
3. 创建：`src/operators/unary-elementwise-nc.c:316–358` 调用 `init_op`。`get_config`（128–131）为 qint8 的 leaky_relu/convert 选择对应 config；`init_op`（266–277）调用该 config 的真实 init，没有额外排除本反例的条件。
4. 配置：`src/configs/unary-elementwise-config.c:2641–2644,2732–2735` 在 AArch64 选择 NEON u32 和本记录运行的 scalar-params init。E1 的 A 是 SALTy 提取的 u8 版本；与 XNNPACK `gen/*-neon-u8.c` 的函数体去空白及入口重命名后逐 token 一致。u32 配置是调用路径依据，不冒充本轮实际运行的 A。
5. reshape/setup：`src/operators/unary-elementwise-nc.c:372–397,439–456` 接受 batch_size=1、channels=1、stride=1，把 params 复制到 contiguous context，并以字节数调度；`src/operator-run.c:1357–1366` 最后执行 `context->ukernel(size,x,y,&context->params)`。n=1 是合法尾部调用。
6. 初始化参数由未修改的 `src/microparams-init.c` 整个翻译单元编译链接得到，保留 assert；没有手填 multiplier，也没有用重写的 init 替代。每个目标 ABI 独立运行同一 init，输出 PARAM 记录相同。

因此反例是 XNNPACK 接受并能产生的输入，不能通过缩小 spec 排除。

## 证据、范围与复现

- `../identity.json` 固定 A、Bopt、工具 v1.2 输出及头文件的来源和 SHA256；`../repro/input-manifest.json` 固定 C/ELF/日志及外部 init、scalar、NEON 源码哈希。
- A 原版编译到 AArch64，真实 NEON intrinsic；Bopt 原版及 v1.2 指针版分别编译到 RV64，真实 RVV intrinsic。改写版使用工具生成的真实包装头文件，未经手改。没有 QCP shim 或软件模拟 intrinsic 参与差分。
- Zig 0.15.2，`-O2 -ffp-contract=off`，static musl；QEMU 8.2.2。RVV 使用 `rv64,v=true,vlen=512/128/256,elen=64,vext_spec=v1.0`。完整 argv、rc、耗时在 `../repro/run-*/results.json`，stdout 在同目录。
- 每 case 测试 n=1,7,8,9,64,65,128,129,256,257,769。分别覆盖 NEON 尾部和整块，以及 RVV e8m4/e16m8 的 VLMAX=64/128/256 与多段流水线。每 kernel 4 cases×11 lengths×7 实际 QEMU 进程配置=308 次 case 执行。全部输出后置哨兵保持；全部 NEON 输出等于 scalar；原版/改写版 RVV 的完整 stdout 在三个 VLEN 逐字节一致。
- 复现：在 worker 根目录运行 `python3 replay.py`，新建时间戳目录，不改旧记录；再运行 `python3 analyze.py` 验证返回码、哨兵、预期反例和原版/改写版一致性。第一次缺 pthreadpool include 的构建失败保留在早期 run 目录，已在脚本补上真实 include 路径。
- 这构成具体不等价的运行证据，不是完整 Coq 证明；QEMU 不枚举 RVV 规范允许的所有 VL 选择，不能从差分测试推出普遍等价。

## 修复计划（未实施）

保留 A 与 Bopt 原件。建议在 Bopt 的所有流水线计算副本中恢复与 A 相同的乘法方向：16 位差改成 `izp-x`，positive/negative multiplier 在 int32 中取负后再窄化到 int16；mask 仍按原始 x 与 izp 选择分支。合法 init 的倍率取负不会溢出 int32。若未来合同仍允许全 int32 原始参数，必须另行处理 INT32_MIN，不能假定这个应用域覆盖旧全域 spec。

拟在监督者批准后，单独保存为 `proof/repair-proposed.patch` 并建立 Bopt_fixed 候选；当前没有生成或应用程序补丁。目标为 **A ≡ Bopt_fixed**，三种 VLEN；另复查 32767/32768、负倍率、全部 byte input 和流水线边界。保持现有 load/compute/store 结构，新增向量取反或改用反向减法的具体成本仍需 Saturn RTL **实测**。性能未测，不能承诺无代价。

不建议排除 multiplier=32768，因真实 init 明确允许。若要使用真实 init 域替换旧宽域 spec，须监督者审核并分配 C 标记；修复对象须分配 V 标记。是否对外报告由用户决定，本 worker 未联系任何维护者。

## 对实验结论的影响

主结论是 **原始 A ≠ Bopt**。完整配对证明未完成，`status.json` 的 passed/cross_isa_pair_checked 均为 false；未启动无法成立的整核等价性证明，未改变程序、未加强 spec、未使用宽松观察关系。修复后的结果应单独计数，不替代当前反例。
