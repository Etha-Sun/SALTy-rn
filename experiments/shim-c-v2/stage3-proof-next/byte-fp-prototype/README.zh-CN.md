# Native byte/IEEE codec：仅供审查的独立源码原型

**未编译、未安装、未运行控制、未资格认证，不能用于 kernel 验收。** 未修改任何当前 source/install/share/lock。root 审查后才可在全新版本编译；当前禁用旧 Bytes+float 的保护必须保持。

`MemBytes-native-codec.patch` 基于已恢复 unary 修复版源码，仅替换 MemBytes 的 codec 和 float store 调用。彻底删除旧 CODEC_FLOAT 及三条 Admit；没有新增公理。binary32/64 的 decode/encode 经 `bytefloat.mlw` 中四个原语声明连接到两个 solver driver 的**原生 SMT 解释**，原语没有不透明合同或逆关系假设。未使用 Why3 BV 公理式桥：整数到 BV 用 SMT int2bv；反向 Z3 用 bv2int，CVC5 用 bv2nat，与已安装官方 driver 的方言一致。是否能经实际 Why3 正确导出仍待检查。

每个 `store_float` 创建一个 fresh int seed，作为 encode 显式参数。fresh seed 不位于缓存定义或全局，不在 load 分配。seed 转32/64位，无任何范围假设。NaN 位表示范围包含两个符号、所有非零 fraction（quiet/signaling）；非 NaN 使用精确 fp.to_ieee_bv。原始 memcpy 仍走既有字节路径，不重编码。32/64之外 Ctypes.c_float 当前只有两个构造；本补丁额外检查 `tau_of_float = ftau`，对 Real 模型调用立即 abort；未提供 long-double 或其他浮点模型支持，不得用降精度替代。

fresh seed→Set→全称 VC closure 的源码证据及风险见 `../spmm/model-review01/REVIEW.zh-CN.md`。实际控制必须检查：两次store不同seed、同一次store后重复load相同字节、byte memcpy保留NaN原bits。不得把此设计推论当作已执行WP证据。

必须继承的整数 memcpy 修复与已检查helper来自 `model-integer-byte-v2/why3/frama_c_wp/membytes_{le,be}.mlw`，Cint来自model-plus。`SOURCE-PROVENANCE.json` 固定这些源的SHA。这里不重复复制数千行或改旧模型。它们的历史控制有尚未闭合的offset/alias目标，继承源码不代表新的整体模型自动通过；新版本必须重跑。

`prepare.py` 仅生成本目录patch/theory/drivers/provenance，不写安装目录，不执行solver。Driver当前import已锁的handoff-model-front原生IEEE driver（路径在provenance中）；root可在独立构建时准备新的路径固定版本，保留本源码初版。需要将新theory置入新wp-share的why3/frama_c_wp，配置只允许运行已提供native解释的Z3/CVC5；未支持Coq/Alt-Ergo等输出，不能借未解释原语声称相同语义。所有实际SMT都应审核不存在旧decode_encode/encode_decode/encode_bounds公理，且不存在未解释codec函数残留。

`controls.c` 包含实际canonical_nan body、32/64数值/零/NaN字节控制、同次存储重复观察、局部字节frame、真实false控制，以及两条“抽象必须保留不确定性”的负控制（后者不宣称在每台物理编译器上命题为假）。还须补完整输入类别、BE配置、越界/错误分离负控制、IEEE/FMA正反回归及严格smoke。原型未执行这些；只有新版本全部资格控制与独立冻结后才可另建九项候选，旧结果和旧锁绝不替换。

WP注册由新增 `bytefloat.driver` 完成，声明库 `bytefloat: cfloat` 并导入 `frama_c_wp.bytefloat.Bytefloat`。新命令须以 `-wp-driver` 加载此文件，同时用新的Why3 solver driver；仅复制MLW与修改why3.conf不够。纯解析/导出检查见driver-export01，不能替代新binary中的WP端到端控制。
