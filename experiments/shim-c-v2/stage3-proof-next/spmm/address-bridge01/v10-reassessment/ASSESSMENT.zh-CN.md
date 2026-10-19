结论：v10剩余spn_out_4保持不能仅靠普通body ghost helper在当前固定内存模型下补出。源码模型与真实控制共同支持这是地址表达缺口，不能把timeout称为原kernel错误，也不能把有限片段反模型冒充全WP反模型。

实际C为output=(float*)((uintptr_t)output+output_stride)。不变量目标是output等于spn_column_4+(nc-n)*(spn_MC/4+4)。WP保持的结论一侧是shift_float32，另一侧是addr_of_int(to_uint64(stride+to_uint64(int_of_addr(previous))))。原址往返、公理valid/linked、整数无溢出均不定义加字节偏移后的地址编码。

当前理论MemAddr第137–145行只有int_of_addr、addr_of_int及静态分配地址原址逆；没有地址编码仿射关系，也没有任意整数的反方向int_of_addr(addr_of_int(x))=x。因此改成整数游标prefix仍在下次pointer→integer时卡住。给等式套定义谓词可以保留它，但无法创建该语义；helper body重做同一转换只生成同一缺失目标。

可实际body证明的部分是纯整数：在原wrapper域内MC=4*m、stride=4*(m+4)、column索引递增/递减、output_decrement=stride*nc-16及后续加8/4的算术关系。v10已闭合入口零差/零积，继续重复这些不能关闭当前uintptr步骤。若改成与真实cast完全同构的递归地址轨迹，可证明程序沿该轨迹走；但无法推出其位于原wrapper声明的typed合法数组，也无法完成最终输出观察，不能将此作为目标替代。

在不改原C/spec/合法域下，真正下一层是独立审计的具体地址布局语义：对象基址+字节偏移、分配范围、uintptr位宽/回绕、跨对象/一过尾和provenance。应先用原typed-step/roundtrip/uintptr-stride及两假目标控制验证，不能只增加一条affine axiom。当前Bytes实验共享MemAddr，修byte codec不会自动修uintptr。此处只给边界，没有提出未经审计的模型补丁。

证据：typed-root01为Typed+float真实body控制7/10，未过的三个post是合法uintptr_stride与两个故意false。v10实际为Typed+raw+float，二者共同地址语义来自同一MemAddr，但不能把Typed控制伪称Raw复验。finite-fragment-result只描述明确列出的有限ground约束，100→116和p+4编码200不一致说明原址逆不足；不是完整模型或硬件反例。

公式来源说明：preserved-goal.txt从既有address-bridge01/actual-goals.txt截取，是早期相同原C步骤的实际WP导出，不能标为本次v10 fresh dump。v10本次确认依据为selected-root01/raw.json唯一未过属性及冻结neon.c相同uintptr更新；本次未重跑WP或solver。
