complex13 独立 proof 工作记录
============================

实现作者 extend_complex；proof作者 extend_integer。原实现/规格由root冻结后才添加
u32-proof.patch、complex_fp-proof.patch及vcmul独立Raw variant的proof.patch。
没有改任何冻结C/头文件、公开spec、generator、driver或checker，没有新axiom。
这些记录区分整核验证、共享原语验证、诊断；当前不能把整核timeout当成已验证。

whole-kernel-status.json 是13项动态汇总，可用 summarize.py 重建。每份正式checker
报告的exit=124表示600秒总预算到期。Frama只在结束时输出raw JSON；若没有产出，
raw_obligations里的0/0不是“零目标”，必须使用log中的scheduled目标数。也不能推断
全部目标失败，因为已有Qed或SMT通过的中间结果未写最终JSON。

首三项使用root额外冻结的官方安全模型变体：Typed+raw，vcmul为Typed+raw+float。
raw表示禁用纯逻辑变量优化，不是unsafe cast或真实ISA模型；kernel/spec字节不变。
旧Typed与Raw的失败记录均保留，不相互覆盖。

共享库的已检查结果
------------------
cx-library-raw01.json：195/195原始义务，18个有体函数所有后置覆盖，三个全局
lemma均有passed记录。包括非融合IEEE binary32 multiply然后add/sub；NaN/Inf保留。
完整驱动绑定的是现成add_f32/sub_f32/mul_f32，不是real近似，也未加入FMA模型。
这是共享C函数的WP证明，不是kernel循环证明，也不证明真实NEON/RVV→C shim正确。

u32-library-raw02.json：旧stride合同152/162；当前最终合同对应u32-library-final01。
初版strided合同stride<=PTRDIFF_MAX/32过保守，已在root释放live proof锁后改为
vl*stride<=PTRDIFF_MAX，不修改公开spec、不缩小其输入域。最终实查结果以JSON为准。
当前卡点为位mask round_down、strided的typed/char指针转换与功能frame、nested tuple。
Typed优化还会丢失r={{x,x}}的初始化约束；官方Raw模型解决简单聚合，但未解决全部。

u32-library-bytes01.json：151/158；byte模型能解决部分strided访问安全/assigns，
其功能前缀仍未闭合，默认聚合优化又导致vmov constructor问题。Bytes+raw诊断明显
退化到普通load/store也大量超时，已主动停止（exit143），无final JSON；不是反例。
没有用这些模型探测的部分结果冒充整核成功。

vcmul kernel 的明确证据
----------------------
model-variants/f32-vcmul-raw/proof.patch 提供单文件循环不变量、功能prefix和真实
assert；它不提供自由函数后置来代替kernel。所有新增assert都必须由checker证明。
cx-case-assert-probe01.log 的8个显式断言中只有1个通过；首个未过目标等价于
  addr_of_int(to_uint64(4*n + int_of_addr(a))) = shift_float32(a,n)
而已知的是valid_read(a,2*n+3)。安装的官方 memaddr.mlw:137–145 只提供直接
addr_of_int(int_of_addr(p))往返公理，不提供整数地址加偏移与typed pointer shift关系。
因此这些uintptr_t写法需要一个有依据的语义桥/前端正规化正确性证明；不能额外
假设该等式，也不能悄悄改source后说原实现已经通过。pointer-offset-probe01进一步
实查：直接pointer→uintptr_t→pointer身份通过，加字面量0和加sizeof(float)两项
后置未过（原始4/6）。因此不能认为pooling的offset=0已经自动免于该编码限制。另有循环memory frame和
功能prefix需要继续补证；当前library195/195不包含这些整核义务。

其他十项的限制要分开看
----------------------
GEMM/卷积/稀疏乘/exp等既需要循环、索引、packed memory与frame证明，也调用
C fmaf。当前标准libc/math.h:2136只有fmaf的assigns errno/result，没有任何返回值
关系；现成Cfloat后端未暴露IEEE FMA绑定。不能把fmaf换成乘后加，也不能给外部
函数塞一个未经证明的ensures冒充实现验证。

maxpool没有FMA，主要是NaN min/max、内存/指针表及循环；argmaxpool更不能被
归为FMA障碍，它用compare/select处理tie/NaN。argmax冻结quantized.c模块又带入
多个实际未调用的bitcast/量化函数，增加了body coverage义务。下一版按调用闭包更细
拆模块能消除此额外负担；其实际vbslq_f32仍用memcpy位blend，需相应语义/工具支持。

NAN/signbit 候选诊断（没有修改冻结实现）
--------------------------------------
标准math.h已有NAN与signbit合同；它们是标准库TCB，不应称为完全没有模型。
/tmp中独立candidate_nan/signbit/less probe有9/10原始义务通过：signbit和IEEE小于
可证明，NAN常量is_NaN目标仍Unknown。打印目标是is_NaN_f32(to_f32((0/0)))。
完整scalar min/max候选71/76，显式logic \NaN还触发Why3 “unbound variable in
of_term”异常。因此“改成NAN宏”不能声称解决位桥。
另一个实际可用的数值候选是标准C nanf("")，配合NaN分类predicate（不嵌入logic \NaN返回值）：
minmax-nanf-candidate01.json 中六个scalar函数完整数值语义81/81通过，源在
minmax-nanf-candidate.c。它依赖现成标准nanf与signbit合同，明确属于libc模型TCB；
没有改本轮冻结C，也没有把candidate的成功算进kernel通过数。候选后置按当前
NaN-aware数值观察比较，未要求NaN payload或正负零位相同；C实现保留原signbit分支。
一次未提权的wp-print仅因Why3本地socket权限失败，单独保存在
nan-candidate-wp-print-sandbox-failure.log；正式probe与重跑使用授权IPC，不混淆。

后续可继续的工作
----------------
1. 为真实C uintptr_t地址算术建立可检查语义桥，或独立证明正规化到指针算术的等价性。
2. 根据实际kernel调用闭包细分共享模块，复用已经闭合的Cfloat load/store/arithmetic合同。
3. 为FMA建立有体实现/可信工具模型的明确对应，保留融合语义与所有特殊浮点情况。
4. 修复/定位NaN常量translation与float↔bits模型桥，再补循环不变量和内存frame。
这些是可解决的工程/证明工作；总预算timeout不是kernel错误的证明，也不是不可解定理。

最终整核结果（13/13实际完整runner尝试，均以600秒预算结束）
------------------------------------------------------
case | scheduled目标（log） | exit | 整核通过
x32-packw-gemm-goi | 335 | 124 | 否
x32-transposec | 265 | 124 | 否
f32-vcmul | 418 | 124 | 否
f32-conv-hwc2chw | 952 | 124 | 否
f32-argmaxpool | 676 | 124 | 否
f32-maxpool | 731 | 124 | 否
qd8-f32-qc4w-gemm-minmax | 1084 | 124 | 否
f32-dwconv2d-chw | 925 | 124 | 否
f32-gemm-minmax | 704 | 124 | 否
f32-spmm-minmax | 465 | 124 | 否
f32-dwconv-minmax | 427 | 124 | 否
f32-raddstoreexpminusmax | 495 | 124 | 否
f32-igemm-minmax | 436 | 124 | 否

全部13项冻结实现/spec文件哈希仍匹配；当前没有整核新通过。全量runner timeout无最终raw JSON，
故不能把0/0当成目标数或通过率；上表scheduled数也不是已失败目标数。
