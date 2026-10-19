# 独立 Bytes/IEEE v3 后端适配实验（未资格认证）

v2 的7个 canonical byte/frame 目标失败，在同源 v1 对照中全部由 CVC5 通过；不归因于四个forall事实。v3保留v2已证支持模块和原native编码，恢复固定CVC5对其支持的任务的求解能力。

适配器只读取实际SMT文件：若含固定CVC5不支持的fp.to_ieee_bv，明确返回unknown，交由Z3求解；否则原参数、原文件直接交给原CVC5 binary。没有重写SMT、没有抽象编码或将unsupported记作证明/负控制通过。

本目录仍未资格认证，未用于kernel；所有控制和依赖需实际通过、新锁与独立checker验收后才能考虑新冻结候选。
