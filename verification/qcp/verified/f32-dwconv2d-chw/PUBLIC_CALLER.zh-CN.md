# DWCHW 公开调用入口组件

`spec.c` 包含两侧实际 kernel 声明的原合同，以及实际调用两核的 `dwchw_public_pair`。`proof/build_public_spec.py` 从两个冻结 constructor 提取同一合同，`proof/public-source-binding.json` 保存精确来源。原 kernel、旧语义模型和运行中的主核输入均未修改。返回1是带已证后置条件的调用入口，运行时检查另由独立 oracle 完成。

该入口6项真实C义务、完整 `VC_Correct` 和6份假设报告通过；包含已证明的两组 maps/output 策略，新增3个普通Coq模块，复用的coherent core及SHA明确记录。依赖 `PublicObservation.v` 的4项数学结论给出完整写入后初始化、两侧数值相等或同为NaN，以及未写区域保留各自初值；不假设两初始输出相同。公开域沿用kernel合同：全FP32/NaN/Inf/无序bounds、uint64尺寸在有效非回绕足迹条件下，输入/zero/权重/params可只读别名，输出分别由唯一owner持有。

两侧主kernel的实际C证明仍在生成，以上组件不计成整核。当前状态见 `proof/public-caller-status.json`、`proof/PublicObservation-status.json`；源/目标/CPP/日志在 `proof/evidence/public-caller/`。仅继承公开框架假设，未新增项目公理；真实ISA/ABI/终止性不属于本组件信用。

实际公开入口native使用原独立9次FMA标量oracle、全部既有alias/VL/tail模式与wrong-one/both负控。UBSan及真实16GiB/swap0 ASan各128520case、12247200lane/side、102816只读别名case通过，两个C单元共16项递归include身份已核。见 `proof/check_public_native.py` 和 `proof/public-native-{undefined,address}-status.json`；有限回归不增加形式化证明信用。
