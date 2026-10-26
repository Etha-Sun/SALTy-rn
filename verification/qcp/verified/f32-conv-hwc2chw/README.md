# f32-conv-hwc2chw

本包的对象是修复/兼容版 `repaired-neon219-rvv162-ordinary-pixel-helpers`。公开入口、前后置条件和观察关系见 [spec.c](spec.c)，完整验收结果以 [proof/status.json](proof/status.json) 为准；生成目标、组件通过或原生回归均不单独构成整核验收。

两份原始实现保存在 [proof/original/](proof/original/)，原版 RVV 的实际 NaN 反例、精确修复补丁及兼容调整见 [修复说明](proof/REPAIR.zh-CN.md) 与 [repair.json](proof/repair.json)。修复版 NEON 主函数219行、RVV主函数162行；10个普通helper单元包含16个函数，连同两个主函数和公开caller共19个普通函数体、13个实际C单元、1748条C义务。所有普通callee都必须绑定实际body证明。

公开caller使用单一输出分配：mode=0调用NEON，所有非零unsigned mode调用RVV，均返回1并满足同一个参考输出观察及精确未写入帧。证明允许任意初始Some/None、只读对象的完整或部分别名、任意给定zero-row内容及全部binary32值。逻辑CHW输出窗口的布局和权限仍须满足公开内存谓词；裁剪尾行/尾通道的内部别名按实际写回次序保留。

硬件/浮点配置与结论边界见 [semantics.json](proof/semantics.json)：RVV固定VLEN128、SEW32、LMUL1、VLMAX4、XLEN64、小端；允许规范中的全部合法VL选择。每个累加器保持原始27次融合运算次序，左边缺项仍执行+0乘权重，右边缺项跳过对应FMA。RNE，关闭default-NaN/flush/traps，异常标志不观察。公开关系允许NaN payload和±0位模式差异；无重结合或误差容限。

[intrinsic台账](proof/intrinsic-ledger.json)列出32项原始规范视图、准确合同、Coq定义和已归档官方来源。它们是显式spec边界，最终人工审核仍待进行；不声称已完成真实ISA对应、SIMD ABI或编译器精化、整个程序终止性。Coq/QCP/Flocq的继承假设由最终逐字段报告列出，不能把“无新增项目公理”理解为整个基础没有假设。

`proof/build_full_handoff.py`冻结来源和生成规则，`proof/check_full.py`重新生成全部实际目标并在统一空本案VO环境编译必要源码，`proof/record_status.py`独立审计完成的运行并签发本地证据。原生UBSan/真实16GiB ASan各307800例及两侧真实SDK编译是独立回归证据，均不计形式义务。失败历史与旧组件收据保留其原始来源，不计作新整核证明。
