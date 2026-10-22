# 环境入口及独立重放

这项改动将既有runner中的leader绝对路径换为QCP_HOME/QCP_COQC入口，不修改公开spec/mapper、原始C或证明body。
实际重放命令、工具和库哈希、输入源码SHA、新日志及Print Assumptions在evidence/worker02。
两个环境变量的说明见../../docs/ENVIRONMENT.zh-CN.md；运行方式：

~~~sh
QCP_HOME=/path/to/QCP QCP_COQC=/path/to/coq-8.20.1/bin/coqc python3 verification/qcp/experiments/environment-replay/run.py --name fresh01
~~~

重放入口建立新的隔离源码副本，删除副本中的旧verdict后检查，拒绝覆盖已有run。
本机结果：40对身份检查、430个native case、48项基础义务、14个NaN C VC及5264对NaN native对照全部通过。
三项环境负对照（缺配置、错误Coq版本、被篡改QCP二进制）均拒绝，归类为environment_failure。
基础义务与NaN桥是既有能力的本机重新检查，未新增整核成功；完整kernel仍为0/40。
kernel-attempt原有首次load资源匹配失败按原exit/公式保留，不将局部基础义务通过解释为整核通过。
本次没有修改finite域或引入extern/Admitted/公理；来源到lowered的对应、全RVV向量/循环和ISA对应仍开放。
证据里的绝对路径属于隔离run provenance，不是runner依赖；旧工作树/历史结果未覆盖。
