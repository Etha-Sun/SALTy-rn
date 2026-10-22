# QCP 局部 struct 与 Assert 的小复现

运行 `python3 verification/qcp/experiments/vadd-rvv/loop-investigation/run.py`。
需要当前项目的 QCP 环境；`qcp` 在 PATH 中。唯一显式 Coq 模型导入为已发布的 `QcpVadd.VaddBits`（其中定义 `vadd_vl`），runner 使用 `shared/vadd` 路径；不依赖进行中的 RVV loop 文件。脚本只执行符号执行与 VC 生成，每例最多 30 秒，不运行 Coq。

两个 C 文件唯一差别是循环中的 Assert 是否保留局部 struct 字段：

- `drop.c`：先 `struct sample a; a.v=0;`，随后 `Assert ... && emp` 不再引用 `a`；当前 QCP 返回 **-11**。
- `keep.c`：同一位置改为 `Assert ... && store(&(a.v),int,0)`；当前 QCP 返回 **0**，成功生成 VC。

普通 C 代码、输入范围、循环更新 `n-=vl` 完全相同。前置条件为 `emp`，没有缩小无符号 `n` 的合法域。`vsetvl` 返回 `min(n,32)`；其实际函数体也交给 QCP 生成义务。

`status.json` 记录实际命令、源/日志/QCP 二进制 SHA-256、退出码与耗时。`drop.log`、`keep.log` 是本轮真实输出。两例生成文件位于被忽略的 `.build/`，其中自动证明模板不是检查过的证明。重跑会更新这三个当前复现记录；如需保留旧轮，应先复制记录。

**这不是 kernel 正确性结果。** `keep.c` 的 VC 尚未证明；此处只定位工具接受的注解形式。现有对照将失败缩小到循环局部 struct 被 Assert 隐去后的处理，尚未审查 QCP 内部实现，不能断言具体内部缺陷。正式 RVV 修复优先保留仍存活向量的字段资源，然后完整生成并证明全部 VC；不应为绕过此问题削弱公共契约或引入公理。

此前较大的诊断输入、日志及自动生成文件留在本地并全部忽略；Git 仅保留本 README、两个 C 文件、短 runner、两份日志、状态 JSON 与 `.gitignore`。
