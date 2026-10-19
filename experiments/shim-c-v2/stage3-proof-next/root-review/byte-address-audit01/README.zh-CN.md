# Byte 地址层资格阻塞

native19沿用的 `MemBytes.PointersProperties.ranges` 用 `l_kind=Admit` 对所有地址加入：静态 base 的地址编码处于 uint64 范围。`MemAddr.in_uintptr_range` 的条件只限制 base，未限制 offset；实际 `addr` 的 offset 是无界整数。现有静态地址逆关系使编码在同一静态 base 的所有 offset 上单射，因此与有限编码域冲突。有效对象保证存在静态 base。

这是工具模型不一致，不是 kernel 反例。Byte1..34均未用于九项验收；此前局部正反控制、store46/46或未来已知例571/571都不足以覆盖此缺陷，不能资格认证。旧结果/模型/锁原样保留；当前strict运行继续保留实际结果，但不赋予qualification。

独立修复将删除非定义型地址位宽注入，重新导出VC核对无回流，复验控制和已知例。指针存储/读取或往返可能因此未证；不得以新前提或公理补回。该修复不自动提供SPMM非零地址步进桥。旧已资格化Typed模型不含新增位宽事实，继续用于proof工作。
