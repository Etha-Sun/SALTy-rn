# 第三阶段：池化与稀疏 kernel 的独立证明续作

本目录保留 f32-maxpool、f32-argmaxpool、f32-spmm-minmax 的新 proof 候选和实际执行证据。未修改旧实现、公共 spec/wrapper、shim、checker 或模型锁。原 C/spec 路径和 SHA 继承自 v4-campaign；环境独立迁移至已验收的 handoff-model-plus。

## 新增证明材料

- maxpool：RVV 两处 channel 循环的输入、输出游标与剩余 channel 不变量；9 元素组计数。frame-v2 独立补像素/组循环写集合。step-v3 再补 VL、剩余长度与 store 后游标的命名断言，全部是待证明的 body 义务。
- argmaxpool：RVV channel 输入/输出/index 游标，9 元素组索引与剩余元素关系。未声称获胜值/index 归纳或 tie 关系已闭合。
- spmm：RVV strip/column/nnz 计数，以及 prefix_nnz 与 weight/dmap 游标关系。未把 FMA 换成乘加；浮点累加关系和 uintptr 地址桥仍需检查。

每个候选有单独 frozen.json、冻结 SHA 和唯一 proof.patch。frame-v2 只是保留的中间版本，不等于运行通过；实际运行看 logs 和最终 STATUS.json。

## 执行和证据边界

run.py 的诊断模式复用原 checker.prepare，检查原 C raw/预处理 token、spec 字节及证明语法守卫，再选择新增命名属性。完整模式执行原 v4 checker，保留其同模型正反控制、全局 lemma 与完整调用闭包，但仅在执行适配器中把 wp-par 从 2 降为 1；每个真实命令及请求命令写到 execution.jsonl。这是独立完整尝试，不能冒充未修改执行条件的正式验收。

诊断为单 worker、每目标5秒、总120秒；首次完整尝试总300秒；step-v3 独立冻结1200秒。所有运行顺序执行，本目录不同时运行多个 solver 任务。新适配器对超时 WP 进程组清理；首个 maxpool 诊断在加入该清理前运行，保留其原日志。

完整 raw 缺失时通过数和未证总数必须未知；global 单独全过不算 kernel 通过。局部不变量成立不能替代公开输出等价。只有 complete=true、raw 全过、pending 空及全部守卫/覆盖/模型控制通过后才能验收。

父 agent 的 stage3-audit 使用原冻结 unit.c 与公共 wrapper 做原生 ASan/UBSan 探测；本目录不重复原生测试。无反例证据时不修改 target，也不把 timeout 说成 kernel 错误。

## 后续诊断与调度记录

maxpool step-v3 的六个新增切分点（两处 VL 界、下一步长度界、store 后输出游标）6/6；没有重跑原 cursor 不变量并取得闭合结论，不能将此记录称为 kernel 前缀证明。其1200秒完整尝试按主 agent 决定暂缓，full-deferred.json 明确记录未执行。

SPMM frame-v2 定点4/6，但自查发现三个 loop assigns 未包括真实 FMA shim 的 errno 写入。原候选保持冻结，不能采用其局部结果作整核证据。停止等待调度进程时，子完整任务已启动；后续取消子任务的命令在解析 ps 表头时异常，未发送任何信号，因此 v2 实际执行约1214秒并超时，**不是取消运行**。cancellation-not-executed.json 保留此事实。

SPMM frame-v3 独立补齐全部三个 errno frame，定点4/6：delta 游标建立/保持、nnz bounds 建立、weight 游标建立通过；nnz bounds 保持和weight 游标保持仍超时。v3 使用新完整run进行最终本轮尝试，最终结果见 STATUS.json。

argmax 首轮 Raw 定点6项均为 Why3 addr/int 类型错误。根 agent 后续在独立工具版本定位并修复 !pointer/!float 翻译问题；此处活跃锁不变。argmax-typed-v2 是未运行的候选，包含四个实际 u32 helper 的已有 body 证明、一个新 masked merge body 证明以及 RVV frame；为避免与根 agent 的新工具复验重复，其完整尝试暂缓。它不能作为本轮 helper 通过的证据。

所有定点或中间候选结论仅针对其实际输入和配置；未执行版本、工具错误、超时缺 body raw、实际已通过局部义务分别报告。根 agent 原生探测无新反例不等于形式化整核通过。

最终v3完整尝试：exit124，总1213.693秒，complete=false，body raw缺失，仅独立global6/6；source_guard、unchanged、model_inputs_unchanged、model_control.accepted均为true。仍未通过整核验收。
