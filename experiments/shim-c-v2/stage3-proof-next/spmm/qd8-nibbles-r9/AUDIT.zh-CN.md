r8实际24/25，唯一pending为真实vand的prefix保持，策略两个子目标中更新lane分支失败，另一路已通过。实际body值含to_sint8(land(255,land(...)))；旧cast桥的类型转换归一化使其不出现在Have中，因此虽然helper4/4，也未提供所需SMT实例。

r9保持原C/model/spec，移动已有有定义等式谓词到helper前，将已有helper post和loop桥改为显式(int8_t)(255 & (u&v))同(int8_t)(u&v)的谓词关系。没有增加requires、无body合同、axiom或断言数量。none01默认Qed导出27项，实际上下文已保留正确mask形状；尚未运行solver。

必须先检查修改后的helper完整body，再检查helper+真实vand全部body。bits_i8三项旧债务依然保留，不代表整核通过。
