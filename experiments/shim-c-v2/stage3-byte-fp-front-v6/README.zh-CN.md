# 独立 Bytes/IEEE v6：已证64位内存读取关系（未资格认证）

v5基础上仅新增有完整body的read64_equal_bytes支持，及原控制C中的逐字节unsigned断言。Read64Bytes已在read64-bytes-v14/root01真实证明1/1；不加公理或前提。membytes_le库导入该已证命题，依赖原模型的明确定义读取/小端序关系。其余模型/旧版本保持，普通C控制token不变；还需新源重放及全部正反语义控制，不用于任何kernel。
