# 第二服务器环境重放

所有公开kernel、spec、mapper和共享证明保持冻结。环境入口只替换工具路径，不改变C模型、合同或VC。
Linux环境设置两个变量即可；路径是部署配置，不写入共享源码：

~~~sh
export QCP_HOME=/path/to/QualifiedCProgramming
export QCP_COQC=/path/to/coq-8.20.1/bin/coqc
python3 verification/qcp/tools/environment.py --check
python3 verification/qcp/experiments/environment-replay/run.py --name replay01
~~~

QCP 2.1.4来源参考commit 08cc7a0f1373a1db3800111a0205a340b6d6f99c。
Git checkout会核对commit与Rocq源码无本地改动；release archive没有Git元数据时明确记录commit未查询，
不把来源参考冒充本机Git验证。两种安装均核对可执行文件及_CoqProject的固定SHA。
symexec及StrategyCheck分别核对固定SHA，Coq必须为8.20.1。需要Python3、GCC、patch、git。
环境入口从该checkout的Rocq/_CoqProject读取已知-R/-Q模式，跳过dune的_build重复映射，拒绝未知格式。
使用前必须按QCP自身构建说明编译库；import probe检查SimpleC.SL的实际编译依赖，入口不会下载或偷偷重建依赖。
版本、二进制SHA、库入口SHA、映射文件SHA及命令路径保存在环境检查输出中。
缺工具、版本漂移或导入失败均标为environment_failure，不计作kernel不等或证明通过。
不需要leader机器上的qcp-env、coq-flags.json或/zp_vegeta路径。

该入口在根目录.build/environment-replay/replay01建立全新源码快照、清除副本中的旧verdict，再调用既有verify.py。\n不允许覆盖已有run；记录输入SHA、命令、退出码和新日志。现有底层runner仍会写其所在快照的派生产物。
worker使用独立源码快照重放，将新证据放experiments/environment-replay；不覆盖旧审查日志。
验收仍分别报告40对身份检查、430个native case、48项共享基础义务、14个NaN C VC以及完整kernel 0/40。
native通过、VC生成成功、环境import probe均不等于整核证明。
Print Assumptions、所有callee body和source-to-lowered对应边界继续保留；本次没有finite-only限制或未证extern。
ISA到C模型对应不由环境重放建立。
