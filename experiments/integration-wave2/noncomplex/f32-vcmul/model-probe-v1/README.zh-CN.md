# 当前冻结Typed模型的最小指针诊断

原vcmul相同Typed+raw+float、machdep/share/config/30s/1024MiB，使用共享WP槽；没有修改kernel或模型。raw7/10：纯指针加法与ptr→int→ptr回环通过，uintptr+sizeof(float)常量1步与任意n步均timeout；false control按预期未证明。完整source、命令、raw和SHA保留。

因此初始uintptr义务的困难在最小上下文也复现，不能归结为大kernel上下文。timeout不构成形式化不可能性证明。
