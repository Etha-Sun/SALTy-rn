# rvv_ptr_lower：RVV intrinsic 的确定性指针化改写

2026-11-04。用户要求：为绕开 QCP 的按值 struct 缺陷而做的源码改写，必须由工具链中的规则式确定性工具完成，不由 LLM 或 worker 手改。最终呈现时，`impl/` 放两份原版代码（NEON A 与 RVV Bopt），证明目录放本工具改写后的程序。

## 为什么需要

在数组字段向量表示下（支持 VLEN512 及多 VLEN 的前提，见 `research/project-plan-20261102/rvv-array-vector-probe-20261104/`），QCP 2.1.4 对按值传递的向量有两个缺陷：

- 按值参数加写堆，会残留旧资源；
- 按值返回的临时对象不会释放。

指针形式（`f(&out, &in, …)`）已在 probe 1 中端到端证通。本工具把 kernel 中所有向量值的传递改成这种形式。

## 做法

- **由类型驱动，不靠文本猜测。** 用固定的 zig clang 20.1.2 得到原文件的带类型 AST，以节点种类和"是否为 RVV 内建类型 `__rvv_*_t`"决定每一处改写。
- **只改涉及向量值的语句。** 其余字节（注释、格式、宏）原样保留。clang 给的是字节偏移，文件按 latin-1 读写，保证逐字节往返。
- **拒绝而不是猜测。** 规则表之外的任何构造都会使工具报出明确的拒绝原因，不会静默跳过。
- **结果确定。** 同一输入总是得到同样的输出。临时变量按出现顺序编号为 `qcpv_tN`，指针形式操作统一命名为 `qcp_p_<去掉 __riscv_ 的原名>`，拷贝命名为 `qcp_p_copy_<类型>`。

解析配置在 `config.json` 中，与 SALTy/sol-pipeline RVV harness 的 prelude 相同。有两个固定 profile：`xnn`（包含 microparams.h）和 `self`（kernel 自带 params 定义时使用），按顺序尝试，第一个能干净解析的生效，并记录在日志里。

## 规则表

| 规则 | 原形式 | 改写后 | 语义依据 |
|---|---|---|---|
| R1 | `T v = f(args);` | `T v; qcp_p_f(&v, args');` | 声明加初始化等于声明后赋值；向量没有 const 以外的限定 |
| R2 | `T v = u;` | `T v; qcp_p_copy_T(&v, &u);` | 同上；拷贝就是值拷贝 |
| R3 | `v = f(args);`，`v` 不是 f 的直接向量参数 | `qcp_p_f(&v, args');` | 先求值实参，再写 v |
| R4 | `v = f(args);`，`v` 是 f 的直接向量参数 | `T t; qcp_p_f(&t, args'); qcp_p_copy_T(&v, &t);` | 消除输出与输入的别名，shim 合同不需要别名版本 |
| R5 | `v = u;` | `qcp_p_copy_T(&v, &u);` | 值拷贝 |
| R6 | 实参中嵌套的向量值调用 `g(...)` | 按从左到右顺序提到语句前的新临时变量 | 安全条件由 check_lifts 检查，见下文 |
| R7 | 向量变量实参 `u` | `&u` | 只读借用 |
| R8 | 结果不是向量（store、标量提取等）但实参含向量的调用 | `qcp_p_f(args')`，仍是表达式 | 同 R7 |
| R9 | 改写后变成多条语句，且原语句是 if/else/for/while/do 的单语句体 | 外面加 `{ … }` | 原单语句不可能是声明，加块不改变作用域含义 |
| R10 | `if`/`switch` 条件需要提升 | 提升出的语句插在 `if`/`switch` 之前 | 条件只求值一次 |
| R11 | R1/R2 中带 `const` 的向量局部变量 | 去掉 `const`，逐处记录 | 变量改为经指针初始化；之后只读 |
| R12 | kernel 文件内定义、宏体含向量代码的宏的调用处 | 替换为 clang 预处理器给出的展开 | 只保留这些宏的 `#define/#undef`，其余指令全部置空，因此头文件宏（`UINT32_C`、`XNN_*`、`assert`）不展开，留给真实编译处理。宏定义行替换为同行数的注释 |
| R13 | `T a = x, b = y;` | 每个声明符一条声明，顺序不变 | C 按顺序初始化声明符，每个声明符从自身之后开始可见 |

