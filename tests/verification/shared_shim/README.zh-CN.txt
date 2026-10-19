共享shim与输入冻结的额外检查

check_guard.py在/tmp的仓库子集副本中测试：正常证明补丁通过；改原C、改spec、
改生成器、额外注入requires false、插入普通赋值、插入无用宏均应被拒绝。
它不调用solver，不能代替各kernel完整WP验证。主仓库冻结文件不被修改。
  python3 tests/verification/shared_shim/check_guard.py
GNU patch需要允许本地文件元数据操作的host环境；结果在guard-results.json。

semantic-witness/下的两个程序直接包含实际f32-vmin/vmax source/target。
它们只为一个quiet-NaN输入提供所需的NEON传播NaN/RVV numeric min/max规则，
不是完整min/max共享库，也不宣称其他输入或真实ISA已验证。
运行得到source NaN、target 1：补齐忠实shim会暴露此差异，不能自动使原kernel等价。
  gcc -std=c11 -O0 -fno-builtin tests/verification/shared_shim/semantic-witness/f32-vmin.c -lm -o /tmp/vmin-witness
  /tmp/vmin-witness
vmax同理；实际命令、程序哈希和输出在semantic-witness/results.json。
