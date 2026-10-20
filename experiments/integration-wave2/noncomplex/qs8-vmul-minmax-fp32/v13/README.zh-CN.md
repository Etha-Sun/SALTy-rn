本轮以冻结 v12-byte-bounds proof093b4d1a...为种子，仅尝试两个byte-store memory RTE。新proof5d5d962b...，公开spec/普通C/shim/model/driver/checker均未变。

实际body18/20；两个原memory目标在新增actual-q-valid loop invariant下通过，但两个新invariant建立失败，因此净关闭0，不推荐合并。新增private signed-char dst前件另外跑caller4目标，360秒行政截止没有main raw，不能记为2/4或4/4，也不认为caller前件已证。

精确模型缺口见 sequent-signed-pre-q-invariant/sequent.log：假设valid_rw(Malloc_0,shift_sint8(p,0),N)，目标valid_rw(Malloc_0,shift_uint8(q,0),N)，N=2/4。原C为void*p到unsigned char*q；冻结Typed模型报“Hide sub-term definition / Cast with incompatible pointers types”，删除了p/q地址对应关系。范围展开可把whole-q有效性推出point-q有效性，却不能重建已隐藏的cast关系。旧v11用unsigned-cast pre时又生成独立w/w_1，同样没有q对应关系。

这不是C/kernel反例，也不是对一切证明编码的正式不可能性结论；是此次实际exported formula明确缺失地址桥。本轮未加axiom/assume、未修改模型、未把未证cut当成功。若继续，需要单独审核/资格化字符signed/unsigned pointer地址及byte-alias模型支持，或另行批准的语义保持shim修改。

详细raw、sourceguard、模型控制、目标身份和资源边界见handoff.json。仅诊断，无整核新计数；所有本轮进程均已结束。
