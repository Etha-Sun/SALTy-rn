read02对真实membytes_le定义作body分解：encode32四byte → block写四map.set → block读单byte → memory层四个位置。全部let lemma都有body且在同一文件，根须执行全部VC，不得只以最终lemma引用前面合同作为通过。无axiom/assume/requires，也不改旧share或锁。Why3 --type-only已通过；transformed.why为仅变换导出、不是求解成绩。

原read01使用EuclideanDivision错误覆盖负整数；见旧目录ERRATA。这里使用实际ComputerDivision，适用于全整数定义。division-controls.mlw一真一故意false，辅助确认除法语义；原C uint32域非负但没有据此偷加目标前提。
