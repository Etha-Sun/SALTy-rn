完整整核检查自然完成：main547/557，全部global12/12，总559/569，尚未整核通过。

仅剩10个values目标：harness2、NEON7、RVV1。memory/v13的原5项memory/load与新增14项invariant建立/保持全部19/19；signed两实际body全部36/36，全部非equivalent主目标均通过。没有取消或缺失raw报告。

此版精确合并merged-v01+memory/v13/minimal-on-v08.patch（7loop invariant、5label），无新semantic条款，普通C/spec/shim/model/driver/checker冻结。sourceguard5740tokens，正控制通过、负控制不通过；实际full par64/depth16、solver30s/1024MiB，搜索配置独立固定。

review.json列出全部10项及19项memory依赖；raw见attempts/0001/main-report.json，不将TIP分支603误作原始557目标。
