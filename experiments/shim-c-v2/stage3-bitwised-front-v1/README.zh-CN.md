# 独立 bitwised 高位分解修复（未资格认证）

仅将单bit掩码构造从机器int改为大整数。OCaml int_size=63 时旧k62为负、k63为0，可能使64位分解退化；尚无旧tactic不健全证据。来源与实际对照见 ../stage3-proof-next/spmm/bitwised-audit01。保留旧源码、锁与所有结果。需独立编译、正反高位控制、真实QD8重放、重新冻结与完整验收；本目录不是kernel成功证据。
