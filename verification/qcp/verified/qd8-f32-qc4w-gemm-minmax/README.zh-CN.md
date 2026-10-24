# QD8-F32-QC4W GEMM 整核验证

本包完成原NEON与修复后RVV的实际C验证，按公开合同建立输出的数值相等或双方均NaN关系。统一入口是[proof/status.json](proof/status.json)，详细检查与来源在[full-status.json](proof/full-status.json)。

5个实际C单元共1531项义务：NEON 1206、RVV 274、caller 42、ordinary helpers 3、scalar NaN helper 6。两侧实际DSL共享12项策略。一次完整fresh运行检查1610个选中本地Coq模块、完整VC_Correct接口及1567项假设报告；配置32并发，仅有14项继承基础依赖，无新增项目公理。完整fresh在同一新依赖环境内续跑，先前脚本内部超时及原始失败记录保存在proof/evidence/full-run/compilation-continuations；源码未变，未导入其他运行的历史本地对象。NEON采用输入hash仍完全一致的已完成整核生成；原始执行时间及来源在`proof/evidence/full-run/neon-adoption.json`，不称为再次执行。其余实际C单元和两侧策略均在最终验收中重新生成。

Native检查另行通过1881个用例、31977个输出，使用ASan/UBSan及独立packed/nibble/mod32/ASR/FMA参考。三项负控制拒绝错误Coq命题、源码token篡改，以及两侧FMA同时错误的实现。测试与诊断均不计入形式证明数量。

## 输入与数值语义

MR固定1、NR固定16、cn_stride固定64字节；N/K为任意满足公开容量条件的正整数。Kr=2*ceil(K/2)，A需要8*ceil(Kr/8)个可读字节，每个权重panel为192+8*Kr字节，包含16个ksum、packed权重、16个scale和16个bias。完整前提、内存资源及输出关系在[唯一公开合同](spec.c)。

signed4权重经原byte位操作展开为乘16的signed值；保持原顺序的逐步wrap32累加，完整Kr后做signed ASR4，再执行整数转binary32、普通乘法、FMA以及max(lo)→min(hi)。保留NaN、Inf、subnormal、signed zero和lo>hi，不使用无界整数点积替代原溢出语义。

RVV固定VLEN128，e8m2/e16m4/e32m8物理VLMAX32，本核只使用前16个活动lane，其余不观察。NEON采用AArch64、RNE、FZ=0、AH=0解释。QCP使用64位整数地址与显式容量条件；未证明物理布局或ABI对应。

## 源码与信任边界

NEON源码保持原SHA。RVV增加bounds/accumulator NaN恢复，并将外层do改为同guard的while；公开入口已有正N，首次迭代行为相同。原版mr=N=K=1、inv_scale=NaN、lo=-1/hi=1反例产生NEON NaN与RVV -1。该反例属于本案全binary32域，不声称所有上游调用器均允许这些参数。

[身份记录](proof/source-identity.json)、[原RVV](proof/evidence/original-rvv.c)、[精确补丁](proof/evidence/rvv-repair.patch)及[唯一修复日志](repair.md)保留原版与修复版区别。循环、内存、普通helper和caller证明完整；45项intrinsic采用来源审查的公开spec，精确合同、Coq定义hash、配置与官方来源在[语义台账](proof/intrinsic-ledger.json)，最终人工语义审阅仍待完成。此结论是C-shim模块化部分正确性；无形式ISA/编译器对应、物理ABI、任意VLEN或独立终止性定理。

## 复现

需要已安装的QCP/Coq/Flocq环境及共享有限预算runner，默认外部路径见proof/dependencies.json和proof/generate.py。外部工具链记录安装身份，未声称在此验收中独立重建。

```sh
python3 proof/check.py --run replay01 --jobs 32 --budget-runner /path/to/budget_run.py
```

该命令默认重新生成全部五个C单元、重放全部本地Coq模块和假设审计、核对源码/调用绑定，并执行native、负控制及环境/依赖检查。每次用新run名，结果只写入新的.build/replay01*，不覆盖封存证据。若显式复用先前NEON生成，脚本必须核对全部captured inputhash并保留原执行来源，不称为新执行。

所有新批配置32workers；普通Coq进程16GiB/7200秒；大于等于64MiB的源码模块32GiB/7200秒（本案原始NEON目标），生成64GiB/21600秒，使用共享512GiB预算池协调。实际并发由依赖和可用预算决定，不复制任务凑数。
