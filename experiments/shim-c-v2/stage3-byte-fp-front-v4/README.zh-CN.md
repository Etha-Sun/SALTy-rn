# 独立 Bytes/IEEE v4：已证 decode 单射支持（未资格认证）

仅新增有完整body及已证依赖的32/64有界整数decode单射。复制的每个模块须核对源SHA与原重放；不引入公理。Z3保留全部已证支持。CVC5 driver仅移除12条已证支持假设（加强目标），保留不含不支持编码原语的decode单射；真实目标仍含fp.to_ieee_bv时adapter明确unknown，绝不改写实际SMT。旧版本保留，控制源原样。未用于任何kernel，尚须正反控制及完整资格验收。
