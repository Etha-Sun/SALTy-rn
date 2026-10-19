# 独立依赖证据复验计划

当前仅准备，未调用 Why3/solver。运行入口：

```sh
python3 experiments/shim-c-v2/stage3-proof-next/root-review/byte-dependency-replay01/run.py root01
```

也可加 `--only codec-round-range` 单组启动；每次必须全新 run 名。

12 条缺运行时 sourceSHA 的历史记录展开为 14 个串行组、预期共 30 个 solver Valid 叶子。旧 prerequisites batch 的 Z3 int64 超时完整保留；三个已通过模块分别增加 -T 选择，int64 沿用原独立 CVC5 成功命令。不重新采用 exported-unproved 记录。read64 虽不是已知导入依赖，仍按审计中该记录一并复验。

每组原命令、实际命令、源路径与预期目标在 PLAN.json。唯一执行配置差别是新目录的记录 wrapper：solver 的原命令参数、原 driver 与实际输入字节不变，捕获 stdout/stderr 后按原字节/退出码转发。不改任何旧模型、配置或日志。

输入清单包含 287 个共同文件加各组独立配置：所有 -L 与源码目录中的理论/驱动/相关代码、Why3 标准库和驱动、递归 driver imports、配置中的 adapter/executable、底层 Z3/CVC5、Python 与 Why3。每组检查前后 SHA，wrapper 按调用唯一目录保留真实 SMT、请求 argv、输入/输出 SHA 和 solver 退出码；不会用 export 文件代替实际输入。SEAL.json 锁定计划、执行脚本及所有输入清单/新配置。

每个 solver 仍为历史 30 秒/2048 MB，组墙钟上限 240 秒，一次一个 Why3 进程。超时 kill 进程组，保留已写证据。验收要求 Why3 exit0、预期命名目标/Valid叶子数量精确相同、无非Valid、输入不变、所有真实 prover 记录完整。任何缺失或不符均不会接受。新复验成功只补历史 body 依赖证据链，不自动宣称 Byte 模型或 kernel 资格完成。

准备阶段只执行 Python AST 与清单 SHA 校验，未运行 solver。