| R14 | 内联汇编只含对齐指令（`asm volatile(".balign N")`、`.p2align`、`.align`），且没有操作数和 clobber | 替换为空语句和注释 | 这条指令只影响指令布局，对 C 语义没有影响。其他形式的 asm 一律拒绝（ASM） |
| R15 | `do S while (OP v REL e);` 或 `do S while (OP v);`，其中 OP 是 `++` 或 `--`，v 是普通变量，e 没有副作用且不含 v，循环体中没有作用于本循环的 `continue` | `do { S v -= 1; } while (v REL e);`（`++` 时为 `v += 1`），或条件为 `(v)` | 条件在每轮 S 之后恰好求值一次，所以把它的副作用移到循环体末尾，求值顺序不变。其余带 `++`、`--` 或赋值的循环条件一律拒绝（NORMCOND） |

| R16 | 在 do-while 循环体中（不跨越内层 for/while），单独成句的 `++v;`、`--v;`、`v++;`、`v--;` | `v += 1;` / `v -= 1;` | 语句的值不被使用，四种写法等价。QCP 2.1.4 在 do-while 中处理 `unsigned long long` 的 `--n;` 会失败，而 `n -= 1;` 可以（W9 发现，v1.2 加入）。只作用于 do-while 内部，已证明 kernel 的程序文本不受影响 |

| R17 | 函数内带常量初始化的 `static const` 数组（可带 `XNN_ALIGN(n)`） | 去掉 `static` 和对齐属性，成为普通的局部 `const` 数组 | 数组只读，每次调用读到的值相同；对齐不影响 C 语义。数组可能被返回、存入非局部左值，或传给非 intrinsic 的函数时拒绝（STATIC）。"intrinsic" 的判断：名称以 `v` 或 `__builtin` 开头（v1.4 起，只看名称）；名称以 `_mm` 开头（x86，v1.5 加入）的，**必须从 clang AST 确认**被调函数是编译器内建（隐式声明或 `__builtin_` 开头），或其声明所在文件位于 clang resource include 或 libc include 目录（即 `immintrin.h` 一类的系统 intrinsic 头文件）。kernel 文件里自己定义或只声明的 `_mm*` 函数，不管名字如何，一律拒绝（STATIC，说明"不是内建、也不是系统头文件里声明的"）。因此在 `--preprocessed` 单元（头文件已内联，无系统头位置）里，`_mm*` 一律无法确认而被拒绝。`immintrin.h` 里的 `_mm*` 只做值运算和按指针 load/store，不保存传入的地址。QCP 2.1.4 不支持函数内的静态存储变量（W9 发现，v1.3 加入；`_mm` 前缀由 W02 在 avx-u16 上发现，v1.5 加入，11-07 起加 AST 确认）。**已知局限：** `v`/`__builtin` 前缀仍只看名称，kernel 里用户自定义的 `v*` 函数同样会被放行；RVV/NEON 输出必须与 v1.4 逐字节一致，所以没有一并收紧 |
| R18 | 初始化列表末尾多余的逗号 `{…, x,}` | `{…, x}` | 纯语法改动。QCP 2.1.4 无法解析末尾逗号（v1.3 加入） |

| R19 | 注释和字面量之外的 GNU `__restrict`、`__restrict__` | C99 `restrict` | 两者语义相同；QCP 2.1.4 只接受 `restrict`（W19 发现，v1.4 加入） |

R14、R15 是 QCP 前端规范化，在 v1.1（2026-11-05）加入，**对两侧都适用**。QCP 2.1.4 不能解析内联 asm，也不能解析出现在表达式里的前置自增/自减（作为独立语句可以）。用 `--isa neon` 时，只对 NEON A 做规范化，不做向量改写。NEON 侧的差分测试由 `validate_neon.py` 完成：原版和规范化后的 A 分别编进上游 harness，在 qemu-aarch64 上运行，要求输出完全相同。

### v1.5 新增规则（2026-11-06）

