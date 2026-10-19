WP frontend 精确定位；尚未构建修补版，不能作为已修复结果使用

官方源码：Frama-C 33.0 Arsenic，归档 URL 和 SHA 在 provenance.json；
本地 /tmp 下载的 SHA 与 opam 包页面发布的 SHA 完全相同。
source-snippets.txt 给出原始源码的相关行；原文件 hash 已记录，可从归档重建。

1. CodeSemantics.ml:242–245 对不同精度 C cast 明确生成
   Cfloat.float_of_real target (Cfloat.real_of_float source value)。
   LogicSemantics.ml:504–506 对 ACSL cast 也做同样的转换。
   若不改变这个位置，仅改 Why3 axioms 无法保存 NaN 和 −0：实数零无法携带零的符号。

2. Cfloat.ml:187–190 code_lit 把 C 浮点字面量经 F.e_float 编成有理实数，再套to_f32/64。
   这里失掉 −0 的符号。compute_float 中 NEG/ADD/SUB/MUL 也用 Q 有理数折叠，
   所以不是简单禁止源码 token `-0.0f` 就够了。
   counterexamples.c 的直接字面量、局部0取负、0乘−1三种正确 C 负零结果，
   实际 WP print 都变成 sign_f32(to_f32(.0))=Negative。Clang IR保留正确负零。

3. 可行修复是新建WP构建，不改 C/spec：
   - Cfloat.code_lit 为真实负零构造 `neg_f32/64(to_f32/64(0))`，不经有理数抹符号。
   - Cfloat.compute_float 停止用Q折叠 IEEE FP arithmetic（或严格实现全部 IEEE cases）；
     使用现有 native IEEE operation 让 backend 处理，避免额外信任一个有理数计算器。
   - 给 Cfloat 增加 source→target FP converter，并在 CodeSemantics 与 LogicSemantics
     两处直接调用；新Cfloat theory对应定义为FloatConverter.to_float32/64 RNE。
     不能再用 universal real-roundtrip bridge 恢复丢掉的信息。
   - 重跑本目录6个前端诊断、负向控制与全部受影响kernel；冻结新 executable/plugin SHA。

4. 当前 binary bundle 仅有 .cmxs，没有 Frama-C/Why3 OCaml .cmi/.cmxa SDK，
   当前PATH也没有ocamlc/ocamlopt/dune/opam。公有 Cfloat API 没有可替换cast/code_lit的hook；
   -wp-driver 能绑定逻辑primitive，不能修复此前已经丢掉的符号。
   独立模型overlay不需要编译，但上述前端修复需要单独建立完整匹配的 OCaml/Frama-C
   开发环境，不能把一段未编译的source patch算作修复完成。

安全验收方面，可保守排除这些前端路径；Clang-O0及O1 IR扫描负零常量比仅grep源码好，
但这也不是完整source→WP保真定理。7项当前同精度逐元素证明应单独记录实际源审计。
浮点cast如果在控制流中已证明输入有限且非零，real往返值可能是正确的；这需要逐点证明，
不能因为源文件有一个cast就判kernel不等价，也不能把全部cast都默认安全。
