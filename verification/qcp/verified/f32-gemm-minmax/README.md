# F32 GEMM minmax：完整修复版验证包

验证当前两侧完整 C kernel 和实际调用两侧的 `equivalent`。最终状态由 [proof/status.json](proof/status.json) 和完整证据决定；本包已通过完整准入与迁移身份审计；其精确证据由 status 引用。采用[项目 intrinsic spec 规则](../../docs/INTRINSIC-SPEC-POLICY.zh-CN.md)，结论是公开契约与列明 intrinsic spec 下的模块化部分正确性/等价性。

## 审核入口

- 实际实现：[NEON](impl/testNEON.c)、[RVV](impl/testRVV.c)；[唯一修复日志](repair.md)及[来源身份/精确补丁](proof/source-identity.json)。原 RVV 存在 NaN clamp 反例，当前证明针对修复版。
- [spec.c](spec.c) 是公开合同和真实 caller 的唯一入口。`QCP_KERNEL_BODY_VIEW` 分支公开 kernel 的原始证明接口，默认分支公开 caller 接口；[FullConsequence.v](proof/coq/FullDomainConsequence/FullConsequence.v) 的六项完整逻辑后果连接两种视图。它们没有增加 caller 输入限制。
- [NEON 合同](shim/neon/shim-undef.h)、[RVV 合同](shim/rvv/intrinsic-spec.h)、[普通 assert helper](shim/ordinary.c)。`qcp_identity` 的实际 `return x` body 位于 RVV 头内，并包含在 RVV 的391个字段中。
- [逐项 intrinsic 台账](proof/intrinsic-ledger.json)：23项精确声明、合同、实际 Coq 定义位置/hash、官方来源与配置，供最终人工语义审核；人工审核状态尚为 pending。
- [完整累加模型](proof/coq/FullDomainRvv/FullModel.v)、[输出内存](proof/coq/FullDomainRvv/FullState.v)、[容量域](proof/coq/FullDomainRvv/MachineDomain.v)、[FMA 定义](proof/coq/GemmSpec/FmaModel.v)、[两种 min/max](proof/coq/GemmSpec/IntrinsicModel.v)。这些是需审查的语义定义。
- [NaN/活动前缀支持定理](proof/coq/F32Admission/Boundary.v)、[全部接口和逐字段假设门禁](proof/coq/F32Admission/FinalCheck.v)、[必要依赖清单](proof/dependencies.json)。旧源注释保留当时状态，不能覆盖当前验收记录。

## 输入域和内存

`mr=1..4`；`N=nc>0`，`K=kc/4>0`，kc 为对齐到4的字节数。K/N 为公开内存容量约束允许的任意64位值，未限制为小矩阵。标准 mapper strides：`a_stride=kc`、`cm_stride=4*N`、`cn_stride=32`，不覆盖任意重叠 stride。

A 有4K个已初始化 float，包含 inactive row 的实际分配；W 有 `ceil(N/8)*8*(K+1)` 个 float，每个完整 NR8 panel 为8个bias、K组8个权重。两个输出各有4N个可写且无需初始化的 float。只观察前mr*N个活动输出，余下输出仍保持未初始化资源；输入 A/W、bounds 和其余 frame 保持。允许 kernel 内 mr<4 时的行指针别名，分离逻辑按实际共享输入/输出资源处理。

容量域排除64位地址回绕，A/W/两个输出/params 的相应资源分离；精确地址上界见 `machine_capacity` 和公开 Require。完整 N 循环、K循环、NEON两步累加、K/N尾部和所有 mr 分支都包含在目标中。

每个输出从packed bias开始，按原K顺序做单次RNE舍入FMA，最后先 `min(hi)` 再 `max(lo)`。该顺序不同于 QD8 GEMM。所有binary32含sNaN/qNaN、Inf、±0、subnormal及lo>hi均允许。观察为数值相等或双方NaN；±0视为相等，不观察payload/sign/quieting/FP flags。

## 配置与信任边界

NEON为AArch64、RNE/FZ=0/AH=0。RVV取VLEN=128、SEW=32、LMUL=4、物理VLMAX=16，vstart=0、RNE且不flush。源码每次请求min(N剩余,8)，因此只需表示前8个槽；8槽struct不代表VLMAX=8。`active8/mask8` 对inactive值不作保证，硬件tail-agnostic没有被解释成清零。循环不读取inactive前缀外的数据。

FMA直接用Flocq `Binary.Bfma`，没有拆成乘加或double中间结果。[Boundary](proof/coq/F32Admission/Boundary.v) 把QD8的NaN观察证明迁移到任意长度的完整FMA累加链，再连接修复的min→max；也证明活动前缀运算和store不依赖tail表示。

C解释信任当前QCP parser、预处理、符号执行覆盖及VC/调用合同实例化；普通Coq检查实际完整`VC_Correct`和合同后果，不声称生成器soundness已形式化。NEON的mr/kc未被实际C修改，调用合同在该标量身份下衔接。采用继承的QCP/Coq/Flocq布局、实数/经典/外延假设，逐字段报告列出完整名字，没有新增项目公理。

不声称原始未修复RVV等价、原C到兼容改写的形式refinement、真实ISA/编译器/物理ABI对应、任意VLEN、独立完整终止性、FP flags/payload相等，或QCP地址模型之外的ISO C对象provenance性质。

## 重放

```sh
python3 proof/check.py --run fresh01 --jobs 32 \
  --budget-runner /path/to/shared/budget_run.py
```

所有新批配置32并发，普通Coq16GiB/7200秒，最终门禁32GiB/14400秒，长生成有限6小时。共享池协调CPU和最多512GiB普通任务预算，实际并发受依赖限制。不导入历史项目.vo，不使用Admitted或跳过证明。

本次实际验收由admission02 C生成、admission03受影响依赖重编译、ordinary helper生成和admission04最终门禁构成；新编译中不受影响的对象只在本次admission01源/依赖/对象hash全部相同时续用。RVV第一次身份检查发现两行策略import未限定/显式限定命名空间的差别，原失败记录保留；[精确补丁](proof/evidence/import-binding/imports.patch)未改任何391个公式，新目标及所有受影响消费者重新普通Coq检查。身份复查不是第二次C生成。

原生回归实际运行当前两侧与caller，独立scalar packed索引/FMA/clamp oracle，6864例/291720输出，ASan+UBSan、输入保持、inactive输出和canary检查。两侧FMA同时改0被独立oracle拒绝；原始RVV NaN反例、false Coq目标和源篡改拒绝单独记录。native支持使用宿主libm，不计形式证明或硬件验证。
