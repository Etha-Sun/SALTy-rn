From isla Require Import opsem.

Definition a210604 : isla_trace :=
  AssumeReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
  AssumeReg "HCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x80000000%Z))) Mk_annot :t:
  AssumeReg "CFG_ID_AA64PFR0_EL1_EL3" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  AssumeReg "CFG_ID_AA64PFR0_EL1_EL2" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  AssumeReg "CFG_ID_AA64PFR0_EL1_EL1" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  AssumeReg "CFG_ID_AA64PFR0_EL1_EL0" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  AssumeReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
  AssumeReg "CPTR_EL3" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  AssumeReg "CPTR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  AssumeReg "EDSCR" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  AssumeReg "OSDLR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  AssumeReg "OSLSR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  Smt (DeclareConst 0%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 2%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 3%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 7%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 9%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 10%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 14%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 15%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 18%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 23%Z (Ty_BitVec 1%N)) Mk_annot :t:
  Smt (DeclareConst 24%Z (Ty_BitVec 1%N)) Mk_annot :t:
  AssumeReg "PSTATE" [Field "EL"] (RegVal_Base (Val_Bits (BV 2%N 0x2%Z))) Mk_annot :t:
  AssumeReg "PSTATE" [Field "SP"] (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) Mk_annot :t:
  AssumeReg "PSTATE" [Field "nRW"] (RegVal_Base (Val_Bits (BV 1%N 0x0%Z))) Mk_annot :t:
  AssumeReg "SCR_EL3" [] (RegVal_Base (Val_Bits (BV 32%N 0x501%Z))) Mk_annot :t:
  AssumeReg "SCTLR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x4000002%Z))) Mk_annot :t:
  ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
  ReadReg "CFG_ID_AA64PFR0_EL1_EL2" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  ReadReg "CFG_ID_AA64PFR0_EL1_EL3" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
  ReadReg "CFG_ID_AA64PFR0_EL1_EL0" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  ReadReg "CFG_ID_AA64PFR0_EL1_EL1" [] (RegVal_Base (Val_Bits (BV 4%N 0x1%Z))) Mk_annot :t:
  ReadReg "SCR_EL3" [] (RegVal_Base (Val_Bits (BV 32%N 0x501%Z))) Mk_annot :t:
  ReadReg "HCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x80000000%Z))) Mk_annot :t:
  ReadReg "CPTR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  ReadReg "CPTR_EL3" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
  Smt (DeclareConst 31%Z (Ty_BitVec 64%N)) Mk_annot :t:
  ReadReg "R1" [] (RegVal_Base (Val_Symbolic 31%Z)) Mk_annot :t:
  Smt (DefineConst 32%Z (Val (Val_Symbolic 31%Z) Mk_annot)) Mk_annot :t:
  Smt (DeclareConst 33%Z (Ty_BitVec 128%N)) Mk_annot :t:
  Smt (DefineConst 36%Z (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff0%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
  ReadReg "SCTLR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x4000002%Z))) Mk_annot :t:
  Smt (DefineConst 40%Z (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot)) Mk_annot :t:
  tcases [
    Smt (Assert (Val (Val_Symbolic 40%Z) Mk_annot)) Mk_annot :t:
    Smt (DeclareConst 45%Z Ty_Bool) Mk_annot :t:
    Smt (DeclareConst 140%Z (Ty_BitVec 64%N)) Mk_annot :t:
    ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 140%Z)) Mk_annot :t:
    Smt (DefineConst 141%Z (Val (Val_Symbolic 140%Z) Mk_annot)) Mk_annot :t:
    tcases [
      Smt (Assert (Val (Val_Symbolic 45%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 339%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (Assert (Val (Val_Symbolic 45%Z) Mk_annot)) Mk_annot :t:
      ReadReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "N"] (RegVal_Struct [("N", RegVal_Base (Val_Symbolic 14%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "Z"] (RegVal_Struct [("Z", RegVal_Base (Val_Symbolic 24%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "C"] (RegVal_Struct [("C", RegVal_Base (Val_Symbolic 2%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "V"] (RegVal_Struct [("V", RegVal_Base (Val_Symbolic 23%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "PAN"] (RegVal_Struct [("PAN", RegVal_Base (Val_Symbolic 15%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Symbolic 18%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Symbolic 10%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Symbolic 3%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Symbolic 0%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Symbolic 9%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Symbolic 7%Z))]) Mk_annot :t:
      Smt (DefineConst 364%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x960000a1%Z))) Mk_annot :t:
      WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 339%Z)) Mk_annot :t:
      Smt (DeclareConst 369%Z (Ty_BitVec 40%N)) Mk_annot :t:
      Smt (DeclareConst 370%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 370%Z)) Mk_annot :t:
      Smt (DefineConst 371%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 370%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 369%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 371%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 364%Z)) Mk_annot :t:
      WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 141%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      BranchAddress (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      ReadReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      tnil;
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 45%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 400%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 45%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      ReadReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "N"] (RegVal_Struct [("N", RegVal_Base (Val_Symbolic 14%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "Z"] (RegVal_Struct [("Z", RegVal_Base (Val_Symbolic 24%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "C"] (RegVal_Struct [("C", RegVal_Base (Val_Symbolic 2%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "V"] (RegVal_Struct [("V", RegVal_Base (Val_Symbolic 23%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "PAN"] (RegVal_Struct [("PAN", RegVal_Base (Val_Symbolic 15%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Symbolic 18%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Symbolic 10%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Symbolic 3%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Symbolic 0%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Symbolic 9%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Symbolic 7%Z))]) Mk_annot :t:
      Smt (DefineConst 425%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x96000021%Z))) Mk_annot :t:
      WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 400%Z)) Mk_annot :t:
      Smt (DeclareConst 430%Z (Ty_BitVec 40%N)) Mk_annot :t:
      Smt (DeclareConst 431%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 431%Z)) Mk_annot :t:
      Smt (DefineConst 432%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 431%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 430%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 432%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 425%Z)) Mk_annot :t:
      WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 141%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      BranchAddress (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      ReadReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      tnil
    ];
    Smt (Assert (Unop (Not) (Val (Val_Symbolic 40%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (Assert (Unop (Not) (Unop (Not) (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (Assert (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
    ReadReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
    Smt (DefineConst 1226%Z (Unop (Not) (Binop (Eq) (Unop (Extract 63%N 52%N) (Val (Val_Symbolic 32%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 12%N 0x0%Z)) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
    tcases [
      Smt (Assert (Val (Val_Symbolic 1226%Z) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 1490%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 1490%Z)) Mk_annot :t:
      Smt (DefineConst 1491%Z (Val (Val_Symbolic 1490%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 1689%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      ReadReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "N"] (RegVal_Struct [("N", RegVal_Base (Val_Symbolic 14%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "Z"] (RegVal_Struct [("Z", RegVal_Base (Val_Symbolic 24%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "C"] (RegVal_Struct [("C", RegVal_Base (Val_Symbolic 2%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "V"] (RegVal_Struct [("V", RegVal_Base (Val_Symbolic 23%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "PAN"] (RegVal_Struct [("PAN", RegVal_Base (Val_Symbolic 15%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Symbolic 18%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Symbolic 10%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Symbolic 3%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Symbolic 0%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Symbolic 9%Z))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Symbolic 7%Z))]) Mk_annot :t:
      Smt (DefineConst 1714%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x96000000%Z))) Mk_annot :t:
      WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 1689%Z)) Mk_annot :t:
      Smt (DeclareConst 1719%Z (Ty_BitVec 40%N)) Mk_annot :t:
      Smt (DeclareConst 1720%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1720%Z)) Mk_annot :t:
      Smt (DefineConst 1721%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 1720%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 1719%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1721%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 1714%Z)) Mk_annot :t:
      WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 1491%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      BranchAddress (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      tnil;
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 1226%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      ReadReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Symbolic 3%Z))]) Mk_annot :t:
      ReadReg "OSLSR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      ReadReg "OSDLR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      ReadReg "EDSCR" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      Smt (DefineConst 2154%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 2302%Z (Manyop Concat [Val (Val_Bits (BV 4%N 0x0%Z)) Mk_annot; Unop (Extract 51%N 0%N) (Val (Val_Symbolic 32%Z) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DefineConst 2303%Z (Unop (ZeroExtend 8%N) (Val (Val_Symbolic 2302%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 2304%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadMem (RegVal_Base (Val_Symbolic 2304%Z)) (RegVal_Poison) (RegVal_Base (Val_Symbolic 2303%Z)) 8%N None Mk_annot :t:
      Smt (DefineConst 2306%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x8%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (Assert (Binop (Eq) (Val (Val_Symbolic 2306%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 2306%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Binop (Eq) (Unop (Extract 63%N 52%N) (Val (Val_Symbolic 2306%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 12%N 0x0%Z)) Mk_annot) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 3447%Z (Val (Val_Symbolic 2306%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 3595%Z (Manyop Concat [Val (Val_Bits (BV 4%N 0x0%Z)) Mk_annot; Unop (Extract 51%N 0%N) (Val (Val_Symbolic 2306%Z) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DefineConst 3596%Z (Unop (ZeroExtend 8%N) (Val (Val_Symbolic 3595%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 3597%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadMem (RegVal_Base (Val_Symbolic 3597%Z)) (RegVal_Poison) (RegVal_Base (Val_Symbolic 3596%Z)) 8%N None Mk_annot :t:
      Smt (DefineConst 3601%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 33%Z) Mk_annot; Val (Val_Bits (BV 128%N 0xffffffffffffffff0000000000000000%Z)) Mk_annot] Mk_annot; Unop (ZeroExtend 64%N) (Val (Val_Symbolic 2304%Z) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 128%N 0xffffffffffffffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 64%N) (Val (Val_Symbolic 3597%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 128%N 0x40%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 3602%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3603%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3604%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3605%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3606%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3607%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3608%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3609%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3610%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3611%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3612%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3613%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3614%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3615%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3616%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3617%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3618%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3619%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3620%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3621%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3622%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3623%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3624%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3625%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3626%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3627%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3628%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3629%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3630%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3631%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3632%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 3633%Z (Ty_BitVec 128%N)) Mk_annot :t:
      ReadReg "_V" [] (RegVal_Vector [RegVal_Base (Val_Symbolic 3602%Z); RegVal_Base (Val_Symbolic 3603%Z); RegVal_Base (Val_Symbolic 3604%Z); RegVal_Base (Val_Symbolic 3605%Z); RegVal_Base (Val_Symbolic 3606%Z); RegVal_Base (Val_Symbolic 3607%Z); RegVal_Base (Val_Symbolic 3608%Z); RegVal_Base (Val_Symbolic 3609%Z); RegVal_Base (Val_Symbolic 3610%Z); RegVal_Base (Val_Symbolic 3611%Z); RegVal_Base (Val_Symbolic 3612%Z); RegVal_Base (Val_Symbolic 3613%Z); RegVal_Base (Val_Symbolic 3614%Z); RegVal_Base (Val_Symbolic 3615%Z); RegVal_Base (Val_Symbolic 3616%Z); RegVal_Base (Val_Symbolic 3617%Z); RegVal_Base (Val_Symbolic 3618%Z); RegVal_Base (Val_Symbolic 3619%Z); RegVal_Base (Val_Symbolic 3620%Z); RegVal_Base (Val_Symbolic 3621%Z); RegVal_Base (Val_Symbolic 3622%Z); RegVal_Base (Val_Symbolic 3623%Z); RegVal_Base (Val_Symbolic 3624%Z); RegVal_Base (Val_Symbolic 3625%Z); RegVal_Base (Val_Symbolic 3626%Z); RegVal_Base (Val_Symbolic 3627%Z); RegVal_Base (Val_Symbolic 3628%Z); RegVal_Base (Val_Symbolic 3629%Z); RegVal_Base (Val_Symbolic 3630%Z); RegVal_Base (Val_Symbolic 3631%Z); RegVal_Base (Val_Symbolic 3632%Z); RegVal_Base (Val_Symbolic 3633%Z)]) Mk_annot :t:
      WriteReg "_V" [] (RegVal_Vector [RegVal_Base (Val_Symbolic 3602%Z); RegVal_Base (Val_Symbolic 3603%Z); RegVal_Base (Val_Symbolic 3601%Z); RegVal_Base (Val_Symbolic 3605%Z); RegVal_Base (Val_Symbolic 3606%Z); RegVal_Base (Val_Symbolic 3607%Z); RegVal_Base (Val_Symbolic 3608%Z); RegVal_Base (Val_Symbolic 3609%Z); RegVal_Base (Val_Symbolic 3610%Z); RegVal_Base (Val_Symbolic 3611%Z); RegVal_Base (Val_Symbolic 3612%Z); RegVal_Base (Val_Symbolic 3613%Z); RegVal_Base (Val_Symbolic 3614%Z); RegVal_Base (Val_Symbolic 3615%Z); RegVal_Base (Val_Symbolic 3616%Z); RegVal_Base (Val_Symbolic 3617%Z); RegVal_Base (Val_Symbolic 3618%Z); RegVal_Base (Val_Symbolic 3619%Z); RegVal_Base (Val_Symbolic 3620%Z); RegVal_Base (Val_Symbolic 3621%Z); RegVal_Base (Val_Symbolic 3622%Z); RegVal_Base (Val_Symbolic 3623%Z); RegVal_Base (Val_Symbolic 3624%Z); RegVal_Base (Val_Symbolic 3625%Z); RegVal_Base (Val_Symbolic 3626%Z); RegVal_Base (Val_Symbolic 3627%Z); RegVal_Base (Val_Symbolic 3628%Z); RegVal_Base (Val_Symbolic 3629%Z); RegVal_Base (Val_Symbolic 3630%Z); RegVal_Base (Val_Symbolic 3631%Z); RegVal_Base (Val_Symbolic 3632%Z); RegVal_Base (Val_Symbolic 3633%Z)]) Mk_annot :t:
      Smt (DefineConst 3635%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x10%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "R1" [] (RegVal_Base (Val_Symbolic 3635%Z)) Mk_annot :t:
      Smt (DeclareConst 3636%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 3636%Z)) Mk_annot :t:
      Smt (DefineConst 3637%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 3636%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Symbolic 3637%Z)) Mk_annot :t:
      tnil
    ]
  ]
.
