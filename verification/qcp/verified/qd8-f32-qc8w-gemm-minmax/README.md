# QD8 → F32、QC8W GEMM minmax

本包验证 `qd8-f32-qc8w-gemm-minmax` 两侧完整 C kernel 和实际调用两侧的 `equivalent`。当前验收结果以 [proof/status.json](proof/status.json) 为准；它必须同时引用重新生成的 C 目标、必要本地 Coq 源码的普通编译、全部接口与假设审计。软件 FMA 实现的历史 1007/1015 不作为本包准入依据。

采用[项目 intrinsic-spec 规则](../../docs/INTRINSIC-SPEC-POLICY.zh-CN.md)：在逐项公开、经规范来源对照的 intrinsic spec 下证明模块化部分正确性和输出等价。内存、循环、分支、普通 helper 和 caller 都由实际 C 生成义务并证明；intrinsic 不要求另外编写 C 实现。最终人工语义复核尚未进行，不能将本次来源审查称为人工批准或 ISA 形式对应。

## 审核入口

- [NEON 实现](impl/testNEON.c)、[RVV 实现](impl/testRVV.c)：包含全部外层 N 循环、内层 K 循环和 tail。
- [唯一公开 spec](spec.c)：两个 kernel 合同、保值/逐元素/数组比较 helper，以及实际调用两侧的 `equivalent`。公开 post 包含 `return==1`、输出关系和输入资源保持；Require 不假定输出相等。
- [NEON intrinsic 合同](shim/neon-api.h)、[RVV intrinsic 合同](shim/rvv-api.h)、[64 位类型](shim/types.h)。[逻辑注册](contracts/model.h) 连接到下面的真实定义。
- [逐项语义台账](proof/intrinsic-ledger.json)：37 个 SIMD intrinsic 与 `__builtin_nanf`，包括签名、合同 hash、定义位置/hash、官方规范、所选配置与未证边界。`__builtin_isnan` 在本包通过 [scalar_nan.c](shim/scalar_nan.c) 的实际 C helper 验证。
- [完整参考与内存模型](proof/coq/Qd8FullKernel/FullModel.v)、[向量/写出模型](proof/coq/Qd8API/ApiModel.v)、[公开观察关系](proof/coq/Qd8Public/CandidateLogic.v)、[FMA 定义](proof/coq/GemmSpec/FmaModel.v)、[两种 min/max 定义](proof/coq/GemmSpec/IntrinsicModel.v)。这些定义属于审核内容，不只是证明实现细节。
- [合同与抽象边界定理](proof/coq/Qd8Admission/ProofBoundary.v)、[最终全部接口门禁](proof/coq/Qd8Admission/FinalCheck.v)、[精确模块清单](proof/dependencies.json)。一些复制的旧源码注释保留当时的“candidate/OPEN/NOT compiled”字样，其日期状态不覆盖本次 status 及重放证据。
- [唯一修复日志](repair.md)、[原始/当前源身份](proof/source-identity.json)、[随时续接 prompt](CONTINUE_PROMPT.zh-CN.md)。

## 输入、结果与内存

`mr=1`，`cn_stride=32`；`a_stride/cm_stride` 在这个 1 行 tile 中不被使用。`N=nc`、`K=kc` 为任意合法正 64 位整数，K 的单位是 int8 字节。没有固定 K、固定 N 或只证明 1×8；N 可横跨任意多个完整 panel 和尾 panel。

每个 packed panel 顺序为 8 个 int32 ksum、K×8 个 int8 权重、8 个 float scale、8 个 float bias，共 `96+8*K` 字节。尾 panel 也完整分配。A 的可读长度为 `8*ceil(K/8)`，源 NEON 的尾部 8 字节 load 所需 padding 已公开。packed 权重基址按 4 字节对齐；输出有 N 个可写 float。

[domain_shape/data_capacity](proof/coq/Qd8FullKernel/FullModel.v) 与分离逻辑资源明确要求正地址、对应类型内存、无地址回绕，以及 A、W、两个输出、params 和 quantization_params 的资源分离。容量包括 `a+A_extent <= UINT64_MAX`、`w+ceil(N/8)*(96+8*K) <= UINT64_MAX`、`c+4*N <= UINT64_MAX`。不额外要求 448 字节可读 prefetch padding。输出初始值不影响结果，post 保持全部输入资源。

