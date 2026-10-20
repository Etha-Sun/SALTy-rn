# qs8-vmul-minmax-fp32

选v10；同候选full825/877，无source globals；52欠：caller34、byte stores8、reinterpret10。9个算术/shift helper中原11条失败在full闭合，新增power/quotient全部body/pre过。未纳入v08/v09失败global lemma。

候选路径/hash/seed来源见selection.json；full与focus独立raw、global及具体pending见上级final-results.json与每版本evidence.json/blockers.json。所有旧版和负结果保留，不继承绿色。
