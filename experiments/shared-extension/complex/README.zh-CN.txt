复杂 kernel 扩展：阶段 1，实际 C 模型、接口、修复与运行证据
================================================================

本目录负责 13 个 kernel。当前交付的是冻结前实现/规格候选，以及完整原始核
参与的编译/回归/反例；这些结果本身不是任意长度的 WP 证明。root 随后冻结
frozen.json，再由独立 proof agent 只改 proof.patch。旧 verified 未修改。

交接入口

phase1-cases.json：后 10 个 kernel 的 basename→仓库路径及 SHA256，模块
顺序、Typed+float、现成 add/sub/mul driver 和待写 proof patch。unit.c 需要
依次包含 spec.h、这些模块 C、neon.c、rvv.c、harness.c。首批 transpose、
packw、vcmul 已由 root 单独冻结，直接使用各 case 的 frozen.json。

共享支持

shared/u32_shim.h,c：纯 uint32 lane、zip、lane load/store、strided store、
segment tuple store；VLEN=128，m1/m4/m8 分别 4/16/32 个 uint32 lane。
shared/complex_fp.h,c：vcmul 的非融合 VMLA/VMLS，先 binary32 multiply
再 binary32 add/sub，绝不替换成 fmaf。
shared/native_types.h + fp_primitives.h + 按功能和向量宽度划分的 25 个模块：
后 10 项共用一份普通 C 原语定义。module-map.json 选取依赖闭包。
shared/native_fp.h 是同一批函数的原始 native 探索集合；select_modules.py
只把函数定义拆出到共享 C 模块，没有增加语义合同、axiom 或外部 ghost。
实际 proof unit 使用拆分模块，避免每个 kernel 拷贝一套 primitive。

IEEE FMA 在 native 中调用 C fmaf，表示一次舍入；VMLA 的两次舍入则用
两个独立普通 C 运算。native 使用 FE_TONEAREST、-fno-fast-math、
-ffp-contract=off。quiet NaN 的可观察分类保持，payload、符号、FP 异常标志
和 errno 不是跨 ISA 输出观察的一部分；规格允许 errno 被 libm 修改。

全套 Frama-C Cfloat 后端现有模型能表示 add/sub/mul/div/sqrt；所检查的
cfloat.mlw 没有 FMA 绑定。fmaf 的真实库实现、memcpy 的 float↔bits 桥、
__builtin_nanf 与 signbit 的 IEEE 对应仍未证明。不能给这些外部调用加一个
未经证明的 ensures 就把整核报告成 verified。ISA→C shim 的正确性亦未证明。
这些是当前形式验证的具体工作，不是“float 不能在 C 中表达”。

各 case 与原版保存

neon.c 均逐字拷贝本任务起点 kernels/source。原 target 位于 original_rvv.c；
rvv.c 是本次待证明实现。前三项不需要改 target，argmaxpool 也保持原样。
GEMM 在起点已经采用上一轮 NaN 修复；因此它的 original_rvv.c 是起点修复版，
更早未修版本额外保存在 upstream_original_rvv.c。未把 NEON 冒充 RVV target。

1. x32-transposec：新增 u32 zip 与 strided store。原 NEON 奇数宽可加载
   多一个 uint32，因此 spec 要求 input 分配 h*input_stride+1 words。
   w/h/input_stride/output_stride 均为符号值；wrapper stride 单位是 word。
   比较完整 w*output_stride 输出，包含未写的 stride 槽，初始两边相等。
   1995 个 native case + 独立标量 transpose 对照，全过。

2. x32-packw-gemm-goi：nr=2、kr=sr=1 来自原 C assert。支持符号 g/nc/kc、
   可空 bias、额外 word padding。输出包括奇数 nc 保留槽和 extra 槽，故两边
   初始输出要求相等。6498 case + 标量 pack oracle 全过。
   本地 clang14 的旧 RVV header 没有 segment tuple 类型/API，真实 ISA
   syntax check 不能通过；这是工具 header 版本缺口，不能把 native tuple
   结构体通过编译说成真实 RVV 编译成功。其他 12 项真实 header 检查通过。

3. f32-vcmul：split real/imag，各 n floats，输入分配 2*n+3；real 尾部
   可能跨入 imag，imag 尾部最多多读三项。NaN-aware 数值比较，不限制 finite。
   非融合乘加与 RVV 显式 mul/add/sub 对应，1572 case + 标量 oracle 全过。

4. f32-maxpool：原版每级 vmax/vmin 把 NEON propagating-NaN 改为 RVV
   maximumNumber/minimumNumber，真实出现 NaN→数值。修复 target 在原
   RVV max/min 之外添加 vmfne 与 merge 恢复 NaN，不修改 shim 中 vfmax 语义。
   pointer table 采用连续 pixels*k，无 input offset；channels 带三项可读尾
   padding，输出带三项 padding，供原 NEON 后续 pass 的 vprev tail load。
   k<=INT_MAX 来源于原 int k 循环。3500 case 全过。

5. f32-argmaxpool：原版就是 vcgt+select / vmfgt+merge，NaN 和 tie 不应当
   偷换成 max primitive。原版 3500 case 全过，无需修复。wrapper 除数值输出
   外还逐项比较 uint32 index；k<=INT_MAX，同时约束 pointer table/output
   allocation，使用连续布局。未证明任意 input offset/stride 配置。

6. f32-gemm-minmax：复用起点已有修复，没有引入新算法。canonical mr=1..4、
   任意 nc/k、NR8 packed weights、连续行；仍要求 input/output 分配满 4 行，
   比较活跃 mr 行，不能冒充所有 API 内存/stride 布局。2400 case 全过。

