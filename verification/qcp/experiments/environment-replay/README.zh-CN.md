# 环境定向重放与证据范围

本目录提供环境/source-pin正负控制；不复制或替换kernel、spec、checker或Coq证明体。包的外部config/tool入口见[ENVIRONMENT](../../docs/ENVIRONMENT.zh-CN.md)，最新本机结果见[评审回应](../../docs/ENVIRONMENT-REVIEW-RESPONSE.zh-CN.md)。

```sh
python3 verification/qcp/experiments/environment-replay/check_environment.py \
  --out /new/path/to/controls --archive /path/to/qcp-fixed-source.tar.gz \
  --compiled-home /path/to/QCP --coqc /path/to/coqc-8.20.1 \
  --fixture-git-source /path/to/existing/local/repository
python3 verification/qcp/experiments/environment-replay/check_source_pin.py \
  --archive /path/to/qcp-fixed-source.tar.gz \
  --commit-api /path/to/pinned-commit-record.json \
  --root-tree-api /path/to/pinned-root-tree-record.json --out /new/path/to/pin-controls
```

输出目录必须不存在；只在新fixtures中变异。13项layout/source控制覆盖两布局正控、所选布局缺依赖且禁止fallback、源码增改、源码/所选Dune目录软链接、未知compiled module及Git staged/index抵消/untracked/ignored源。Dune fixture复制/链接已有产物，**不是新的Dune build**。5项pin控制覆盖真实来源、根内容、缺失、重复和权限模式变化。

源码锁、工具版本、artifact身份和import probe分别登记。source-to-vo真实build对应未建立；这些控制不计kernel C VC、不代替recursive coqchk或ISA证明。

本机最新同版环境通过13＋5项控制及真实in-place/import；独立基础快照重放40对来源、48基础义务、14 NaN C VC、430 native case/860调用和5264 NaN native对。历史controls03只有12项且代码身份不同，保留其历史含义，不能替代当前同版日志。

**完整原调用VADD87的本机独立重放已完成**：固定集成3cf03900隔离源码，11个C单元新生成、8组策略、87个本地模块和FinalCheck全部ordinary Coq通过，总758.75秒，无project/experiment旧.vo。初次240秒生成超时保留；成功重试只把wall预算显式提高至900秒，原checker和证明源不变。这里不再沿用旧“VADD87未做”的阶段状态；实际日志与来源审计位置由评审回应列出。

旧experiments的`--byvalue`路线与新`verified/f32-vadd/proof/check.py`不是同一个接受入口。本补丁不移植旧runner，也不重跑或覆盖其历史证据。此处基础重放的旧0/40字段不能覆盖当前全库清单，VADD重放也不是第6个kernel。真实Dune复核、外部build history、ISA和独立终止性仍单列。

完整接受结果、实际命令、Coq原日志和13＋5控制现已放在[仓库证据](evidence/worker-current/README.zh-CN.md)。[公开900秒入口](../../tools/run_package_check.py)复用同一预算规则，固定case/shape/checker身份；复现命令见环境文档。新增helper仅做真实--help和已过99调用映射，不借机重复87或伪称又一次fresh全证明。
