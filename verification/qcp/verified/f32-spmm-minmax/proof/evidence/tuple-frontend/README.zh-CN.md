# 浮点记录数组模板诊断

原始probe_def.v错误地把float字段定义为R类型且使用Int存储谓词，不能编译为所需binary32语义。原输出保留为raw-probe_def.v，仅诊断，不导入证明。实际原C数组返回与按值复制不改；公开SpmmSpec.TupleMemory逐项定义fp32与Float存储、原sizeof结构步长、全部四字段和长度，并证明数组/字段转换。前端生成的五个C目标保持原样，probe_def进口适配只导出这份公开类型模型，八个策略须全部实际证明。当前策略/探针的全检查尚未完成，不能算完整kernel。

spmm-tuple05的五个C目标已原字节复制到SpmmTupleProbe/probe_goal.v。probe_def.v显式导出公开类型模型；原错误模板未编译、未记通过。

后续修正：record-probe_goal.v是spmm-tuple10的原字节目标，采用完整返回记录谓词（定义即原数组）以使前端回收临时对象；record-binding.json保留身份。当前公开probe_goal.v对应此版。tuplecheck12已完整通过12策略与5实际C义务；老5目标/8策略及原模板为历史诊断，未把失败返回目标记通过。