| 规则 | 原形式 | 改写后 | 语义依据 | 拒绝条件 |
|---|---|---|---|---|
| R20（仅 `--preprocessed`） | 预处理后单元中顶层的 `static inline` 函数（含前置 `__attribute__`），同时满足：(a) 没有任何其余顶层声明（自身除外）引用它；(b) 它的任何一个声明都不带会让函数不经引用也可能执行或保留的属性（constructor、destructor、used、retain、weak、weakref、alias、ifunc、asm 标签） | 删除该函数的定义和它的原型声明；删除后重新判断，直到不动点。**不满足的一律保留**，`normalization.json` 的 `r20_retained` 逐个记录保留原因（`attribute: …`、`referenced by …`、`not reachable from any reference outside the static inline set: reference cycle kept conservatively`） | 未被引用的、无特殊属性的内部链接函数没有可观察行为，删除后其余函数的行为不变。引用包括：`DeclRefExpr`（调用、取地址、存入函数指针、各种初始化器都算；引用来自任何顶层声明，不限于主文件）、`__attribute__((alias("f")))` 的目标、`__attribute__((cleanup(f)))` 的函数；自引用不算；互相引用且都无外部引用的函数，保守地不删（不做可达性分析）。QCP 2.1.4 前端会被未引用的 `static inline` 函数击倒（"record initializer: local address not found"），而 `f32-avx-base.h` 带着大量未用 wrapper（W02 发现 15） | 要删的函数位于宏展开之内（MACRO）。非 `static`、非 `inline`、被引用的函数不会被删，不是拒绝 |
| R21（仅 `--isa x86`，由 `config.json` 里各 ISA 的 `enable_r21` 开关控制） | 同一个调用的多个实参是同一个按值向量变量 `v`（`op(v, v)`、`op3(v, w, v)`）；该调用恰好是整条表达式语句、单个声明的整个初始化式，或 `x = call;` 的整个右端 | 在该语句之前插入 `T qcpv_dupN = v;`；第 2 次及以后出现的 `v` 换成 `qcpv_dupN`（每个多余出现一个新临时变量，`T` 是变量类型的拼写） | 语句开头读 `v` 与调用求值时读 `v` 得到同一个值：语句里除调用本身外没有别的求值，实参里没有调用和赋值，`v` 不会中途改变（`x = op(x, x)` 的赋值发生在调用返回之后）。QCP 不能把同一变量的资源分给两个形参（"Cannot derive the precondition"，W02 发现 9）。向量判定见下 | 调用嵌在更大的表达式里；在 if/while/for 的条件或头部；是无花括号的循环体；一条语句里有多个这样的调用；实参含调用或赋值；需改写处位于宏展开之内（MACRO）。拒绝码 R21 |
| R22（所有 ISA，只加注释） | 调用用户自定义函数 W（定义不在编译器或 libc 的头文件目录内）：W 有按值向量形参，且 W 直接或经被调函数调用了名称匹配 `heap_write_regex` 的函数 | 紧接调用表达式插入 `\n/*@ where p=&v, … */\n`：每个按值向量形参 `p` 一个绑定，`v` 是对应实参变量名 | 按值向量参数加写堆会在 QCP 里留下陈旧资源；`&(arg)` 的取址与按值传入的拷贝等价，`where` 注解让 QCP 把形参资源绑定到实参变量的存储。只加注释：自检要求去掉注释后插入前后的 C token 序列逐一相同，否则报 INTERNAL。调用后已紧跟 `/*@ where` 时不重复插入（幂等） | 按值向量实参不是普通变量（如 `st(o, make())`）；形参没有名字；调用位于宏展开之内。拒绝码 R22 |

补充说明：

