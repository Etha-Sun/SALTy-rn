> 监督者审核后收录（2026-11-05 11:15 UTC，用户休息期间，待用户审核）。原草稿：`build/e1-workers-20261104/w23-requant/repo/verification/qcp/candidates/e1-qs8-vcvt-pair/proof/bugs/BUG-DRAFT.zh-CN.md`。

# qs8-vcvt：倍率预移位截断及提前饱和破坏重量化

状态：已确认具体不等价；修复决定待监督者审核。

## 发现途径

E1 验证原始 NEON A ⇔ 最终优化 RVV Bopt 的准备阶段，复用清单提供边界/算法疑点，辅助手段（真实 init + intrinsic 差分测试）首先给出并确认反例。不是 Coq 证明失败产生的反例，未将其计为已完成配对证明。

## 固定版本、触发条件和最小反例

- A：SALTy-rn `be16280c7812a7459c26c3ce82a47339a3d07718`；Bopt：optimized-rvv-kernels `80feb4564cb470de301062109b6f89db672bdf9d`。编号暂为 **BOPT-TBD（W23-cvt）**，交监督者决定是否按两个根因分号。
- 最小非空 batch：n=1，input=[1]，输入/输出 zero_point=0，输入/输出 scale=1。
- 真实 `xnn_init_qs8_cvt_scalar_params`（`src/microparams-init.c:1207–1226`）产生 `{izp=0,m=256,ozp=0}`，所有 assert 通过。
- A/scalar=1，Bopt/工具 v1.2 指针版=-1，VLEN512/128/256 均相同。差 2，已超过 `test/unary-ops.h:133–146` 的容差 1。
- 第二个简单用例：scale 比为 2（m=512），其余相同，A/scalar=2，Bopt=0。
- 独立的饱和顺序反例：n=1、input=[127]、izp=-128、ozp=-100、input_scale=255/256、output_scale=1（init m=255）。A/scalar=127，Bopt/改写版=27。这个倍率的移位不溢出 int16，故可单独暴露第二个根因。

## 偏离方与两个根因

Bopt 偏离。

1. `impl/testRVV.c:19–20` 把 7 位移位从输入差移到 multiplier，并窄化成 int16，丢失有效位。m=256 时 `256<<7=32768` 截成 -32768；vsmul(1,-32768,RNU) 得 -1。m=512 时截成 0。反例本身不涉及有符号左移 UB：移位前 int32 值分别为正 256/512。合法域上限 m=32768 会先变成负 int16 再左移，另有 C UB 风险，本轮未依赖这一点得出结论。
2. 第 35–36 行（尾段同为 52–53 行）先 `vnclip` 饱和到 i8，再 `vsadd` 加输出零点。正确顺序是先在较宽类型中加零点，再最终 clip8。饱和用例差 255，乘 32640 后 RNU 得 254，提前 clip8 得127，再加 -100 得27；正确的 254-100=154 最终 clip8 得127。

XNNPACK scalar-u1（`src/qs8-vcvt/gen/qs8-vcvt-scalar-u1.c:32–48`）按 int32 原始倍率计算 `clip8(floor(((x-izp)*m+128)/256)+ozp)`；tester Convert 的 ReferenceImpl 是恒等的反量化/重量化参考（`test/unary-ops.h:133–145`）。合法的单位 scale、同零点本应保持输入值。A 与参考在本 suite 全部一致。

复用清单已有 izp=128 的旧反例不属于正常 qint8 张量零点；本记录使用 izp=0 或 -128 的新反例，不依赖那个非法零点。

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

保留原件。建议取消 multiplier 的预移位截断，把 7 位移位恢复到 16 位输入差，并采用与 A 相同的 `izp-x`、取负 multiplier、RNU 分数乘法；在 16 位结果上 `vsadd` 加 output_zero_point 后再窄化到 i8。该方向同时处理 multiplier=32768 边界及提前 clip8。保持现有流水线调度，所有计算副本一起更新；或使用 32 位精确乘法后 RNU 右移 8 作为另一方案，但需比较实际成本。

拟在监督者批准后，单独保存 `proof/repair-proposed.patch`，以 **A ≡ Bopt_fixed** 为后续三 VLEN 验证目标；当前没有生成或应用程序补丁。必须覆盖 m=1/255/256/512/32768、极端零点、正负输入差、饱和抵消和尾段。恢复向量 shift、宽加法及可能的反向减法会改变指令序列，Saturn RTL 性能尚未实测，不能报告无影响。

不得用 m<256 或 ozp=0 的前提排除有效用例。旧 spec 全 int32 multiplier 与原 A 的 INT32_MIN 取负 UB 还需监督者单独裁定；任何应用域条件或程序变体要分别分配 C/V 标记。是否对外报告由用户决定，本 worker 未发送报告。

## 对实验结论的影响

主结论是 **原始 A ≠ Bopt**。完整配对证明未完成，`status.json` 的 passed/cross_isa_pair_checked 均为 false；未启动无法成立的整核等价性证明，未改变程序、未加强 spec、未使用宽松观察关系。修复后的结果应单独计数，不替代当前反例。
