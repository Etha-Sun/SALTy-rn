# 本轮池化/SPMM结果

当前没有新增整核通过，也没有新 kernel 反例。所有源 C、shim、公开 spec/wrapper 保持冻结内容。

| Kernel / 候选 | 实际局部结果 | 完整尝试 |
|---|---|---|
| f32-maxpool 初版 | 定点120秒截断，无完整raw | 300秒主预算耗尽，body raw缺失；global5/5不计整核 |
| maxpool step-v3 | 六个新增算术/游标切分点6/6；原cursor不变量尚未重新闭合 | 未执行，优先级调整后暂缓 |
| f32-argmaxpool 初版 | 0/6，六项均Why3 addr/int类型错误 | 300秒主预算耗尽，body raw缺失；global5/5不计整核 |
| argmax typed-v2 | 未运行，保留独立proof候选 | 未执行；根agent另行验证真实工具修复 |
| f32-spmm-minmax 初版 | 3/6：nnz界建立/保持、weight游标建立 | 300秒主预算耗尽，body raw缺失；global6/6不计整核 |
| spmm frame-v2 | 4/6；但发现errno frame遗漏，不能采用 | 实际1200秒主预算耗尽，未成功取消；body raw缺失 |
| spmm frame-v3 | 补齐errno后4/6；剩nnz界保持和weight游标保持 | 1200秒主预算耗尽（总1213.693秒），body raw缺失；global6/6不计整核 |

核心缺口仍包括真实uintptr地址桥、canonical_nan/memcpy位表示、未闭合的kernel循环frame/终止/输出归纳，以及本轮5秒solver预算下未闭合的FMA helper前缀。未证不表示原程序有错误。maxpool的6/6只是新增切分点，不等于原不变量或输出等价通过。

资源：单worker串行运行；旧v4 checker未改，执行适配器仅降worker并保存请求/实际命令。全局lemma由checker独立运行后可能并入raw JSON；STATUS.json显式区分global与body，body缺失时通过数及pending总量均为未知。