- **向量判定（R21、R22）** 由 `config.json` 里每个 ISA 的 `vector_type_regex` 决定：类型的拼写或脱糖后的拼写（去掉 `struct`/`union`、`const`/`volatile`、`__attribute__`）匹配该正则，或脱糖拼写带 `__vector_size__`、`neon_vector_type`、`ext_vector_type` 属性。指向向量的指针和向量数组不算向量。
- **`heap_write_regex`（R22）** 按 ISA 配置，是被调函数名的白名单，不靠函数体文本猜测。x86：`^(?:(?:qcp)?_mm\d*_\w*(?:store|stream|maskmove)|(?:memcpy|memmove|memset)$)`；NEON：`vst*` 与 `mem*`；RVV：`__riscv_vs{e,se,oxei,uxei,seg,sseg}<n>` 与 `mem*`。
- **处理顺序：** R12（仅 RVV）、R20（仅 `--preprocessed`）、R23、R14–R19（`normalize`）、R21、R22；每步之后重新解析。日志里的 `line` 是该步骤输入文本中的行号。`--isa rvv` 与 `--preprocessed` 不能同用（R12 需要宏文本）。
- **R21 只对 x86 开启：** RVV 是指针形式，NEON 在旧证明中没有遇到这个问题，E1 已有证明建立在 v1.4 的输出上。`enable_r21` 在 `isa.rvv`、`isa.neon` 为 `false`，`isa.x86` 为 `true`。关闭时 R21 完全不运行（RVV 的 35 个 kernel 和 NEON 的 40 个文件与 v1.4 逐字节相同，只有版本串不同；RVV 若开启 R21，f32-vlrelu、f32-vrndne、qs8-rsum 会被改写，这是关闭的原因）。
- **R22 对 XNNPACK 原版源文件：** 不预处理时，`xnn_storeu_f32(output, vy)` 之类对头文件 wrapper 的调用在 kernel 里加注释；wrapper 本身在头文件里，不动。直接调用 clang 头文件里的 `_mm256_storeu_ps` 不算 wrapper 调用。

### v1.6 新增规则（2026-11-06）

| 规则 | 原形式 | 改写后 | 语义依据 | 拒绝条件 |
|---|---|---|---|---|
| R23（所有 ISA） | 一条语句里恰有一处带自增/自减的解引用 `*p++`、`*p--`、`*++p`、`*--p`：语句是单个声明符的带初始化式声明 `T v = e;`，或 `x = e;` 的赋值语句（`e` 含该处），且语句是复合语句的直接子语句 | 后置：`*p++` 的 `p++` 改成 `p`，语句的 `;` 之后同一行插入 ` p += 1;`（`--` 为 `p -= 1;`）。前置：`++p` 改成 `p`，语句之前插入 `p += 1; ` | C11 6.5.2.4：`p++` 的值是 `p` 的旧值，副作用在下一个序列点之前完成。语句里 `p` 只出现一次，所以语句内没有其他读写 `p` 的求值，也没有未定序问题；`p` 是普通局部变量或形参，不是 volatile，地址从未被取，没有别名能在语句内观察 `p`；因此在语句后（后置）或语句前（前置）更新 `p`，与原语句的结果和 `p` 的最终值相同。从站点到语句根的路径上只允许值运算（类型转换、括号、下标、成员、`- + ~ ! *`、算术/比较/位运算二元算符），没有求值顺序或短路。QCP 2.1.4 不能解析表达式里的 `p++`（`s8-rmax-neon-u32-acc2` 的 `const int8_t vt = *input++;`） | 全局/函数内静态/volatile/成员表达式的 `p`；`&p` 在函数里出现；`p` 在同一语句里再次出现；站点在 if/while/do/for 的条件、for 初始化式、无花括号的循环或 if 体、case 标号语句、return、`=` 的左端、复合赋值、裸表达式语句里；路径上有 `?:`、`&&`、`||`、`,`、调用实参；一条语句里有多个这样的解引用（含多声明符）；站点位于宏展开之内（MACRO）。拒绝码 R23 |

- **R23 在 normalize 之前运行**，所以条件里的 `*p++` 等先由 R23 给出明确的拒绝原因，而不是被 `normalize` 的其他规则抢先拒绝。
- **R23 严格拒绝：** v1.6 对 `*p++` 作调用实参、`?:` 分支、多声明符等场景不改写而是拒绝（见 REPORT 的监督者决策项）。v1.5 下未拒绝的 RVV f32-gemm-minmax、f32-igemm-minmax、NEON f32-maxpool、f32-argmaxpool，v1.6 因此被拒绝。
- **测试：** `rule_tests.py` 含 R23 的 11 个正例（编译后与原版在宿主上执行结果相同）和 28 个负例；`validate_r23_target.py` 对 `s8-rmax-neon-u32-acc2.c` 做 qemu-aarch64 差分（含负控）；`validate_neon.py` 对被 R23 拒绝而没有规范化输出的 kernel 记为 `NO-NORMALIZED`。

### v1.7 新增规则与 `--isa hvx`（2026-11-07）

