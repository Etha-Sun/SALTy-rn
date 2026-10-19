# uintptr 地址诊断

使用独立新前端、固定native IEEE模型和原有Typed两种配置，不修改任何模型或kernel。`control.c`只用于定位；它不是给kernel添加的前提或公理。

| 目标 | Typed+raw+float | Typed+float |
|---|---|---|
| 原样pointer→uintptr→pointer往返 | 通过 | 通过 |
| 普通类型指针p+i | 通过 | 通过 |
| uintptr加i*sizeof(int)再转指针，要求等于p+i | timeout | timeout |
| 故意错误的“原样往返等于p+1” | unknown | timeout |

每配置完整raw为6/8，包含assigns义务。故意错误目标没有通过；这里的timeout/unknown不意味着真实C反例或已证明模型不可表达该性质。

只读源码追踪：`MemTyped.loc_of_int/int_of_loc`经由`MemAddr.addr_of_int/int_of_addr`；MemAddr简化器处理零及一类原样往返，未直接化简加偏移的转换。当前锁定`memaddr.mlw`中物理地址部分只声明null转换和有效静态地址往返关系，没有直接连接int_of_addr与shift的线性偏移关系。这支持将字节偏移桥单独调查，不能仅凭延长solver时间声称问题已解决，也不能为过证明加入未经证明的桥公理。

本诊断没有实现新地址模型，不能声明一般地址桥已修复；uintptr运算的具体实现语义仍需明确。命令、source/model SHA、raw和日志独立保留，所读源码SHA见`source-audit.json`。

独立审查见 [address-review.json](../../stage3-conv/address-review.json)。直接pointer→integer→pointer的绿色还包含CIL对嵌套转换的消除；MemAddr中另一方向integer→address→integer的化简须区分。这里的valid_read和乘法界也没有直接建立base+offset不溢出关系，不能声称byte_step是ISO C无条件定律。
