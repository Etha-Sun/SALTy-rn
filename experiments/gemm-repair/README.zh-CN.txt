GEMM NaN 翻译修复实验（未进入 verified）
=======================================

来源与判断

固定 Arcadia-Y/SALTy-rn verification commit
4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca：reference_neon.c 与 original_rvv.c
保持该快照原文。原函数只有维度、kc 对齐和非空指针 assert，没有声明输入
不得为 NaN；该快照 verification/extraction/profiles.json 没有 GEMM profile，
也没有在所检查的根 README/verification 文档找到 GEMM 的 finite-only 合同。
这不足以证明 XNNPACK 生产接口必须接受 NaN，因此这里只判断相对固定 NEON
reference、扩展到包含 NaN 的输出等价目标存在 RVV 翻译语义缺陷。

这不是 SMT 自己制造的差异：ARM FMIN/FMAX 的 NaN 传播与 RVV vfmin/vfmax
minimumNumber/maximumNumber 语义不同。过去把 NEON shim 换成 minNum 的模型
会隐藏这个差异。参考官方说明：
https://docs.riscv.org/reference/isa/unpriv/v-st-ext
https://docs.riscv.org/reference/isa/unpriv/f-st-ext.html
https://documentation-service.arm.com/static/67e40f3398aa3c3b6eea6a85

实际修改了什么

repaired_rvv.c 只修改 min/max clamp 阶段，原 vfmin/vfmax 指令仍保留：
1. scalar bound 是 NaN 时，用 vfmv 广播 canonical quiet NaN。
2. 否则，先用 vmfne(vacc,vacc) 标记 NaN accumulator lane，再执行原
   vfmin/vfmax，最后 vfmerge 只在这些 lane 恢复 canonical quiet NaN。
新增三个真实 RVV intrinsic：vmfne_vv_f32m4_b8、vfmerge_vfm_f32m4、
vfmv_v_f_f32m4。shim.h 逐条给出普通 C lane 实现；没有改写 vfmin/vfmax
本身语义。coupling agent 已只读审查 mask 的生成时机、b8 类型和活跃 lane。
新分支 codex/verified-output-equivalence 的实际
kernels/target/f32-gemm-minmax.c 已由主 agent 更新，与本目录测试的
repaired_rvv.c 逐字一致，SHA256 为
b74472bb9b787da06d6f55981cdeb1475e8d7e392250f8c76ca9dff2a1724162。
原 target 留存在 original_rvv.c。默认 target 已修复，但 GEMM 仍未通过
完整形式证明，未进入 verified。

普通 C shim 仍是 quiet-NaN 传播后 canonicalize 为 0x7fc00000 的观察模型。
原 NEON ARM 语义可保留不同 NaN payload/sign，受 FPCR.DN 等设置影响；
本修复没有证明所有 NaN payload 的跨 ISA 位等价，也未证明 sNaN/异常标志、
动态舍入、FTZ/DAZ 或 errno 的对应。比较 NaN 分类相等与比较原始 bits
必须区分。不要把下面 native 结果说成真实 ISA 全部 NaN 语义已证明。

已运行的检查

native_test.c 直接调用完整原 NEON 与修复 RVV；编译未开启 fast-math。
ASan/UBSan，FE_TONEAREST，2400 个 case 的 canonical 模型输出逐位一致：
mr=1..4，nc=1/2/3/4/7/8/9/17/23/33，K=1/2/3/7/16；每组含普通有限值、
activation NaN、weight NaN、bias NaN、下界 NaN、上界 NaN、两界 NaN、
signed zero、infinity/invalid FMA、互逆 infinite clamp 等场景。
旧反例仍单独重放：reference=7fc00000，old=3f800000，repaired=7fc00000。
这些是回归测试，不是所有输入证明。

Clang 14 的真实 RVV intrinsic header 下 riscv64 + rv64gcv 语法检查通过。
因为本机 header 使用旧版 API 名称，.build/rvv_compile.c 只做 __riscv_
前缀映射，以及 vfmerge 新旧参数顺序映射；计算代码仍是 repaired_rvv.c
原文，没有把 intrinsic 替换成普通 C 后再冒充 RVV 编译检查。