| 规则 | 原形式 | 改写后 | 语义依据 | 拒绝条件 |
|---|---|---|---|---|
| R25（所有 ISA，只在给出 `--entry F` 时运行） | 主文件里定义的、不在 F 调用图内的函数 | 删除其定义和原型声明。**保留**：F；带 constructor、destructor、used、retain、weak、weakref、alias、ifunc、asm 标签属性的函数；在"调用"之外被引用的函数（取地址、存入函数指针、各种初始化器；引用来自任何函数体，含本身会被删的死函数，以及非函数的顶层声明；`alias`、`cleanup` 属性指名的函数也算）；以上各函数的被调函数，传递闭包。`normalization.json`/`lowering.json` 的 `r25_retained` 逐个记录保留原因 | 不可达、无特殊属性、地址未被取的函数不会被执行，删除不改变 F 的行为。对"死函数里取地址"保守地保留，因此可能多留，不会多删。头文件中的函数不动。QCP 2.1.4 不接受带按值向量形参的死函数（例如 XNNPACK 生成文件里未用的辅助函数） | F 在输入文件中没有定义（R25）；要删的函数位于宏展开之内（MACRO）。没有 `--entry` 时 R25 完全不运行 |
| R26（`--isa hvx`） | `*(T*)&v`，`v` 是局部（自动存储）、非 volatile 的向量变量；`T`（脱糖后）是字符类（`char`、`signed char`、`unsigned char`，所以 `int8_t`、`uint8_t` 可用）或该向量的元素类型（含其有无符号变体），且 `T` 的拼写是单个标识符（`unsigned char` 这类带空格的拼写目前拒绝，用 typedef 名）；偏移为 0；整个表达式只作为右值读取 | `qcp_p_lane0_<类>_<拼写>(&v)`，在 `qcp_hvx_ptr_ops.h` 里定义为对 `v` 首字节的 `memcpy` 读取 | C11 6.5p7：经字符类型读对象表示总是允许；经元素类型读，是对向量 lane 0 的读取，与 HVX 向量在内存中的 lane 布局一致。偏移 0 即 lane 0（小端）。操作名带向量类，避免不同向量类之间的名称冲突 | 全局/静态/volatile 的 `v`；`v` 不是变量；`T` 不是字符类也不是元素类型（长元素向量上的 `int32_t` 等）；`T` 的拼写含空格（`signed char`）；数组形式 `((T*)&v)[0]`、经中间指针变量；写、复合赋值、自增、对结果取址；偏移不为 0。除 R26 站点外，对向量变量取地址一律拒绝（ADDROF），向量形参、静态向量照旧拒绝（VECPARAM、STATIC） |

`--isa hvx`：解析标志 `-target hexagon-linux-musl -mcpu=hexagonv67 -mhvx=v68 -mhvx-length=128B`（与 W03 使用的 `zig cc` 目标等价，直接调 clang），规则 R1–R8、R11、R15、R16、R23、R25、R26 与 RVV 相同的方式作用于 `HVX_Vector`、`HVX_UVector`、`HVX_VectorPair`、`HVX_VectorPred`。R22 对 hvx 不运行。R21 对 hvx 关闭（`enable_r21: false`）。输出 `<stem>.lowered.c`（首行 `#include "qcp_hvx_ptr_ops.h"`）、`qcp_hvx_ptr_ops.h`、`qcp_hvx_ptr_ops.proto.h`、`<stem>.normalized.c`、`<stem>.lowering.json`。

