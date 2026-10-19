r3 scalar-root01完整raw784/784、前后input/generated/frozen/proof/model均true；独立核256case恰各一次、default及两helper全部post均通过。r4只给既有ghost caller loop frame/variant加名字，未改变helperbody或合同。

两组真实验证仍分开：bits_i8、vsll、vand全部body，none完整47goal；equivalent caller选定组none完整26goal，包括原两nibble断言、新3prefix建立/保持、loop assigns、variant、ghost index RTE。selector包含@assert以覆盖自动RTE，也选中部分旧main断言。完整清单见CALLER-INVENTORY/CALLEE-INVENTORY，none不是验证通过。运行命令见commands.txt；只有callee和caller新增债务全过才能称这一局部关系闭合，不能称kernel通过。
