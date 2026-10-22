# 按值向量接口探针

这是对“保留 kernel 的调用、赋值形式，只调整 shim 和证明标注”的最小可行性检查。
不是原始 `test_neon` / `test_rvv` 整核证明，也没有替换已发布的指针版本。

`vadd.c` 定义四个 float 字段的向量，按值传参并按值返回。`vaddq_f32`
实际执行四次浮点加法；`chain` 保留以下 C 表达式：

```c
float32x4_t vacc = vaddq_f32(a,b) /*@ where a = &a, b = &b */;
vacc = vaddq_f32(vacc,c) /*@ where a = &vacc, b = &c */;
return vacc;
```

`where` 是 QCP 调用标注，普通 C 编译器将其视为注释。它绑定契约参数，
不把 C 参数改成指针，也不把返回值改成输出参数。
目前省略标注会导致 QCP 报内部 `a_callee` / `b_callee` 无法实例化。
错误消息建议绑定内部名字，但最小探针实际需要使用源参数名。

后置条件逐字段描述 `fp32_add(fp32_add(x,y),z)`，没有重排浮点加法，
也没有有限值前提；生成时使用 `--no-float-finite-vc`。
`Layout.v` 定义未初始化结构体字段资源，并证明地址表示正规化引理。
`checked.v` 实现全部 8 个生成的 C VC，不含 Admitted 或新增公理。
仍采用现有 QCP 内存、浮点和地址模型的基础假设。

## 复现及边界

```sh
python3 verification/qcp/experiments/byvalue-probe/run.py
```

脚本使用当前工作区已有的 QCP / Coq 配置，生成到独立 `.build/run-*`，
重新编译布局定义、生成目标及完整证明模块。不会覆盖旧指针版本的证明记录。
将第二次调用改为 `vaddq_f32(a,c)` 的负对照必须在 Coq 检查时失败。

`duplicate.c` 额外尝试 `vaddq_f32(a,a)`。当前独立输入资源契约在调用点
匹配失败，因此不能据此宣称按值接口已支持所有 C 值复制/别名场景。
此失败不等于该程序错误，也未证明所有其他契约写法都不可行。

下一步才是 load/store、NEON 尾部、RVV 动态 VL 和原 kernel 循环。
本次没有直接 include 原 kernel，所以不能称为已经完成原始 C 的证明。
保留按值接口可以省去外部调用改写器，但生成 VC 中仍有结构体复制和
内存所有权义务；完整证明是否更短，需要同一整核完成后才能比较。
