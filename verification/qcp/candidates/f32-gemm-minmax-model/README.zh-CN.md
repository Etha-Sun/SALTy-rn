# GEMM 完整参数域模型能力包

本目录交付完整参数域的数值、packed布局、循环schedule和内存SL模型及数学桥。**34个模型/数学模块和ModelGate已从源fresh普通Coq通过，总134.07秒，2并行、每compiler16GiB；本包C VC数为0，不是原始C整核成功。** [实际结果](proof/evidence/fresh01/result.json)、[完整Coq日志](proof/evidence/fresh01/coq-logs.txt)、[gate及假设](proof/evidence/fresh01/ModelGate.log)。

这不是以数学模型替代原C来申报kernel完成。另一层local NEON21/RVV03候选的850个C VC及caller44个C VC没有搬入，也没有由本包重放或闭合，不能用此PR声称已提交850个C证明闭包。原始C对应、intrinsic C body、ISA与独立终止性仍保留边界，不进入verified、不增加kernel计数。

## 人工审查入口

先读[interface.json](interface.json)、原[NEON](impl/testNEON.c)/[RVV](impl/testRVV.c)及[独立修复](repaired/rvv.c)。[真正公开spec.c](review/full-domain-caller/spec.c)逐字保留实际调用test_neon/test_rvv、比较输出及return==1/输出关系/输入和内存资源保持的合同；[contracts.h](review/full-domain-caller/contracts.h)与literal include所需headers齐备。它们在本包只供审查，**未编译或证明C body**；没有在proof中藏另一份kernel C body或旧Require/Ensure模板。

| 模型内容 | 源与结论 |
| --- | --- |
| 精确FMA与不同min/max | [FmaModel](proof/coq/GemmSpec/FmaModel.v)、[IntrinsicModel](proof/coq/GemmSpec/IntrinsicModel.v)：Flocq Bfma融合RNE，NEON传播NaN与RVV选择number分别定义 |
| 独立NaN修复数学 | [ClampRepair](proof/coq/GemmRepair/ClampRepair.v)、[Observation](proof/coq/GemmRepair/Observation.v)、[反例记录](repair.md) |
| 全矩阵/panel索引 | [OutputBridge](proof/coq/GemmFullBridge/OutputBridge.v)：所有mr/nc/K的数学输出关系及合法域索引界；不是C执行定理 |
| 两侧累加schedule | [NeonSchedule](proof/coq/GemmFullNeonBridge/NeonSchedule.v)、[RvvSchedule](proof/coq/GemmFullRvvBridge/RvvSchedule.v)：保持实际FMA顺序，不使用浮点结合律 |
| 未初始化输出与缺行alias | [FullState](proof/coq/FullDomainRvv/FullState.v)、[FullNeonModel](proof/coq/FullDomainNeon/FullNeonModel.v)、[NeonStoreState](proof/coq/FullDomainNeon/NeonStoreState.v) |
| 初始、分块、完成内存 | [InitialState](proof/coq/FullDomainMemory/InitialState.v)、[ChunkState](proof/coq/FullDomainMemory/ChunkState.v)、[RowWindows](proof/coq/FullDomainMemory/RowWindows.v)、[OutputFinish](proof/coq/FullDomainMemory/OutputFinish.v) |
| 调用合同逻辑适配 | [FullCallerLogic](proof/coq/FullDomainCaller/FullCallerLogic.v)、[FullConsequence](proof/coq/FullDomainConsequence/FullConsequence.v)：完整pure/A/W/C/params及任意frame保留，不是函数环境soundness证明 |
| 共享SL tactic | [FastFrame](proof/coq/LeaderAutomation/FastFrame.v)，与集成3cf的已审查版本逐字相同 |

所有34模块的原namespace、导入图、源SHA及位置在[manifest](proof/manifest.json)。29份源逐字复制；5份基础模型从同hash的[verified VADD源码](../../verified/f32-vadd/proof/manifest.json)按repo路径读取并在本轮fresh重编译，不读取其旧.vo。Vadd命名仅表示共享数值/比较/数组模型来源，没有运行VADD kernel验证。ModelGate实际Check关键定理及20个Print Assumptions；35份实际Coq日志共175个报告块，**不是175个C VC**，继承的框架/地址/经典/实数/外延假设原样保留，不宣称全局无公理。

## 参数域与观察

mr=1..4，nc及K为符号的任意合法正数，kc=4K字节；标准mapper的A行stride=kc、C行stride=4nc、列块stride=32。A有4K个初始化float，W有ceil(nc/8)个[8bias＋K×8weight]完整panel，含padding；每侧输出各4nc个可写槽，**无需初始化**，资源分离及地址/机器容量界保留。缺行允许逻辑alias，物理输出资源只拥有一次。不是固定1×8，也不覆盖任意重叠stride。

全fp32含NaN、Inf、subnormal、±0合法，lo/hi也不要求finite或lo≤hi。观察active mr×nc数值相等或双方NaN，±0相等；不观察payload、异常flags。精确域与内存条件以公开spec/接口和[MachineDomain](proof/coq/FullDomainRvv/MachineDomain.v)为准。[语义台账](semantics.json)列明spec-only和ISA状态。

QCP底层是byte memory；FloatArray/store_float是其上的typed assertions。本包证明这些明确f32布局与SL桥，不声称任意bytecast或混合量化kernel已闭合。部分基础文件保留较小tile的辅助定义，顶层FullState与矩阵/schedule定理没有因此固定mr/nc/K。

## 可移植fresh重放

依赖公开[环境能力PR#5](https://github.com/Etha-Sun/SALTy-rn/pull/5)，其environment.py身份在manifest固定；不要再复制一份环境工具。配置QCP2.1.4/Coq8.20.1后：

```sh
QCP_HOME=/path/to/QCP QCP_COQC=/path/to/coqc-8.20.1 QCP_LAYOUT=in-place \
  python3 verification/qcp/candidates/f32-gemm-minmax-model/proof/check.py \
  --name fresh-new --jobs 2 --wall-seconds 300
```

若环境能力在另一公开checkout，可显式给`--environment-tools /path/to/environment-checkout/verification/qcp/tools`。脚本检查依赖SHA，直接调用load_environment，构建仅external标准库＋包内fresh目录的namespace flags；不读取任何worker build下的旧flags。`.build/<name>`必须不存在；从零project objects开始，所有模型及5份repo基础源逐个重编译，随后检查ModelGate，保存命令/日志/Print。最多2个compiler，每个AS16GiB、CPU/wall有限；外层应允许32GiB aggregate。原始来源绝对路径仅作provenance，重放只使用package_source/reused_repository_source。

本轮复用既有外部QCP/Coq/Flocq库，没有从空环境重建工具链、没有新recursive coqchk，也未建立外部source-to-vo build history。模型与原C之间的parser/VC generator/source-refinement边界、精确intrinsic合同的实现与ISA对应均不会因数学gate通过消失。
