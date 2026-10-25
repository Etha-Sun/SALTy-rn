# x32-transposec：当前候选与迁移来源

**尚未通过统一全案fresh门禁，不计入已验证总数。** NEON完整226条和RVV完整124条实际C义务均已从源码重编依赖，通过全限定`VC_Correct`、第二次类型核对和逐项`Print Assumptions`。普通helper/宽度探针/公开调用者的其余31条实际C义务也已分别通过。当前完整库存为8个C单元、381个VC字段、13个普通函数body、9个原始intrinsic规格视图和0个自定义策略。

原版来自Keagan提交`be16280c7812a7459c26c3ce82a47339a3d07718`，逐字保存在`proof/original/`，来源和SHA见`proof/originals.json`。宽度0、高度1、输入首字`0xa1234567`时，NEON写出该字，RVV保留原输出`0x55ab21de`。其原因是NEON do-loop至少执行一次，且两列输出重合时低列最后写入。反例不能算等价性证明。

`impl/testRVV.c`迁移Arcadia固定提交`4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca`的effective-width修复：高度非零时零宽按一列处理，高度零时无访存。`impl/testNEON.c`在保留两个原始入口assert之后增加高度零早返回；这是公开的兼容改写，不宣称已建立原始ISO C到改写C的形式refinement。随后NEON将原`vzip_u32(...).val[0/1]`机械拆为原生AArch64 `vzip1_u32`/`vzip2_u32`，保留完整两个向量、tile2×2结构、高列先写/低列后写和奇数尾部顺序；两投影数学等式及实际15条调用C义务已单独检查。入口assert之后将零宽局部计数归一为1，正值入口的外层do-loop机械改为while-loop；没有新增宽度正值前件。普通`doz`、`round_down_po2`和实际strided-store借用适配器仍保留真实C body，并已分别检查5及3条实际C义务；它们不是免body的intrinsic。精确补丁、SHA与zero-fuzz重放见`proof/repair.patch`和`proof/repair.json`。

迁移已有经验的记录见`proof/migration.json`：ArgmaxPool的单一只读地址map避免重复输入行/padding的所有权冲突，optional输出状态保留未初始化及未写frame；改为精确UInt32位值，并以新命名空间`X32Transpose`重新编译。旧case的候选`.vo`没有被导入；共享QCP基线依赖仍单列。`Geometry.v`参考同一Arcadia版本的`X32Transpose.Entry/Storage`，保留uint64模乘assert、条件非空内存域、按实际使用次数要求stride对齐，以及每行一word可读padding。零高度允许NULL及空footprint，不无端增加未使用的stride约束。原研究/Frama-C结果不转记为新证明。

实际C的UBSan及真实16GiB/swap0 ASan各通过8,808例、每侧1,006,296个写入word、67个零高度调用，覆盖三个合法VL选择、两种inactive-tail填充、零宽、多VL边界、奇偶尺寸、间隙和合法输入行复用；当前实际公开调用者额外执行127,014次合法written位置观察（小矩阵遍历全部位置，大矩阵包含首/中/末位置）；调用者顺序运行两侧并保存第一次UInt32值，其强post仍要求最终完整`xt_result`。全部输出及未写间隙/guard、输入保持与独立scalar转置oracle核对。wrong-one、双方同错负控均以exit2拒绝。脚本为`proof/check_native.py`；前两轮新增边界测试的非法stride触发原assert，失败日志保留，没有修改原assert来通过测试。这些是有限C-emulator回归，不是机器ISA验证。

后续实际intrinsic声明须逐项绑定原始规范：Arm ACLE固定版本`aef52c2b0944bf652443c1acd867dbb893af8dd0`的uint32 load/ZIP/store；RVV v1.0的e32m8、固定VLEN128/VLMAX32、全部合法VL区间及任意inactive lanes。RVV strided store的stride单位为字节，且多lane访存无顺序保证；需由实际kernel几何条件证明活动输出地址互异，或VL不超过1。原C unsigned stride转API ptrdiff_t的位表示及模64地址必须明确，不能偷偷添加signed stride非负前提。普通doz、round_down及借用适配器的C body仍必须完整证明，不能借intrinsic规则豁免。

主要规范来源：[Arm ACLE](https://raw.githubusercontent.com/ARM-software/acle/aef52c2b0944bf652443c1acd867dbb893af8dd0/neon_intrinsics/advsimd.md)、[RISC-V Vector v1.0](https://raw.githubusercontent.com/riscv/riscv-v-spec/v1.0/v-spec.adoc)。intrinsic spec最终人工审核、ISA/编译器对应及独立完整终止性不属于已获结果。

当前指针cursor模型在零列步、零行步时保留原逻辑指针，非零移动按原整数/指针转换取模64。旧版空高度不访存却要求原地址等于取模结果，属于模型过强，反模型与旧源码保存在`proof/history/before-zero-step-cursor-*`；没有用新增输入范围修掉该问题。修正后双方目标文本SHA不变，但全部模型依赖和证明对象均从源码重编，没有把旧对象直接转记为新信用。

formal `size_t`/`uintptr_t`显式使用unsigned64，native/SDK取平台标准类型。实际宽度探针8条C义务与双架构SDK静态断言分别核对64位无符号计数/指针整数和32位word；这不是编译器/ABI refinement。旧自动生成tuple记录中默认32位大端模型的失败探针保留为错误配置历史，当前原生ZIP拆分不使用该记录owner。完整修复记录明确`original_source_refinement_proved=false`。

最终观察不是仅一个C比较点：`StateObservation.xt_kernel_posts_written_and_frames`量化任意实际written地址，并同时保留两次执行各自的unwritten初始状态；`xt_kernel_posts_full_map`在初始unwritten状态相同的条件下给出完整点态map相等。公开C调用者只是其中一次合法位置实例。

RVV原生API的signed64 byte-stride映射按GCC15.2规定的整数转换行为审核；`SignedStrideFacts.v`已普通Coq证明完整unsigned64域的signed解码范围、lower64 bits相同和任意lane的模64地址相同。未增加stride<=INT64_MAX前件。ISA strided元素访存无序，实际caller已证明活动地址互异，输出空间还要求分离的UInt32 cell资源；折叠写入只是这个前提下的最终map表示。详细9项合同/Coq定义/配置和官方版本记录在`proof/intrinsic-ledger.json`，原intrinsic没有被记作C-body-checked或正式ISA/编译器refinement。
