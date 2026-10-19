root31 是 argmaxpool 独立候选，基于 dwconv/argmax-index-r2。保持原 qualified unary-front 模型；普通 C token/spec/model 不变，source_guard=true。仅在真实 uint32 store 前后增加同一个 index cursor 断言，原 advanced/rebased 和全部 loop/helper 义务保留。两个新 cut 自身尚未证明，不代表闭合。

父 r2 advanced 的实际 none WP 位于 print-parent02.log:1268，左右均 Typed shift_uint32，index/i 经长 Mptr 更新链读取；未涉及 uintptr 地址恢复。首试 observer 模块 Not_found 保留，第二试取消 observer 仅打印成功。runner 因旧 unary ABI 不加载当前 observer，求解必须以正常 raw 覆盖为准，超时不得认 complete。
