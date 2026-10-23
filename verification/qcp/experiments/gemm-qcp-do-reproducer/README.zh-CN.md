# 原控制流 GEMM 的 QCP 崩溃重放

这是 PR6 评审请求的工具故障诊断包。它保存完整参数域 NEON 的实际注解输入、shim、全部策略依赖、命令和已有 GDB 证据。**本包没有 Coq 证明，已证明 C VC 为0、整核为0；不能用崩溃推断 GEMM 不等价。** 模型能力包仍见[PR6](https://github.com/Etha-Sun/SALTy-rn/pull/6)，环境入口见[PR5](https://github.com/Etha-Sun/SALTy-rn/pull/5)。

## 输入与证明边界

[input/neon-undef-original-stackcomplete.c](input/neon-undef-original-stackcomplete.c) 保留原函数的调用、赋值、原始 do/for、向量声明初始化及 const。公开重放先核对原源码 SHA 和去注解函数 token，再严格核对两种预处理 SHA。token 相同是静态身份检查，**不是原 C 到 shim/ISA 的语义证明**。

输入域仍为 mr=1..4、nc/K 任意合法正数、kc=4K、标准 mapper stride、完整机器地址/容量约束；A四行共4K个初始化float，W完整panel及padding，输出四行共4nc只需可写。缺行alias只拥有一次物理资源。全fp32包含NaN/Inf/subnormal/±0，lo/hi不限制finite或lo≤hi。完整 Require/Ensure 和所有内存条件逐字保留。

[shim-undef.h](input/shim-undef.h) 中的 intrinsic 为精确合同，尚无完整 C body/ISA 对应证明。本包既不宣称其实现已证，也不更改其语义使两边相等。生成器读取这些 Extern Coq 名字与合同；本次仅重放生成器失败，不调用 Coq、不需要导入项目模型 `.vo`。若将来工具成功生成目标，编译和证明仍需另行补齐全部模型/策略/C body 依赖，不能把本包当证明闭包。

## 重放

准备公开 PR5 的环境工具和 PR6 的原源码。两者可以在独立 checkout 中，无需修改集成分支；对应 identity 固定在[manifest.json](manifest.json)。QCP 为固定2.1.4 Linux binary，Coq环境入口按PR5配置8.20.1；不包含工具链或私有flags。

```sh
QCP_HOME=/path/to/QCP QCP_COQC=/path/to/coqc-8.20.1 QCP_LAYOUT=in-place \
  python3 verification/qcp/experiments/gemm-qcp-do-reproducer/replay.py \
    --name original-do-new \
    --environment-tools /path/to/PR5/verification/qcp/tools \
    --original-kernel /path/to/PR6/verification/qcp/candidates/f32-gemm-minmax-model/impl/testNEON.c
```

PR5/PR6 已在同一 checkout 中时可省略两个路径参数。`--preprocess-only` 只核对原函数和两种CPP身份，不执行QCP。每次 `--name` 必须新建，旧记录不会被覆盖。

实际 QCP 命令写入 `.build/<name>/command.json`：64-bit/little-endian、`--no-float-finite-vc`、strategy limit4096，全部策略搜索仅指向本包input。`--no-exec-info` 只关闭大体积执行trace，未修改输入；可直接使用记录的命令在调试器中启动，需要trace时去掉这一输出选项。原25及GDB26启用了详细trace，历史与新重放分别标识，不冒充完全相同的调用参数。

脚本使用有限资源：单QCP进程AS16GiB、stack512MiB、CPU900s、默认wall900s，core dump关闭；外层请只保留一个该实验任务并预留16GiB。命令正常退出也只代表目标生成，不代表证明；失败时脚本非0退出，实际QCP返回码和GNU time资源写入 `result.json`/`resources.log`。不设置重试、不缩小输入、不做do→while或不变量变体。

## 已有故障证据

[historical-results.json](evidence/historical-results.json) 标明历史20/25的exit139和0生成VC。注解CPP SHA为`40478fb50e03faaf36e1a89e1e0c25c37cf87f7eb75998dfa408adbe23a2806a`，执行CPP SHA为`64eb8a9c5db07e1c52ef651d999d955a70220366b8876bca5a263aec638931c7`。二者及所有input文件在新机器必须逐字一致，否则脚本拒绝继续。

26次父启动GDB的实际[回溯/寄存器/maps](evidence/historical-gdb26/backtrace-registers-maps.txt) 捕获SIGSEGV，RIP=`0x116753a`、RAX=0。[该固定binary的反汇编](evidence/historical-gdb26/fault-disassembly.txt) 在该PC为 `mov 0x8(%rax),%rdi`，直接读地址为0x8；调用侧处于condition dispatch。此前同输入16GiB重放内存峰值约1.54GiB，不是预算耗尽。上游对象为何为空仍未知，不能将工具读NULL解释成原C浮点load反例。

历史回溯不是新重放的回溯；新运行若再次139，只报告再次SIGSEGV，不能在未调试时声称相同PC。后续单独的纯正性cut已在第二轮成功frame整个heap、产生显式nc>0，仍139；仅缺正性不是充分解释。本包不重复这些变体。

**本次公开命令已实际重放**：[relocated01/result.json](evidence/relocated01/result.json)，138.44秒、实际exit139/SIGSEGV、RSS峰值1617264KiB（约1.54GiB/16GiB）、0生成C VC、0证明。全部输入未变，两种CPP身份匹配；[实际命令](evidence/relocated01/command.json)、[完整小日志](evidence/relocated01/qcp.log)、[资源](evidence/relocated01/resources.log)、[实际扩展输入](evidence/relocated01/neon_full.c)均保存。新重放未启动GDB，故不声称新故障PC与历史26相同。执行trace关闭后仍SIGSEGV，供后续工具修复验收对照，不继续重复同输入。

没有源文件证明或Print Assumptions可在此报告；它们属于另一层适配候选的850个C VC和模型包，不能拿来补本包0证明的数量。历史诊断与本次relocated01分别保留。
