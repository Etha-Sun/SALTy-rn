> 当前结论（2026-11-04 UTC）：NEON、RVV、AVX 原始 kernel/caller 的完整执行规格和三端完整观察等价均已证完，限于明确的 C-shim/native 与前端边界。共同定理绑定三个真实原始 caller，包含合法配对初态的实际执行见证、所有完成调用输出数值相等或双方 NaN、无无限调用；完整递归 coqchk=0/592.103秒，结束身份一致，证书 `proof/evidence/three-execution-equivalence-latest.json`。NEON/AVX 已证有限和无限调用适配明确接入原始入口及三端结论，原始 C/helper 未改。HVX 整核及四端等价仍未完成；当前物理 C32 v2 的具体 VMEM 真实入口绑定、原始 kernel/caller 有限/无限调用适配、真实 abs/storeu/loadu/load_tail 输出及进展已新鲜完整递归检查，0/583.720秒，VM开启、无跳过、结束身份一致，证书 `proof/evidence/hvx-standard-helpers-latest.json`。物理指针转换和两项具体 VMEM dispatch 是明示模型边界，不声称机器码/硬件/ABI/编译器精化；原始 HVX C/helper/shim/native 原型未改。仍需真实 polyfill/tail/循环的输出及进展、整核和四端组合，继续入口 `proof/hvx/POLYFILL-CONTINUE.zh-CN.md`。保留全部 binary32 输入/中间位；仅最终观察忽略 NaN payload 和零符号。配额限制已取消，不启动 agent。以下旧完成性/配额描述是历史记录。

> HVX 后续检查：物理128字节取边界与标准 external-call 内存注入的直接解释有已证实际内存反例。当前没有假设该不兼容 profile，而采用已定义的具体 VMEM 关系，并已重检完整调用适配/helper闭包。详细模型边界、历史复现和继续义务见候选 `proof/hvx/NATIVE-ADDRESS-AUDIT.zh-CN.md`。

> **当前更正（2026-11-03 客户端日期）：NEON、RVV、AVX 已通过 VC/源码检查，但从 VC 到实际执行输出规格的语义连接未完成，三端和四端程序等价均未完成。旧“独立整核完成”分类已撤回。** 当前优先补齐这三端的执行语义连接，然后组合三端等价，不等待HVX。原始 kernel/helper 和历史证明记录保留；NEON/AVX 调用适配的执行等价结论仍有效。配额最新实际剩余21%，低于27%停止线，不启动新证明批次。继续入口：`build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/proof/semantic-bridge/RESUME.zh-CN.md`；当前分类：`proof/evidence/semantic-status-correction-20261104.json`。以下旧完成性措辞均为历史记录，不代表当前结论。

> **2026-11-03 22:50Z 配额27%停止检查点：NEON、RVV、AVX 的声明 C-shim/native-spec 边界内独立整核门禁已完成；HVX 整核和四端等价性仍未完成。** 当前三端源码、工具与递归依赖身份重新核对吻合，没有重跑 RVV。原始 kernel/helper 保留。HVX 已检查复制入口、内层尾部调用、原 kernel 四处调用和 caller 的完整执行双向等价，但其输出正确性尚缺真实 polyfill 的空间/返回接口、storeu 输出未初始化数组视图、native profile 与最终新鲜整核闭包。新的 storeu proof annotation 因剩余27%而未启动生成/检查。已停止新证明批次，无本任务证明进程运行。继续入口：`build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/proof/hvx/CONTINUE-QUOTA27.zh-CN.md`；当前身份/配额与未完成项：同候选 `proof/evidence/checkpoint-20261103-quota27.json`。不启动其他 agent，停止线仍27%、保留25%。以下保留历史记录。

> **2026-11-03 16:53Z 当前结论：NEON、RVV、AVX 三端独立整核完整门禁已通过；HVX 与四端等价尚未完成。** NEON/AVX 使用已证明并接入真实原始入口的复制调用适配，原 kernel/helper/spec.c 保留。AVX最终证书绑定真实只读 mask table 世界及显式 native frame profile；递归 coqchk=0，结束身份复查通过。详见候选 `proof/AVX-RESULT.zh-CN.md` 与 `proof/evidence/avx-complete-latest.json`（`.build/avx-complete-8hzmlfd4/`）。RVV/NEON未重跑，三端冻结输入和依赖身份当前再次核对无变化。HVX正在独立调查 C32 物理地址转换与真实 polyfill body，草稿未采用，见 `proof/hvx/WORKING.zh-CN.md`。配额停止线27%、保留25%，不启动 agent。此段覆盖下文历史状态。

> **2026-11-03 当前结论：NEON、RVV 独立整核门禁已通过；四端等价未完成。** NEON 采用已证明的复制入口适配，原 kernel/helper/spec.c 未改；原始/适配 helper、整核与真实 caller 的语义一致性已接入完整门禁，递归 coqchk 通过。见 `build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/proof/NEON-RESULT.zh-CN.md` 与 `build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/proof/evidence/neon-complete-latest.json`（`.build/neon-complete-55ymb7kl/`）。RVV 未重跑，当前绑定输入 SHA 已复核相同。AVX 正在处理原始 mask table/helper，HVX 与四端组合仍待证。配额操作停止线27%、保留25%；不启动其他 agent。此段覆盖下文历史状态。

