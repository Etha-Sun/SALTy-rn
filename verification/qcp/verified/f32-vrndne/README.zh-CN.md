# f32-vrndne

两侧原始 C 实现、全部实际 callee 和公开 equivalent caller 已通过统一 fresh 门禁。原件与 impl 逐字一致，无实现修复；来源和 SHA 见 [originals.json](proof/originals.json)。

本轮从 live impl/spec/shim 重新生成并核对28个实际 C 翻译单元、71个实际函数及全部调用/契约闭包，闭合1560个单元 VC 字段和10组策略的30个字段。231个本地依赖与证明源码重新编译，再运行 FinalCaseCheck，共232次普通 Coq 编译、1590条 fully qualified typed-interface 假设报告；没有复用组件 .vo。字段按翻译单元接口计数，包含重复 helper 校验，不代表互不重复的语义义务或额外 kernel。完整记录见 [full-status.json](proof/full-status.json)。

公开域为所有 binary32（含 NaN、Inf、±0、subnormal）、RNE、任意合法正长度，input 额外3个 float padding，分离 input/output/frame。未使用的 params 可为 NULL。保留原 magic add/sub 顺序；中间 reinterpret/select 使用真实位语义。RVV 固定 VLEN128、SEW32、LMUL8、VLMAX32，选择 min(AVL,32)；未观察的 inactive lane 采用确定代表值0。最终观察为数值相等或两者均 NaN；另外保留纯 Coq 逐元素位相等定理。

独立 nearbyintf oracle 的有限 native 回归在 ASan/UBSan 两个模式分别通过6300例、每侧378600个 lane，并检查输入保持、输出边界及 NULL params，见 [native-status.json](proof/native-status.json)。该历史 native 记录具有逐进程300秒时限，没有可归档确认的外层16GiB限额。新增发布前回归 .build/publication-native-ftoxd3fr/status.json 对同一52项递归输入分别重编并通过上述两模式正向测试；UBSan 使用16GiB地址空间硬限，ASan 使用实际16GiB/swap0 cgroup。两侧同时产生相同错误结果的负控在两模式中均被独立 nearbyintf oracle 明确拒绝，且没有 sanitizer 错误。这是单独的新证据，没有改写旧记录；之前含LSan提前返回问题的失败负控也保留。有限测试不代替全域证明。

首轮统一生成曾因 TU 构造漏入 program_model.h 而失败；其旧 H、构造器、模板、日志及实际取消记录保存在 [失败归档](proof/evidence/failed-full-kvmy3j7z/provenance.json)。修复仅补齐组件本已使用的逻辑头上下文，并增加全部28个 CPP 身份预检；本次完整 fresh 重跑通过，见 [失败修复关联记录](proof/evidence/failed-full-resolution.json)。旧1800秒超时及组件命名失败也保留，不计作成功重放。

证明范围是公开内存契约及指定模型/配置下 C-shim 的模块化部分正确性。Arm/RVV 分别按来源建模 NaN 行为，来源及环境见 [semantics.json](proof/semantics.json)。ISA 形式对应、physical struct ABI 精化、任意 VLEN、独立终止性定理仍未建立；到抽象 round-to-nearest-even 数学规格的形式精化也未建立。继承假设按最终实际 Print 报告列入 assumption-audit.json；没有新增项目公理不表示底层库没有假设。

在已配置环境中，使用本案 proof/check_full.py，指定 --config 与已验收 VADD 的 --dependency-dir，运行 --jobs 16 --timeout 7200。完整归档支持历史 .build 不存在时按不可变证据核对新生成目标；迁移 CPP/源码身份审计不算第二次证明。
