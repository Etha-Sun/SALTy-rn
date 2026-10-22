# equivalent 的条件式组合证明

`python3 verification/qcp/experiments/vadd-wrapper/run.py` 重新生成caller与策略目标、逐字核对目标，再在独立Coq目录检查 **9个caller VC和1条新数组策略**。它只证明调用方在给定callee合同下成立；本runner不检查两个kernel body，完整kernel状态保持false。runner还将最终返回改为0作负对照，要求QCP明确因0==1拒绝，环境错误不算通过。原始mapper仍直接include原始`test_neon`与`test_rvv`，没有修改。

`generate.py` 是VADD专用的小程序：先调用既有freeze审计，锁住原始源码、公开spec/mapper和runtime struct；对固定pattern要求恰好出现一次。公开Require/Ensure原文复制。NEON合同来自已有kernel证明输入；RVV暂用同形合同作为**待履行义务**，不是已证声明。数组长度按`batch=n*sizeof(float)`转换，局部char参数struct初始化展开成字段赋值，比较循环替换为`compare_outputs`调用。注释Assert的字节算术和局部地址事实本身也生成VC并已检查，未作为外部假设略过。

9个VC覆盖局部初始化安全、字节长度转换、两次kernel调用前件与未触碰数组的frame、共同`vadd_values`输出到NaN-aware关系、比较返回值传到公开`__return==1`后件。数组策略只是在地址/长度相等时匹配两个undef_full；没有增加可读或可写范围。公开pre没有finite-only或非NaN前提。

必须继续保留三条边界：

- 两侧kernel的实际body及完整依赖链尚未由本目录证明。最终接线必须逐项核对真实已证callee合同、目标与源码版本，不能从caller通过推断两个kernel已证。
- `compare_outputs`实际循环与helper body已有相邻`vadd-comparator`独立证明；这里仅重查其使用的模型与策略，以及调用前提。原inline比较循环到read/identity/helper调用、按值向量到pointer/out及局部struct表示的程序转换对应仍需单独建立。
- Print Assumptions保留QCP地址/布局模型（含局部变量地址非零）、Coq/Flocq标准假设。没有新增Axiom/Admitted。自动生成的未证模板不在编译链；partial correctness不自动成为终止或实际ISA定理。

`status.json`记录当前输入、命令、日志hash和明确pending依赖。只要这些依赖未实际闭合，`full_kernel_proof`就保持false。原公共review surface仍是两个原始函数、interface.json、spec.h、mapper.c；本目录属于共享证明/适配基础设施。
