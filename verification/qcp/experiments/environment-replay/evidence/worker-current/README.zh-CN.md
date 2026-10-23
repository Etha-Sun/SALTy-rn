# Worker 当前环境与 VADD 接受证据

本目录将本机实际结果、命令及Coq日志作为仓库可读文件保存；不要求读者访问worker的`build/`。原始绝对路径只保留作provenance，不能当作远程可访问链接。没有凭据、完整会话、工具binary、compiled objects或大cache。

| 结果 | 仓库内证据 |
| --- | --- |
| 完整VADD接受 | [acceptance.json](acceptance.json)、[实际结果](vadd87-result.json)、[终态身份审计](vadd87-terminal-audit.json) |
| 实际命令与资源 | [120条命令](vadd87-commands.json)、[root运行日志](vadd87-command.log)、[资源](vadd87-resources.log)；命令文件用显式path aliases及一次公共flags数组无损压缩重复参数 |
| 普通Coq及假设 | [88份实际日志](vadd87-coq-logs.txt)、[逐段offset/SHA索引](vadd87-coq-logs-index.json)：87模块＋FinalCheck，188KB原日志；含334个实际Print Assumptions报告块，不是334个C VC |
| 当前环境控制 | [13项layout/source](environment-controls.json)、[5项pin](source-pin-controls.json)、[实际控制命令](environment-control-commands.json)、[工具与来源SHA](tools-and-sources.json) |
| 原超时与重试 | [首次240秒生成超时](initial-timeout.json)、[成功private adapter的99次调整](private-timeout-adjustments.jsonl) |
| 新公共入口验收 | [setup真实smoke](setup-smoke.json)、[public runner --help](public-runner-help.log)、[已成功99命令映射](public-runner-mapping-check.json) |

实际完整重放固定集成3cf03900：11个C单元新生成、8组策略、87本地模块＋FinalCheck共88个ordinary Coq命令全部成功，758.75秒。无旧project/experiment.vo；外部QCP/Coq/Flocq产物复用。首次240秒生成超时、0模块尚未开始的结果完整保留，不能当作数学反例；成功重试仅显式增加wall预算，原checker、C、spec、Coq和manifest不变。

成功重放使用了保留的private adapter。新增公开[run_package_check.py](../../../../tools/run_package_check.py)把同一实际规则收敛为固定f32-vadd87/11及checker SHA的薄入口：QCP240→900秒、Coq180→900秒，CPP/strategy/coqdep不改。已做真实--help、全部99条实际调用的规则映射、同flags/tool身份核对和未知命令拒绝，**没有再重复87模块重放**；不能把此映射说成公开helper本身又完整运行成功。

可移植复现命令位于[ENVIRONMENT](../../../../docs/ENVIRONMENT.zh-CN.md)，必须使用新的runtime/evidence目录。未来运行由原checker继续生成具体run/status及每命令日志，公共helper另记预算调整。旧已通过结果不会被复制成未来fresh verdict。

`foundation-review-before-VADD87.json`是独立基础48/NaN14/native的历史前置阶段，其`full_original_call_VADD87_replayed=false`保留当时时间含义，由当前acceptance补充，不是当前未做。Print Assumptions保留框架/布局/地址及经典/实数/外延依赖；不宣称全局无公理。

真实Dune安装仍只有布局fixture，source-to-vo外部build history未建立；ISA对应、独立终止性另列。此包不新增kernel数、不新增GEMM VC，也不是PR2可自动merge的声明。逐个文件的复制/派生来源与原SHA在[source-index.json](source-index.json)。
