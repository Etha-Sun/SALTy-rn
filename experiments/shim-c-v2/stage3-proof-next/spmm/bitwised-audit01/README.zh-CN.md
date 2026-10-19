# 64 位 bitwised 分解审计（尚未资格验收）

真实 OCaml 4.14.2（Sys.int_size=63）执行 `mask-comparison.ml`，对照 Zarith 任意精度 `Z.shift_left Z.one k`。k=0、31、32、61 相同；k=62 的旧值为 -4611686018427387904，正确值为 4611686018427387904；k=63 的旧值为 0，正确值为 9223372036854775808。完整命令、环境及退出码见 mask-comparison-result.json。

TacBitwised.ml 第16行用 `F.e_int (1 lsl k)` 构造位掩码；第19—26行逐位合取；第30—31行允许64位。第11—13行自身已使用任意精度 `Z.two_power_of_int` 生成范围界。tool.patch 仅替换第16行的掩码为 `F.e_zint (Z.two_power_of_int k)`；旧源码与所有现有安装、锁未修改。

实际 QD8 r4 日志（源SHA见 provenance.json）在64位分解后仍留下高两位联合掩码 13835058055282163712 的 land 等式，以及 bit_test 1..61。actual-goal.txt 是原日志带原行号摘录；它不是自行构造的目标。

此处确认的是逐位分解实现不符合预期，尚不能称旧证明不健全。在0<=x,y<2^64范围内，旧k62负掩码仍同时比较62/63位，k63的零掩码只是冗余；全部低位加联合高位仍可能等价于原等式。独立新版本应验证展开确实产生独立62/63位，且正反控制拒绝不正确高位关系。

controls.c 含两个正目标（完整64位重构、低位清零等于右移再左移）和三个故意假目标（仅翻转bit62、仅翻转bit63、忽略高两位）。各有实际C body，无前提。每个假目标单独函数，不能让一个假assert污染后续目标。应分别确认2个正确post通过、3个故意错误post未通过，且所有真实body/RTE/assigns义务都记录。假目标未通过本身不等于反例；不得因其 timeout 宣称求解出反例。

由主agent在独立source/install/share/config版本编译、冻结binary SHA，再以显式 `-wp-prover tip,z3,cvc5` 执行带策略控制并保存 script:allgoals,strategy。控制需观察62/63子目标，不允许仅因Qed简化全部消掉而称已覆盖该修复。建议继承已资格化环境的IEEE、FMA、unary、正反语义控制及已通过kernel smoke；最后同一QD8 r4 proof配置重放，核对新增独立bit目标。当前此目录未执行solver、没有kernel验收结论。
