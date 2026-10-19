r6失败定位：实际SMT的1384行含lsl_1，1387行含lsl_add，故不是CBits未加载。noqed输出保留exact1/double2而没有nested2。Cint.ml:750–780的smp_cmp_with_lsl在项构造阶段消去共同左移，把(u<<2)==((u<<1)<<1)归一为同项等式true。即使关闭Qed，无法保留这个对SMT触发有用的中间项。此为证明表示与触发问题，不是kernel反例，也未声称工具不健全。

r7只增加显式定义predicate qd8_shift_same(integer x,integer y)=x==y，并把六个已有nested断言改为谓词调用。定义内比较参数，因而保留调用参数中的嵌套移位，语义仍是原等式。无axiom、assume、requires或普通C修改，没有扩大断言数量。

none01及none-default01均exit0，分别关闭/启用Qed，实际exact2的上下文均保留nested2谓词事实；nested2自身仍是必须证明的目标。未执行solver，不据此声称任何目标通过。先完整验证qd8_shift8_bound全部body/post/旧新断言，再验证helper+实际vsll。bits_i8等旧依赖仍未闭合。
