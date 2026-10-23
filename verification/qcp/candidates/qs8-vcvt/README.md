# qs8-vcvt：待重新验证

旧准入已撤销：QCP 将 `unsigned long size_t` 解析为32位，native LP64为64位，旧证明不能支撑所声明的完整64位长度域。原始证明、修复、反例、证书及本次实际sizeof诊断都保留在 proof/，原证书在 `proof/evidence/invalidated-word-width/`。这属于模型/类型映射问题，不是数值反例。

保留全部公开输入域，修正为明确支持的64位类型并重跑所有受影响目标和完整门禁；不得通过把长度限制为32位来恢复通过。当前不计入 verified。
