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
  AssumeReg "SCTLR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x4000000%Z))) Mk_annot :t:
  Smt (DeclareConst 26%Z (Ty_BitVec 64%N)) Mk_annot :t:
  Assume (AExp_Binop ((Bvcomp Bvuge)) (AExp_Val (AVal_Var "R1" []) Mk_annot) (AExp_Val (AVal_Bits (BV 64%N 0x80000000%Z)) Mk_annot) Mk_annot) Mk_annot :t:
  Smt (Assert (Binop ((Bvcomp Bvuge)) (Val (Val_Symbolic 26%Z) Mk_annot) (Val (Val_Bits (BV 64%N 0x80000000%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  Assume (AExp_Binop ((Bvcomp Bvule)) (AExp_Val (AVal_Var "R1" []) Mk_annot) (AExp_Val (AVal_Bits (BV 64%N 0x83fffff0%Z)) Mk_annot) Mk_annot) Mk_annot :t:
  Smt (Assert (Binop ((Bvcomp Bvule)) (Val (Val_Symbolic 26%Z) Mk_annot) (Val (Val_Bits (BV 64%N 0x83fffff0%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
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
  ReadReg "R1" [] (RegVal_Base (Val_Symbolic 26%Z)) Mk_annot :t:
  Smt (DefineConst 32%Z (Val (Val_Symbolic 26%Z) Mk_annot)) Mk_annot :t:
  Smt (DeclareConst 33%Z (Ty_BitVec 128%N)) Mk_annot :t:
  Smt (DefineConst 36%Z (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff0%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
  ReadReg "SCTLR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x4000000%Z))) Mk_annot :t:
  Smt (DefineConst 71%Z (Unop (Not) (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
  tcases [
    Smt (Assert (Val (Val_Symbolic 71%Z) Mk_annot)) Mk_annot :t:
    Smt (Assert (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xffffffffffffffff%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
    ReadReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
    Smt (Assert (Unop (Not) (Unop (Not) (Binop (Eq) (Unop (Extract 63%N 52%N) (Val (Val_Symbolic 32%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 12%N 0x0%Z)) Mk_annot) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (Assert (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (DeclareConst 937%Z Ty_Bool) Mk_annot :t:
    Smt (DeclareConst 1197%Z (Ty_BitVec 64%N)) Mk_annot :t:
    ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 1197%Z)) Mk_annot :t:
    Smt (DefineConst 1198%Z (Val (Val_Symbolic 1197%Z) Mk_annot)) Mk_annot :t:
    tcases [
      Smt (Assert (Val (Val_Symbolic 937%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 1396%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (Assert (Val (Val_Symbolic 937%Z) Mk_annot)) Mk_annot :t:
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
      Smt (DefineConst 1421%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x960000a1%Z))) Mk_annot :t:
      WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 1396%Z)) Mk_annot :t:
      Smt (DeclareConst 1426%Z (Ty_BitVec 40%N)) Mk_annot :t:
      Smt (DeclareConst 1427%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1427%Z)) Mk_annot :t:
      Smt (DefineConst 1428%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 1427%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 1426%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1428%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 1421%Z)) Mk_annot :t:
      WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 1198%Z)) Mk_annot :t:
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
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 937%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 1457%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 937%Z) Mk_annot) Mk_annot)) Mk_annot :t:
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
      Smt (DefineConst 1482%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x96000021%Z))) Mk_annot :t:
      WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 1457%Z)) Mk_annot :t:
      Smt (DeclareConst 1487%Z (Ty_BitVec 40%N)) Mk_annot :t:
      Smt (DeclareConst 1488%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1488%Z)) Mk_annot :t:
      Smt (DefineConst 1489%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 1488%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 1487%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 1489%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
      WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 1482%Z)) Mk_annot :t:
      WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 1198%Z)) Mk_annot :t:
      WriteReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
      WriteReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
      ReadReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
      BranchAddress (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
      tnil
    ];
    Smt (Assert (Unop (Not) (Val (Val_Symbolic 71%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (Assert (Binop (Eq) (Val (Val_Symbolic 32%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
    ReadReg "TCR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
    Smt (Assert (Unop (Not) (Unop (Not) (Binop (Eq) (Unop (Extract 63%N 52%N) (Val (Val_Symbolic 32%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 12%N 0x0%Z)) Mk_annot) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (DefineConst 2277%Z (Unop (Extract 51%N 0%N) (Val (Val_Symbolic 32%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (DefineConst 2377%Z (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    tcases [
      Smt (Assert (Val (Val_Symbolic 2377%Z) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 2382%Z Ty_Bool) Mk_annot :t:
      Smt (DeclareConst 2642%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 2642%Z)) Mk_annot :t:
      Smt (DefineConst 2643%Z (Val (Val_Symbolic 2642%Z) Mk_annot)) Mk_annot :t:
      tcases [
        Smt (Assert (Val (Val_Symbolic 2382%Z) Mk_annot)) Mk_annot :t:
        Smt (DefineConst 2841%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
        Smt (Assert (Val (Val_Symbolic 2382%Z) Mk_annot)) Mk_annot :t:
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
        Smt (DefineConst 2866%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
        WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x960000a1%Z))) Mk_annot :t:
        WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 2841%Z)) Mk_annot :t:
        Smt (DeclareConst 2871%Z (Ty_BitVec 40%N)) Mk_annot :t:
        Smt (DeclareConst 2872%Z (Ty_BitVec 64%N)) Mk_annot :t:
        ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 2872%Z)) Mk_annot :t:
        Smt (DefineConst 2873%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 2872%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 2871%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
        WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 2873%Z)) Mk_annot :t:
        WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
        WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 2866%Z)) Mk_annot :t:
        WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 2643%Z)) Mk_annot :t:
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
        Smt (Assert (Unop (Not) (Val (Val_Symbolic 2382%Z) Mk_annot) Mk_annot)) Mk_annot :t:
        Smt (DefineConst 2902%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
        Smt (Assert (Unop (Not) (Val (Val_Symbolic 2382%Z) Mk_annot) Mk_annot)) Mk_annot :t:
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
        Smt (DefineConst 2927%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 14%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 24%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 2%Z) Mk_annot; Val (Val_Symbolic 23%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x1c%Z)) Mk_annot) Mk_annot; Val (Val_Bits (BV 32%N 0xffbfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 15%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x16%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffdfffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 18%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x15%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffefffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 31%N) (Val (Val_Symbolic 10%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x14%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffc3f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 28%N) (Manyop Concat [Val (Val_Symbolic 3%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 0%Z) Mk_annot; Manyop Concat [Val (Val_Symbolic 9%Z) Mk_annot; Val (Val_Symbolic 7%Z) Mk_annot] Mk_annot] Mk_annot] Mk_annot) Mk_annot) (Val (Val_Bits (BV 32%N 0x6%Z)) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xffffffef%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffff3%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x8%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0xfffffffe%Z)) Mk_annot] Mk_annot; Val (Val_Bits (BV 32%N 0x1%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
        WriteReg "ESR_EL2" [] (RegVal_Base (Val_Bits (BV 32%N 0x96000021%Z))) Mk_annot :t:
        WriteReg "FAR_EL2" [] (RegVal_Base (Val_Symbolic 2902%Z)) Mk_annot :t:
        Smt (DeclareConst 2932%Z (Ty_BitVec 40%N)) Mk_annot :t:
        Smt (DeclareConst 2933%Z (Ty_BitVec 64%N)) Mk_annot :t:
        ReadReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 2933%Z)) Mk_annot :t:
        Smt (DefineConst 2934%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 2933%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffff0000000000f%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 24%N) (Val (Val_Symbolic 2932%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
        WriteReg "HPFAR_EL2" [] (RegVal_Base (Val_Symbolic 2934%Z)) Mk_annot :t:
        WriteReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "SP"] (RegVal_Struct [("SP", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        ReadReg "PSTATE" [Field "nRW"] (RegVal_Struct [("nRW", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        ReadReg "PSTATE" [Field "EL"] (RegVal_Struct [("EL", RegVal_Base (Val_Bits (BV 2%N 0x2%Z)))]) Mk_annot :t:
        WriteReg "SPSR_EL2" [] (RegVal_Base (Val_Symbolic 2927%Z)) Mk_annot :t:
        WriteReg "ELR_EL2" [] (RegVal_Base (Val_Symbolic 2643%Z)) Mk_annot :t:
        WriteReg "PSTATE" [Field "SS"] (RegVal_Struct [("SS", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "A"] (RegVal_Struct [("A", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "I"] (RegVal_Struct [("I", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "F"] (RegVal_Struct [("F", RegVal_Base (Val_Bits (BV 1%N 0x1%Z)))]) Mk_annot :t:
        WriteReg "PSTATE" [Field "IL"] (RegVal_Struct [("IL", RegVal_Base (Val_Bits (BV 1%N 0x0%Z)))]) Mk_annot :t:
        ReadReg "VBAR_EL2" [] (RegVal_Base (Val_Bits (BV 64%N 0x0%Z))) Mk_annot :t:
        BranchAddress (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
        WriteReg "_PC" [] (RegVal_Base (Val_Bits (BV 64%N 0x200%Z))) Mk_annot :t:
        tnil
      ];
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 2377%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      ReadReg "PSTATE" [Field "D"] (RegVal_Struct [("D", RegVal_Base (Val_Symbolic 3%Z))]) Mk_annot :t:
      ReadReg "OSLSR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      ReadReg "OSDLR_EL1" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      ReadReg "EDSCR" [] (RegVal_Base (Val_Bits (BV 32%N 0x0%Z))) Mk_annot :t:
      Smt (DefineConst 3241%Z (Val (Val_Symbolic 32%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 3389%Z (Manyop Concat [Val (Val_Bits (BV 4%N 0x0%Z)) Mk_annot; Val (Val_Symbolic 2277%Z) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DefineConst 3390%Z (Unop (ZeroExtend 8%N) (Val (Val_Symbolic 3389%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 3391%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadMem (RegVal_Base (Val_Symbolic 3391%Z)) (RegVal_Poison) (RegVal_Base (Val_Symbolic 3390%Z)) 8%N None Mk_annot :t:
      Smt (DefineConst 3393%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x8%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (Assert (Binop (Eq) (Val (Val_Symbolic 3393%Z) Mk_annot) (Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 3393%Z) Mk_annot; Val (Val_Bits (BV 64%N 0xfffffffffffffff8%Z)) Mk_annot] Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Binop (Eq) (Unop (Extract 63%N 52%N) (Val (Val_Symbolic 3393%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 12%N 0x0%Z)) Mk_annot) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (Assert (Unop (Not) (Unop (Not) (Val (Val_Symbolic 36%Z) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 4534%Z (Val (Val_Symbolic 3393%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 4682%Z (Manyop Concat [Val (Val_Bits (BV 4%N 0x0%Z)) Mk_annot; Unop (Extract 51%N 0%N) (Val (Val_Symbolic 3393%Z) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DefineConst 4683%Z (Unop (ZeroExtend 8%N) (Val (Val_Symbolic 4682%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 4684%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadMem (RegVal_Base (Val_Symbolic 4684%Z)) (RegVal_Poison) (RegVal_Base (Val_Symbolic 4683%Z)) 8%N None Mk_annot :t:
      Smt (DefineConst 4688%Z (Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Manyop (Bvmanyarith Bvor) [Manyop (Bvmanyarith Bvand) [Val (Val_Symbolic 33%Z) Mk_annot; Val (Val_Bits (BV 128%N 0xffffffffffffffff0000000000000000%Z)) Mk_annot] Mk_annot; Unop (ZeroExtend 64%N) (Val (Val_Symbolic 3391%Z) Mk_annot) Mk_annot] Mk_annot; Val (Val_Bits (BV 128%N 0xffffffffffffffff%Z)) Mk_annot] Mk_annot; Binop ((Bvarith Bvshl)) (Unop (ZeroExtend 64%N) (Val (Val_Symbolic 4684%Z) Mk_annot) Mk_annot) (Val (Val_Bits (BV 128%N 0x40%Z)) Mk_annot) Mk_annot] Mk_annot)) Mk_annot :t:
      Smt (DeclareConst 4689%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4690%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4691%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4692%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4693%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4694%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4695%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4696%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4697%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4698%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4699%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4700%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4701%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4702%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4703%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4704%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4705%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4706%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4707%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4708%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4709%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4710%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4711%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4712%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4713%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4714%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4715%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4716%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4717%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4718%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4719%Z (Ty_BitVec 128%N)) Mk_annot :t:
      Smt (DeclareConst 4720%Z (Ty_BitVec 128%N)) Mk_annot :t:
      ReadReg "_V" [] (RegVal_Vector [RegVal_Base (Val_Symbolic 4689%Z); RegVal_Base (Val_Symbolic 4690%Z); RegVal_Base (Val_Symbolic 4691%Z); RegVal_Base (Val_Symbolic 4692%Z); RegVal_Base (Val_Symbolic 4693%Z); RegVal_Base (Val_Symbolic 4694%Z); RegVal_Base (Val_Symbolic 4695%Z); RegVal_Base (Val_Symbolic 4696%Z); RegVal_Base (Val_Symbolic 4697%Z); RegVal_Base (Val_Symbolic 4698%Z); RegVal_Base (Val_Symbolic 4699%Z); RegVal_Base (Val_Symbolic 4700%Z); RegVal_Base (Val_Symbolic 4701%Z); RegVal_Base (Val_Symbolic 4702%Z); RegVal_Base (Val_Symbolic 4703%Z); RegVal_Base (Val_Symbolic 4704%Z); RegVal_Base (Val_Symbolic 4705%Z); RegVal_Base (Val_Symbolic 4706%Z); RegVal_Base (Val_Symbolic 4707%Z); RegVal_Base (Val_Symbolic 4708%Z); RegVal_Base (Val_Symbolic 4709%Z); RegVal_Base (Val_Symbolic 4710%Z); RegVal_Base (Val_Symbolic 4711%Z); RegVal_Base (Val_Symbolic 4712%Z); RegVal_Base (Val_Symbolic 4713%Z); RegVal_Base (Val_Symbolic 4714%Z); RegVal_Base (Val_Symbolic 4715%Z); RegVal_Base (Val_Symbolic 4716%Z); RegVal_Base (Val_Symbolic 4717%Z); RegVal_Base (Val_Symbolic 4718%Z); RegVal_Base (Val_Symbolic 4719%Z); RegVal_Base (Val_Symbolic 4720%Z)]) Mk_annot :t:
      WriteReg "_V" [] (RegVal_Vector [RegVal_Base (Val_Symbolic 4689%Z); RegVal_Base (Val_Symbolic 4690%Z); RegVal_Base (Val_Symbolic 4688%Z); RegVal_Base (Val_Symbolic 4692%Z); RegVal_Base (Val_Symbolic 4693%Z); RegVal_Base (Val_Symbolic 4694%Z); RegVal_Base (Val_Symbolic 4695%Z); RegVal_Base (Val_Symbolic 4696%Z); RegVal_Base (Val_Symbolic 4697%Z); RegVal_Base (Val_Symbolic 4698%Z); RegVal_Base (Val_Symbolic 4699%Z); RegVal_Base (Val_Symbolic 4700%Z); RegVal_Base (Val_Symbolic 4701%Z); RegVal_Base (Val_Symbolic 4702%Z); RegVal_Base (Val_Symbolic 4703%Z); RegVal_Base (Val_Symbolic 4704%Z); RegVal_Base (Val_Symbolic 4705%Z); RegVal_Base (Val_Symbolic 4706%Z); RegVal_Base (Val_Symbolic 4707%Z); RegVal_Base (Val_Symbolic 4708%Z); RegVal_Base (Val_Symbolic 4709%Z); RegVal_Base (Val_Symbolic 4710%Z); RegVal_Base (Val_Symbolic 4711%Z); RegVal_Base (Val_Symbolic 4712%Z); RegVal_Base (Val_Symbolic 4713%Z); RegVal_Base (Val_Symbolic 4714%Z); RegVal_Base (Val_Symbolic 4715%Z); RegVal_Base (Val_Symbolic 4716%Z); RegVal_Base (Val_Symbolic 4717%Z); RegVal_Base (Val_Symbolic 4718%Z); RegVal_Base (Val_Symbolic 4719%Z); RegVal_Base (Val_Symbolic 4720%Z)]) Mk_annot :t:
      Smt (DefineConst 4722%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 32%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x10%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "R1" [] (RegVal_Base (Val_Symbolic 4722%Z)) Mk_annot :t:
      Smt (DeclareConst 4723%Z (Ty_BitVec 64%N)) Mk_annot :t:
      ReadReg "_PC" [] (RegVal_Base (Val_Symbolic 4723%Z)) Mk_annot :t:
      Smt (DefineConst 4724%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 4723%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
      WriteReg "_PC" [] (RegVal_Base (Val_Symbolic 4724%Z)) Mk_annot :t:
      tnil
    ]
  ]
.