> **2026-11-03最新接续：** 四端仍未完成；RVV独立门禁未重跑，当前输入与工具SHA复查相同。原NEON当前重新生成仍有普通按值store调用后旧输出资源残留；新增参数形态、内置record谓词及soundness导出尝试均未提供修复或已证明适配。原kernel/helper/spec未改。用户已授权带完整语义证明的验证适配；操作停止线更正为**27%**、保留25%，下文55%历史政策失效。详见 `build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/proof/CONTINUE-20261103.zh-CN.md`；本轮仍无新增完整端或四端等价结论。

# f32-vabs 四端验证状态

2026-11-02 20:50Z：四端整体仍未完整证完。**RVV独立端已完整通过当前C-shim模块化部分正确性门禁**；NEON、AVX、HVX尚未完成，跨端共同caller与六对程序等价性未完成。NEON普通按值struct写堆的工具阻塞仍需支持/修复；未改原kernel或采用新lowering。最新实时额度剩余73%。每个证明批次前且持续工作最多5分钟查询额度；剩余<=55%或查询失败停止新批次。

- 工作树：`/zp_vegeta/scratch_sb/ycsun/verus/build/four-isa-vabs`。
- 分支：`codex/four-isa-vabs-20261102`，基线 `821969733d7953a212c51839194add416fd5799b`。
- 候选：`verification/qcp/candidates/f32-vabs-four-isa/`，未移入 verified；旧 40 项未改，未 push。
- XNNPACK：固定 `23dd5070fa002ef0b124817798ae090fa29f9653`，四份原始完整 C 文件与上游 SIMD/helper 头身份已保留。
- 数值域：全部 binary32；输出观察为数值相等或双方 NaN，不提前合并输入或中间值。四端整体来源审核和最终gate仍未完成；RVV独立结果限于公开native spec边界，用户最终人工intrinsic审核pending。

| 部分 | 实际状态 |
|---|---|
| 环境 | 固定 QCP/Coq 身份与库导入通过；小模块已新编译 |
| NEON abs / loadu | 真实普通 helper 的 3 / 4 个 VC 曾在独立目录检查通过；最终仍须绑定最新完整输入重新检查 |
| NEON storeu | 早期合同 2 VC 通过；扩展为带剩余输出空间的合同后尚须重新生成和检查 |
| NEON load_tail | 真实 helper 的 12 VC 曾新编译通过；保留完整 4 lane 尾读与 3 float padding |
| NEON store_tail | 原始 body 未改；完整28 VC已新编译通过（coq-components-fial2wvc） |
| NEON 主函数 | 原始 u4 主循环和尾部保留 token，49 VC 已生成；44项安全/调用义务模块已新编译通过（coq-components-1zxgdwk9）；另5项循环/返回内存义务与调用堆域审核待完成 |
| RVV | **完整独立门禁通过**：原始C、真实assert/caller、source-reviewed native账本、当前源码与加载依赖身份、fresh项目证明、递归coqchk均通过；证据`.build/rvv-complete-bds52j5f/`。固定VLEN128/e32m1与合法执行状态，仍非ISA/ABI/编译器精化或实际总终止性证明 |
| AVX / HVX | 固定源码/helper 清单；尚未启动整核证明。HVX 的 Q6_V_vstu_variable 是普通 C helper，必须验证 body |

候选中 `proof/status.json` 是机器可读检查点；`proof/evidence/checkpoint-files.json`是历史草稿快照，最新身份索引为`proof/evidence/checkpoint-rvv-complete-files.json`。所有失败日志与此前成功日志保留在独立 `.build/` 目录，没有用新结果覆盖旧失败。其余三端的草稿/组件不能构成整核通过证据；RVV正式独立结果见`proof/RVV-RESULT.zh-CN.md`及`proof/evidence/rvv-complete-latest.json`。

## 继续入口

额度查询通过后，读候选 `RESUME.zh-CN.md`。下一步须解决普通按值struct写堆的工具阻塞；RVV原始do-while注释位置已解决，不能重复当作待修入口。不得通过改写循环或缩小输入域绕过失败。剩余三端的完整helper/来源/caller及跨端组合门禁仍待完成。RVV维持既定部分正确性边界；外部库被逐对象固定源/vo身份并递归检查，没有声称重建外部环境。

## 已确认的任务级阻塞与接续

NEON主函数普通按值store helper调用后，同区间新FloatArray.full与旧undef_full重叠。接续agent已用无浮点/无数组/无intrinsic/无循环的真实普通C最小例复现：按值struct helper的body为`*p=v.a;`，三种合同写法均残留旧p资源，指针及标量对照不残留。禁止利用矛盾做空证明。固定发行包tutorial还明确称直接struct参数不支持；另一个官方上游二进制仅作独立诊断也重现，未用于kernel证据或替换固定工具。

详见候选`proof/STRUCT-CALL-HEAP-AUDIT.zh-CN.md`、`proof/reproduce_struct_call_heap.py`与`RESUME.zh-CN.md`最新增量。原始NEON/AVX/HVX普通按值store helper结构不能通过任意改名native或改kernel规避。需要获得工具支持/修复；若确无该途径，需用户决定是否另行授权带精化证据的lowering。本次没有改架构。

RVV独立路径已完整闭环，当前无运行作业。其余三端及四端整体未完成。原始实现和原公开spec完整前缀均保持；spec仅新增同域RVV验证caller声明。没有正式verified登记、push或修改旧40项。需要决定时的具体工具修复/精化适配选项在候选`proof/STRUCT-CALL-OPTIONS.zh-CN.md`，新lowering尚未实施。所有旧失败、主动停止和成功日志均保留。
