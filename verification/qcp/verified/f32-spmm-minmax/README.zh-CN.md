# F32 SpMM 完整核验证

两端完整实际 C、循环与内存、caller、普通helper和策略均已通过完整准入：NEON 443/443、RVV 335/335，四个实际C单元共788字段。835个本地模块在同一环境fresh编译，956份假设报告与完整递归Coq检查通过；只有既有框架假设，没有新增项目公理。状态及范围见 [proof/status.json](proof/status.json)，证据见 [full-status.json](proof/full-status.json)。

本包验证稀疏矩阵乘法与夹紧的完整 M/N/非零权重循环，包含 NEON 4/2/1 行路径和 RVV 所有合法 VL 选择。实际 C、合同与 intrinsic 解释分别在 [impl/testNEON.c](impl/testNEON.c)、[impl/testRVV.c](impl/testRVV.c)、[spec.c](spec.c) 和 [intrinsic-ledger.json](proof/intrinsic-ledger.json)。原件、两个逐侧补丁及所有修复说明保留在 [repair.md](repair.md) 与 [source-identity.json](proof/source-identity.json)。

## 实现与原版差异

原 RVV 使用先乘后加，NEON 使用融合乘加。有效循环打包反例：M=4、N=1、nnz=1、dmap=[0]、bias=-1、A=1+2^-23、W=1-2^-23、夹紧范围[-Inf,+Inf]。原 NEON 和独立 oracle 得到 -2^-46，原 RVV 得到 +0。修复把 RVV 改为一次舍入的 vfmacc，并恢复 NEON 的 NaN 传播观察行为；稀疏累积次序不变。

两端另有前端兼容改写：`*ptr++` 和条件中的 `--counter` 拆为显式顺序语句；RVV 局部 `in` 改名为 `input_cursor`，避免生成 Coq 关键字。证明针对这些可见的当前实现。原始两端永久保存在 [proof/original](proof/original)，没有声称当前 NEON 逐字原样，也没有声称形式证明了一般 C 源码变换器。

## 精确输入和观察边界

M 表示 float 行数，C 参数 mc=4*M 字节；M/N 为公开容量合同内的任意正整数，不固定稀疏图或有限测试尺寸。每列为一个 bias 与相应的非零权重，NN 为 N 个 uint32 非零数，D 为有符号 int32 字节偏移，每个偏移为4的倍数；D 的总和为0，各前缀对应的全部活动输入行均在拥有的输入数组内。该循环打包约定及索引定义见 [Model.v](proof/coq/SpmmSpec/Model.v)。

输出只拥有每列 M 个 float，列步长至少4*M且4字节对齐；列间空隙保留在调用者 frame 中。容量约束最后实际写入位置 `out + stride*(N-1) + 4*M < 2^64`，允许未解引用的中间无符号乘积与回退表达式回绕。输入、权重、索引表、参数及输出的分离和访问范围均属于实际义务。prefetch 地址表达式保留合同中的额外数值界限；QCP 使用整数地址内存模型，不额外声称 ISO C 对象来源规则或物理 ABI 已被形式证明。

所有 binary32 值都保留，包括 NaN、无穷、正负零、次正规数及无序夹紧边界。输出关系是数值相等或两者均为 NaN；NaN payload、符号、quieting 和异常标志不作为输出观察。证明保留每步单次舍入的累积次序。

| 项目 | 配置与边界 |
| --- | --- |
| NEON | AArch64，RNE，不flush，NaN策略按输出观察抽象 |
| RVV | VLEN=128、SEW=32、LMUL=8、VLMAX=32、vstart=0、RNE |
| VL | 保留全部合法选择，包括32<AVL<64时的balanced选择 |
| 非活动lane | 任意值，只在活动前缀内读写和建立结果关系 |
| 正确性范围 | intrinsic-spec 下的完整 C 模块化部分正确性 |
| 尚未证明 | ISA/编译器/物理ABI对应、完整终止性、任意硬件VLEN |

循环打包来源对照固定在上游800ffc1792873f09af89518a1578a53fdaf78219的 `xnn_pack_f32_spmm_w` 与卷积算子缩放逻辑，材料在 [proof/evidence/packing](proof/evidence/packing)。这不是生产packer的形式C证明，也没有把该版本与catalog源码版本的精确对应当成已证明事实。

## 可复用证明与信任边界

迁移已验证 F32 GEMM 的 FMA、NaN夹紧、观察关系与内存能力，以及 QS8 的分离逻辑归还策略；迁移来源与SHA在 [reuse-provenance.json](proof/reuse-provenance.json)。本包重新检查全部导入。新增共享引理处理稀疏递推、有符号偏移、模2^64游标、列strip借还、tuple临时对象与任意合法活动前缀；两端直接共用这些证明。

[FinalCheck.v](proof/coq/SpmmAdmission/FinalCheck.v) 绑定两端、caller、普通helper和两类策略的完整接口。四个实际C单元共788字段（443+335+6+4），另有19策略字段和9个记录/无符号地址探针字段。`qcp_identity`、断言与prefetch普通wrapper有实际C体证明；只有底层intrinsic/builtin采用来源审阅合同。26条 [intrinsic ledger](proof/intrinsic-ledger.json) 逐条公开合同、Coq定义、官方来源、配置、调用适配及内存解释，最终人工语义审阅仍待完成；没有增加未证项目公理。

参数tuple采用 `scalar_bounds` 中相邻 min/max 的类型化字段视图。AAPCS64/ACLE对照及GCC/AArch64-Clang布局检查在 [proof/evidence/params-layout](proof/evidence/params-layout)。NEON生成器错误的R/Int记录模板原件在 [proof/evidence/neon-record-frontend](proof/evidence/neon-record-frontend)，实际目标不改写，公开definition导入已检查的binary32/Float解释。

## 重放与证据

需要已配置的 QCP2.14、Coq8.20.1、Flocq与项目外部依赖；普通Git克隆不包含这些工具链。安装环境由 `proof/environment.py` 记录版本及外部文件SHA，这是一份安装环境清单，不冒称从零重建了外部工具。

```sh
python3 proof/check.py --run replay01 --jobs 32 \
  --budget-runner /path/to/budget_run.py
```

新批次固定配置32 worker；普通进程16GiB/7200秒，重型递归检查32GiB/14400秒，生成64GiB/21600秒。通过共享池预留内存，32普通worker合计512GiB；实际并发由依赖就绪情况和共享预算决定。完整递归checker检查根及所有传递导入，没有跳过依赖的标志。使用新的run名，保留既有失败、续跑与历史记录。

当前原生回归对max/balanced两种合法VL各检查8160例、594720输出，采用独立索引式 `fmaf` oracle 与 ASan/UBSan；两端同错负控被拒绝。它们是有限host模型测试，不能替代形式证明或硬件执行。最终门禁还检查实际C/CPP记号身份、逐调用合同绑定、所有义务、Print Assumptions、错误证明拒绝和源码篡改拒绝。

可继续工作的状态见 [CONTINUE_PROMPT.zh-CN.md](CONTINUE_PROMPT.zh-CN.md)。完整证据、原始失败与续跑记录已封存；status/full-status/manifest给出相互绑定的文件身份。

本次完整编译耗时约1217.99秒，递归coqchk约1530.11秒。完整准入运行名 `wholecase01`；早期分支批次仅用于开发，最终声明以统一完整环境为准。
