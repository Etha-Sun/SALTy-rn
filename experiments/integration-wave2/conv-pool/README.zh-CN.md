# Conv / pool 第二轮整合

本组覆盖全部五项：f32-conv-hwc2chw、f32-dwconv-minmax、f32-dwconv2d-chw、f32-maxpool、f32-argmaxpool。没有只选方便的 kernel。未调用 DeepSeek API；使用其已落盘 proof 和固定 ROOT10 提交 101fc27d738d6bfd934730ef5aec055dca716542。

普通 C、公共 spec、shim、driver、模型和原有 solver 单目标时限/内存保持冻结。Conv 保留本地 right-edge 修复，Argmax 使用 integration-review-v1 已独立导入的安全 tail 修复 target，旧原版均未覆盖。每个候选 case 只有一个 proof.patch，临时 annotated/build/attempt 中的副本属于复验记录。

三个原 v3 case 另有 closure-v4 独立 profile：只固定已有 v4 checker 和 closure 工具，增加全局引理与调用闭包验收；没有更换 C/spec/model。旧 v3 profile 和所有失败均保留。

| Kernel | 本轮实际移植 / 新补 | 已有局部证据 | 仍欠 |
|---|---|---|---|
| Conv HWC→CHW | DS 整数/游标框架；纠正 4 字节 validity 被误写成 4 个 int32 元素；补两输入重复 load 精确 post | 独立 globals 18/18；原首轮实际生成 3281 VC | 900 秒整核预算无最终 raw；真实调用闭包的索引 memcpy/frame、FMA/aggregate 与主循环未完成。pair-load 是额外共享 helper 诊断，当前核不可达，不列为整核欠债。v4 globals 复验一项有超时波动，不能继承早先绿色 |
| DWCONV | ROOT10 frame45 + DS 五条 FMA/add/min/max 同余；修复 do/while 出口 0；真实 RVV 入口 label 取代错误的 inline-wrapper Pre | globals 14/14；真实入口 frame 诊断 7/13 | 6 项：入口 validity established、inner origin preserved、当前 weight 入口有效性、weight/vacc 入口 block length、copy-frame；distinct-base 依赖链未闭合 |
| DWCONV2D CHW | ROOT10 row/height/window 框架，保留快照；补 pair-load 两 vector 常量字段 post | globals 6/6；pair-load 18/20 | 滚动行、高度/宽度 frame、真实 masked load / reinterpret / FMA 与主输出。额外 pair-load 的两条 ensures 在当前核不可达，不列为整核欠债。首轮 900 秒无最终 main raw |
| MAXPOOL | ROOT10 step-v3 cursor/store + DS 六条 pool/clamp 纯同余 | globals 11/11 | 整核 1200 秒管理员终止，无最终 raw；uintptr 地址对应、主循环/tree/store frame |
| ARGMAXPOOL | 独立安全 tail target proof 重绑本机 native-v6；四整数 RVV helper 真正 VL/validity/post；load/store validity、source/prefix 不变量 | move 12/12、merge 15/15；四 helper 合计 55/60 + globals 5/5 | load/store 的 5 个内存/post/prefix/assigns 目标；原首轮 750 VC 调度后 1200 秒终止，另见实际 Why3 addr/int 类型错误；新 proof 整核也在 1200 秒预算结束，无最终 main raw |

所有数字按各自 proof/hash/model/scope 记录，分母不同不能相减宣称净进步。每 kernel 的 review.json 列出实际 raw、精确 pending、sourceguard、冻结 SHA、profile 和工具异常。`collect.py` 只汇总已保存证据，不启动求解、不改变结果、不做 admission。

本轮新增完整收录仍为 0；本组所有整核任务均已结束；逐项 review.json / attempt 原始报告保留管理员终止、outer timeout、工具异常与实际局部 raw。不能把 globals 全绿、缺主报告或依赖未证 cuts 的 frame 目标当成完整 kernel 证明。
