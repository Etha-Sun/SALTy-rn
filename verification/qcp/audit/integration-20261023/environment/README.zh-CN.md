# PR5 环境集成检查（2026-10-23）

本次检查集成 PR5–8 的本地工作树，未修改环境检查器、源码锁、C/spec/Coq 证明。

- `environment-controls.json`：13/13 layout/source 正负控制通过；控制中的 Dune 是复制/链接已有产物的 fixture，不是新构建。
- `pin-controls.json`：5/5 来源正负控制通过；GitHub commit/root tree 原始记录在本目录，树内容经脚本校验 Git object hash。
- `dune-actual.json`：原本机真实 Dune 目录检查失败，缺少映射的 StrategyLib 目录。Dune 原安装只构建了部分闭包。
- `in-place-actual.json`：原本机 in-place 目录检查失败，没有 SeparationLogic.vo。
- `dune-isolated.json`：从原始固定 archive 提取源码、链接原本机真实 Dune 的 441 个 artifacts、为全部 pinned namespace 建立目录后，严格 source pin 和 Dune import probe 通过。没有修改原安装，也没有混合两种布局。
- `isolated-layout-provenance.json`：隔离环境的路径和产物来源；既有外部 artifact 的 source-to-vo 构建对应未重新建立。

隔离环境路径：`.build/integration-environment/QCP-V2.1.4`。空 namespace 目录仅满足环境映射的完整性要求，并不提供缺失的模块；若实际 import 缺少模块，Coq 仍会失败。

VADD 的首次隔离复制遗漏共享文件，在进入证明生成前失败，记录保存在 `vadd-wrapper/` 和 `vadd-command.log`。补齐原共享文件并建立隔离根目录标记后，以原 public helper、jobs=16、每子进程 wall=1800 秒在新目录重放；状态另记，历史 package 状态不被覆盖。

当前 PR5 环境功能评审建议：可合并。真实 partial Dune 安装需要 namespace 目录配置，不能将此误报为 proof failure；工具对外部 artifact 构建历史的限制已明确记录。

## VADD 最终结果

完整重放通过：11 个 C 单元、8 组策略、87 个本地模块和 FinalCheck，120 条命令全部 exit 0；总耗时 381.04 秒。`vadd-status.json` 保存完整逐命令记录，`vadd-command-logs.txt` 按文件名标题合并本次原始日志（每份原日志 SHA 在 `consolidated-log-index.json`），`VaddFinalCheck.v` 保存本次组合门禁。未复用任何 project/experiment 旧 .vo，外部 QCP/Coq/Flocq 库仍复用。此结果是 VADD C-shim 合同下的部分正确性，不是 GEMM 或硬件语义/终止性证明。
