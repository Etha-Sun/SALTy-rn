# Byte21 两个初始 byte 目标

实际 original SMT 的状态为抽象 memory t；两个 read_uint32 等式约束初始化值，并有 bytes(t)。没有任何 ground write_uint32 项。对应目标分别读取原数组第5/6字节为86/52。现有 write_uint32 触发器匹配不了该状态；它证明的是 store 后读，而这两个 VC 要从整 word 的读值反推出各 byte。

更早一步：checked_word_byte 与 auto_instance 在 adapter 接收的 original SMT 中已不存在，不是 subset adapter 删掉这些 ground facts。它们挂在 bytefloat driver 的 bytefloat:cfloat library，当前纯整数目标没有引用该库的浮点符号；具体库激活路径仍应在独立配置 export 验证，不能仅换触发就称修复。

现有 memory_unsigned32_bytes 的四byte线性和及 bytes 定义在 reduced SMT 都保留；原 goal 逐字节不变。可行局部支持是从现有分解和 0..255 byte 域证明四个逆向商余等式，并对实际 read_uint32 项实例化。read-inverse09 提供真实 scalar body 与 memory body，无新 requires；所有 body/assert/post 都必须先求证。将来集成应挂到实际整数内存库或在独立 driver 强制验证可见性，不能继续仅依赖未激活的 bytefloat 库。

这里未跑solver、未改变v21锁、源码或驱动；不是kernel反例，也不是模型资格完成。
