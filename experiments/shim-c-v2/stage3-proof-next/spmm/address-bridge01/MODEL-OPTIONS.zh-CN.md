# Frama-C 33 现有内存模型选项：uintptr桥只读审查

结论：没有找到可直接切换、且支持本次真实指针整数加法所需仿射语义的现有选项。不能笼统说所有模型均共享MemAddr：Eva有独立路径，但明确拒绝非零整数转指针。此结论是固定本地源码审查，不是完成所有模型的实际solver试验。

- `Factory.ml:13,229—242,333—345` 枚举全部heap选择：Hoare、ZeroAlias、Eva、Bytes、Region、Typed；Raw/Var/Ref/Caveat是变量表示层。
- Typed 的Raw直接用MemTyped，Var/Ref包装同实现，Caveat也包装MemTyped（Factory:197—204）。MemTyped:927—928仅调用MemAddr.addr_of_int/int_of_addr，后者增加目标整数转换。
- `Cast`/`NoCast`只是Typed指针cast策略（Factory:334—336）；不能补充pointer→integer→加法→pointer的仿射关系，也不能以Unsafe选择掩盖缺桥。
- Bytes:930—938也调用MemAddr.addr_of_int/int_of_addr。Region由MemRegion.Make(RegionAnalysis)(MemBytes)(MemBytes.LOADER)构造（Factory:184），其cast在MemRegion:404—405继续委托底层。即便未来修好字节浮点编解码，这一地址桥仍不会随之自动出现；本次未启用旧Bytes+float。
- MemVar:483—484只是包装，非新的地址编码语义。
- ZeroAlias:154—155直接报`No Hardware Address`。
- Hoare使用MemEmpty（Factory:197—198）；MemEmpty:55—56整数到loc为空值、loc到整数为0，不适合验证本次真实内存kernel，不是合法替代。
- Eva/MemVal为独立地址路径，但MemVal:453—458对任何非零整数转指针报`Forbidden cast of int to pointer`（明确TODO reinterpret integer with Value）。所以不是本次表达式的可用现成支持。其pointer_val:415返回loc_t，shift:428—433按对象大小移动，并没有使被禁止的逆转换可用。

所有可执行真实一般内存地址转换的上述路径最后均落到现有MemAddr抽象逆映射。现有memaddr理论只有原址往返，没有合法对象内加字节偏移对应C指针步进的关系。valid与linked约束分配/大小，不能凭此推出整数编码必须仿射；此前有限ground片段说明这一逻辑缺失，绝非硬件反例。

下一步只应由主agent执行已准备Typed+float真实C正反控制，证实具体WP行为；无推荐的替代model开关值得盲跑九核。不修改原C、普通spec、输入域、模型锁，也不提出未经审计的地址axiom。若后续必须支持地址编码，应单独设计与实现定义C/目标平台一致的内存语义，审查整对象地址布局、整数宽度/回绕、跨对象/一过尾、provenance及负控制，不能仅追加一条全局affine假设。
