Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import S8Clamp.Types.
Require Import S8Clamp.MemoryModel.
Require Import S8Clamp.RvvModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_vectors_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvint8m8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s7"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s8"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s9"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s10"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s11"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s12"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s13"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s14"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s15"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s16"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s17"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s18"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s19"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s20"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s21"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s22"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s23"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s24"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s25"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s26"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s27"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s28"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s29"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s30"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s31"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s32"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s33"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s34"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s35"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s36"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s37"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s38"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s39"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s40"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s41"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s42"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s43"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s44"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s45"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s46"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s47"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s48"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s49"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s50"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s51"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s52"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s53"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s54"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s55"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s56"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s57"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s58"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s59"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s60"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s61"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s62"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s63"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s64"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s65"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s66"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s67"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s68"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s69"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s70"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s71"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s72"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s73"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s74"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s75"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s76"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s77"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s78"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s79"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s80"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s81"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s82"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s83"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s84"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s85"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s86"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s87"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s88"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s89"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s90"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s91"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s92"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s93"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s94"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s95"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s96"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s97"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s98"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s99"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s100"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s101"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s102"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s103"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s104"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s105"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s106"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s107"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s108"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s109"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s110"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s111"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s112"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s113"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s114"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s115"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s116"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s117"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s118"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s119"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s120"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s121"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s122"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s123"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s124"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s125"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s126"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8m8_t" ->ₛ "s127")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "vint8m8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "vint8m8_t" ->ₛ "s0")))
    ).

Module Type rvv_vectors_Strategy_Correct.

  Axiom rvv_vectors_strategy1_correctness : rvv_vectors_strategy1.

End rvv_vectors_Strategy_Correct.
