> 监督者收录（2026-11-05 11:50 UTC）。原草稿：`build/e1-workers-20261104/w21-qu8rdsum-transpose/bugs/QCP-TBD-unreachable-record-and-neon-crash.zh-CN.md`。**根因尚未定位**，完整目标上的 SIGSEGV 与缩出的最小错误是否同一原因还未证明。

# QCP-TBD：不可达 record 初始化失败，以及本轮 NEON 整核生成崩溃

状态：当前安装的 QCP 上已复现，正式编号待监督者分配。只在 worker 目录存草案；未改工具、未对外报告。

## 发现途径与版本

E1 W21 第二轮：按监督者批准的 C-006（x32transpose 宽高>=1）及 A_fixed（qu8-rdsum 三处行计数修复）生成实际 NEON C-body VC。QU8 保留完整正 uint64 rows 域；没有为了证明缩小 rows。原始 A/Bopt 仍在 impl/，RVV 改写版仍为工具 v1.2 输出。

当前 QCP 可执行文件及 SHA256 由各包 `proof/check.py` 动态记录到顶层 status.json 的 `qcp_binary_sha256`；应以该 hash 为身份，不能把旧 QCP2.1.4 的历史成功记录视为这份二进制的新结果。

## 1. 已缩到5行的独立失败

候选的 `proof/probes/r2/unreachable-record-if.c`：

```c
typedef struct V {unsigned int x;} V;
V make(void) /*@ Require emp Ensure store(&(__return.x),unsigned int,0) */;
void empty_if(int n)
/*@ Require n==0 && emp Ensure emp */
{if(n>0){V v=make();}}
```

`gcc -std=c11 -fsyntax-only` 退出0；QCP `--arch=64 --endian=little --no-exec-info` 退出1：

`record initializer: local address not found`（第5行）。

函数前提明确 n=0，分支不能执行，函数保持 emp 是有效目标。make 是带明确、可实现返回合同的普通声明；不需要执行它就应能生成 empty_if 的 VC。对照探针仅把前提改为 n=1，QCP 正常生成（退出0）。另有 for 循环 n==0 的同类最小失败 `unreachable-record.c`。这些 probe 不是 SIMD 语义模拟，也不是 kernel 证明结果。

统一命令（任一包）为 `python3 proof/check.py --jobs 2`：在空目录完成输入身份审计、原始/注释输入 CPP token 核对、GCC 检查、可达控制和不可达回归；当前在最后一项退出1。两个包的日志分别为 worker `r2-qu8-check.log`、`r2-x32-check.log`，完整命令、日志hash与资源在各自 `.build/check-r2-*/status.json`。

## 2. 原始强不变量 NEON 目标的实际崩溃

- QU8 A_fixed：`e1-qu8-rdsum-pair/.build/r2-neon-1793877467897611408/`，完整输入 `.c` 与原固定版 executable token 相同（加的是逻辑注释/真实 helper 合同）。QCP 约942.32秒后退出-11（SIGSEGV），没有完整 `_goal.v`，不能作 Coq 检查。没有 OOM。
- transpose 原始 A、C-006：`e1-x32transpose-pair/.build/r2-neon-1793877361739395583/`，退出-11。设置256MiB栈的新目录 `r2-neon-1793877506125049578/` 仍退出-11；不是仅默认栈过小。全部保留原 do-while 与原 vzip 调用，packed uint64 是数学 vector 表示，不是运行程序修复。
- transpose trace：`r2-neon-1793877531762281173/qcp.log` 最后停在 do 外层再次进入后，处理已经解析过的内层 Inv。去掉向量工作后仍崩溃；减少 Inv/Assert 子句后的诊断样本保存在 `proof/probes/r2/x32-do-crash-minimized.c` 与 `x32-do-crash-post-min.c`。这些是缺陷缩减输入，不是可接受的 kernel 证明替代物。
- QU8 独立缩小诊断域 channels<32 后，在原 bulk 的 struct 初始化给出 `record initializer: local address not found`，与第1节小例错误一致；该窄域只用于 probe，不在 spec.c，不是条件验证结果。目录 `r2-tail-probe-1793878565644083813/`。

第1节错误和整核 SIGSEGV 是否为同一根因**尚未证明**。这里只确认它们都阻止了当前生成流程，不把推测写成工具根因。

## 实际应用和偏离方

这是验证器行为问题，不是 A/Bopt 的新输出反例。kernel 参数可达性不适用于最小工具例；工具例本身是有明确前提的有效 C 程序，前提与原应用无关。当前无法从 QCP 失败推断 kernel 正确或错误。

## 修复计划及实验影响

1. 将当前二进制 hash、5行失败/可达对照、实际 NEON 强目标及 reduced fixture 交监督者/工具维护者诊断；不自行删不可达分支、不手改 do→while、不添加公理或放宽观察来通过。
2. 建议检查 unreachable assertion 集上的 struct local allocation/return-value initialization，以及已解析嵌套 Inv 的再次进入；这只是待查方向，不是已定位缺陷。当前没有工具补丁。
3. 修复后先重跑本组可达/不可达探针，然后在新目录重跑两个实际 NEON 目标。只有完整生成后才能迁移 Coq `VC_Correct` 实例；必须重新生成全部当前目标、证明普通 helper、RVV 逐lane copy、三种VLEN的当前Bopt，以及公开调用者/比较器完整闭包。
4. kernel 性能未测，不存在对 Bopt 的性能修改。工具修复性能也未测。
5. 原始 qu8 A≠Bopt 与 width0 transpose 差异继续保留；本轮 A_fixed 配对、C-006 配对均未完成。两个包 passed=false/whole_kernel_verified=false。
6. 不向上游或 QCP 作者发送消息。对外报告仍需用户授权。
