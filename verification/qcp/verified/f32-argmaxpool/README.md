# F32 ArgmaxPool：修复版的 C-shim 等价性

本案比较 `impl/testNEON.c` 与 `impl/testRVV.c` 的修复、兼容实现。完整验收以 `proof/status.json`、完整源码门禁及其冻结清单为准；组件通过或有限原生回归不单独计作已验证 kernel。

两侧原实现将正的 `size_t pooling_elements` 窄化为 `int`，在 2^31 等计数下会跳过输入处理。当前实现保留无符号 64 位计数，并将最后不足九项后的剩余数置零，避免无符号减法回绕。NEON 尾部只加载已初始化的有效旧输出和索引，不要求额外初始化 padding。原件、计数反例、精确补丁及旧修复元数据均保留在 `proof/original/`、`proof/original-counterexamples.json`、`proof/repair*.patch` 和 `proof/history/`。

为适配证明前端，间接表读使用实际普通 C 函数 `ap_read_table`，局部自增和像素递减改为相邻语句。RVV 的每个通道块提取为普通函数 `ap_rvv_block32`，内部执行原来的九次有序候选更新与配对存储；`ap_rvv_update_into32` 仍执行原来的严格比较、浮点选择和索引选择。只有不逃逸的局部游标前进移到调用之后。它们都有实际 C 函数体证明，不属于 intrinsic 规格免证范围。此兼容重构不声称新增语义反例，也不声称原始源码到当前实现的编译器精化。修复原因与身份见 `proof/repair.json`。

公开条件是 `spec.c` 中的 `app_arguments`、`app_valid` 及显式内存所有权，尺寸使用 64 位表示。指针表与输入浮点数据以共享只读映射描述，允许输入行重复或别名；每行输入窗口包含 channels+3 个可读 float，以覆盖 NEON 尾读 padding，padding 值不受限制。表内指针值可以为零，只要按原始无符号 64 位回绕加偏移后得到有效读取窗口。可写输出和索引使用各自拥有的可选值映射。旧输出只在前一轮已写过对应有效通道时读取。未写地址保留各自初值，包括 `None`，没有把输出 padding 全部已初始化作为额外前提。像素间地址推进保留无符号 64 位回绕，跨像素重复写遵循实际先后顺序。具体地址范围、非空、步长和计数条件以 `proof/coq/APProgramModel.v`、`APKernelModel.v` 与 `MemoryModel.v` 为准。

写入位置观察精确 binary32 位和无符号 32 位索引，保留严格大于时才更新、并列时保留先前索引、NaN payload 和符号零，以及索引模 2^32 回绕。浮点域没有排除 NaN。`public_spec.c` 是实际先后调用两侧的普通公开调用器，其证明连接两侧模型的结果和各自未写帧；返回常数一不是运行时比较器。

RVV 固定 XLEN=64、VLEN=128、SEW=32、LMUL=8、VLMAX=32、vstart=0、小端，涵盖这一配置下全部合法 VL 选择；非活动向量 lane 不固定。NEON 使用原来的 128/64 位向量视图。浮点配置与内存边界见规范台账，异常标志和陷阱不在观察范围。任意输入长度不表示任意硬件 VLEN。

`proof/intrinsic-boundary-status.json` 汇总三十个原生 intrinsic 规范视图、二十八个原始名称，记录完整声明、合同、精确 Coq 定义及固定版本的官方来源。`proof/audit_intrinsic_boundary.py` 核对当前头文件、模型、来源和实际原生调用清单。原生 intrinsic 可以只使用对应规格；普通适配器、读表、读旧输出、块更新和公开调用器仍须逐个检查实际函数体。最终人工语义审核 pending，未证明真实 ISA、物理 ABI、编译器精化或终止性；结论是这些明确边界下的模块化 C-shim 部分正确性。

完整门禁必须从当前实际源码重新生成所有 C 目标，并在同一命名空间从所有本案 `.v` 源码普通重编译，再检查完整 `VC_Correct`、独立第二接口和最终假设报告。超出 Git 单文件限制的实际目标以可逐字还原的 gzip 归档，编译仍使用原始解压字节。历史日志和失败记录保留其来源，不当作新的验证运行。

`proof/check_native.py` 与 `proof/check_public_native.py` 编译当前主函数、实际普通块与更新函数，并分别运行 UBSan 和真实 16 GiB、禁止 swap 的 ASan 检查。原生数组语义只作补充证据：独立整数 IEEE 位级参考逐项检查输出和索引，单侧错误与两侧共同错误都须被拒绝。原始 2^31 计数反例单独保留；有限原生检查不替代形式化证明。
