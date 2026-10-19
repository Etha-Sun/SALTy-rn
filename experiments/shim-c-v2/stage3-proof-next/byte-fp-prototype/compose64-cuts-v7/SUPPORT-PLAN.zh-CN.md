# 待64组合全过后的独立支持版本方案

此文件是计划，不是已导入模块，也不修改v1/v2share。

1. 保留当前Bytefloat四原语的完全相同native解释和名字；在全新share目录复制已锁的原理论及依赖，不替换旧bytefloat文件。复制checked-subset-v4四body、v3 nativebv原语与prerequisites/interfaces、32/64 cuts组合源码，逐module标注所用后端及实证SHA。v3文件内存在历史未证记录，不可凭文件整体认定通过；原IntRoundtrip64已由后续CVC5精确重验补齐。
2. 新增单独支持模块（例如checked_support.BytefloatChecked），只use四个实证decode/range module以及32/64完整组合module，绝不添加axiom或对NaN的bitwise逆。支持模块与原Bytefloat分开，避免Bytefloat导入组合、组合又导入Bytefloat造成循环。
3. 新WP driver额外import该独立支持模块，原native codec syntax不变。导出审查仅出现有完整body证明链的事实，且非NaN逆的整数范围与非NaN条件完整保留。Z3执行FP控制；CVC5仅作为已锁纯integer前置的独立证据，不把不兼容FP encoder偷偷启用。
4. 先在新路径重验每个body及所有6+6组合VC、native具体负控制，再做真实C memcpy/store/repeated-read/seed-independent正反控制和IEEE/FMA回归、严格smoke。记录每个所用事实到源、body VC、实际prover/config/driver/log/binary的映射。只有新环境控制通过才能独立freeze并建立九项新候选；绝不把旧失败结果改成通过。

目前64组合和native类型负控制仍待root执行，因此支持模块尚不生成或导入公共share。
