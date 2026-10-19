独立恢复的 solver 资产

Z3 4.12.5 与 CVC5 1.2.1 从各自官方 GitHub release 下载，来源、归档和可执行文件 SHA、实际版本、ldd 依赖及 solver smoke 见 provenance.json。可执行入口为 .build/bin/z3 和 .build/bin/cvc5。下载归档、解包二进制及符号链接均仅留 .build，不提交 Git。

这是新路径的新环境资产，不替换旧锁，不表示历史 proof 在此环境重验通过。BV sat/unsat 和 IEEE NaN 小检查只检查 solver 可执行性及基本行为，不能替代 model-front 的正反控制或整核复验。Why3 配置仍须使用这些入口的绝对路径重新创建独立版本。
