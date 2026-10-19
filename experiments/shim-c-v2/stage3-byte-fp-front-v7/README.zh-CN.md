# 独立 Bytes/IEEE v7（未资格认证）

v6新增已证明memory read/write及浮点store/load/frame组合引理；每条均有body，依赖由v16真实证明。保留v6失败控制与旧锁；未用于kernel。CVC5仅删除含不支持encoder的已证store推论（加强目标），原生Z3保留。仍须新share重放、正反内存/IEEE回归及完整已过案例。
