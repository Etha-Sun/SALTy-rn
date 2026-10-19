证明/实现隔离的独立负测试

check.py在临时目录复制冻结case，先跑guard正例，再测试三种实际拒绝：
改冻结neon.c；合法proof patch加入普通赋值；合法proof patch加入无用#define。
probe_public_contract.py额外测试不改spec.h却从harness定义注入requires false，必须拒绝。
主case文件不被测试写入；case全部输入hash及实际错误在evidence/*.json。

从仓库根执行：
python3 tests/verification/proof_separation/check.py
python3 tests/verification/proof_separation/probe_public_contract.py

它们只验证guard行为，不运行完整WP，不证明任意ghost程序无干扰。
GNU patch需要允许本地文件元数据操作；本环境sandbox的fchown限制可能导致环境错误。
已保留的通过结果在host执行，且每个负例都匹配具体拒绝原因，未把patch格式错误算成功。
完整源码/规格/ghost边界解释见docs/SEPARATION.zh-CN.txt。
