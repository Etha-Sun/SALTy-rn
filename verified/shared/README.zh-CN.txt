共享普通C shim与三个生成接口

旧版verified/qs8-rsum保持不动，基线提交cabc637。
新版本实现/规格检查点是cb36fab；proof随后独立补充。

shim.h统一类型、宏和固定VLEN128环境；base.c提供vsetvl和共享load。
rsum、clamp、float_ops是按指令族拆开的普通C模块，不是每个kernel复制一套shim。
e8m2/e32m8容量32，e32m1容量4，e8m8容量128；实际VL取min(AVL,容量)。
uint16x4_t/uint32x2_t当前仅提供8字节raw表示，用于s8 reinterpret与lane store，
没有提供这些类型的完整算术API；不能据此宣称所有uint16/32 intrinsic已支持。

每个kernel仍是neon.c、rvv.c、spec.h、harness.c、一个proof.patch。
共享库另有base-proof.patch与各模块proof补丁；合同、循环注解、ghost引理随库复用。
这些是库自身的证明，不为每个kernel新增独立helper源文件。

tools/shim_c_generate.py是三个小接口模板，不是新C前端或通用推断引擎。
每case的interface.json只有family/padding/observation三项；函数声明直接取自原C。
当前family为reduction-u8、clamp-s8、binary-f32。模板里明确保存各接口合法域。
默认只核对生成结果；--write只用于冻结前首次生成。
  python3 tools/shim_c_generate.py verified/qu8-rsum

spec只声明合法调用、frame、终止要求和wrapper返回1；没有kernel数学结果ensures。
wrapper实际运行两份原C再比较输出；长度是符号参数，没有固定loop展开界限。
qu8-rsum允许任意uint32初值（模2^32），没有sum相关范围前提。
s8-vclamp允许任意int8输入及-128<=lower<=upper<=127，输入要求7个padding字节。
f32-vadd允许所有float输入，要求每输入3个padding元素；C比较为数值相等或双方NaN。
此观察忽略NaN payload与signed-zero位差，不观察FP flags/errno。

frozen.json锁住三个case的原实现、生成spec/wrapper、接口描述、所有共享C/h、
浮点driver和生成器；其摘要固定在checker中。证明修改不能刷新这个基线。
tools/shim_c_check.py复用旧包的C token检查，禁止普通C变化、公共合同注入及axiom。
附注副本在case/.build/下；保留assert源位置后，Clang全部预处理token必须相同。
checker实际内联两kernel，验证本case使用的共享模块、base、ghost helper和wrapper。
仅有外部ensures而没有被检查的函数体，不作为共享已证库收录。

复现（仓库根目录；新name保留既有日志）
  python3 tools/shim_c_check.py qu8-rsum --name replay --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin
其他case名称为s8-vclamp、f32-vadd；--prepare仅构建/检查副本，不运行WP。
需要Frama-C33 Arsenic、Clang14、GNU patch与Z3/CVC5/Alt-Ergo，版本见tools/environment.json。
Why3本地IPC和GNU patch元数据操作需在允许它们的环境运行。
每轮2个solver worker、每目标10秒/1024MB、总600秒，禁用cache。

float.driver只把有名逻辑加法映射到WP既有Cfloat.add_f32；没有新增axiom。
使用Typed+float并允许IEEE NaN/Inf，绝不用Real模型替代IEEE。
映射本身需要信任和审阅；它没有证明真实NEON/RVV NaN payload/FP环境对应。
所有ISA intrinsic到普通C shim的形式对应仍属于TCB；原程序不变不能解除这点。

本包通过状态只以各case最终fresh summary与verified/manifest.json为准。
文件放在此目录、C运行回归通过或局部shim通过，都不自动代表完整kernel已证。
