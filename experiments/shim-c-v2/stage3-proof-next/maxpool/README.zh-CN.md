# maxpool：九项内的扩展候选

原版为 `stage3-pool-spmm/f32-maxpool-step-v3`，原 C/spec/shim/model 均未改变。候选只在 proof.patch 增加 ghost/body 合同、断言或 WP 内置策略。没有新增 requires。当前没有整核通过。

- cursor-r1：无前提、空 body 的 size_t 减法 helper 证明条件化的无回绕恒等式；在两个真实 RVV `c -= vl` 后补输出 rebase 断言。selected01 的完整 raw 为15/17，未证的是两个输出游标建立。两项新断言和 helper ensures 均已通过；helper01 完整 body2/2，control01 的 true过/false未过，输入SHA一致。
- cursor-r2：只在 r1 上增加 WP 内置 `Wp.filter` 策略，希望移除与简单初始化关系无关的巨大上下文。selected01 到600秒仍未完成，无最终raw，不选择它作为改善。单独helper2/2和真假控制接受不能代替主选定组的完成。
- cursor-r3：从r1派生，增加有真实body的指针零偏移条件化helper，并在所有行基址ghost初始化后调用，以实例化两个输出游标seed。没有引入前提或公理；selected01完整18/18，helper01完整body4/4，control01真假控制接受。root独立运行，另一agent审查source/contract和实际raw，见root-review/maxpool-peer-review.json。完整清单1239逻辑项、32 CFG项，full01运行中；不算整核通过。
- baseline-v3：原proof逐字节复制，仅重设独立证据路径，供相同预算对照；目前未执行，不能据此声称r1已改进原游标组。

`print-establish01`首次使用不匹配的property过滤器，得到0义务，只是无效诊断，绝不作为证明。`print-cursor02`随后导出了实际四个游标公式：建立结论含`o=shift(output,channels-c)`，上下文含初始`o=output`及`c=channels`，同时保留大量先前NEON/指针表分支和内存关系。预算内未证不表示该初始化关系错误。

本目录独立runner只用于定点/诊断；完整清单、全部callee、全局lemma和严格checker验收仍不可省略。所有失败和未执行候选保留，不覆盖canonical记录。
