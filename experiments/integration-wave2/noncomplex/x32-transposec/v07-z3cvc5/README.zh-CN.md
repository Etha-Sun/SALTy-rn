# x32-transposec v07-z3cvc5

新v07-z3cvc5仅排除故障Alt-Ergo，fresh control正成立/false未证且无Why3异常；proof与v04同SHA。mapping focus0/1，未full/未完成等价性；v01..v06全部旧WP正结果仍不合资格，不继承。

普通C、公开spec、Typed+raw模型、driver、checker及proof字节全部不变。实际命令仅z3,cvc5，par16，单目标10秒/1024MiB。新source guard通过，prepared annotated各文件SHA与v04相同。

新控制raw的true ensures成立、false ensures未证，日志没有导出/解析错误。这只是控制筛查，不是模型一致性定理。见evidence.json及attempts/0001的raw/log。核心mapping全部仍未证；本目录不能作为完整kernel通过结果。旧v04等所有负记录保留。
