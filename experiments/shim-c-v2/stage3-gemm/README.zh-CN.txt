第三阶段 GEMM 三项 proof 续补

基线 HEAD 3b96d1a，原 v4-campaign 冻结文件逐项 SHA 核对；实际源、公共 spec/wrapper、shim、原 checker/模型/锁均未改。
独立环境采用已验收 handoff-model-plus（固定 VLEN128、IEEE RNE、原合法域）。没有发现新的 target 反例，因此没有修改或另建修复 target。

每版每kernel仍只有一份 proof.patch。serial-v4.py 从 tools/shim_c_campaign_v4.py 独立复制，只插入一行强制 wp-par=1；差异与 SHA 在 checker-delta.json。其余 model control、body/global coverage、source/model SHA 守卫保持原逻辑。副本路径及 SHA 纳入每版 frozen.json；运行通过 PYTHONPATH=tools 导入原检查模块。

实质证明工作：
- f32-gemm-minmax：按真实单次舍入 shim_fma32 定义任意 K 的递归累加参考，NEON 四行/两半向量及 RVV 四行加入逐lane K前缀不变量。没有把 FMA 改成普通乘加。
- f32-igemm-minmax：按 indirection position 与 K 展平顺序定义递归 FMA 参考；增加 NC、position、K 三层游标/variant/累加器不变量。沿用原 wrapper 的 mr=1、a_offset=0、zero=NULL，未加前提。
- qd8-f32-qc4w-gemm-minmax：增加偶数KC、input/packed-weight游标不变量，以及 RVV 高低4-bit符号扩展断言。r2补实际 bits_i8、load、shift、and、signextend 函数合同和循环归纳；合同/循环都必须由原body验证，bits_i8的memcpy位桥仍不得当成假设通过。

版本记录：
- 无后缀首版实际诊断发现新注释错误：ACSL logic formal不接受const；把logic放在header guard之后引起重复声明。保留冻结及原失败日志。不是环境错误或target缺陷。
- -v2是仅去const的静态中间候选，未执行WP，不作证据。
- -r1同时纠正上述两项，三项静态source guard和实际解析通过。GEMM/IGEMM各90秒定点预算耗尽，未产生完整raw；qd8两项nibble目标0/2。这些局部结果不能代替完整body证明。
- -r2增加需实际检查的递归seed/step lemma及checked Wp.array策略；qd8同时补底层实际body的合同。三项静态source guard与实际解析通过。每版保存独立manifest/proof SHA；没有覆盖前版。

执行限制：最多一个solver run，wp-par=1。run-r1.py full串行每项300秒主体预算，保留同上下文正反控制、独立global lemma及完整日志；后续GEMM r3候选使用独立1200秒预算。定点诊断只检查选定属性，不能宣称覆盖其他RTE、helper或整核；实际完成记录以logs里的execution/summary/raw为准。

严格通过仍要求complete=true、全部raw通过、pending为空、source_guard/unchanged/model_inputs_unchanged/model_control.accepted为true，并且missing_body_ensures/global_lemmas为空。缺body raw记未知，不以global通过数或0/0替代。下游单VC通过可能依赖上游未证断言，必须整链验收。

后续实际进展：
- r1三核300秒完整尝试均未完成；body预算耗尽，没有完整body raw。source_guard、unchanged、model_inputs_unchanged、model_control.accepted均true。不能把主体超时后合并的lemma-only raw视为全量结果。
- GEMM/IGEMM r3由实际printseed01 VC引导：参考快照固定于block入口，显式input/weight frame。两核各自完整定点raw均3/6：递归seed、step与NEON首lane建立通过；NEON保持、RVV建立/保持未证。完整run仍需验证所有frame义务。
- qd8 r2完整选定5个helper的body+RTE诊断为66/71。剩bits_i8的memcpy ensures、valid_src、separation；vsll signed-overflow；vand prefix invariant preserved，共5项timeout。这些helper下游结果仍可能依赖bits_i8未证合同，不算完整callee链通过。
- r4加入全参数ext_same FMA同余lemma，lemma本身必须实际检查；旧模型与普通C不变。独立定点在r3完整run后串行执行，结果以新raw为准。

最终逐项冻结SHA、proof SHA、所有尝试与局部pending由collect.py生成RESULTS.json。该文件对主体超时记body_total=null，而非0/0。

GEMM r3完整1200秒主体尝试于1218.995秒结束，exit124、complete=false，所有冻结/模型控制守卫仍true；1175调度目标，但没有完整body raw。r4 GEMM定点4/7，FMA同余lemma已实际证明，原3项累计/RVV目标仍未闭合。

IGEMM r4最后定点同样4/7，新增FMA同余lemma通过，原3项累计/RVV目标未闭合。所有队列已结束，最终最佳proof为两f32 r4及qd8 r2；没有新增整核通过。

追加qd8算术诊断：r3加入0..7各移位范围lemma及合并范围，globals 9/16；constant shift 2..7与合并范围未证。components02为67/71，shift overflow消失，但依赖尚未证明的全局范围lemma，不能替代r2的66/71或声称RTE已独立闭合。r4仅新增内置checked Wp.range/Wp.shift证明策略，原C/前提/模型不变，等待最终globals及components对照。

追加算术尝试已结束：qd8 r3 globals9/16（7项raw verdict=timeout），components02=67/71；r4 globals10/16（6项常数shift raw verdict=unknown），components03=67/71。r4合并范围lemma通过，但其全局lemma集合未闭合。两个components的shift overflow通过均不能被记为独立有效改善，继续保留最佳可用r2 66/71；bits_i8真实body仍未证。原始raw及pending verdict完整保留。17版源与proof SHA核对无变化，无后续运行。