真正完整 C 验证尝试，而非前一轮 schedule shadow

prepare.py 把完整普通 C shim、原 NEON、修复 RVV 与输出等价 wrapper
直接串接为 proof.c，所有语义/规格/待补证明注释放在这一个 C 文件。
postcondition 只是 forall active output i, same_value(left[i],right[i])，
其中 same_value 是 C 数值相等或两边都是 NaN。没有矩阵乘法数学规格。
wrapper 使用连续行布局、NR8 packed weights、任意合法正维度，允许所有
float 值；没有偷偷加入 finite/nonNaN 输入限制。这尚未覆盖任意 stride
组合，并且即使 mr<4 也要求 a 分配满 4*K 个元素、两份输出各分配满
4*nc 个元素，比只分配活跃 mr 行更强；不应冒充接口所有合法内存布局
的完整证明。

唯一新增的显式库级语义假设是 fmaf 的结果与共享逻辑 common_fma 在
same_value 观察下相等，保留 errno 写入范围。这个外部契约没有检查过
libc 实现或 ISA→库桥接，本身仍是 TCB。没有给 kernel 或复杂 shim
添加未经证明的正确性合同；完整两核与所有普通 C intrinsic 实现都在
WP 命令中请求 inline，循环不变量/内存关系尚须实际建立。
此外，任意共享函数不自动在 same_value 关系下同余，尤其涉及 signed
zero 或 NaN payload 时，归纳还需真实 IEEE FMA 的同余证明或更强的
word 关系。这里没有加入未证同余公理来绕过这个问题。

正式尝试使用 gcc_x86_64 + Typed+float，可识别 __builtin_nanf 的类型。
识别不等于其 NaN 语义已经验证：该 builtin 仍没有数值/NaN 契约，WP
日志记录了生成默认 specification。另有 canonical_nan 的 memcpy
float*/uint32* 到 byte* 的 Typed memory 不兼容转换警告；浮点值、位表示
与内存读写之间的桥接仍未完成。没有通过伪造 helper 合同消除这些缺口。
首次 x86_64 探索发出该 builtin 未识别警告，只保留诊断，不作证明证据。
完整尝试限制 180 秒、进程地址空间 8 GiB、SMT 每目标 5 秒、每 prover
1024 MiB、并发 2，WP cache none。状态详见 gcc-wp-results.json 和
logs/full-wp-gcc.log。当前不满足 verified 的完整证明准入要求。
该正确 GCC 机型的完整 inline 尝试在 180.19 秒达到 wall budget，尚未
完成大体积整核 AST 的 VC 生成/调度，也未生成最终义务 JSON；所以不能
把 raw 0/0 解释成通过，也不能报已通过
多少完整 kernel 义务。日志仍有大量循环缺少 assigns、默认全内存 havoc
的警告，尚未建立整核循环不变量、地址/内存对应；上述 primitive 桥接
缺口亦保留。该失败是有界资源内没有完成检查，不是新的语义反例。
没有收到 SMT 逐目标判定不等价的证据。首次 x86_64 诊断记录的
source_unchanged_during_check=false 原样保留（过程中调整/增加 runner
文件）；正式 GCC 尝试锁定的 C/h 文件哈希保持一致，summary.json 中已
再次核对，没有借用不稳定输入的记录宣称证明通过。

复现

将 frama-c、z3、cvc5、alt-ergo 放到 PATH 后：
python3 experiments/gemm-repair/run.py
python3 experiments/gemm-repair/run_gcc_wp.py
python3 experiments/gemm-repair/inspect_results.py

也可设置 FRAMAC=/path/to/frama-c 和 PROVER_BIN=/path/to/prover/bin。
runner 不依赖主工作区绝对布局；历史日志保留实际执行时的绝对命令。

工具复用既有 Frama-C/求解器，未修改旧 v1/v2。历史 logs/full-wp.* 保留
首次机型设置的诊断；当前 runner 默认已修正为 gcc_x86_64。以本轮保存
的 logs/full-wp-gcc.* 判断正式完整尝试的状态。
