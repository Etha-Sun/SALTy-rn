qu8-f32-vcvt 最小续补候选（尚未运行 Frama-C）

基线 integer-array-v3/qu8-f32-vcvt local01 历史为 835/843，8 pending。
以原基线 proof 为底，仅移植 output-instance-qu8-f32-vcvt final03 两项变更：checked Wp.instance 策略，以及原最终比较循环的 output_same 逐点不变量。未把该局部 3/3 历史诊断合并为新整核成功。

已通过原 tools/shim_c_campaign_closure.py prepare 的完整静态 guard：所有基线 manifest 文件 SHA 一致、patch --fuzz=0 应用、raw C token 一致、clang-14 完整预处理 token 12417 个一致、spec 字节不变、合同注入/外部 ghost/axiom 检查通过。见 static-guard.json，含原 frozen SHA、原 proof SHA、新 proof SHA。

静态检查直接验证原基线，再在内存中仅替换 proof_patches 指向本目录候选；没有修改原 manifest，没有生成新环境锁，没有执行模型控制或 Frama-C。报告 frozen_sha256 明确标识旧基线，不代表候选已冻结。

待环境恢复并完成语义控制后，另建独立冻结 case 和全新 run，完整检查所有 VC、body/global coverage、model-control 和模型 SHA。局部 final03 历史只覆盖 ensures_equal 及 output_same established/preserved，不处理其余 7 个 pending。目前完整状态仍为未通过，未出现新 kernel 反例。
