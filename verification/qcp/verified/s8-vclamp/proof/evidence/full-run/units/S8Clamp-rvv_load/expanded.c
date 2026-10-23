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
/*@ include strategies "rvv_vectors.strategies" */
vint8m8_t __riscv_vle8_v_i8m8(const int8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,s8_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,s8_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,s8_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,s8_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,s8_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,s8_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,s8_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,s8_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,s8_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,s8_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,s8_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,s8_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,s8_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,s8_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,s8_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,s8_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,s8_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,s8_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,s8_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,s8_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,s8_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,s8_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,s8_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,s8_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,s8_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,s8_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,s8_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,s8_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,s8_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,s8_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,s8_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,s8_read_lane(31,vl,idx,L)) * store(&(__return.s32),char,s8_read_lane(32,vl,idx,L)) * store(&(__return.s33),char,s8_read_lane(33,vl,idx,L)) * store(&(__return.s34),char,s8_read_lane(34,vl,idx,L)) * store(&(__return.s35),char,s8_read_lane(35,vl,idx,L)) * store(&(__return.s36),char,s8_read_lane(36,vl,idx,L)) * store(&(__return.s37),char,s8_read_lane(37,vl,idx,L)) * store(&(__return.s38),char,s8_read_lane(38,vl,idx,L)) * store(&(__return.s39),char,s8_read_lane(39,vl,idx,L)) * store(&(__return.s40),char,s8_read_lane(40,vl,idx,L)) * store(&(__return.s41),char,s8_read_lane(41,vl,idx,L)) * store(&(__return.s42),char,s8_read_lane(42,vl,idx,L)) * store(&(__return.s43),char,s8_read_lane(43,vl,idx,L)) * store(&(__return.s44),char,s8_read_lane(44,vl,idx,L)) * store(&(__return.s45),char,s8_read_lane(45,vl,idx,L)) * store(&(__return.s46),char,s8_read_lane(46,vl,idx,L)) * store(&(__return.s47),char,s8_read_lane(47,vl,idx,L)) * store(&(__return.s48),char,s8_read_lane(48,vl,idx,L)) * store(&(__return.s49),char,s8_read_lane(49,vl,idx,L)) * store(&(__return.s50),char,s8_read_lane(50,vl,idx,L)) * store(&(__return.s51),char,s8_read_lane(51,vl,idx,L)) * store(&(__return.s52),char,s8_read_lane(52,vl,idx,L)) * store(&(__return.s53),char,s8_read_lane(53,vl,idx,L)) * store(&(__return.s54),char,s8_read_lane(54,vl,idx,L)) * store(&(__return.s55),char,s8_read_lane(55,vl,idx,L)) * store(&(__return.s56),char,s8_read_lane(56,vl,idx,L)) * store(&(__return.s57),char,s8_read_lane(57,vl,idx,L)) * store(&(__return.s58),char,s8_read_lane(58,vl,idx,L)) * store(&(__return.s59),char,s8_read_lane(59,vl,idx,L)) * store(&(__return.s60),char,s8_read_lane(60,vl,idx,L)) * store(&(__return.s61),char,s8_read_lane(61,vl,idx,L)) * store(&(__return.s62),char,s8_read_lane(62,vl,idx,L)) * store(&(__return.s63),char,s8_read_lane(63,vl,idx,L)) * store(&(__return.s64),char,s8_read_lane(64,vl,idx,L)) * store(&(__return.s65),char,s8_read_lane(65,vl,idx,L)) * store(&(__return.s66),char,s8_read_lane(66,vl,idx,L)) * store(&(__return.s67),char,s8_read_lane(67,vl,idx,L)) * store(&(__return.s68),char,s8_read_lane(68,vl,idx,L)) * store(&(__return.s69),char,s8_read_lane(69,vl,idx,L)) * store(&(__return.s70),char,s8_read_lane(70,vl,idx,L)) * store(&(__return.s71),char,s8_read_lane(71,vl,idx,L)) * store(&(__return.s72),char,s8_read_lane(72,vl,idx,L)) * store(&(__return.s73),char,s8_read_lane(73,vl,idx,L)) * store(&(__return.s74),char,s8_read_lane(74,vl,idx,L)) * store(&(__return.s75),char,s8_read_lane(75,vl,idx,L)) * store(&(__return.s76),char,s8_read_lane(76,vl,idx,L)) * store(&(__return.s77),char,s8_read_lane(77,vl,idx,L)) * store(&(__return.s78),char,s8_read_lane(78,vl,idx,L)) * store(&(__return.s79),char,s8_read_lane(79,vl,idx,L)) * store(&(__return.s80),char,s8_read_lane(80,vl,idx,L)) * store(&(__return.s81),char,s8_read_lane(81,vl,idx,L)) * store(&(__return.s82),char,s8_read_lane(82,vl,idx,L)) * store(&(__return.s83),char,s8_read_lane(83,vl,idx,L)) * store(&(__return.s84),char,s8_read_lane(84,vl,idx,L)) * store(&(__return.s85),char,s8_read_lane(85,vl,idx,L)) * store(&(__return.s86),char,s8_read_lane(86,vl,idx,L)) * store(&(__return.s87),char,s8_read_lane(87,vl,idx,L)) * store(&(__return.s88),char,s8_read_lane(88,vl,idx,L)) * store(&(__return.s89),char,s8_read_lane(89,vl,idx,L)) * store(&(__return.s90),char,s8_read_lane(90,vl,idx,L)) * store(&(__return.s91),char,s8_read_lane(91,vl,idx,L)) * store(&(__return.s92),char,s8_read_lane(92,vl,idx,L)) * store(&(__return.s93),char,s8_read_lane(93,vl,idx,L)) * store(&(__return.s94),char,s8_read_lane(94,vl,idx,L)) * store(&(__return.s95),char,s8_read_lane(95,vl,idx,L)) * store(&(__return.s96),char,s8_read_lane(96,vl,idx,L)) * store(&(__return.s97),char,s8_read_lane(97,vl,idx,L)) * store(&(__return.s98),char,s8_read_lane(98,vl,idx,L)) * store(&(__return.s99),char,s8_read_lane(99,vl,idx,L)) * store(&(__return.s100),char,s8_read_lane(100,vl,idx,L)) * store(&(__return.s101),char,s8_read_lane(101,vl,idx,L)) * store(&(__return.s102),char,s8_read_lane(102,vl,idx,L)) * store(&(__return.s103),char,s8_read_lane(103,vl,idx,L)) * store(&(__return.s104),char,s8_read_lane(104,vl,idx,L)) * store(&(__return.s105),char,s8_read_lane(105,vl,idx,L)) * store(&(__return.s106),char,s8_read_lane(106,vl,idx,L)) * store(&(__return.s107),char,s8_read_lane(107,vl,idx,L)) * store(&(__return.s108),char,s8_read_lane(108,vl,idx,L)) * store(&(__return.s109),char,s8_read_lane(109,vl,idx,L)) * store(&(__return.s110),char,s8_read_lane(110,vl,idx,L)) * store(&(__return.s111),char,s8_read_lane(111,vl,idx,L)) * store(&(__return.s112),char,s8_read_lane(112,vl,idx,L)) * store(&(__return.s113),char,s8_read_lane(113,vl,idx,L)) * store(&(__return.s114),char,s8_read_lane(114,vl,idx,L)) * store(&(__return.s115),char,s8_read_lane(115,vl,idx,L)) * store(&(__return.s116),char,s8_read_lane(116,vl,idx,L)) * store(&(__return.s117),char,s8_read_lane(117,vl,idx,L)) * store(&(__return.s118),char,s8_read_lane(118,vl,idx,L)) * store(&(__return.s119),char,s8_read_lane(119,vl,idx,L)) * store(&(__return.s120),char,s8_read_lane(120,vl,idx,L)) * store(&(__return.s121),char,s8_read_lane(121,vl,idx,L)) * store(&(__return.s122),char,s8_read_lane(122,vl,idx,L)) * store(&(__return.s123),char,s8_read_lane(123,vl,idx,L)) * store(&(__return.s124),char,s8_read_lane(124,vl,idx,L)) * store(&(__return.s125),char,s8_read_lane(125,vl,idx,L)) * store(&(__return.s126),char,s8_read_lane(126,vl,idx,L)) * store(&(__return.s127),char,s8_read_lane(127,vl,idx,L)) */
{
 vint8m8_t r;
 r.s0=qcp_s8_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_s8_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_s8_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_s8_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_s8_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_s8_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_s8_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_s8_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_s8_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_s8_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_s8_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_s8_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_s8_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_s8_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_s8_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_s8_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s16=qcp_s8_read_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s17=qcp_s8_read_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s18=qcp_s8_read_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s19=qcp_s8_read_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s20=qcp_s8_read_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s21=qcp_s8_read_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s22=qcp_s8_read_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s23=qcp_s8_read_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s24=qcp_s8_read_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s25=qcp_s8_read_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s26=qcp_s8_read_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s27=qcp_s8_read_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s28=qcp_s8_read_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s29=qcp_s8_read_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s30=qcp_s8_read_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s31=qcp_s8_read_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s32=qcp_s8_read_lane(p,32,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s33=qcp_s8_read_lane(p,33,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s34=qcp_s8_read_lane(p,34,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s35=qcp_s8_read_lane(p,35,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s36=qcp_s8_read_lane(p,36,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s37=qcp_s8_read_lane(p,37,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s38=qcp_s8_read_lane(p,38,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s39=qcp_s8_read_lane(p,39,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s40=qcp_s8_read_lane(p,40,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s41=qcp_s8_read_lane(p,41,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s42=qcp_s8_read_lane(p,42,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s43=qcp_s8_read_lane(p,43,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s44=qcp_s8_read_lane(p,44,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s45=qcp_s8_read_lane(p,45,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s46=qcp_s8_read_lane(p,46,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s47=qcp_s8_read_lane(p,47,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s48=qcp_s8_read_lane(p,48,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s49=qcp_s8_read_lane(p,49,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s50=qcp_s8_read_lane(p,50,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s51=qcp_s8_read_lane(p,51,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s52=qcp_s8_read_lane(p,52,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s53=qcp_s8_read_lane(p,53,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s54=qcp_s8_read_lane(p,54,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s55=qcp_s8_read_lane(p,55,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s56=qcp_s8_read_lane(p,56,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s57=qcp_s8_read_lane(p,57,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s58=qcp_s8_read_lane(p,58,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s59=qcp_s8_read_lane(p,59,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s60=qcp_s8_read_lane(p,60,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s61=qcp_s8_read_lane(p,61,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s62=qcp_s8_read_lane(p,62,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s63=qcp_s8_read_lane(p,63,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s64=qcp_s8_read_lane(p,64,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s65=qcp_s8_read_lane(p,65,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s66=qcp_s8_read_lane(p,66,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s67=qcp_s8_read_lane(p,67,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s68=qcp_s8_read_lane(p,68,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s69=qcp_s8_read_lane(p,69,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s70=qcp_s8_read_lane(p,70,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s71=qcp_s8_read_lane(p,71,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s72=qcp_s8_read_lane(p,72,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s73=qcp_s8_read_lane(p,73,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s74=qcp_s8_read_lane(p,74,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s75=qcp_s8_read_lane(p,75,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s76=qcp_s8_read_lane(p,76,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s77=qcp_s8_read_lane(p,77,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s78=qcp_s8_read_lane(p,78,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s79=qcp_s8_read_lane(p,79,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s80=qcp_s8_read_lane(p,80,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s81=qcp_s8_read_lane(p,81,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s82=qcp_s8_read_lane(p,82,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s83=qcp_s8_read_lane(p,83,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s84=qcp_s8_read_lane(p,84,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s85=qcp_s8_read_lane(p,85,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s86=qcp_s8_read_lane(p,86,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s87=qcp_s8_read_lane(p,87,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s88=qcp_s8_read_lane(p,88,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s89=qcp_s8_read_lane(p,89,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s90=qcp_s8_read_lane(p,90,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s91=qcp_s8_read_lane(p,91,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s92=qcp_s8_read_lane(p,92,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s93=qcp_s8_read_lane(p,93,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s94=qcp_s8_read_lane(p,94,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s95=qcp_s8_read_lane(p,95,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s96=qcp_s8_read_lane(p,96,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s97=qcp_s8_read_lane(p,97,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s98=qcp_s8_read_lane(p,98,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s99=qcp_s8_read_lane(p,99,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s100=qcp_s8_read_lane(p,100,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s101=qcp_s8_read_lane(p,101,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s102=qcp_s8_read_lane(p,102,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s103=qcp_s8_read_lane(p,103,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s104=qcp_s8_read_lane(p,104,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s105=qcp_s8_read_lane(p,105,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s106=qcp_s8_read_lane(p,106,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s107=qcp_s8_read_lane(p,107,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s108=qcp_s8_read_lane(p,108,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s109=qcp_s8_read_lane(p,109,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s110=qcp_s8_read_lane(p,110,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s111=qcp_s8_read_lane(p,111,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s112=qcp_s8_read_lane(p,112,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s113=qcp_s8_read_lane(p,113,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s114=qcp_s8_read_lane(p,114,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s115=qcp_s8_read_lane(p,115,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s116=qcp_s8_read_lane(p,116,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s117=qcp_s8_read_lane(p,117,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s118=qcp_s8_read_lane(p,118,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s119=qcp_s8_read_lane(p,119,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s120=qcp_s8_read_lane(p,120,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s121=qcp_s8_read_lane(p,121,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s122=qcp_s8_read_lane(p,122,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s123=qcp_s8_read_lane(p,123,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s124=qcp_s8_read_lane(p,124,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s125=qcp_s8_read_lane(p,125,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s126=qcp_s8_read_lane(p,126,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s127=qcp_s8_read_lane(p,127,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
