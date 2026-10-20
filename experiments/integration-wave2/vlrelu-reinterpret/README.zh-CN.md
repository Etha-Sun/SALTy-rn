本目录仅处理 v12 两个 signed reinterpret 实际 body。spec、普通 C、shim、模型、driver、checker 与 v12 一致；sourceguard 均检查去掉 proof 后的 C tokens。

已取得的可移植结果：v05 的原始 loop 上下文没有新增 byte/word/validity cut，六项 memcpy callpre **6/6**，全部 globals **11/11**。原来的两项 valid_dest 各由 `Wp.unfold(P_valid_or_empty)`、`Wp.valid(valid_rw)` 和 CVC5 闭合。v09随后将两项sign preserved也闭合，两实际函数全部36/36且globals12/12；未声明整核通过。

关键选择器修正是 `\wp::proof VmemSignValidity:"@requires";`。只列 caller 函数名没有选中来自 callee memcpy 的 requires；官方手册准确引用及新旧真实 script 对照在 selector-audit/。v05 Gateway 的 missing_diagnostic_properties=["@requires"] 是把分类名当普通属性名字检查的限制；actual-commands 与 main-report 明确只选中了全部六项 requires。本次仍是诊断，不做 admission。

|版本|真实结果|处理|
|---|---|---|
|本目录根候选（v01）|body30/34，globals10/10|普通地址展开未选中两callpre；sign两项未闭|
|v02|globals11/11，body取消|我添加的无条件 raw-word invariant 对 NaN payload 过强；自审取消，不是 kernel 反例|
|v03|取消|修正非NaN cut后，又定位到 requires selector漏选；避免重复求解|
|v04|body40/46，globals11/11|两valid_dest通过；新增byte/word各两preserved与原sign两preserved未闭；实验cuts不移植|
|v05|requires6/6，globals11/11|移除全部实验loop cuts，独立确认两valid_dest闭合；优先移植|
|v06|body34/36，globals12/12|prefix assigns全闭；旧lane case过，只剩当前lane|
|v07|body34/36，globals12/12|四个ground byte等式Clause真过；word Clause/sign Assume待证|
|v08|body34/36，globals12/12|byte/unsigned transport/sourceframe/signed-word Clauses均过；仅最后sign Assume待证|
|v09|**body36/36，globals12/12**|在同一已验证Uint Clause中明确raw32范围，全部Clause/Assume真闭；推荐移植|
|v10|**body36/36，globals12/12**|任意integer非NaN native sign引理CVC5 .667秒；无raw32 range cut的泛化备选|

新增纯 `reinterpret_signed32_sign` 引理已 CVC5 实证约0.41秒，无公理；它只对非NaN值断言 IEEE sign 与 signed32 的关系。Byte32 逐字节 memcpy、read_sint32/uint32、native decoder/sign 的定义在真实 Why3/SMT 上下文均存在；没有建立语义桥缺失或 kernel 反例。sequent01/ 保存原四目标、版本SHA、实际上下文、两真实 solver SMT；v04/sequent01/ 保存新增 cuts 的完整依赖。

v05/review.json 记录冻结SHA、proof SHA与成功raw目标；v05/delta-from-v12.patch 是最小审阅差异。旧版本、错误尝试、取消原因全部保留。不要将 v04 未证的byte/word cuts当作已证前提移植。

根审计员另建 depth16-root，使用相同v08 proof、相同语义与solver限制，仅独立wrapper追加官方 -wp-auto-depth16；由root运行与审核，不把搜索深度5视为逻辑限制。

v09/review.json 包含两项原sign preserved的完整实际分支成功审计、冻结SHA、proof SHA、所有新assigns/global义务与model controls结果；v09/delta-from-v12.patch 只涉及bits.c证明注释，可与root新caller/store增量合并。不要整体覆盖其它文件。v09在原默认搜索深度5配置就通过，未改runner或环境。

root指定采用v09：merged-v01从memory/v08整核base仅替换bits.c，保留全部caller/store策略；普通manifest与v09完全相同，先行独立sourceguard通过5740tokens，随后par64 full≤1200s运行。merge-audit.json保存逐文件身份检查。v10虽也全闭，仅保存泛化备选，不覆盖root选择。