7. f32-igemm-minmax：原 mr<=1 assert 意味 mr=1；NR8 weights。只修 NaN
   clamp，保留间接输入、K 及 positions 循环。canonical a_offset=0、zero=NULL、
   连续输出，输入表可含共享只读行。1875 case 全过。

8. f32-spmm-minmax：发现纯有限值 FMA 差异：a=0x3f800001、w=0x3f7fffff、
   bias=-1，NEON=0x337ffffe，原 RVV=0。源真实调用 vfma/vfmaq，原 target
   的“non-fused to match scalar reference”注释并不对应这份 NEON 参考。
   修复为真实 RVV vfmacc，另修 NaN clamp。原 target 还每个 strip 重置输入，
   原 NEON 沿 dmap 累积；修复保持 NEON 4/2/1 strip 及 in+vl cursor 更新，
   支持总差值非零/负差值，不加入 sum(dmap)=0 前置条件。
   spec 定义两个递归 prefix sum，要求每个可能 cursor+load/prefetch 地址
   可读、dmap 字节差值是 4 的倍数。内存要求保守，覆盖一些未实际读取位置。
   输出 stride=(m+4)*4，比较各列活跃 m 个值。3150 comparison case 全过，
   包含非零 dmap 总差值与非均匀输入；参考调度对齐会限制 RVV 吞吐宽度。

9. f32-dwconv-minmax：NEON weights 按固定四 channel block 存储。原 RVV
   却以 vl 推进 bias/k0/k1/k2 指针，甚至 channels=1 的 tail 都读取错槽。
   修复 vl<=4、每个权重段始终跳过 4，加 NaN clamp 修复。wrapper 支持符号
   pixels/channels、每 pixel 三个输入指针、无额外 offset、连续输出。
   175 case 全过；非零 offsets/任意 input_stride 暂未纳入该 wrapper。

10. f32-dwconv2d-chw：FMA tap 顺序与参考相同，本轮只修 target NaN clamp。
    wrapper 是整个连续 CHW plane，padding_top=1 来自原 assert，输入与 zero
    各需三项 padding。不限制输入或 zero 的浮点数值。760 case 全过。

11. f32-conv-hwc2chw：除 NaN 外发现真实 target 漏掉第二输出行的全部 upper
    clamp，补上四条 min。还存在“先 unmasked load、后 merge”的越界读：
    左边界先读 zero[-3]，即使该 lane 的 mask=false。最小合法带尾 padding
    例子中原版 ASan 实际报 12-byte 左越界，修复版通过。修复为真正 masked
    strided load，再 merge 显式零；不把 masked load 的语义混到 unmasked。
    canonical full plane，padding_top=1，连续 CHW output，w 限制在有符号
    RVV 索引可表示范围；非默认 padding/stride 另需 profile。1650 case 全过。

12. qd8-f32-qc4w-gemm-minmax：本轮只修 NaN clamp，保留 nibble unpack、
    模 2^32 signed multiply/accumulate、算术右移、float 转换及融合 scale+bias。
    原 mr=1、NR16 packed ABI、kc 向二 byte 取整，NEON 尾部读 8 byte，要求
    额外可读 input padding。weights 要求 4-byte 对齐，packed byte/int32/float
    的内存模型桥仍未证明。scale/zp/输入值没有 finite 或小整数限制。
    3325 case 全过；本轮起点的 NEON 早已采用 shift-then-convert，本轮没有
    修改它来迎合 target。

13. f32-raddstoreexpminusmax：原逐项 exp 输出一致，但 sum 从 n=4 就可差
    1 ULP。native vfredusum 采用一种合法顺序树；不等于已执行真实硬件，也
    不声称所有 unordered reduction 树都产生该反例。为了确定性等价，修复
    target 按 NEON 四 lane 分组累积，显式 (lane0+lane1)+(lane2+lane3)，
    tail 先两项相加再加单项。保留 RVV polynomial/FMA/bit operations。
    同时比较 n 项输出和 sum，没有改成 ULP 容差、没有加入有限值前置条件。
    3144 次输出/归约比较全过，包含 NaN/Inf；代价是不能使用更宽无序归约。

证据与重放

small-native-results.json：前三项 ASan/UBSan + 标量 oracle；
small-parse-results.json：前三项 Frama33 parse；
all-parse-results.json：后十项 Frama33 parse 全过，qc4w 保留 void* cast 警告；
wide-native-original_rvv-results.json：起点 original 的差异及未修改 GEMM 回归；
wide-native-rvv-results.json：10 个完整修复/无需修复 kernel 运行结果及输入哈希；
rvv-syntax-results.json：真实 riscv_vector.h 编译，不用普通 C shim 冒充 ISA；
unmasked-load-counterexample.json：HWC 最小内存原版越界与修复版对照。

python3 experiments/shared-extension/complex/native_small.py
python3 experiments/shared-extension/complex/parse_cases.py
python3 experiments/shared-extension/complex/native_wide.py original_rvv.c
python3 experiments/shared-extension/complex/native_wide.py rvv.c
python3 experiments/shared-extension/complex/check_rvv_syntax.py
python3 experiments/shared-extension/complex/native_oob.py

这些 native 记录均是有限回归，不是任意数组长度证明。规格/实现冻结后，不应
直接执行 select_modules.py 重写 frozen shared 文件；模型修改必须另建版本。
真正整核 proof 进展只应以独立 checker 的 complete=true 及原始义务记录为准。
