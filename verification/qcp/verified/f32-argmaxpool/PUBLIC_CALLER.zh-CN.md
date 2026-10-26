# Argmax 公开调用入口组件

`public_spec.c` 的 `argmax_public_pair` 实际调用两侧 kernel，返回1。它是带有已验证后置条件的公开调用入口；运行时数值检查由独立 native oracle 完成。

该入口的6项真实C义务、完整 `VC_Correct` 接口及6份最终假设报告通过。17个依赖模块从源码普通编译通过，记录见 `proof/public-caller-status.json` 和 `proof/evidence/public-caller/`；仅继承已公开的 `eval_addr_expr` 和函数外延性假设，未新增项目公理。两侧主核实际C证明仍未闭合，因此本组件不增加 verified 计数。

`APPublicModel.v` 从两次调用的真实参数导出共同只读输入视图，再连接 `APProgramObservation.v` 的写入序列定理。四个可写输出/索引 owner 和唯一的只读数据/指针表 owner 均保留；初始输出可以不同，包含未初始化值；重复写入取最后一次结果。后置要求每个已写浮点位值和索引在两侧对应。输出/索引地址映射的单射性及有效pixel/channel上的地址对应仍是显式前提，不假定跨64位回绕的普通常数偏移。完整门禁须将这6项与两侧主核provider一起检查。

实际入口 native 回归使用 `proof/check_public_native.py`：UBSan与真实16GiB/swap0 ASan各4320用例、197640 lane/side通过，同一独立整数IEEE排序oracle检查浮点原始位及uint32索引。保留读区域/输出边界检查；单侧错误和双侧共同错误均被oracle拒绝。`proof/public-native-status.json` 和 `proof/evidence/public-native/` 保存命令、源码SHA和实际日志；这些有限回归不额外产生形式化证明信用。原始大计数反例记录未覆盖。

重放当前公开入口生成：`python3 proof/check_public_generation.py`；源码闭包编译：按本案环境运行 `python3 proof/check_math.py --targets PublicCallerChecked --jobs 32 --max-live 2`。本组件采用冻结的原始 `spec.c` 两核合同，不修改其模型或实现；是否完成整核最终以 verified 清单及完整证书为准。
