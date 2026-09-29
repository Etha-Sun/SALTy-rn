From isla Require Import opsem.

Definition a800001c6 : isla_trace :=
  AssumeReg "elen" [] (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) Mk_annot :t:
  AssumeReg "vlen" [] (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) Mk_annot :t:
  AssumeReg "misa" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200100%Z)))]) Mk_annot :t:
  AssumeReg "rv_enable_zfinx" [] (RegVal_Base (Val_Bool false)) Mk_annot :t:
  AssumeReg "mstatus" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) Mk_annot :t:
  AssumeReg "vtype" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0xd3%Z)))]) Mk_annot :t:
  Smt (DeclareConst 0%Z (Ty_BitVec 64%N)) Mk_annot :t:
  ReadReg "PC" [] (RegVal_Base (Val_Symbolic 0%Z)) Mk_annot :t:
  Smt (DefineConst 1%Z (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 0%Z) Mk_annot; Val (Val_Bits (BV 64%N 0x4%Z)) Mk_annot] Mk_annot)) Mk_annot :t:
  ReadReg "misa" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200100%Z)))]) Mk_annot :t:
  ReadReg "rv_enable_zfinx" [] (RegVal_Base (Val_Bool false)) Mk_annot :t:
  ReadReg "mstatus" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) Mk_annot :t:
  ReadReg "vlen" [] (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) Mk_annot :t:
  ReadReg "elen" [] (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) Mk_annot :t:
  ReadReg "vtype" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0xd3%Z)))]) Mk_annot :t:
  WriteReg "vtype" [Field "bits"] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) Mk_annot :t:
  ReadReg "vtype" [] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) Mk_annot :t:
  Smt (DeclareConst 2%Z (Ty_BitVec 64%N)) Mk_annot :t:
  ReadReg "x10" [] (RegVal_Base (Val_Symbolic 2%Z)) Mk_annot :t:
  Smt (DefineConst 3%Z (Unop (ZeroExtend 64%N) (Val (Val_Symbolic 2%Z) Mk_annot) Mk_annot)) Mk_annot :t:
  Smt (DefineConst 4%Z (Binop ((Bvcomp Bvsle)) (Val (Val_Symbolic 3%Z) Mk_annot) (Val (Val_Bits (BV 128%N 0x40%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
  tcases [
    Smt (Assert (Val (Val_Symbolic 4%Z) Mk_annot)) Mk_annot :t:
    Smt (DefineConst 5%Z (Unop (Extract 63%N 0%N) (Val (Val_Symbolic 3%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    WriteReg "vl" [] (RegVal_Base (Val_Symbolic 5%Z)) Mk_annot :t:
    ReadReg "vl" [] (RegVal_Base (Val_Symbolic 5%Z)) Mk_annot :t:
    WriteReg "x15" [] (RegVal_Base (Val_Symbolic 5%Z)) Mk_annot :t:
    ReadReg "vtype" [Field "bits"] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) Mk_annot :t:
    WriteReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
    ReadReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
    WriteReg "PC" [] (RegVal_Base (Val_Symbolic 1%Z)) Mk_annot :t:
    tnil;
    Smt (Assert (Unop (Not) (Val (Val_Symbolic 4%Z) Mk_annot) Mk_annot)) Mk_annot :t:
    Smt (DefineConst 6%Z (Binop ((Bvcomp Bvslt)) (Val (Val_Symbolic 3%Z) Mk_annot) (Val (Val_Bits (BV 128%N 0x80%Z)) Mk_annot) Mk_annot)) Mk_annot :t:
    tcases [
      Smt (Assert (Val (Val_Symbolic 6%Z) Mk_annot)) Mk_annot :t:
      Smt (DefineConst 9%Z (Unop (Extract 63%N 0%N) (Binop ((Bvarith Bvsdiv)) (Manyop (Bvmanyarith Bvadd) [Val (Val_Symbolic 3%Z) Mk_annot; Val (Val_Bits (BV 128%N 0x1%Z)) Mk_annot] Mk_annot) (Val (Val_Bits (BV 128%N 0x2%Z)) Mk_annot) Mk_annot) Mk_annot)) Mk_annot :t:
      WriteReg "vl" [] (RegVal_Base (Val_Symbolic 9%Z)) Mk_annot :t:
      ReadReg "vl" [] (RegVal_Base (Val_Symbolic 9%Z)) Mk_annot :t:
      WriteReg "x15" [] (RegVal_Base (Val_Symbolic 9%Z)) Mk_annot :t:
      ReadReg "vtype" [Field "bits"] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) Mk_annot :t:
      WriteReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
      ReadReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
      WriteReg "PC" [] (RegVal_Base (Val_Symbolic 1%Z)) Mk_annot :t:
      tnil;
      Smt (Assert (Unop (Not) (Val (Val_Symbolic 6%Z) Mk_annot) Mk_annot)) Mk_annot :t:
      WriteReg "vl" [] (RegVal_Base (Val_Bits (BV 64%N 0x40%Z))) Mk_annot :t:
      ReadReg "vl" [] (RegVal_Base (Val_Bits (BV 64%N 0x40%Z))) Mk_annot :t:
      WriteReg "x15" [] (RegVal_Base (Val_Bits (BV 64%N 0x40%Z))) Mk_annot :t:
      ReadReg "vtype" [Field "bits"] (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) Mk_annot :t:
      WriteReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
      ReadReg "vstart" [] (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) Mk_annot :t:
      WriteReg "PC" [] (RegVal_Base (Val_Symbolic 1%Z)) Mk_annot :t:
      tnil
    ]
  ]
.
