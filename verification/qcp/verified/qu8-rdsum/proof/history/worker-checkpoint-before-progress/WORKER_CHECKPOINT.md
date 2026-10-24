# qu8-rdsum

原件真实共同错误已确认：rows=2^31、stride0、全部1输入时两侧均输出0，独立oracle应为0x80000000。signed额外确认NEON tail scalar Init=INT32_MAX+input1 UB。原件/日志保留；两侧已做全uint64 rows语义修复，实际QCP证明尚未完成，不能计入verified。
