浮点 proof 的增量版本；冻结 C/spec，不把基线重放当完成

最终新前端验收在 ../frontend-campaign/f32-v*/ 中进行。本目录保留在 base native
Cfloat overlay 下定位和补充 proof 的过程；各 frozen.json 指向同一批原实现/spec。
新的 proof 都是单个 proof.patch，可含共享库合同、实际有体 ghost helper 和循环证明。
源码不改，public spec 不改，无新 finite/非NaN 输入限制，无 user axiom。

1. *-frame：只加6个标量参数的 transport lemma，独立实际证明该lemma（1/1）。
   完整 vadd 仍413/432；这不是有效的最终修复，记录保留。

2. *-read-frame：旧 `f32_read{Old}(p,k)` 隐藏了标签内存的select，复杂内存frame量词
   实例化不稳定。改为 `\at(p[\at(k,Here)],Old)`，并在wrapper显式证明逐点valid/separated。
   内层Here重要：ghost k在Old标签尚未声明，直接\at(p[k],Old)不合法。
   它们都是ACSL断言，不能将\at语法直接当作ghost C函数的调用实参。
   7项的跨NEON/RVV调用frame目标均实质推进；min/max各535/536，只剩NEON高半tail。
   完整原始报告、同上下文false/true gate和具体pending保存在各logs/。

3. vadd-prefix-step：新增有体ghost helper证明“已有前缀+第k项→下一前缀”。
   旧版空helper的本体4/4；改成返回k+1的helper，将整数计数与量词归纳切入小目标。
   前提包括k<SIZE_MAX和数组有效，调用者必须实际证明它们；没有免费合同。
   diag02是返回计数器版，proof-v1.patch保留旧空helper版。
   4处归纳的8个建立/保持目标，5秒预算7/8；30秒8/8，唯一慢项CVC5需12.6秒。
   减少全局transport或把global lemma改成check-only均仍7/8，未将这些诊断当最终proof。

4. vsub-prefix-tail：在返回计数器helper之外，补两个固定NEON高半lane的有效性、
   分离与Before2→当前内存的逐点float关系，从而为最后1-lane及全前缀提供证明。
   新helper有函数体，全部ensures及调用requires进入完整WP。它不是新增TCB helper。

status-before-frontend.json 是旧模型阶段的完整逐目标状态快照。
diagnostics/ 保存定点检查；这些检查不替代最终全库/全wrapper replay。
所有最终通过结论必须读 frontend-campaign 中的完整 summary，且 require complete、
model-control accepted、model inputs unchanged、所有 expected body/lemma coverage 同时成立。
