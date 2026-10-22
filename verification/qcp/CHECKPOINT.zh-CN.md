# VADD 当前 checkpoint（2026-10-22）

完整QCP kernel仍为 **0/40**。以下是不同组件的检查范围，存在重复依赖，不能将数字直接相加。原始kernel、公开spec.h、mapper.c和冻结输入均未修改。

| 组件 | 已检查范围 | 入口 |
|---|---|---|
| 初始共享基础 | 48项；NaN bridge另14个C VC | `tools/verify.py`（初始四项重放） |
| 公开接口生成 | 两个短模板，从interface.json生成；与冻结spec/mapper逐字相同 | `tools/generate_review.py --check` |
| 输出模型关系与分块 | 9个纯Coq引理：NaN-aware反身性、共同模型到关系、长度/前缀分块/索引等 | `experiments/vadd-relations/run.py` |
| 实际比较循环 | 12个loop VC+4策略；另重查read2、NaN链14、旧数组策略2；51native控制 | `experiments/vadd-comparator/run.py` |
| NEON块与局部struct | 4通用引理+4策略+6实际调用VC，共14项 | `experiments/vadd-neon/run.py` |
| NEON循环与尾部 | 完整101个kernel VC及5个lane0 VC；26证明文件顺序重放通过，源码/预处理绑定与3个变异负对照通过。旧tail6记录保留 | `experiments/vadd-neon-loop/run_full.py` |
| wrapper条件式组合 | 9个caller VC+1策略；只证明给定callee合同下的组合，两个kernel body与adapter仍为依赖 | `experiments/vadd-wrapper/run.py` |
| RVV完整32lane primitives | load100、add101、store75个C VC；数组3、store5策略；396load/add及396store native对照 | `experiments/vadd-rvv/run.py --add --store` |

RVV primitive整套重放已通过并发布于`140851d4`。输入域包含全部fp32；load/store只要求VL个有效cell，VL=0允许数据指针为NULL，但完整向量对象仍由调用者拥有。旧180秒add超时保存在history，不以新结果覆盖历史。

## 下一步，按此继续

1. NEON：完整101个VC已由checked Module实现并编译；26证明文件已顺序重放，QCP重新生成同一goal；实际C、头文件、策略和预处理输入已绑定，宏替换、Inv修改、反斜杠换行3个负对照均被拒绝。检查点为`vadd-neon-loop/checkpoint-full101.json`。literal lane0使用同一实际C body的专门契约，并另证5个VC，没有把该body作为extern假设。保留旧首次load和lane实例化失败记录。
2. RVV：load/add/store已完成。继续原始RVV循环不变量与资源拼接、共同vadd_values模型后件；`RvvResultBridge.v`已证明完整32lane结果的有效前缀等于共同模型，`RvvLoopMemory.v`已提供输入分割/恢复与输出拼接，`RvvLoopResult.v`已证明有效chunk模型拼接。未完成loop不计完整kernel。
3. 最终接线：两侧kernel建立共同vadd_values → 已证关系桥 → 已证比较循环 → 公开equivalent返回1。仍需原始mapper到helper形式、向量按值到pointer/out的对应证明/明确边界。ISA→C shim对应另列，不因C proof通过而自动成立。
4. 生成器保持小型模板程序。其余39项交第二服务器，按docs/ROADMAP及协调PR分工；本机先完成VADD。

## 保存与暂停

本轮按用户额度规则进入wait_initial后，前台实际完成14轮1800秒等待与实时查询，随后确认额度恢复100%，已恢复leader模式；之后低于70%再保存并等待。没有使用context百分比或旧session日志代替实时额度。备用用户定时器仍存在；前台活动期间保留 `.build/quota/wakeup-pending` 防止重复唤醒。

所有checked成果应以各目录status/命令日志/hash为准，生成的自动Admitted模板不进入检查链。循环探索的中间VC、源码含Qed或编译超时均不表示完整kernel正确性。旧CSim修复仍只读参考，不静默替换原始代码。