每个输出先按 32 位模运算计算 `ksum*zero_point + Σ A[k]*W[k,lane]`，解释为 signed32 并以 RNE 转 binary32；再独立乘 `inv_scale`，最后以单次舍入 FMA 计算 `scaled_acc*filter_scale+bias`。clamp 的实际顺序是 **max(lo)，然后 min(hi)**，不交换这两步。

浮点域包含所有 binary32：NaN（含 signaling/quiet）、Inf、±0、subnormal；`lo>hi` 也允许。公开观察是数值相等或双方 NaN，不比较 NaN payload/sign、quieting 和异常标志。内部参考关系更强，除 NaN 外保持同一 binary32 值。

## Intrinsic 语义与配置

NEON 选择 AArch64 分支；FPCR RNE、关闭 flush-to-zero，采用通常 IEEE 浮点行为。RVV 固定 VLEN=128，使用 e8mf2/e16m1/e32m2，每种配置 VLMAX=8；`vstart=0`，请求 `min(nc,8)`。浮点为 RNE，VXRM 对这些非饱和整数运算无作用。当前没有任意 VLEN 定理。

FMA 直接使用 Flocq `Binary.Bfma`，先前乘法直接使用 `Binary.Bmult`。Arm NaN 传播 min/max 与 RVV minimumNumber/maximumNumber 分开建模；RVV 原有的 self-NaN mask、merge 和 bounds-NaN 路径保持可观察结果。

NaN 的具体代表位型不冒充硬件输出位型。[ProofBoundary](proof/coq/Qd8Admission/ProofBoundary.v) 证明任意合法 NaN 结果策略通过本核完整乘法→FMA→max/min 浮点链后保持公开观察；源审查确认该链无 payload 读取和由 payload 决定的分支。实际 NaN 检测 helper 也有完整 C 证明。

RVV 的 inactive/tail 零补全是 **活动前缀的表示约定**。台账对照真实 tail-agnostic 规则，未声称硬件清零。前缀一致性定理覆盖逐 lane 一元/二元/三元运算及只写前 vl 个元素；当前循环每个 panel 重新 load，内部 vl 不变，无 tail→active 重排或横向读取。load/store 合同保留精确的访问前缀和 frame。

## 重放

先按仓库的 QCP/Coq 环境说明安装相同版本和模型。默认工具路径是 `/tmp/qcp214-src`、`/tmp/qcp-coq820-install/bin/coqc`；外部工具链身份记入证据。首次完整验收从空本地编译目录开始，Coq 使用普通 `.v → .vo`，没有 `Admitted`、`-quick` 或 proof skipping。

```sh
python3 proof/check.py --run fresh01 --jobs 32 \
  --budget-runner /path/to/shared/budget_run.py
```

共享服务器必须传入本机共享预算 runner。普通 Coq 每进程 16 GiB、32 路上限合计 512 GiB；最终大门禁 32 GiB，NEON C 生成 64 GiB，均有有限 CPU/墙钟限制。实际并发由依赖、就绪任务和共享池决定。独占预留资源的机器可不传 runner，生成阶段先完成再进入 Coq 阶段。命名运行目录不覆盖；不会重写已发布证书。

原生回归运行当前两个 impl 和 caller，使用独立标量点积/浮点参考、ASan/UBSan、输入保持及输出 canary。测试支持中的 FMA 使用宿主 libm，属于补充回归，不增加形式证明或硬件 ISA 验证数量。两侧同时出错的模型控制、false-goal 和源篡改拒绝控制均单独记录。

## 结论边界

结果是列明 intrinsic spec 和公开契约下的完整 C-shim **模块化部分正确性/等价性**。继承的 QCP/Coq/Flocq 假设由最终逐字段报告完整列出；没有新增未证明项目公理。声明的 intrinsic 合同属于语义边界，不能因 `Print Assumptions` 通过而删掉。

C 程序解释还信任当前 QCP parser、预处理、符号执行路径覆盖和 VC 生成／合同实例化；本包检查其实际生成的完整接口，未把生成器本身的 soundness 当成已经形式化证明。

未声称：ISA/编译器/物理 struct ABI 到模型的形式对应，任意硬件 VLEN，浮点异常标志/NaN payload 相等，独立完整终止性，或超出 QCP 整数地址模型的 ISO C 对象 provenance 性质。
