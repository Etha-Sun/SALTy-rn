From isla Require Import opsem.
Require Import RvvLiterals.
Definition load_prefix (tail : isla_trace) : isla_trace :=

  AssumeReg "elen" [] (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) Mk_annot :t:
  AssumeReg "vlen" [] (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) Mk_annot :t:
  AssumeReg "cur_privilege" [] (RegVal_Base (Val_Enum "Machine")) Mk_annot :t:
  AssumeReg "misa" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200104%Z)))]) Mk_annot :t:
  AssumeReg "rv_enable_zfinx" [] (RegVal_Base (Val_Bool false)) Mk_annot :t:
  AssumeReg "rv_pmp_count" [] (RegVal_I 0%Z 64%Z) Mk_annot :t:
  AssumeReg "rv_enable_vext" [] (RegVal_Base (Val_Bool true)) Mk_annot :t:
  AssumeReg "mstatus" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) Mk_annot :t:
  AssumeReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
  AssumeReg "vlenb" [] (RegVal_Base (Val_Bits (BV 64%N 0x20%Z))) Mk_annot :t:
  AssumeReg "vtype" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x90%Z)))]) Mk_annot :t:
  AssumeReg "rv_enable_misaligned_access" [] (RegVal_Base (Val_Bool false)) Mk_annot :t:
  AssumeReg "rv_ram_base" [] (RegVal_Base (Val_Bits (BV 64%N 0x80000000%Z))) Mk_annot :t:
  AssumeReg "rv_ram_size" [] (RegVal_Base (Val_Bits (BV 64%N 0x4000000%Z))) Mk_annot :t:
  AssumeReg "rv_rom_base" [] (RegVal_Base (Val_Bits (BV 64%N 0x1000%Z))) Mk_annot :t:
  AssumeReg "rv_rom_size" [] (RegVal_Base (Val_Bits (BV 64%N 0x100%Z))) Mk_annot :t:
  AssumeReg "rv_clint_base" [] (RegVal_Base (Val_Bits (BV 64%N 0x2000000%Z))) Mk_annot :t:
  AssumeReg "rv_clint_size" [] (RegVal_Base (Val_Bits (BV 64%N 0xc0000%Z))) Mk_annot :t:
  AssumeReg "rv_htif_tohost" [] (RegVal_Base (Val_Bits (BV 64%N 0x40001000%Z))) Mk_annot :t:
  Smt (DeclareConst 0%Z (Ty_BitVec 64%N)) Mk_annot :t:
  Assume (AExp_Binop ((Bvcomp Bvule)) (AExp_Val (AVal_Var "vl" []) Mk_annot) (AExp_Val (AVal_Bits (BV 64%N 0x8%Z)) Mk_annot) Mk_annot) Mk_annot :t:
  Smt (Assert (Binop ((Bvcomp Bvule)) (Val (Val_Symbolic 0%Z) Mk_annot) (Val (Val_Bits (BV 64%N 0x8%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DeclareConst 1%Z (Ty_BitVec 64%N)) Mk_annot :t:
  Assume (AExp_Binop ((Bvcomp Bvuge)) (AExp_Val (AVal_Var "x11" []) Mk_annot) (AExp_Val (AVal_Bits (BV 64%N 0x80000000%Z)) Mk_annot) Mk_annot) Mk_annot :t:
  Smt (Assert (Binop ((Bvcomp Bvuge)) (Val (Val_Symbolic 1%Z) Mk_annot) (Val (Val_Bits (BV 64%N 0x80000000%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  Assume (AExp_Binop ((Bvcomp Bvule)) (AExp_Val (AVal_Var "x11" []) Mk_annot) (AExp_Val (AVal_Bits (BV 64%N 0x83fffff8%Z)) Mk_annot) Mk_annot) Mk_annot :t:
  Smt (Assert (Binop ((Bvcomp Bvule)) (Val (Val_Symbolic 1%Z) Mk_annot) (Val (Val_Bits (BV 64%N 0x83fffff8%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DeclareConst 2%Z (Ty_BitVec 64%N)) Mk_annot :t:
  ReadReg "PC" [] (RegVal_Base (Val_Symbolic 2%Z)) Mk_annot :t:
  Smt (DefineConst 3%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
  ReadReg "misa" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200104%Z)))]) Mk_annot :t:
  ReadReg "rv_enable_zfinx" [] (RegVal_Base (Val_Bool false)) Mk_annot :t:
  ReadReg "mstatus" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) Mk_annot :t:
  ReadReg "vtype" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x90%Z)))]) Mk_annot :t:
  ReadReg "vlenb" [] (RegVal_Base (Val_Bits (BV 64%N 0x20%Z))) Mk_annot :t:
  ReadReg "elen" [] (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) Mk_annot :t:
  Smt (DeclareConst 5%Z (Ty_BitVec 65536%N)) Mk_annot :t:
  ReadReg "vr0" [] (RegVal_Base (Val_Symbolic 5%Z)) Mk_annot :t:
  Smt (DeclareConst 11%Z (Ty_BitVec 65536%N)) Mk_annot :t:
  ReadReg "vr2" [] (RegVal_Base (Val_Symbolic 11%Z)) Mk_annot :t:
  Smt (DefineConst 46%Z (Unop (ZeroExtend 0%N) (Unop (Extract 7%N 0%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 48%Z (Unop (ZeroExtend 0%N) (Unop (Extract 15%N 8%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 50%Z (Unop (ZeroExtend 0%N) (Unop (Extract 23%N 16%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 52%Z (Unop (ZeroExtend 0%N) (Unop (Extract 31%N 24%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 54%Z (Unop (ZeroExtend 0%N) (Unop (Extract 39%N 32%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 56%Z (Unop (ZeroExtend 0%N) (Unop (Extract 47%N 40%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 58%Z (Unop (ZeroExtend 0%N) (Unop (Extract 55%N 48%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 60%Z (Unop (ZeroExtend 0%N) (Unop (Extract 63%N 56%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 62%Z (Unop (ZeroExtend 0%N) (Unop (Extract 71%N 64%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 64%Z (Unop (ZeroExtend 0%N) (Unop (Extract 79%N 72%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 66%Z (Unop (ZeroExtend 0%N) (Unop (Extract 87%N 80%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 68%Z (Unop (ZeroExtend 0%N) (Unop (Extract 95%N 88%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 70%Z (Unop (ZeroExtend 0%N) (Unop (Extract 103%N 96%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 72%Z (Unop (ZeroExtend 0%N) (Unop (Extract 111%N 104%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 74%Z (Unop (ZeroExtend 0%N) (Unop (Extract 119%N 112%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 76%Z (Unop (ZeroExtend 0%N) (Unop (Extract 127%N 120%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 78%Z (Unop (ZeroExtend 0%N) (Unop (Extract 135%N 128%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 80%Z (Unop (ZeroExtend 0%N) (Unop (Extract 143%N 136%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 82%Z (Unop (ZeroExtend 0%N) (Unop (Extract 151%N 144%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 84%Z (Unop (ZeroExtend 0%N) (Unop (Extract 159%N 152%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 86%Z (Unop (ZeroExtend 0%N) (Unop (Extract 167%N 160%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 88%Z (Unop (ZeroExtend 0%N) (Unop (Extract 175%N 168%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 90%Z (Unop (ZeroExtend 0%N) (Unop (Extract 183%N 176%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 92%Z (Unop (ZeroExtend 0%N) (Unop (Extract 191%N 184%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 94%Z (Unop (ZeroExtend 0%N) (Unop (Extract 199%N 192%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 96%Z (Unop (ZeroExtend 0%N) (Unop (Extract 207%N 200%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 98%Z (Unop (ZeroExtend 0%N) (Unop (Extract 215%N 208%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 100%Z (Unop (ZeroExtend 0%N) (Unop (Extract 223%N 216%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 102%Z (Unop (ZeroExtend 0%N) (Unop (Extract 231%N 224%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 104%Z (Unop (ZeroExtend 0%N) (Unop (Extract 239%N 232%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 106%Z (Unop (ZeroExtend 0%N) (Unop (Extract 247%N 240%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 108%Z (Unop (ZeroExtend 0%N) (Unop (Extract 255%N 248%N) (Val (Val_Symbolic 11%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  ReadReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
  ReadReg "vlen" [] (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) Mk_annot :t:
  ReadReg "vl" [] (RegVal_Base (Val_Symbolic 0%Z)) Mk_annot :t:
  Smt (DefineConst 110%Z (Binop ((Bvarith Bvsub)) (Unop (ZeroExtend 64%N) (Val (Val_Symbolic 0%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 128%N 0x1%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 113%Z (Binop ((Bvcomp Bvsgt)) (Val (Val_Bits (BV 128%N 0x0%Z)) Mk_annot) (Val (Val_Symbolic 110%Z) Mk_annot) Mk_annot)) Mk_annot :t:
tail.
