# QCP 环境与 package 配置

环境工具固定QCP2.1.4源码commit `08cc7a0f1373a1db3800111a0205a340b6d6f99c`、symexec/StrategyCheck的SHA和Coq8.20.1。配置来自本机环境，不依赖leader绝对路径：

```sh
export QCP_HOME=/path/to/QualifiedCProgramming
export QCP_COQC=/path/to/coq-8.20.1/bin/coqc
export QCP_LAYOUT=in-place
python3 verification/qcp/tools/environment.py --check
python3 verification/qcp/tools/setup_package_environment.py --case f32-vadd \
  --out .build/qcp-environment/f32-vadd --check
```

第二个入口只生成runtime config和工具forwarding，不运行kernel checker。当前仅接受已核对的f32-vadd 87模块/11单元形状；未知case/布局/工具命令明确拒绝。`qcp`链接到已验证的真实symexec，因而原checker寻找同目录StrategyCheck仍有效；`qcp-env`只转发coqc/coqdep。config仅登记外部库映射；项目本地映射由原checker在新run建立。

```sh
PATH="$PWD/.build/qcp-environment/f32-vadd/bin:$PATH" \
  python3 verification/qcp/tools/run_package_check.py --case f32-vadd \
  --config .build/qcp-environment/f32-vadd/coq-flags.json --jobs 16 \
  --wall-seconds 900 --evidence-dir .build/qcp-environment/f32-vadd-check900
```

运行前另设每compiler与整组资源上限。16并行、每compiler16GiB对应整组最多256GiB；不能把整组放入单个16GiB限制。配置入口不改变checker默认预算；上述公开run_package_check薄入口明确将QCP240/Coq180秒wall提高至900秒，并仅支持固定checker SHA与f32-vadd87/11形状，未知命令/shape报错。本机独立接受检查曾在NEON生成240秒超时，随后用相同预算规则的private adapter完成；原checker/manifest/C/Coq源不变。默认预算超时不是数学反例，扩大预算必须另保留实际命令和日志，不能跳过模块。

`in-place`只选择`Rocq/...`；`dune`只选择`_build/default/Rocq/...`。每namespace唯一物理路径，缺所选依赖时报错，不从另一布局补齐。`--layout`可显式覆盖QCP_LAYOUT；`--check`实际编译import probe。工具/路径/导入失败归为environment failure，不能解释为proof failure。

Git源码分别比较pinned HEAD对index、对worktree，拒绝staged修改、index/worktree相互抵消以及untracked/ignored可导入源。archive和Git使用同一源码锁：Rocq下2992个source/build输入（含2940个.v）及两个根build输入，按完整相对名和内容SHA聚合；新增、缺失、修改均拒绝。锁由原archive独立重建Git tree并与官方commit/root-tree记录核实，再由`pin_qcp_source.py`重生；不是从现有编译树反推pin。

编译产物身份单独登记。未知module、与pin不一致的源视图、逃出所选布局的产物和递归目录软链接均拒绝。**产物SHA与import probe不能证明其由所锁源码构建**；既有外部库source-to-vo build history仍未知，也不是递归coqchk。本机记录429个existing artifacts，不代表完整QCP库fresh构建。

当前13项layout/source控制、5项pin来源控制与真实in-place检查均已通过。Dune仅验证过复制/链接既有产物的布局fixture，**尚未在本机完成真实Dune构建**；leader仍需在真实安装重放`--check --layout dune`。控制入口见[环境定向重放](../experiments/environment-replay/README.zh-CN.md)。

截至本机接受记录，完整原调用VADD的11单元、8策略、87本地模块及FinalCheck已独立重放通过；不是新增kernel或GEMM成功。当前公开契约、ISA/终止性边界及全库数量以集成[CHECKPOINT](../CHECKPOINT.zh-CN.md)和[verified清单](../verified/manifest.json)为准。配置/forwarding的轻量smoke不能替代这次完整接受证据，细节见[PR2评审回应](ENVIRONMENT-REVIEW-RESPONSE.zh-CN.md)。

仓库内可读的实际结果、120条命令、88份Coq日志、13＋5控制、工具hash及新helper映射验收见[worker-current证据](../experiments/environment-replay/evidence/worker-current/README.zh-CN.md)。公开helper新增后只做--help和既有99调用规则/flags/tool一致性检查，没有重复87模块；过去的完整成功与本helper新增验收分别记录。
