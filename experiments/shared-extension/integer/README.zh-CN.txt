整数、量化和转换扩展（实现/规格阶段；尚无等价性证明）

这10项保留 original/neon.c、original/rvv.c 的字节副本；neon.c 未修改。
修复4份 target：
- qs8-vadd-minmax：负shift应左移。两份vadd又统一按NEON低8位移位编码处理，幅度>=32为0，避免RVV按5位取模。
- qu8-vadd-minmax：shift=32时NEON输出0，原RVV把shift按31掩码后输出1。
- qs8-vcvt：32位乘积左移1后再缩窄在极值溢出。直接vnclip15保留饱和高乘舍入。
- qs8-vmul-minmax-fp32：忠实复现NEON magic-bias位算法，替换原target数值float转int。全float scale域内两算法并非等价。
每份实际原版反例见 witness.c、witness-results.json；它们运行实际原kernel，未把kernel替换成标量oracle。
原版之所以“错误”是指与保留的NEON输出规格不一致，不表示在XNNPACK所有已知参数生成器的更窄域上一定错误。

组织：shared/shim.c 是全体实际使用原语的普通C实现；共享header定义类型、参数和API。
shared/integer-<case>.c 是按调用闭包从该库原样投影的最小模块，以免WP检查无关函数；没有新语义。
所有函数均有C函数体；没有axiom/assume或未实现intrinsic合同。浮点位重解释用memcpy，实际ISA→C模型仍需审查。
每case module.json 给通用checker所需的basename文件映射、模块顺序、Typed或Typed+float模型。
unit.c 组织为 spec.h + 共享最小C模块 + neon.c + rvv.c + harness.c。
普通编译需 -Iexperiments/shared-extension/integer/shared。checker扁平副本可直接按basename include。

generate_interfaces.py 是简单接口模板生成器：8个逐元素转换/量化case和2个row-reduction展开成spec.h/harness.c。
公共后置只有 equivalent 返回1。参数值不固定；浮点scale允许NaN、Inf；浮点输出比较数值相等或双方NaN。
两个输入允许互相alias，输出与所有输入/参数分离；输入有尾部padding。
长度上限用于字节换算、padding及指针范围；rdsum rows<=INT_MAX，因为实际源/target都把rows转int。
原C中 -multiplier/-zero_point/-shift 不能接受INT32_MIN，否则有C未定义行为，所以只排除这些值。
vadd没有[-31,31]限制：target已修复大shift编码，与source完整已定义输入域对应。
rdsum的zero有32个零元素。stride>=channels+15、7*stride与row地址乘加不溢出。
qs8-rdsum原NEON最后一个odd channel使用标量signed +=：仅该元素要求initial+模32行和在int32范围，
用显式定义signed_low32和ACSL sum表达，无须限制所有行部分和或bulk输出。channels偶数无此条件。

native-results.json 为最终最小模块的实际运行hash与结果：8项各9480例，两rdsum各1343例。
ASan/UBSan，FE_TONEAREST，-ffp-contract=off；数据含任意float位模式，vadd含大/负shift。
这仅是有限回归，不是无界证明，更不是硬件ISA验证。所有case的Frama33解析也已通过。

建议proof顺序：qs8/qu8-f32-vcvt（转换值绝对值<=32768，转float精确）；
其次qs8-vlrelu、qs8-vcvt、两个vadd（先共享模宽/舍入/饱和等式）；
最后rdsum、f32-f16-vcvt、qs8-vmul-minmax-fp32。
主要未闭合挑战：
1. 模宽、算术右移、舍入与饱和的共享数学引理；当前都是有体C，尚未给合同/循环不变量。
2. WP Typed浮点/整数memcpy bitcast桥接，尤其f32-f16和magic-bias，不能用自由合同充当证明。
3. rdsum原程序uintptr_t加法再转指针的WP内存模型支持，以及多层循环、padding和ACSL sum不变量。
4. 浮点完整特殊值语义、ISA异常环境/NaN位语义仍在TCB边界，不能通过Real模型忽略。
