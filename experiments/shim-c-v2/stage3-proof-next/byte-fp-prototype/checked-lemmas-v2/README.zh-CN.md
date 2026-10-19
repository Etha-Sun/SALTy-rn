# 后端资格更正

实际运行已确认：CVC5 1.2.1 不支持当前 encoder 使用的 `fp.to_ieee_bv`，6个正VC与2个逆关系负goal均 HighFailure/parse error；false单独为Unknown。这些后端错误绝不能算负控制有效拒绝，导出exit0不代表solver支持。旧driver/v1快照保留不变，本独立v2的 `z3-only.conf` 明确仅保留原固定Z3 native配置，没有猜测或替换语义。

Z3实际body证明4/6 Valid：两种宽度的decode_encode和encode范围；两条非NaN encode_decode在30秒预算超时，不导入。`z3-proved-subset.mlw` 仅复制四个原已过body，互不依赖，没有添加/弱化事实；该新文件仍需root独立重验，精确命令见z3-only-commands.json。新share采用仍未授权为已通过，实际C控制也必须全部按Z3后端重新验证。

以下为最初准备记录，已由上述实际后端结果修正：

# 独立有 body codec 引理候选 v2

当前仅完成 Why3 解析及原生 SMT 导出，未运行 solver、未证明、未加入任何 share/模型。v1 和旧环境完全不变。

`checked.mlw` 有六个独立 module，每个仅导入原生 codec，不导入其它候选引理。每个 `let lemma` 都有真实 `= ()` body，确保其 ensures 本身生成证明义务，没有 axiom、assume、admit 或外部无 body 合同：

- binary32/64 的 decode(encode(v,seed)) = v。
- 0 <= n < 2^width 且 decode(n) 非 NaN 时，encode(decode(n),seed) = n。
- encode 范围 0 <= encode(v,seed) < 2^width。

第一条是原生 SMT FP 排序的逻辑等号，不是 C 的 `==`/SMT `fp.eq`：同一 NaN 抽象值可逻辑自等，±0 仍须区分。它绝不表示保留 NaN payload/sign。第二条明确排除 NaN 逆向逐位关系，只是引理的条件蕴含，不改变任何 kernel 输入域。seed 全称量化、无范围限制。

`negative.mlw` 包含无条件 bitwise 逆关系（32/64，只有合法整数位宽限制）及 false，必须不被证明。这些是 goal，不会作为 lemma 被其它模块假定。

`commands.json` 给出四条无 solver 导出命令及四条 root 执行求解命令，固定 Why3 路径、v1 native driver/config/share，单任务30秒、2048MB。导出已经运行：四批 exit0，每个 solver 6正VC、3负goal；保留原始 SMT、命令、退出码和 SHA。`export-audit.json` 标明 native codec、无未解释 codec 名及无旧逆公理。没有将正常导出等同证明成功。

风险与后续：

1. Why3 的 lemma 即使未证明也可能被后续 import 当成事实。当前各module隔离；禁止把该文件直接加入公共share，必须所有正VC实际通过、负控未证，并保留driver/source/binary/SMT SHA后，另建独立share候选。
2. 必须用两个已审查的native drivers。它们将codec原语解释成真正FP/BV运算；不能用未解释codec或Real配置得到结果。
3. 这些goal验证原生codec关系，不验证WP fresh seed作用域、地址/数组/memcpy桥、边界分离、endianness或调用覆盖。新share采用后仍须重做真实C正反控制、IEEE/FMA回归及严格smoke。
4. 量化FP与int/BV转换可能仍超时；不能以超时当反例、降低精度或添加有限/非NaN kernel前提。若需实例化策略应另建候选，不能把未证引理投入下游。