- **向量类型的规范化。** AST 把 `HVX_Vector` 等写成宏展开出的 `HEXAGON_Vect1024`（长元素，32 lane，pair 为 64 lane），内建与 `xnn_hvx_vector_t` 是 int 元素向量。`vector_canonical` 把两类都映射到 `HVX_Vector`/`HVX_VectorPair`，保证同一操作只生成一份。
- **Q6 宏**只接受平凡转发宏 `Q6_X(P..) -> __builtin_HEXAGON_V6_name_128B(P..)`，用 `clang -E -dM` 机械检查；其他形式拒绝。
- **XNNPACK 头文件里的 `xnn_*` wrapper**（`xnn_loadu_s8`、`xnn_max_s8`、`xnn_reduce_max_s8`、`xnn_set1_s8`、`xnn_vadd_f32` 等）按操作处理（`kind: "wrapper"`，生成 `qcp_p_xnn_*`），**不内联**（内联需要 F1–F3，暂缓）。wrapper 函数体不由本工具降低；证明时要么按"平凡转发 wrapper"进合同库，要么需要 F1–F3 后证明函数体。
- **向量 load**（`*(HVX_UVector*)p`）生成 `qcp_p_load_<向量类>_<元素类型>`；指针的指向类型必须是字符类或 `void`，否则拒绝（VECEXPR）。
- 尚未实现：F1–F3、P4、H7（XNN-004 的修复变体 V-007）。因此 `xnn_reduce_max_s8` 保留其 `float` 返回，lane-0 的 `*(int8_t*)&v` 若在头文件 wrapper 内就不在本工具处理范围。
- **`--preprocessed` + hvx**：解析并运行 R25，但 wrapper 函数体（含 R26 之外的构造）会被拒绝，直到 F1–F3 完成；s8-rmax 的预处理单元得到 5 条拒绝（见 REPORT）。

## x86（`--isa x86`）

只做规范化（R14–R22），不做 RVV 式指针改写。解析配置在 `config.json` 的 `isa.x86`：目标 `x86_64-unknown-linux-musl -mavx`，profile 带 `immintrin.h` 和 `src/xnnpack/common.h` 等，`user_includes` 覆盖 XNNPACK 的 `simd/f32-avx*.h`。`<pthreadpool.h>` 在部分工作副本里缺子模块，所以 `@tool/stub-include/pthreadpool.h`（只含 `typedef struct pthreadpool* pthreadpool_t;`）作为**最后一个**包含路径：真头文件存在时用真的，缺失时才用桩；桩用于解析，以及在真头文件缺失时编译差分测试 harness（`validate*.py`；原版和改写版看到同一个桩，kernel 只用到 `pthreadpool_t` 类型，不调用 pthreadpool）。输出为 `<stem>.normalized.c` 和 `<stem>.normalization.json`（与 `--isa neon` 相同；没有 `lowering.json`）。

`--preprocessed`：输入是自包含的预处理单元（`gcc -E -P -CC -nostdinc`，shim 头文件已内联），单独解析（无系统头路径、无前置包含），并启用 R20。W02 的 `vabs-avx` 单元上 R20 删除的函数数量、R21/R22 触发次数见 `REPORT.md`。`normalization.json` 里的 `r20_retained` 列出所有保留的 `static inline` 函数及原因。

QCP 证明用的 shim（如 `qcp_mm256_storeu_ps(float*, const __m256*)` 加宏 `_mm256_storeu_ps(p,a) → qcp_mm256_storeu_ps((p), &(a))`）在预处理阶段展开，不属于本工具。

QCP 支持 do-while 本身，但循环不变量要写在循环体之后、`while` 之前（`do { ... } /*@ Inv Assert ... */ while (c);`，见 QCP tutorial T3-6），所以不需要像旧项目那样手工改成 while。

R6 的安全条件（check_lifts）：

- (a) 被提升的调用没有副作用。它们只能是纯运算或 load；store 返回 void，不会被嵌套。
- (b) 语句其余部分只写具名变量（`++`、`--`、`=`、`op=`）。语句自身的顶层赋值或初始化除外，C 本来就把它排在操作数求值之后。
- (c) 被提升的调用不读取其余部分写入的任何变量。

三条都满足时，提前求值不可观测。

**拒绝的情形：**
- 循环条件、增量或 for-init 中有向量调用；
- `&&`、`||`、`?:`、逗号的非首操作数中有向量调用；
- 不满足 R6 安全条件；
- 函数有向量类型的参数或返回值；
- 非 intrinsic 函数接受向量；
- 其他种类的向量表达式；
- 需要改写的部分位于头文件宏展开之内。

## 输出

每个 kernel 生成以下文件：

- `<k>.lowered.c`：首行插入 `#include "qcp_rvv_ptr_ops.h"`。
- `qcp_rvv_ptr_ops.h`：按 AST 签名生成的指针形式包装，内部直接调用真实 intrinsic，例如 `*qcp_r = __riscv_vfadd_vv_f32m4(*qcp_a0, *qcp_a1, qcp_a2);`。它用于编译和差分测试改写后的程序。QCP 证明使用另一份同名的 shim，以数组字段表示向量，附带合同。
- `<k>.lowering.json`：输入和输出的 SHA、parse profile，逐条改写记录（规则、行号、原文、改写结果），用到的指针操作及其规范类型签名（供编写 QCP shim 使用），以及拒绝记录。
- 如果用到 R12，另有 `<k>.r12-expanded.c`（宏展开后、指针化之前的中间文件）和 `r12-derived.c`（供预处理器使用的派生文件）。

