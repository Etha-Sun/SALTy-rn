# 已验证的 kernel

当前 **13/40**，目标至少 **21/40**。最新新增 [qs8-vcvt](qs8-vcvt/README.md) 两侧修复版。

本目录只收录完整 C-shim 模块化等价性检查通过的 kernel；清单见 manifest.json。
原始 impl、公开 spec/contracts 和操作 shim 是审核入口；proof/c 只保存证明注释和策略。
程序前置条件、输出观察关系和硬件参数以各 case 的 spec 与 README 为准。
真实 ISA 与 shim 的对应、终止性及浮点异常标志不属于这里的完成计数。

运行某个 case：

```bash
python3 verification/qcp/verified/f32-vadd/proof/check.py --jobs 16
```

候选保留在 ../candidates；必须完整检查实际 kernel、shim、比较器、wrapper 与 Coq 依赖后才能入库。
