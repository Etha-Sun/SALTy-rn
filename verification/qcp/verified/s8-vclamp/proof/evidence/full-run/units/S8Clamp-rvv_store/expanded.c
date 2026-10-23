typedef unsigned long long size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
struct qcp_s8_scalar_params { int32_t min; int32_t max; };
struct xnn_s8_minmax_params { struct qcp_s8_scalar_params scalar; };
typedef struct int8x8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
} int8x8_t;
typedef struct int8x16_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
} int8x16_t;
typedef struct vint8m8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
  int8_t s16;
  int8_t s17;
  int8_t s18;
  int8_t s19;
  int8_t s20;
  int8_t s21;
  int8_t s22;
  int8_t s23;
  int8_t s24;
  int8_t s25;
  int8_t s26;
  int8_t s27;
  int8_t s28;
  int8_t s29;
  int8_t s30;
  int8_t s31;
  int8_t s32;
  int8_t s33;
  int8_t s34;
  int8_t s35;
  int8_t s36;
  int8_t s37;
  int8_t s38;
  int8_t s39;
  int8_t s40;
  int8_t s41;
  int8_t s42;
  int8_t s43;
  int8_t s44;
  int8_t s45;
  int8_t s46;
  int8_t s47;
  int8_t s48;
  int8_t s49;
  int8_t s50;
  int8_t s51;
  int8_t s52;
  int8_t s53;
  int8_t s54;
  int8_t s55;
  int8_t s56;
  int8_t s57;
  int8_t s58;
  int8_t s59;
  int8_t s60;
  int8_t s61;
  int8_t s62;
  int8_t s63;
  int8_t s64;
  int8_t s65;
  int8_t s66;
  int8_t s67;
  int8_t s68;
  int8_t s69;
  int8_t s70;
  int8_t s71;
  int8_t s72;
  int8_t s73;
  int8_t s74;
  int8_t s75;
  int8_t s76;
  int8_t s77;
  int8_t s78;
  int8_t s79;
  int8_t s80;
  int8_t s81;
  int8_t s82;
  int8_t s83;
  int8_t s84;
  int8_t s85;
  int8_t s86;
  int8_t s87;
  int8_t s88;
  int8_t s89;
  int8_t s90;
  int8_t s91;
  int8_t s92;
  int8_t s93;
  int8_t s94;
  int8_t s95;
  int8_t s96;
  int8_t s97;
  int8_t s98;
  int8_t s99;
  int8_t s100;
  int8_t s101;
  int8_t s102;
  int8_t s103;
  int8_t s104;
  int8_t s105;
  int8_t s106;
  int8_t s107;
  int8_t s108;
  int8_t s109;
  int8_t s110;
  int8_t s111;
  int8_t s112;
  int8_t s113;
  int8_t s114;
  int8_t s115;
  int8_t s116;
  int8_t s117;
  int8_t s118;
  int8_t s119;
  int8_t s120;
  int8_t s121;
  int8_t s122;
  int8_t s123;
  int8_t s124;
  int8_t s125;
  int8_t s126;
  int8_t s127;
} vint8m8_t;
typedef struct uint8x8_t {
  uint8_t s0;
  uint8_t s1;
  uint8_t s2;
  uint8_t s3;
  uint8_t s4;
  uint8_t s5;
  uint8_t s6;
  uint8_t s7;
} uint8x8_t;
/* Byte-backed views preserve all eight bytes, without aligned word loads. */
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import S8Clamp.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Import Coq Require Import S8Clamp.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import S8Clamp.RvvModel */
/*@ Extern Coq (s8_rvv_min_lane:Z -> Z -> Z -> Z -> Z)
 (s8_rvv_max_lane:Z -> Z -> Z -> Z -> Z)
 (s8_rvv_prefix:Z -> list Z -> list Z)
 (s8_rvv_snoc:list Z -> Z -> list Z)
 (s8_rvv_length:list Z -> Z)
 (s8_rvv_nth:list Z -> Z -> Z)
 (s8_rvv_pack128:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
/*@ include strategies "rvv_store.strategies" */
int8_t qcp_s8_rvv_get128(const vint8m8_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) (x32:Z) (x33:Z) (x34:Z) (x35:Z) (x36:Z) (x37:Z) (x38:Z) (x39:Z) (x40:Z) (x41:Z) (x42:Z) (x43:Z) (x44:Z) (x45:Z) (x46:Z) (x47:Z) (x48:Z) (x49:Z) (x50:Z) (x51:Z) (x52:Z) (x53:Z) (x54:Z) (x55:Z) (x56:Z) (x57:Z) (x58:Z) (x59:Z) (x60:Z) (x61:Z) (x62:Z) (x63:Z) (x64:Z) (x65:Z) (x66:Z) (x67:Z) (x68:Z) (x69:Z) (x70:Z) (x71:Z) (x72:Z) (x73:Z) (x74:Z) (x75:Z) (x76:Z) (x77:Z) (x78:Z) (x79:Z) (x80:Z) (x81:Z) (x82:Z) (x83:Z) (x84:Z) (x85:Z) (x86:Z) (x87:Z) (x88:Z) (x89:Z) (x90:Z) (x91:Z) (x92:Z) (x93:Z) (x94:Z) (x95:Z) (x96:Z) (x97:Z) (x98:Z) (x99:Z) (x100:Z) (x101:Z) (x102:Z) (x103:Z) (x104:Z) (x105:Z) (x106:Z) (x107:Z) (x108:Z) (x109:Z) (x110:Z) (x111:Z) (x112:Z) (x113:Z) (x114:Z) (x115:Z) (x116:Z) (x117:Z) (x118:Z) (x119:Z) (x120:Z) (x121:Z) (x122:Z) (x123:Z) (x124:Z) (x125:Z) (x126:Z) (x127:Z)
 Require 0<=i && i<128 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * store(&(a->s32),char,x32) * store(&(a->s33),char,x33) * store(&(a->s34),char,x34) * store(&(a->s35),char,x35) * store(&(a->s36),char,x36) * store(&(a->s37),char,x37) * store(&(a->s38),char,x38) * store(&(a->s39),char,x39) * store(&(a->s40),char,x40) * store(&(a->s41),char,x41) * store(&(a->s42),char,x42) * store(&(a->s43),char,x43) * store(&(a->s44),char,x44) * store(&(a->s45),char,x45) * store(&(a->s46),char,x46) * store(&(a->s47),char,x47) * store(&(a->s48),char,x48) * store(&(a->s49),char,x49) * store(&(a->s50),char,x50) * store(&(a->s51),char,x51) * store(&(a->s52),char,x52) * store(&(a->s53),char,x53) * store(&(a->s54),char,x54) * store(&(a->s55),char,x55) * store(&(a->s56),char,x56) * store(&(a->s57),char,x57) * store(&(a->s58),char,x58) * store(&(a->s59),char,x59) * store(&(a->s60),char,x60) * store(&(a->s61),char,x61) * store(&(a->s62),char,x62) * store(&(a->s63),char,x63) * store(&(a->s64),char,x64) * store(&(a->s65),char,x65) * store(&(a->s66),char,x66) * store(&(a->s67),char,x67) * store(&(a->s68),char,x68) * store(&(a->s69),char,x69) * store(&(a->s70),char,x70) * store(&(a->s71),char,x71) * store(&(a->s72),char,x72) * store(&(a->s73),char,x73) * store(&(a->s74),char,x74) * store(&(a->s75),char,x75) * store(&(a->s76),char,x76) * store(&(a->s77),char,x77) * store(&(a->s78),char,x78) * store(&(a->s79),char,x79) * store(&(a->s80),char,x80) * store(&(a->s81),char,x81) * store(&(a->s82),char,x82) * store(&(a->s83),char,x83) * store(&(a->s84),char,x84) * store(&(a->s85),char,x85) * store(&(a->s86),char,x86) * store(&(a->s87),char,x87) * store(&(a->s88),char,x88) * store(&(a->s89),char,x89) * store(&(a->s90),char,x90) * store(&(a->s91),char,x91) * store(&(a->s92),char,x92) * store(&(a->s93),char,x93) * store(&(a->s94),char,x94) * store(&(a->s95),char,x95) * store(&(a->s96),char,x96) * store(&(a->s97),char,x97) * store(&(a->s98),char,x98) * store(&(a->s99),char,x99) * store(&(a->s100),char,x100) * store(&(a->s101),char,x101) * store(&(a->s102),char,x102) * store(&(a->s103),char,x103) * store(&(a->s104),char,x104) * store(&(a->s105),char,x105) * store(&(a->s106),char,x106) * store(&(a->s107),char,x107) * store(&(a->s108),char,x108) * store(&(a->s109),char,x109) * store(&(a->s110),char,x110) * store(&(a->s111),char,x111) * store(&(a->s112),char,x112) * store(&(a->s113),char,x113) * store(&(a->s114),char,x114) * store(&(a->s115),char,x115) * store(&(a->s116),char,x116) * store(&(a->s117),char,x117) * store(&(a->s118),char,x118) * store(&(a->s119),char,x119) * store(&(a->s120),char,x120) * store(&(a->s121),char,x121) * store(&(a->s122),char,x122) * store(&(a->s123),char,x123) * store(&(a->s124),char,x124) * store(&(a->s125),char,x125) * store(&(a->s126),char,x126) * store(&(a->s127),char,x127)
 Ensure __return==s8_rvv_nth(s8_rvv_pack128(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127),i) && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * store(&(a->s32),char,x32) * store(&(a->s33),char,x33) * store(&(a->s34),char,x34) * store(&(a->s35),char,x35) * store(&(a->s36),char,x36) * store(&(a->s37),char,x37) * store(&(a->s38),char,x38) * store(&(a->s39),char,x39) * store(&(a->s40),char,x40) * store(&(a->s41),char,x41) * store(&(a->s42),char,x42) * store(&(a->s43),char,x43) * store(&(a->s44),char,x44) * store(&(a->s45),char,x45) * store(&(a->s46),char,x46) * store(&(a->s47),char,x47) * store(&(a->s48),char,x48) * store(&(a->s49),char,x49) * store(&(a->s50),char,x50) * store(&(a->s51),char,x51) * store(&(a->s52),char,x52) * store(&(a->s53),char,x53) * store(&(a->s54),char,x54) * store(&(a->s55),char,x55) * store(&(a->s56),char,x56) * store(&(a->s57),char,x57) * store(&(a->s58),char,x58) * store(&(a->s59),char,x59) * store(&(a->s60),char,x60) * store(&(a->s61),char,x61) * store(&(a->s62),char,x62) * store(&(a->s63),char,x63) * store(&(a->s64),char,x64) * store(&(a->s65),char,x65) * store(&(a->s66),char,x66) * store(&(a->s67),char,x67) * store(&(a->s68),char,x68) * store(&(a->s69),char,x69) * store(&(a->s70),char,x70) * store(&(a->s71),char,x71) * store(&(a->s72),char,x72) * store(&(a->s73),char,x73) * store(&(a->s74),char,x74) * store(&(a->s75),char,x75) * store(&(a->s76),char,x76) * store(&(a->s77),char,x77) * store(&(a->s78),char,x78) * store(&(a->s79),char,x79) * store(&(a->s80),char,x80) * store(&(a->s81),char,x81) * store(&(a->s82),char,x82) * store(&(a->s83),char,x83) * store(&(a->s84),char,x84) * store(&(a->s85),char,x85) * store(&(a->s86),char,x86) * store(&(a->s87),char,x87) * store(&(a->s88),char,x88) * store(&(a->s89),char,x89) * store(&(a->s90),char,x90) * store(&(a->s91),char,x91) * store(&(a->s92),char,x92) * store(&(a->s93),char,x93) * store(&(a->s94),char,x94) * store(&(a->s95),char,x95) * store(&(a->s96),char,x96) * store(&(a->s97),char,x97) * store(&(a->s98),char,x98) * store(&(a->s99),char,x99) * store(&(a->s100),char,x100) * store(&(a->s101),char,x101) * store(&(a->s102),char,x102) * store(&(a->s103),char,x103) * store(&(a->s104),char,x104) * store(&(a->s105),char,x105) * store(&(a->s106),char,x106) * store(&(a->s107),char,x107) * store(&(a->s108),char,x108) * store(&(a->s109),char,x109) * store(&(a->s110),char,x110) * store(&(a->s111),char,x111) * store(&(a->s112),char,x112) * store(&(a->s113),char,x113) * store(&(a->s114),char,x114) * store(&(a->s115),char,x115) * store(&(a->s116),char,x116) * store(&(a->s117),char,x117) * store(&(a->s118),char,x118) * store(&(a->s119),char,x119) * store(&(a->s120),char,x120) * store(&(a->s121),char,x121) * store(&(a->s122),char,x122) * store(&(a->s123),char,x123) * store(&(a->s124),char,x124) * store(&(a->s125),char,x125) * store(&(a->s126),char,x126) * store(&(a->s127),char,x127) */
{
  if(i<64) {
   if(i<32) {
    if(i<16) {
     if(i<8) {
      if(i<4) {
       if(i<2) {
        if(i<1) {
         return a->s0;
        } else {
         return a->s1;
        }
       } else {
        if(i<3) {
         return a->s2;
        } else {
         return a->s3;
        }
       }
      } else {
       if(i<6) {
        if(i<5) {
         return a->s4;
        } else {
         return a->s5;
        }
       } else {
        if(i<7) {
         return a->s6;
        } else {
         return a->s7;
        }
       }
      }
     } else {
      if(i<12) {
       if(i<10) {
        if(i<9) {
         return a->s8;
        } else {
         return a->s9;
        }
       } else {
        if(i<11) {
         return a->s10;
        } else {
         return a->s11;
        }
       }
      } else {
       if(i<14) {
        if(i<13) {
         return a->s12;
        } else {
         return a->s13;
        }
       } else {
        if(i<15) {
         return a->s14;
        } else {
         return a->s15;
        }
       }
      }
     }
    } else {
     if(i<24) {
      if(i<20) {
       if(i<18) {
        if(i<17) {
         return a->s16;
        } else {
         return a->s17;
        }
       } else {
        if(i<19) {
         return a->s18;
        } else {
         return a->s19;
        }
       }
      } else {
       if(i<22) {
        if(i<21) {
         return a->s20;
        } else {
         return a->s21;
        }
       } else {
        if(i<23) {
         return a->s22;
        } else {
         return a->s23;
        }
       }
      }
     } else {
      if(i<28) {
       if(i<26) {
        if(i<25) {
         return a->s24;
        } else {
         return a->s25;
        }
       } else {
        if(i<27) {
         return a->s26;
        } else {
         return a->s27;
        }
       }
      } else {
       if(i<30) {
        if(i<29) {
         return a->s28;
        } else {
         return a->s29;
        }
       } else {
        if(i<31) {
         return a->s30;
        } else {
         return a->s31;
        }
       }
      }
     }
    }
   } else {
    if(i<48) {
     if(i<40) {
      if(i<36) {
       if(i<34) {
        if(i<33) {
         return a->s32;
        } else {
         return a->s33;
        }
       } else {
        if(i<35) {
         return a->s34;
        } else {
         return a->s35;
        }
       }
      } else {
       if(i<38) {
        if(i<37) {
         return a->s36;
        } else {
         return a->s37;
        }
       } else {
        if(i<39) {
         return a->s38;
        } else {
         return a->s39;
        }
       }
      }
     } else {
      if(i<44) {
       if(i<42) {
        if(i<41) {
         return a->s40;
        } else {
         return a->s41;
        }
       } else {
        if(i<43) {
         return a->s42;
        } else {
         return a->s43;
        }
       }
      } else {
       if(i<46) {
        if(i<45) {
         return a->s44;
        } else {
         return a->s45;
        }
       } else {
        if(i<47) {
         return a->s46;
        } else {
         return a->s47;
        }
       }
      }
     }
    } else {
     if(i<56) {
      if(i<52) {
       if(i<50) {
        if(i<49) {
         return a->s48;
        } else {
         return a->s49;
        }
       } else {
        if(i<51) {
         return a->s50;
        } else {
         return a->s51;
        }
       }
      } else {
       if(i<54) {
        if(i<53) {
         return a->s52;
        } else {
         return a->s53;
        }
       } else {
        if(i<55) {
         return a->s54;
        } else {
         return a->s55;
        }
       }
      }
     } else {
      if(i<60) {
       if(i<58) {
        if(i<57) {
         return a->s56;
        } else {
         return a->s57;
        }
       } else {
        if(i<59) {
         return a->s58;
        } else {
         return a->s59;
        }
       }
      } else {
       if(i<62) {
        if(i<61) {
         return a->s60;
        } else {
         return a->s61;
        }
       } else {
        if(i<63) {
         return a->s62;
        } else {
         return a->s63;
        }
       }
      }
     }
    }
   }
  } else {
   if(i<96) {
    if(i<80) {
     if(i<72) {
      if(i<68) {
       if(i<66) {
        if(i<65) {
         return a->s64;
        } else {
         return a->s65;
        }
       } else {
        if(i<67) {
         return a->s66;
        } else {
         return a->s67;
        }
       }
      } else {
       if(i<70) {
        if(i<69) {
         return a->s68;
        } else {
         return a->s69;
        }
       } else {
        if(i<71) {
         return a->s70;
        } else {
         return a->s71;
        }
       }
      }
     } else {
      if(i<76) {
       if(i<74) {
        if(i<73) {
         return a->s72;
        } else {
         return a->s73;
        }
       } else {
        if(i<75) {
         return a->s74;
        } else {
         return a->s75;
        }
       }
      } else {
       if(i<78) {
        if(i<77) {
         return a->s76;
        } else {
         return a->s77;
        }
       } else {
        if(i<79) {
         return a->s78;
        } else {
         return a->s79;
        }
       }
      }
     }
    } else {
     if(i<88) {
      if(i<84) {
       if(i<82) {
        if(i<81) {
         return a->s80;
        } else {
         return a->s81;
        }
       } else {
        if(i<83) {
         return a->s82;
        } else {
         return a->s83;
        }
       }
      } else {
       if(i<86) {
        if(i<85) {
         return a->s84;
        } else {
         return a->s85;
        }
       } else {
        if(i<87) {
         return a->s86;
        } else {
         return a->s87;
        }
       }
      }
     } else {
      if(i<92) {
       if(i<90) {
        if(i<89) {
         return a->s88;
        } else {
         return a->s89;
        }
       } else {
        if(i<91) {
         return a->s90;
        } else {
         return a->s91;
        }
       }
      } else {
       if(i<94) {
        if(i<93) {
         return a->s92;
        } else {
         return a->s93;
        }
       } else {
        if(i<95) {
         return a->s94;
        } else {
         return a->s95;
        }
       }
      }
     }
    }
   } else {
    if(i<112) {
     if(i<104) {
      if(i<100) {
       if(i<98) {
        if(i<97) {
         return a->s96;
        } else {
         return a->s97;
        }
       } else {
        if(i<99) {
         return a->s98;
        } else {
         return a->s99;
        }
       }
      } else {
       if(i<102) {
        if(i<101) {
         return a->s100;
        } else {
         return a->s101;
        }
       } else {
        if(i<103) {
         return a->s102;
        } else {
         return a->s103;
        }
       }
      }
     } else {
      if(i<108) {
       if(i<106) {
        if(i<105) {
         return a->s104;
        } else {
         return a->s105;
        }
       } else {
        if(i<107) {
         return a->s106;
        } else {
         return a->s107;
        }
       }
      } else {
       if(i<110) {
        if(i<109) {
         return a->s108;
        } else {
         return a->s109;
        }
       } else {
        if(i<111) {
         return a->s110;
        } else {
         return a->s111;
        }
       }
      }
     }
    } else {
     if(i<120) {
      if(i<116) {
       if(i<114) {
        if(i<113) {
         return a->s112;
        } else {
         return a->s113;
        }
       } else {
        if(i<115) {
         return a->s114;
        } else {
         return a->s115;
        }
       }
      } else {
       if(i<118) {
        if(i<117) {
         return a->s116;
        } else {
         return a->s117;
        }
       } else {
        if(i<119) {
         return a->s118;
        } else {
         return a->s119;
        }
       }
      }
     } else {
      if(i<124) {
       if(i<122) {
        if(i<121) {
         return a->s120;
        } else {
         return a->s121;
        }
       } else {
        if(i<123) {
         return a->s122;
        } else {
         return a->s123;
        }
       }
      } else {
       if(i<126) {
        if(i<125) {
         return a->s124;
        } else {
         return a->s125;
        }
       } else {
        if(i<127) {
         return a->s126;
        } else {
         return a->s127;
        }
       }
      }
     }
    }
   }
  }
}
void qcp_s8_rvv_store_next(int8_t *p,size_t vl,size_t i,int8_t value)
/*@ With (P:list Z)
 Require 0<=i && i<vl && vl<=128 && CharArray::seg(p,0,i,P) * CharArray::undef_seg(p,i,vl)
 Ensure CharArray::seg(p,0,i+1,s8_rvv_snoc(P,value)) * CharArray::undef_seg(p,i+1,vl) */
{p[i]=value;}
void qcp_s8_rvv_store128(int8_t *p,const vint8m8_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) (x32:Z) (x33:Z) (x34:Z) (x35:Z) (x36:Z) (x37:Z) (x38:Z) (x39:Z) (x40:Z) (x41:Z) (x42:Z) (x43:Z) (x44:Z) (x45:Z) (x46:Z) (x47:Z) (x48:Z) (x49:Z) (x50:Z) (x51:Z) (x52:Z) (x53:Z) (x54:Z) (x55:Z) (x56:Z) (x57:Z) (x58:Z) (x59:Z) (x60:Z) (x61:Z) (x62:Z) (x63:Z) (x64:Z) (x65:Z) (x66:Z) (x67:Z) (x68:Z) (x69:Z) (x70:Z) (x71:Z) (x72:Z) (x73:Z) (x74:Z) (x75:Z) (x76:Z) (x77:Z) (x78:Z) (x79:Z) (x80:Z) (x81:Z) (x82:Z) (x83:Z) (x84:Z) (x85:Z) (x86:Z) (x87:Z) (x88:Z) (x89:Z) (x90:Z) (x91:Z) (x92:Z) (x93:Z) (x94:Z) (x95:Z) (x96:Z) (x97:Z) (x98:Z) (x99:Z) (x100:Z) (x101:Z) (x102:Z) (x103:Z) (x104:Z) (x105:Z) (x106:Z) (x107:Z) (x108:Z) (x109:Z) (x110:Z) (x111:Z) (x112:Z) (x113:Z) (x114:Z) (x115:Z) (x116:Z) (x117:Z) (x118:Z) (x119:Z) (x120:Z) (x121:Z) (x122:Z) (x123:Z) (x124:Z) (x125:Z) (x126:Z) (x127:Z)
 Require 0<=vl && vl<=128 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * store(&(a->s32),char,x32) * store(&(a->s33),char,x33) * store(&(a->s34),char,x34) * store(&(a->s35),char,x35) * store(&(a->s36),char,x36) * store(&(a->s37),char,x37) * store(&(a->s38),char,x38) * store(&(a->s39),char,x39) * store(&(a->s40),char,x40) * store(&(a->s41),char,x41) * store(&(a->s42),char,x42) * store(&(a->s43),char,x43) * store(&(a->s44),char,x44) * store(&(a->s45),char,x45) * store(&(a->s46),char,x46) * store(&(a->s47),char,x47) * store(&(a->s48),char,x48) * store(&(a->s49),char,x49) * store(&(a->s50),char,x50) * store(&(a->s51),char,x51) * store(&(a->s52),char,x52) * store(&(a->s53),char,x53) * store(&(a->s54),char,x54) * store(&(a->s55),char,x55) * store(&(a->s56),char,x56) * store(&(a->s57),char,x57) * store(&(a->s58),char,x58) * store(&(a->s59),char,x59) * store(&(a->s60),char,x60) * store(&(a->s61),char,x61) * store(&(a->s62),char,x62) * store(&(a->s63),char,x63) * store(&(a->s64),char,x64) * store(&(a->s65),char,x65) * store(&(a->s66),char,x66) * store(&(a->s67),char,x67) * store(&(a->s68),char,x68) * store(&(a->s69),char,x69) * store(&(a->s70),char,x70) * store(&(a->s71),char,x71) * store(&(a->s72),char,x72) * store(&(a->s73),char,x73) * store(&(a->s74),char,x74) * store(&(a->s75),char,x75) * store(&(a->s76),char,x76) * store(&(a->s77),char,x77) * store(&(a->s78),char,x78) * store(&(a->s79),char,x79) * store(&(a->s80),char,x80) * store(&(a->s81),char,x81) * store(&(a->s82),char,x82) * store(&(a->s83),char,x83) * store(&(a->s84),char,x84) * store(&(a->s85),char,x85) * store(&(a->s86),char,x86) * store(&(a->s87),char,x87) * store(&(a->s88),char,x88) * store(&(a->s89),char,x89) * store(&(a->s90),char,x90) * store(&(a->s91),char,x91) * store(&(a->s92),char,x92) * store(&(a->s93),char,x93) * store(&(a->s94),char,x94) * store(&(a->s95),char,x95) * store(&(a->s96),char,x96) * store(&(a->s97),char,x97) * store(&(a->s98),char,x98) * store(&(a->s99),char,x99) * store(&(a->s100),char,x100) * store(&(a->s101),char,x101) * store(&(a->s102),char,x102) * store(&(a->s103),char,x103) * store(&(a->s104),char,x104) * store(&(a->s105),char,x105) * store(&(a->s106),char,x106) * store(&(a->s107),char,x107) * store(&(a->s108),char,x108) * store(&(a->s109),char,x109) * store(&(a->s110),char,x110) * store(&(a->s111),char,x111) * store(&(a->s112),char,x112) * store(&(a->s113),char,x113) * store(&(a->s114),char,x114) * store(&(a->s115),char,x115) * store(&(a->s116),char,x116) * store(&(a->s117),char,x117) * store(&(a->s118),char,x118) * store(&(a->s119),char,x119) * store(&(a->s120),char,x120) * store(&(a->s121),char,x121) * store(&(a->s122),char,x122) * store(&(a->s123),char,x123) * store(&(a->s124),char,x124) * store(&(a->s125),char,x125) * store(&(a->s126),char,x126) * store(&(a->s127),char,x127) * CharArray::undef_full(p,vl)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * store(&(a->s32),char,x32) * store(&(a->s33),char,x33) * store(&(a->s34),char,x34) * store(&(a->s35),char,x35) * store(&(a->s36),char,x36) * store(&(a->s37),char,x37) * store(&(a->s38),char,x38) * store(&(a->s39),char,x39) * store(&(a->s40),char,x40) * store(&(a->s41),char,x41) * store(&(a->s42),char,x42) * store(&(a->s43),char,x43) * store(&(a->s44),char,x44) * store(&(a->s45),char,x45) * store(&(a->s46),char,x46) * store(&(a->s47),char,x47) * store(&(a->s48),char,x48) * store(&(a->s49),char,x49) * store(&(a->s50),char,x50) * store(&(a->s51),char,x51) * store(&(a->s52),char,x52) * store(&(a->s53),char,x53) * store(&(a->s54),char,x54) * store(&(a->s55),char,x55) * store(&(a->s56),char,x56) * store(&(a->s57),char,x57) * store(&(a->s58),char,x58) * store(&(a->s59),char,x59) * store(&(a->s60),char,x60) * store(&(a->s61),char,x61) * store(&(a->s62),char,x62) * store(&(a->s63),char,x63) * store(&(a->s64),char,x64) * store(&(a->s65),char,x65) * store(&(a->s66),char,x66) * store(&(a->s67),char,x67) * store(&(a->s68),char,x68) * store(&(a->s69),char,x69) * store(&(a->s70),char,x70) * store(&(a->s71),char,x71) * store(&(a->s72),char,x72) * store(&(a->s73),char,x73) * store(&(a->s74),char,x74) * store(&(a->s75),char,x75) * store(&(a->s76),char,x76) * store(&(a->s77),char,x77) * store(&(a->s78),char,x78) * store(&(a->s79),char,x79) * store(&(a->s80),char,x80) * store(&(a->s81),char,x81) * store(&(a->s82),char,x82) * store(&(a->s83),char,x83) * store(&(a->s84),char,x84) * store(&(a->s85),char,x85) * store(&(a->s86),char,x86) * store(&(a->s87),char,x87) * store(&(a->s88),char,x88) * store(&(a->s89),char,x89) * store(&(a->s90),char,x90) * store(&(a->s91),char,x91) * store(&(a->s92),char,x92) * store(&(a->s93),char,x93) * store(&(a->s94),char,x94) * store(&(a->s95),char,x95) * store(&(a->s96),char,x96) * store(&(a->s97),char,x97) * store(&(a->s98),char,x98) * store(&(a->s99),char,x99) * store(&(a->s100),char,x100) * store(&(a->s101),char,x101) * store(&(a->s102),char,x102) * store(&(a->s103),char,x103) * store(&(a->s104),char,x104) * store(&(a->s105),char,x105) * store(&(a->s106),char,x106) * store(&(a->s107),char,x107) * store(&(a->s108),char,x108) * store(&(a->s109),char,x109) * store(&(a->s110),char,x110) * store(&(a->s111),char,x111) * store(&(a->s112),char,x112) * store(&(a->s113),char,x113) * store(&(a->s114),char,x114) * store(&(a->s115),char,x115) * store(&(a->s116),char,x116) * store(&(a->s117),char,x117) * store(&(a->s118),char,x118) * store(&(a->s119),char,x119) * store(&(a->s120),char,x120) * store(&(a->s121),char,x121) * store(&(a->s122),char,x122) * store(&(a->s123),char,x123) * store(&(a->s124),char,x124) * store(&(a->s125),char,x125) * store(&(a->s126),char,x126) * store(&(a->s127),char,x127) * CharArray::full(p,vl,s8_rvv_prefix(vl,s8_rvv_pack128(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127))) */
{
 size_t i=0;
/*@ Inv 0<=i && i<=vl && vl<=128 && p==p@pre && a==a@pre && vl==vl@pre &&
 store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * store(&(a->s32),char,x32) * store(&(a->s33),char,x33) * store(&(a->s34),char,x34) * store(&(a->s35),char,x35) * store(&(a->s36),char,x36) * store(&(a->s37),char,x37) * store(&(a->s38),char,x38) * store(&(a->s39),char,x39) * store(&(a->s40),char,x40) * store(&(a->s41),char,x41) * store(&(a->s42),char,x42) * store(&(a->s43),char,x43) * store(&(a->s44),char,x44) * store(&(a->s45),char,x45) * store(&(a->s46),char,x46) * store(&(a->s47),char,x47) * store(&(a->s48),char,x48) * store(&(a->s49),char,x49) * store(&(a->s50),char,x50) * store(&(a->s51),char,x51) * store(&(a->s52),char,x52) * store(&(a->s53),char,x53) * store(&(a->s54),char,x54) * store(&(a->s55),char,x55) * store(&(a->s56),char,x56) * store(&(a->s57),char,x57) * store(&(a->s58),char,x58) * store(&(a->s59),char,x59) * store(&(a->s60),char,x60) * store(&(a->s61),char,x61) * store(&(a->s62),char,x62) * store(&(a->s63),char,x63) * store(&(a->s64),char,x64) * store(&(a->s65),char,x65) * store(&(a->s66),char,x66) * store(&(a->s67),char,x67) * store(&(a->s68),char,x68) * store(&(a->s69),char,x69) * store(&(a->s70),char,x70) * store(&(a->s71),char,x71) * store(&(a->s72),char,x72) * store(&(a->s73),char,x73) * store(&(a->s74),char,x74) * store(&(a->s75),char,x75) * store(&(a->s76),char,x76) * store(&(a->s77),char,x77) * store(&(a->s78),char,x78) * store(&(a->s79),char,x79) * store(&(a->s80),char,x80) * store(&(a->s81),char,x81) * store(&(a->s82),char,x82) * store(&(a->s83),char,x83) * store(&(a->s84),char,x84) * store(&(a->s85),char,x85) * store(&(a->s86),char,x86) * store(&(a->s87),char,x87) * store(&(a->s88),char,x88) * store(&(a->s89),char,x89) * store(&(a->s90),char,x90) * store(&(a->s91),char,x91) * store(&(a->s92),char,x92) * store(&(a->s93),char,x93) * store(&(a->s94),char,x94) * store(&(a->s95),char,x95) * store(&(a->s96),char,x96) * store(&(a->s97),char,x97) * store(&(a->s98),char,x98) * store(&(a->s99),char,x99) * store(&(a->s100),char,x100) * store(&(a->s101),char,x101) * store(&(a->s102),char,x102) * store(&(a->s103),char,x103) * store(&(a->s104),char,x104) * store(&(a->s105),char,x105) * store(&(a->s106),char,x106) * store(&(a->s107),char,x107) * store(&(a->s108),char,x108) * store(&(a->s109),char,x109) * store(&(a->s110),char,x110) * store(&(a->s111),char,x111) * store(&(a->s112),char,x112) * store(&(a->s113),char,x113) * store(&(a->s114),char,x114) * store(&(a->s115),char,x115) * store(&(a->s116),char,x116) * store(&(a->s117),char,x117) * store(&(a->s118),char,x118) * store(&(a->s119),char,x119) * store(&(a->s120),char,x120) * store(&(a->s121),char,x121) * store(&(a->s122),char,x122) * store(&(a->s123),char,x123) * store(&(a->s124),char,x124) * store(&(a->s125),char,x125) * store(&(a->s126),char,x126) * store(&(a->s127),char,x127) * CharArray::seg(p,0,i,s8_rvv_prefix(i,s8_rvv_pack128(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127))) * CharArray::undef_seg(p,i,vl) */
 for(;i<vl;++i){
  int8_t value=qcp_s8_rvv_get128(a,i);
  qcp_s8_rvv_store_next(p,vl,i,value);
 }
}