## 用法

```bash
python3 -I tools/rvv_ptr_lower/rvv_ptr_lower.py <kernel.c> --out-dir <dir> [--isa rvv|neon|x86|hvx] [--preprocessed] [--entry F]
python3 -I tools/rvv_ptr_lower/validate.py <kernel-dir> --out <dir> [--only k1 k2] [--no-difftest]
python3 -I tools/rvv_ptr_lower/validate_x86.py --out <dir> [--kernels f32-vabs-avx f32-vlrelu-avx-u16] [--preprocessed-unit <unit.c>]
python3 -I tools/rvv_ptr_lower/rule_tests.py [--out <dir>]
```

- `--preprocessed`：输入是已预处理的单个翻译单元，启用 R20（只用于 neon/x86）。
- `validate.py --no-difftest`：跳过 QEMU 差分（缺 SALTy harness 时使用），状态记为 `OK-NODIFF`。
- `validate_x86.py`：x86 的确定性、幂等性、gcc `-mavx` 比特差分；`--preprocessed-unit` 再检查 R20/R21/R22 单元。
- `validate_r23_target.py`：R23 目标 kernel 的 qemu-aarch64 差分（`--normalized` 可传入被篡改的输出做负控）。
- `--entry F`：启用 R25（所有 ISA）。
- `rule_tests.py`：R17/R20/R21/R22/R23/R25/R26 与 HVX 的小型夹具，含拒绝用例，退出码 0 表示全部符合预期；`--only <前缀>` 只跑匹配的用例。

`validate.py` 对每个 kernel 检查四项：
- **确定性**：两次运行的输出逐字节相同；
- **语法**：改写结果连同头文件能被解析；
- **幂等性**：对改写结果再运行一次，没有任何改写或拒绝；
- **QEMU 差分测试**：把原版和改写版分别放进上游 SALTy harness，在 VLEN 128/256/512 下运行，要求 stdout 完全相同。harness 唯一的改动是在 `sys_reboot` 前打印所有文件级静态数组的 FNV-1a 哈希。

差分测试是测试证据，不是证明；改写的正确性论证依据是上面的规则表。

## 信任边界

- 被验证的是改写后的程序。从原程序到改写程序这一步由以上规则保证，没有形式化证明。
- clang 解析、R12 宏展开和 harness 编译都依赖固定工具链：zig 0.15.2 / clang 20.1.2。
- **R22 靠名称识别写堆函数。** `heap_write_regex` 只按被调函数的名字匹配，不分析函数体，所以名字不匹配的写堆函数会漏标。这是可以接受的：漏标只会让后续 QCP 证明失败，不会让错误的结论通过（R22 只加注释，不改任何 C token）。
- **R20 的保守边界。** 删除只依据 AST 里的引用、属性和 `alias`/`cleanup` 引用；`#pragma weak`、链接脚本、`-Wl,--undefined` 等工具看不到的引用方式不在范围内，不过被删的函数是内部链接的，外部不能按符号引用它。互相引用的环保守保留。
- **R17 的 `_mm` 确认依赖系统头文件的位置**，不依赖名称；`v*`/`__builtin*` 前缀仍只看名称（见 R17 的已知局限）。
- **R25 的保守边界。** 只看 AST 里的引用和属性；`#pragma weak`、链接脚本等看不到的引用不在范围内。只有在给出 `--entry` 时才删函数，调用者要保证 F 是真正的入口。
- **R26 只读 lane 0。** 本工具不证明 HVX lane 布局，只依据 C 对象表示规则；lane 布局与 `qcp_p_lane0_*` 的忠实性靠差分测试（qemu-hexagon）。
- 生成的头文件把每个指针操作定义为对原 intrinsic 的直接调用。QCP shim 与 intrinsic 语义是否一致，是另一项需要单独审查的工作，不在本工具范围内。
