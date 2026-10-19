实际Why3 transformation插件已编译成功，尚未运行Frama-C导出。只从task中删除精确四个optional已证codec Paxiom，所有其它declaration/goal保持原对象，不增加任何事实。删除前提使证明义务更强；不会伪造Valid。本次为remove分支，无ground instance插入，并非已实施inst_rem。

commands.json及run-export.py提供positive_zero32 ensures原/新导出。独立config仍名为Z3以兼容WP注册，但命令明确为/bin/true，仅驱动打印SMT，完全不调用solver；所得诊断raw的Failure/Unknown不得当作验证结果。两组均加载同一插件，只有新driver启用变换。旧v1/v2 binary/share/driver/config不变。root可运行 python3 .../run-export.py original 和 removed；之后审goal及内存前提不变，只有四个支持forall消失，再用固定solver单独运行。

该实验针对真正FP目标；copyword实际不含这些forall，已保留失败准备并更正此前错误归因。v2 pure-byte退化对应去掉CVC5，不是这些forall造成的已知结果。
