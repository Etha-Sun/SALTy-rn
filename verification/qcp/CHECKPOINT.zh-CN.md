# VADD 当前 checkpoint（2026-10-22）

完整QCP kernel仍为 **0/40**。以下是不同组件的检查范围，存在重复依赖，不能将数字直接相加。原始kernel、公开spec.h、mapper.c和冻结输入均未修改。

| 组件 | 已检查范围 | 入口 |
|---|---|---|
| 初始共享基础 | 48项；NaN bridge另14个C VC | `tools/verify.py`（初始四项重放） |
| 公开接口生成 | 两个短模板，从interface.json生成；与冻结spec/mapper逐字相同 | `tools/generate_review.py --check` |
| 输出模型关系与分块 | 9个纯Coq引理：NaN-aware反身性、共同模型到关系、长度/前缀分块/索引等 | `experiments/vadd-relations/run.py` |
| 实际比较循环 | 12个loop VC+4策略；另重查read2、NaN链14、旧数组策略2；51native控制 | `experiments/vadd-comparator/run.py` |
| NEON块与局部struct | 4通用引理+4策略+6实际调用VC，共14项 | `experiments/vadd-neon/run.py` |
| NEON尾部资源 | 3通用/纯引理+3策略，共6项；整核循环仍未检查 | `experiments/vadd-neon-loop/check.py` |
| RVV完整32lane load | 100个C VC+3策略，VL=0..32，只要求vl个可读cell；396native load/add对照 | `experiments/vadd-rvv/run.py` |

RVV add已生成101个VC，但最后完整编译在180秒预算内未完成；保持pending。store未开始。Native add通过不能代替body证明。

## 下一步，按此继续

1. NEON：`vadd-neon-loop` 最新固定状态在 `checkpoint-tail6.json`。循环不变量已经写出，实际符号执行进入尾部；此前停在 `vst1_lane_f32` 的逻辑参数z实例化。root最后做了单独的 `attempt.py --bind-lane` 尝试，只添加 `where z = vacc_lo.s0`，结果在 `results-bound-lane/`，不覆盖旧失败记录。该尝试仍exit1，不能推出lane store前置条件；诊断中出现lane=0却需要0==1的分支，显式绑定z尚未解决。先定位契约分支/策略匹配，再处理loop初始化/维护、输入prefix重组、输出模型拼接及tail后件。可复用 `VaddSegments.v` 的三个模型引理。
2. RVV：先优化add的frame消去（最后记录在 `partial_solve_wit_16` 附近），实际coqc exit0后再标成功。然后证明仅要求vl个可写cell的store，以及原始RVV loop。不把范围加强到始终32个有效cell。
3. 最终接线：两侧kernel建立共同vadd_values → 已证关系桥 → 已证比较循环 → 公开equivalent返回1。仍需原始mapper到helper形式、向量按值到pointer/out的对应证明/明确边界。ISA→C shim对应另列，不因C proof通过而自动成立。
4. 生成器保持小型模板程序。其余39项交第二服务器，按docs/ROADMAP及协调PR分工；本机先完成VADD。

## 保存与暂停

本轮已按用户额度规则停止新增证明，进入wait_initial；前台会话按1800秒间隔查询实时额度，>=90%后恢复为leader模式，之后低于70%再等待。没有使用context百分比或旧session日志代替实时额度。备用用户定时器仍存在；前台活动期间保留 `.build/quota/wakeup-pending` 防止重复唤醒。

所有checked成果应以各目录status/命令日志/hash为准，生成的自动Admitted模板不进入检查链。循环探索的中间VC、源码含Qed或编译超时均不表示完整kernel正确性。旧CSim修复仍只读参考，不静默替换原始代码。
