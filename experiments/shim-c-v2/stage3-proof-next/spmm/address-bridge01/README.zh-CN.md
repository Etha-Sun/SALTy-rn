# SPMM v8 游标与 frame：精确 WP 分类

`neon-frame-v8/cursor-frame-print01` 使用原候选 annotated、同模型/inline 配置、none prover，完整退出0，实际打印15目标（out_4建立/保持+frame2的13项）。命令/观察/raw/完整日志保留；本目录 actual-goals.txt 摘录所请求4项，没有新求解结论。

1. out_4 established：目标 `(x_2*(4+x_3/4))=0`，定义 x_2=x_1-x；已有 `Init:x_1=x`。这是直接整数等式，根本不涉及uintptr桥，未通过不能归咎地址语义。量化/巨大上下文可能造成solver困难，未发现缺前提。
2. out_4 preserved：目标 `shift_float32(a_1,x_15*x_5)=addr_of_int(to_uint64(x_21+to_uint64(int_of_addr(a_6))))`。它确实包含真实C `(float*)((uintptr_t)output+output_stride)` 与普通float指针步长的连接，需分别保有stride数值关系、游标关系，以及合法同对象地址的字节平移语义。
3. frame2 part05（line69）：`!invalid(m_1,a_33,1) ==> included(a_33,1,output,total)`，以及同样的 a_12/4。a_33=local nnz，a_12=local vacc0123。这是局部生命周期/块frame排除，不能将locals硬证明成输出域；不由新整数范围helper解决。
4. frame2 part06（line70）：`included(a_62,1,output,total)`，其中 a_62=global(L_tmp_2_9235)，路径 `When: !invalid(m_1,a_62,1)`。它也是循环内局部临时量生命周期frame排除，不是output整数界或uintptr步进。

现有语义证据：handoff-model-plus/wp-share/why3/frama_c_wp/memaddr.mlw 只定义 addr={base,offset}、shift 的offset相加，int_of_addr/addr_of_int 是抽象函数；`addr_of_int_bijection` 仅对statically_allocated的原地址保证往返。文件没有 `int_of_addr(shift(p,k))=int_of_addr(p)+byte_size*k` 或相应 inverse-add 定理。MemTyped.ml:927-928 直接连接上述抽象函数，指针转整数还做C整数截断；MemAddr.ml:300-307 只简化null和int_of_addr(addr_of_int(a))，未增加仿射语义。

因此往返原理本身不足推出加stride后的逆映射。合法/valid 条件只约束base/offset/分配大小，不给整数编码加法关系。这里没有声称构造了整个WP模型的有限反模型，也没有把缺桥当真实kernel错误。全模型还包含自动生成的rank、类型大小和额外性质，真正补模型必须审完整生成理论及C实现定义的指针整数语义，不能凭此局部观察加入全局affine假公理。

controls.c 提供真实C最小对照：typed p+4、uintptr零位移往返、真实SPMM形式的uintptr固定16字节步进，以及两个故意错误的p+3关系。仅独立控制声明有效5元素buffer，不改变任何kernel输入域。希望Typed步进和零位移可证明；整数步进若不通，检查生成的准确WP及存在的地址性质。错误两个post必须不通过。当前未运行solver，交root同冻结Raw配置执行并保存全部post/RTE/frame义务。

新增固定root runner：`python3 experiments/shim-c-v2/stage3-proof-next/spmm/address-bridge01/run.py typed-root01`。严格Typed+float、原handoff-model-plus锁与入口、1worker/20秒per prover/180秒总预算；运行前后核对锁全部输入SHA，源快照、全部函数body/RTE/assigns及正反post原raw保留。未自行启动solver。

进一步源码审查：MemTyped.ml:439—450的linked约束字符串分配长度；548—562对global大小或局部初始大小0作约束。此处未发现涉及int_of_addr的方程，因而linked可提供生命周期信息，但没有补上地址编码仿射桥。

`finite-fragment.py` 已实际执行：有限ground片段中p=(base1,offset0)编码100，p+4编码200，另一个合法地址(base2,offset0)编码116；原址往返、null零、uint64范围、五元素valid及无整数加法回绕均满足，而decode(encode(p)+16)不等于p+4。其用途只是具体展示这组已有性质不蕴含所需桥。它并非对完整WP地址/shift/linked理论的全称有限模型，也不是硬件或kernel反例；没有将该片段假设加入proof。
