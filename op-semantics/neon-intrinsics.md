# ARM NEON Intrinsics Reference

## ABS

**Description:** Absolute value (vector). This instruction calculates the absolute value of each vector element in the source SIMD&FP register, puts the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    if neg then
        element = -element;
    else
        element = Abs(element);
    Elem[result, e, esize] = element<esize-1:0>;                

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vabs_s8(int8x8_t a)` | `ABS Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vabsq_s8(int8x16_t a)` | `ABS Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vabs_s16(int16x4_t a)` | `ABS Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vabsq_s16(int16x8_t a)` | `ABS Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vabs_s32(int32x2_t a)` | `ABS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vabsq_s32(int32x4_t a)` | `ABS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vabs_s64(int64x1_t a)` | `ABS Dd,Dn` | `Dd -> result` | A64 |
| `int64_t vabsd_s64(int64_t a)` | `ABS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vabsq_s64(int64x2_t a)` | `ABS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |

---

## ADD

**Description:** Add (vector). This instruction adds corresponding elements in the two source SIMD&FP registers, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if sub_op then
        Elem[result, e, esize] = element1 - element2;
    else
        Elem[result, e, esize] = element1 + element2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vadd_s8(int8x8_t a, int8x8_t b)` | `ADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vaddq_s8(int8x16_t a, int8x16_t b)` | `ADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vadd_s16(int16x4_t a, int16x4_t b)` | `ADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vaddq_s16(int16x8_t a, int16x8_t b)` | `ADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vadd_s32(int32x2_t a, int32x2_t b)` | `ADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vaddq_s32(int32x4_t a, int32x4_t b)` | `ADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vadd_s64(int64x1_t a, int64x1_t b)` | `ADD Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vaddq_s64(int64x2_t a, int64x2_t b)` | `ADD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vadd_u8(uint8x8_t a, uint8x8_t b)` | `ADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vaddq_u8(uint8x16_t a, uint8x16_t b)` | `ADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vadd_u16(uint16x4_t a, uint16x4_t b)` | `ADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vaddq_u16(uint16x8_t a, uint16x8_t b)` | `ADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vadd_u32(uint32x2_t a, uint32x2_t b)` | `ADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b)` | `ADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vadd_u64(uint64x1_t a, uint64x1_t b)` | `ADD Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vaddq_u64(uint64x2_t a, uint64x2_t b)` | `ADD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vaddd_s64(int64_t a, int64_t b)` | `ADD Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64_t vaddd_u64(uint64_t a, uint64_t b)` | `ADD Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## ADDHN

**Description:** Add returning High Narrow. This instruction adds each vector element in the first source SIMD&FP register to the corresponding vector element in the second source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vaddhn_s16(int16x8_t a, int16x8_t b)` | `ADDHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vaddhn_s32(int32x4_t a, int32x4_t b)` | `ADDHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vaddhn_s64(int64x2_t a, int64x2_t b)` | `ADDHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vaddhn_u16(uint16x8_t a, uint16x8_t b)` | `ADDHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vaddhn_u32(uint32x4_t a, uint32x4_t b)` | `ADDHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vaddhn_u64(uint64x2_t a, uint64x2_t b)` | `ADDHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |

---

## ADDHN2

**Description:** Add returning High Narrow. This instruction adds each vector element in the first source SIMD&FP register to the corresponding vector element in the second source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vaddhn_high_s16(int8x8_t r, int16x8_t a, int16x8_t b)` | `ADDHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `int16x8_t vaddhn_high_s32(int16x4_t r, int32x4_t a, int32x4_t b)` | `ADDHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `int32x4_t vaddhn_high_s64(int32x2_t r, int64x2_t a, int64x2_t b)` | `ADDHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |
| `uint8x16_t vaddhn_high_u16(uint8x8_t r, uint16x8_t a, uint16x8_t b)` | `ADDHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vaddhn_high_u32(uint16x4_t r, uint32x4_t a, uint32x4_t b)` | `ADDHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vaddhn_high_u64(uint32x2_t r, uint64x2_t a, uint64x2_t b)` | `ADDHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |

---

## ADDP

**Description:** Add Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements from the concatenated vector, adds each pair of values together, places the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[concat, 2*e, esize];
    element2 = Elem[concat, (2*e)+1, esize];
    Elem[result, e, esize] = element1 + element2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vpadd_s8(int8x8_t a, int8x8_t b)` | `ADDP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vpadd_s16(int16x4_t a, int16x4_t b)` | `ADDP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vpadd_s32(int32x2_t a, int32x2_t b)` | `ADDP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vpadd_u8(uint8x8_t a, uint8x8_t b)` | `ADDP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vpadd_u16(uint16x4_t a, uint16x4_t b)` | `ADDP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vpadd_u32(uint32x2_t a, uint32x2_t b)` | `ADDP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int8x16_t vpaddq_s8(int8x16_t a, int8x16_t b)` | `ADDP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x8_t vpaddq_s16(int16x8_t a, int16x8_t b)` | `ADDP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x4_t vpaddq_s32(int32x4_t a, int32x4_t b)` | `ADDP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vpaddq_s64(int64x2_t a, int64x2_t b)` | `ADDP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x16_t vpaddq_u8(uint8x16_t a, uint8x16_t b)` | `ADDP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x8_t vpaddq_u16(uint16x8_t a, uint16x8_t b)` | `ADDP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x4_t vpaddq_u32(uint32x4_t a, uint32x4_t b)` | `ADDP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vpaddq_u64(uint64x2_t a, uint64x2_t b)` | `ADDP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `int64_t vpaddd_s64(int64x2_t a)` | `ADDP Dd,Vn.2D` | `Dd -> result` | A64 |
| `uint64_t vpaddd_u64(uint64x2_t a)` | `ADDP Dd,Vn.2D` | `Dd -> result` | A64 |
| `int32_t vaddv_s32(int32x2_t a)` | `ADDP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |
| `int64_t vaddvq_s64(int64x2_t a)` | `ADDP Dd,Vn.2D` | `Dd -> result` | A64 |
| `uint32_t vaddv_u32(uint32x2_t a)` | `ADDP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |
| `uint64_t vaddvq_u64(uint64x2_t a)` | `ADDP Dd,Vn.2D` | `Dd -> result` | A64 |

---

## ADDV

**Description:** Add across Vector. This instruction adds every vector element in the source SIMD&FP register together, and writes the scalar result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
V[d] = Reduce(op, operand, esize);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8_t vaddv_s8(int8x8_t a)` | `ADDV Bd,Vn.8B` | `Bd -> result` | A64 |
| `int8_t vaddvq_s8(int8x16_t a)` | `ADDV Bd,Vn.16B` | `Bd -> result` | A64 |
| `int16_t vaddv_s16(int16x4_t a)` | `ADDV Hd,Vn.4H` | `Hd -> result` | A64 |
| `int16_t vaddvq_s16(int16x8_t a)` | `ADDV Hd,Vn.8H` | `Hd -> result` | A64 |
| `int32_t vaddvq_s32(int32x4_t a)` | `ADDV Sd,Vn.4S` | `Sd -> result` | A64 |
| `uint8_t vaddv_u8(uint8x8_t a)` | `ADDV Bd,Vn.8B` | `Bd -> result` | A64 |
| `uint8_t vaddvq_u8(uint8x16_t a)` | `ADDV Bd,Vn.16B` | `Bd -> result` | A64 |
| `uint16_t vaddv_u16(uint16x4_t a)` | `ADDV Hd,Vn.4H` | `Hd -> result` | A64 |
| `uint16_t vaddvq_u16(uint16x8_t a)` | `ADDV Hd,Vn.8H` | `Hd -> result` | A64 |
| `uint32_t vaddvq_u32(uint32x4_t a)` | `ADDV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## AESD

**Description:** AES single round decryption.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) result;
result = operand1 EOR operand2;
if decrypt then
    result = AESInvSubBytes(AESInvShiftRows(result));
else
    result = AESSubBytes(AESShiftRows(result));

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vaesdq_u8(uint8x16_t data, uint8x16_t key)` | `AESD Vd.16B,Vn.16B` | `Vd.16B -> result` | A32/A64 |

---

## AESE

**Description:** AES single round encryption.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) result;
result = operand1 EOR operand2;
if decrypt then
    result = AESInvSubBytes(AESInvShiftRows(result));
else
    result = AESSubBytes(AESShiftRows(result));

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vaeseq_u8(uint8x16_t data, uint8x16_t key)` | `AESE Vd.16B,Vn.16B` | `Vd.16B -> result` | A32/A64 |

---

## AESIMC

**Description:** AES inverse mix columns.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand = V[n];
bits(128) result;
if decrypt then
    result = AESInvMixColumns(operand);
else
    result = AESMixColumns(operand);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vaesimcq_u8(uint8x16_t data)` | `AESIMC Vd.16B,Vn.16B` | `Vd.16B -> result` | A32/A64 |

---

## AESMC

**Description:** AES mix columns.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand = V[n];
bits(128) result;
if decrypt then
    result = AESInvMixColumns(operand);
else
    result = AESMixColumns(operand);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vaesmcq_u8(uint8x16_t data)` | `AESMC Vd.16B,Vn.16B` | `Vd.16B -> result` | A32/A64 |

---

## AND

**Description:** Bitwise AND (vector). This instruction performs a bitwise AND between the two source SIMD&FP registers, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

if invert then operand2 = NOT(operand2);

case op of
    when LogicalOp_AND
        result = operand1 AND operand2;
    when LogicalOp_ORR
        result = operand1 OR operand2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vand_s8(int8x8_t a, int8x8_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vandq_s8(int8x16_t a, int8x16_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vand_s16(int16x4_t a, int16x4_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vandq_s16(int16x8_t a, int16x8_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vand_s32(int32x2_t a, int32x2_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vandq_s32(int32x4_t a, int32x4_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vand_s64(int64x1_t a, int64x1_t b)` | `AND Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vandq_s64(int64x2_t a, int64x2_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vand_u8(uint8x8_t a, uint8x8_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vandq_u8(uint8x16_t a, uint8x16_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vand_u16(uint16x4_t a, uint16x4_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vandq_u16(uint16x8_t a, uint16x8_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vand_u32(uint32x2_t a, uint32x2_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vandq_u32(uint32x4_t a, uint32x4_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vand_u64(uint64x1_t a, uint64x1_t b)` | `AND Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vandq_u64(uint64x2_t a, uint64x2_t b)` | `AND Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## BCAX

**Description:** Bit Clear and Exclusive OR performs a bitwise AND of the 128-bit vector in a source SIMD&FP register and the complement of the vector in another source SIMD&FP register, then performs a bitwise exclusive OR of the resulting vector and the vector in a third source SIMD&FP register, and writes the result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Va = V[a];
V[d] = Vn EOR (Vm AND NOT(Va));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vbcaxq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint16x8_t vbcaxq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint32x4_t vbcaxq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint64x2_t vbcaxq_u64(uint64x2_t a, uint64x2_t b, uint64x2_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int8x16_t vbcaxq_s8(int8x16_t a, int8x16_t b, int8x16_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int16x8_t vbcaxq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int32x4_t vbcaxq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int64x2_t vbcaxq_s64(int64x2_t a, int64x2_t b, int64x2_t c)` | `BCAX Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |

---

## BF1CVTL

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x8_t vcvt1_bf16_mf8_fpm(mfloat8x8_t vn, fpm_t fpm)` | `BF1CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vcvt1_low_bf16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `BF1CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |

---

## BF1CVTL2

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x8_t vcvt1_high_bf16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `BF1CVTL2 Vd.8H,Vn.16B` | `Vd.8H -> result` | A64 |

---

## BF2CVTL

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x8_t vcvt2_bf16_mf8_fpm(mfloat8x8_t vn, fpm_t fpm)` | `BF2CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vcvt2_low_bf16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `BF2CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |

---

## BF2CVTL2

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x8_t vcvt2_high_bf16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `BF2CVTL2 Vd.8H,Vn.16B` | `Vd.8H -> result` | A64 |

---

## BFCVT

**Description:** Floating-point convert from single-precision to BFloat16 format (scalar) converts the single-precision floating-point value in the 32-bit SIMD&FP source register to BFloat16 format and writes the result in the 16-bit SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(32) operand = V[n];
FPCRType fpcr    = FPCR[];
boolean merge    = IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

Elem[result, 0, 16] = FPConvertBF(operand, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16_t vcvth_bf16_f32(float32_t a)` | `BFCVT Hd,Sn` | `Hd -> result` | A32/A64 |

---

## BFCVTN

**Description:** Floating-point convert from single-precision to BFloat16 format (vector) reads each single-precision element in the SIMD&FP source vector, converts each value to BFloat16 format, and writes the results in the lower or upper half of the SIMD&FP destination vector. The result elements are half the width of the source elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand = V[n];
bits(64) result;

for e = 0 to elements-1
    Elem[result, e, 16] = FPConvertBF(Elem[operand, e, 32], FPCR[]);

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x4_t vcvt_bf16_f32(float32x4_t a)` | `BFCVTN Vd.4H,Vn.4S` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vcvtq_low_bf16_f32(float32x4_t a)` | `BFCVTN Vd.4H,Vn.4S` | `Vd.8H -> result` | A32/A64 |

---

## BFCVTN2

**Description:** Floating-point convert from single-precision to BFloat16 format (vector) reads each single-precision element in the SIMD&FP source vector, converts each value to BFloat16 format, and writes the results in the lower or upper half of the SIMD&FP destination vector. The result elements are half the width of the source elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand = V[n];
bits(64) result;

for e = 0 to elements-1
    Elem[result, e, 16] = FPConvertBF(Elem[operand, e, 32], FPCR[]);

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `bfloat16x8_t vcvtq_high_bf16_f32(bfloat16x8_t inactive, float32x4_t a)` | `BFCVTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | A32/A64 |

---

## BFDOT

**Description:** BFloat16 floating-point dot product (vector). This instruction delimits the source vectors into pairs of 16-bit BF16 elements. Within each pair, the elements in the first source vector are multiplied by the corresponding elements in the second source vector. The resulting single-precision products are then summed and added destructively to the single-precision element of the destination vector that aligns with the pair of BF16 values in the first source vector. The instruction ignores the FPCR and does not update the FPSR exception status.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;

for e = 0 to elements-1
    bits(16) elt1_a = Elem[operand1, 2 * e + 0, 16];
    bits(16) elt1_b = Elem[operand1, 2 * e + 1, 16];
    bits(16) elt2_a = Elem[operand2, 2 * e + 0, 16];
    bits(16) elt2_b = Elem[operand2, 2 * e + 1, 16];

    bits(32) sum = Elem[operand3, e, 32];
    sum = BFDotAdd(sum, elt1_a, elt1_b, elt2_a, elt2_b, FPCR[]);
    Elem[result, e, 32] = sum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vbfdot_f32(float32x2_t r, bfloat16x4_t a, bfloat16x4_t b)` | `BFDOT Vd.2S,Vn.4H,Vm.4H` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vbfdotq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b)` | `BFDOT Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vbfdot_lane_f32(float32x2_t r, bfloat16x4_t a, bfloat16x4_t b, __builtin_constant_p(lane))` | `BFDOT Vd.2S,Vn.4H,Vm.2H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vbfdotq_laneq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b, __builtin_constant_p(lane))` | `BFDOT Vd.4S,Vn.8H,Vm.2H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vbfdot_laneq_f32(float32x2_t r, bfloat16x4_t a, bfloat16x8_t b, __builtin_constant_p(lane))` | `BFDOT Vd.2S,Vn.4H,Vm.2H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vbfdotq_lane_f32(float32x4_t r, bfloat16x8_t a, bfloat16x4_t b, __builtin_constant_p(lane))` | `BFDOT Vd.4S,Vn.8H,Vm.2H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## BFMLALB

**Description:** BFloat16 floating-point widening multiply-add long (vector) widens the even-numbered (bottom) or odd-numbered (top) 16-bit elements in the first and second source vectors from Bfloat16 to single-precision format. The instruction then multiplies and adds these values to the overlapping single-precision elements of the destination vector.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand1 = V[n];
bits(128) operand2 = V[m];
bits(128) operand3 = V[d];
bits(128) result;

for e = 0 to elements-1
    bits(32) element1 = Elem[operand1, 2 * e + sel, 16] : Zeros(16);
    bits(32) element2 = Elem[operand2, 2 * e + sel, 16] : Zeros(16);
    bits(32) addend   = Elem[operand3, e, 32];
    Elem[result, e, 32] = BFMulAdd(addend, element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vbfmlalbq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b)` | `BFMLALB Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vbfmlalbq_lane_f32(float32x4_t r, bfloat16x8_t a, bfloat16x4_t b, __builtin_constant_p(lane))` | `BFMLALB Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vbfmlalbq_laneq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b, __builtin_constant_p(lane))` | `BFMLALB Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## BFMLALT

**Description:** BFloat16 floating-point widening multiply-add long (vector) widens the even-numbered (bottom) or odd-numbered (top) 16-bit elements in the first and second source vectors from Bfloat16 to single-precision format. The instruction then multiplies and adds these values to the overlapping single-precision elements of the destination vector.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand1 = V[n];
bits(128) operand2 = V[m];
bits(128) operand3 = V[d];
bits(128) result;

for e = 0 to elements-1
    bits(32) element1 = Elem[operand1, 2 * e + sel, 16] : Zeros(16);
    bits(32) element2 = Elem[operand2, 2 * e + sel, 16] : Zeros(16);
    bits(32) addend   = Elem[operand3, e, 32];
    Elem[result, e, 32] = BFMulAdd(addend, element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vbfmlaltq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b)` | `BFMLALT Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vbfmlaltq_lane_f32(float32x4_t r, bfloat16x8_t a, bfloat16x4_t b, __builtin_constant_p(lane))` | `BFMLALT Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vbfmlaltq_laneq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b, __builtin_constant_p(lane))` | `BFMLALT Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## BFMMLA

**Description:** BFloat16 floating-point matrix multiply-accumulate into 2x2 matrix. This instruction multiplies the 2x4 matrix of BF16 values held in the first 128-bit source vector by the 4x2 BF16 matrix in the second 128-bit source vector. The resulting 2x2 single-precision matrix product is then added destructively to the 2x2 single-precision matrix in the 128-bit destination vector. This is equivalent to performing a 4-way dot product per destination element. The instruction ignores the FPCR and does not update the FPSR exception status.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) op1 = V[n];
bits(128) op2 = V[m];
bits(128) acc = V[d];

V[d] = BFMatMulAdd(acc, op1, op2);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vbfmmlaq_f32(float32x4_t r, bfloat16x8_t a, bfloat16x8_t b)` | `BFMMLA Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A32/A64 |

---

## BIC

**Description:** Bitwise bit Clear (vector, register). This instruction performs a bitwise AND between the first source SIMD&FP register and the complement of the second source SIMD&FP register, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

if invert then operand2 = NOT(operand2);

case op of
    when LogicalOp_AND
        result = operand1 AND operand2;
    when LogicalOp_ORR
        result = operand1 OR operand2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vbic_s8(int8x8_t a, int8x8_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vbicq_s8(int8x16_t a, int8x16_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vbic_s16(int16x4_t a, int16x4_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vbicq_s16(int16x8_t a, int16x8_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vbic_s32(int32x2_t a, int32x2_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vbicq_s32(int32x4_t a, int32x4_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vbic_s64(int64x1_t a, int64x1_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t vbicq_s64(int64x2_t a, int64x2_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vbic_u8(uint8x8_t a, uint8x8_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vbicq_u8(uint8x16_t a, uint8x16_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vbic_u16(uint16x4_t a, uint16x4_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vbicq_u16(uint16x8_t a, uint16x8_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vbic_u32(uint32x2_t a, uint32x2_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vbicq_u32(uint32x4_t a, uint32x4_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vbic_u64(uint64x1_t a, uint64x1_t b)` | `BIC Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vbicq_u64(uint64x2_t a, uint64x2_t b)` | `BIC Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## BSL

**Description:** Bitwise Select. This instruction sets each bit in the destination SIMD&FP register to the corresponding bit from the first source SIMD&FP register when the original destination bit was 1, otherwise from the second source SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1;
bits(datasize) operand2;
bits(datasize) operand3;
bits(datasize) operand4 = V[n];

case op of
    when VBitOp_VEOR
        operand1 = V[m];
        operand2 = Zeros();
        operand3 = Ones();
    when VBitOp_VBSL
        operand1 = V[m];
        operand2 = operand1;
        operand3 = V[d];
    when VBitOp_VBIT
        operand1 = V[d];
        operand2 = operand1;
        operand3 = V[m];
    when VBitOp_VBIF
        operand1 = V[d];
        operand2 = operand1;
        operand3 = NOT(V[m]);

V[d] = operand1 EOR ((operand2 EOR operand4) AND operand3);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vbsl_s8(uint8x8_t a, int8x8_t b, int8x8_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vbslq_s8(uint8x16_t a, int8x16_t b, int8x16_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vbsl_s16(uint16x4_t a, int16x4_t b, int16x4_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vbslq_s16(uint16x8_t a, int16x8_t b, int16x8_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vbsl_s32(uint32x2_t a, int32x2_t b, int32x2_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vbslq_s32(uint32x4_t a, int32x4_t b, int32x4_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vbsl_s64(uint64x1_t a, int64x1_t b, int64x1_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t vbslq_s64(uint64x2_t a, int64x2_t b, int64x2_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vbsl_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vbslq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vbsl_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vbslq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vbsl_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vbslq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vbsl_u64(uint64x1_t a, uint64x1_t b, uint64x1_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vbslq_u64(uint64x2_t a, uint64x2_t b, uint64x2_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly64x1_t vbsl_p64(poly64x1_t a, poly64x1_t b, poly64x1_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A32/A64 |
| `poly64x2_t vbslq_p64(poly64x2_t a, poly64x2_t b, poly64x2_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A32/A64 |
| `float32x2_t vbsl_f32(uint32x2_t a, float32x2_t b, float32x2_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `float32x4_t vbslq_f32(uint32x4_t a, float32x4_t b, float32x4_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly8x8_t vbsl_p8(uint8x8_t a, poly8x8_t b, poly8x8_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vbslq_p8(uint8x16_t a, poly8x16_t b, poly8x16_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vbsl_p16(uint16x4_t a, poly16x4_t b, poly16x4_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x8_t vbslq_p16(uint16x8_t a, poly16x8_t b, poly16x8_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `float64x1_t vbsl_f64(uint64x1_t a, float64x1_t b, float64x1_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `float64x2_t vbslq_f64(uint64x2_t a, float64x2_t b, float64x2_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vbsl_mf8(uint8x8_t a, mfloat8x8_t b, mfloat8x8_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x16_t vbslq_mf8(uint8x16_t a, mfloat8x16_t b, mfloat8x16_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `float16x4_t vbsl_f16(uint16x4_t a, float16x4_t b, float16x4_t c)` | `BSL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `float16x8_t vbslq_f16(uint16x8_t a, float16x8_t b, float16x8_t c)` | `BSL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## CLS

**Description:** Count Leading Sign bits (vector). This instruction counts the number of consecutive bits following the most significant bit that are the same as the most significant bit in each vector element in the source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. The count does not include the most significant bit itself.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

integer count;
for e = 0 to elements-1
    if countop == CountOp_CLS then
        count = CountLeadingSignBits(Elem[operand, e, esize]);
    else
        count = CountLeadingZeroBits(Elem[operand, e, esize]);
    Elem[result, e, esize] = count<esize-1:0>;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vcls_s8(int8x8_t a)` | `CLS Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vclsq_s8(int8x16_t a)` | `CLS Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vcls_s16(int16x4_t a)` | `CLS Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vclsq_s16(int16x8_t a)` | `CLS Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vcls_s32(int32x2_t a)` | `CLS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vclsq_s32(int32x4_t a)` | `CLS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int8x8_t vcls_u8(uint8x8_t a)` | `CLS Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vclsq_u8(uint8x16_t a)` | `CLS Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vcls_u16(uint16x4_t a)` | `CLS Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vclsq_u16(uint16x8_t a)` | `CLS Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vcls_u32(uint32x2_t a)` | `CLS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vclsq_u32(uint32x4_t a)` | `CLS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## CLZ

**Description:** Count Leading Zero bits (vector). This instruction counts the number of consecutive zeros, starting from the most significant bit, in each vector element in the source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

integer count;
for e = 0 to elements-1
    if countop == CountOp_CLS then
        count = CountLeadingSignBits(Elem[operand, e, esize]);
    else
        count = CountLeadingZeroBits(Elem[operand, e, esize]);
    Elem[result, e, esize] = count<esize-1:0>;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vclz_s8(int8x8_t a)` | `CLZ Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vclzq_s8(int8x16_t a)` | `CLZ Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vclz_s16(int16x4_t a)` | `CLZ Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vclzq_s16(int16x8_t a)` | `CLZ Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vclz_s32(int32x2_t a)` | `CLZ Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vclzq_s32(int32x4_t a)` | `CLZ Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vclz_u8(uint8x8_t a)` | `CLZ Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vclzq_u8(uint8x16_t a)` | `CLZ Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vclz_u16(uint16x4_t a)` | `CLZ Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vclzq_u16(uint16x8_t a)` | `CLZ Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vclz_u32(uint32x2_t a)` | `CLZ Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vclzq_u32(uint32x4_t a)` | `CLZ Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## CMEQ

**Description:** Compare bitwise Equal (vector). This instruction compares each vector element from the first source SIMD&FP register with the corresponding vector element from the second source SIMD&FP register, and if the comparison is equal sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if and_test then
        test_passed = !IsZero(element1 AND element2);
    else
        test_passed = (element1 == element2);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vceq_s8(int8x8_t a, int8x8_t b)` | `CMEQ Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vceqq_s8(int8x16_t a, int8x16_t b)` | `CMEQ Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vceq_s16(int16x4_t a, int16x4_t b)` | `CMEQ Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vceqq_s16(int16x8_t a, int16x8_t b)` | `CMEQ Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vceq_s32(int32x2_t a, int32x2_t b)` | `CMEQ Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vceqq_s32(int32x4_t a, int32x4_t b)` | `CMEQ Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vceq_u8(uint8x8_t a, uint8x8_t b)` | `CMEQ Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vceqq_u8(uint8x16_t a, uint8x16_t b)` | `CMEQ Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vceq_u16(uint16x4_t a, uint16x4_t b)` | `CMEQ Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vceqq_u16(uint16x8_t a, uint16x8_t b)` | `CMEQ Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vceq_u32(uint32x2_t a, uint32x2_t b)` | `CMEQ Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vceqq_u32(uint32x4_t a, uint32x4_t b)` | `CMEQ Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vceq_p8(poly8x8_t a, poly8x8_t b)` | `CMEQ Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vceqq_p8(poly8x16_t a, poly8x16_t b)` | `CMEQ Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vceq_s64(int64x1_t a, int64x1_t b)` | `CMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vceqq_s64(int64x2_t a, int64x2_t b)` | `CMEQ Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64x1_t vceq_u64(uint64x1_t a, uint64x1_t b)` | `CMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vceqq_u64(uint64x2_t a, uint64x2_t b)` | `CMEQ Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64x1_t vceq_p64(poly64x1_t a, poly64x1_t b)` | `CMEQ Dd,Dn,Dm` | `Dd -> result` | A32/A64 |
| `uint64x2_t vceqq_p64(poly64x2_t a, poly64x2_t b)` | `CMEQ Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A32/A64 |
| `uint64_t vceqd_s64(int64_t a, int64_t b)` | `CMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64_t vceqd_u64(uint64_t a, uint64_t b)` | `CMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vceqz_s8(int8x8_t a)` | `CMEQ Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vceqzq_s8(int8x16_t a)` | `CMEQ Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vceqz_s16(int16x4_t a)` | `CMEQ Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vceqzq_s16(int16x8_t a)` | `CMEQ Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vceqz_s32(int32x2_t a)` | `CMEQ Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vceqzq_s32(int32x4_t a)` | `CMEQ Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint8x8_t vceqz_u8(uint8x8_t a)` | `CMEQ Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vceqzq_u8(uint8x16_t a)` | `CMEQ Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vceqz_u16(uint16x4_t a)` | `CMEQ Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vceqzq_u16(uint16x8_t a)` | `CMEQ Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vceqz_u32(uint32x2_t a)` | `CMEQ Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vceqzq_u32(uint32x4_t a)` | `CMEQ Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint8x8_t vceqz_p8(poly8x8_t a)` | `CMEQ Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vceqzq_p8(poly8x16_t a)` | `CMEQ Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint64x1_t vceqz_s64(int64x1_t a)` | `CMEQ Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vceqzq_s64(int64x2_t a)` | `CMEQ Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint64x1_t vceqz_u64(uint64x1_t a)` | `CMEQ Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vceqzq_u64(uint64x2_t a)` | `CMEQ Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint64x1_t vceqz_p64(poly64x1_t a)` | `CMEQ Dd,Dn,#0` | `Dd -> result` | A32/A64 |
| `uint64x2_t vceqzq_p64(poly64x2_t a)` | `CMEQ Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A32/A64 |
| `uint64_t vceqzd_s64(int64_t a)` | `CMEQ Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64_t vceqzd_u64(uint64_t a)` | `CMEQ Dd,Dn,#0` | `Dd -> result` | A64 |

---

## CMGE

**Description:** Compare signed Greater than or Equal (vector). This instruction compares each vector element in the first source SIMD&FP register with the corresponding vector element in the second source SIMD&FP register and if the first signed integer value is greater than or equal to the second signed integer value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    test_passed = if cmp_eq then element1 >= element2 else element1 > element2;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vcge_s8(int8x8_t a, int8x8_t b)` | `CMGE Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcgeq_s8(int8x16_t a, int8x16_t b)` | `CMGE Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcge_s16(int16x4_t a, int16x4_t b)` | `CMGE Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcgeq_s16(int16x8_t a, int16x8_t b)` | `CMGE Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcge_s32(int32x2_t a, int32x2_t b)` | `CMGE Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgeq_s32(int32x4_t a, int32x4_t b)` | `CMGE Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcge_s64(int64x1_t a, int64x1_t b)` | `CMGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgeq_s64(int64x2_t a, int64x2_t b)` | `CMGE Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcged_s64(int64_t a, int64_t b)` | `CMGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vcgez_s8(int8x8_t a)` | `CMGE Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vcgezq_s8(int8x16_t a)` | `CMGE Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vcgez_s16(int16x4_t a)` | `CMGE Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vcgezq_s16(int16x8_t a)` | `CMGE Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vcgez_s32(int32x2_t a)` | `CMGE Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcgezq_s32(int32x4_t a)` | `CMGE Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcgez_s64(int64x1_t a)` | `CMGE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcgezq_s64(int64x2_t a)` | `CMGE Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint64_t vcgezd_s64(int64_t a)` | `CMGE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint8x8_t vcle_s8(int8x8_t a, int8x8_t b)` | `CMGE Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcleq_s8(int8x16_t a, int8x16_t b)` | `CMGE Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcle_s16(int16x4_t a, int16x4_t b)` | `CMGE Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcleq_s16(int16x8_t a, int16x8_t b)` | `CMGE Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcle_s32(int32x2_t a, int32x2_t b)` | `CMGE Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcleq_s32(int32x4_t a, int32x4_t b)` | `CMGE Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcle_s64(int64x1_t a, int64x1_t b)` | `CMGE Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcleq_s64(int64x2_t a, int64x2_t b)` | `CMGE Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcled_s64(int64_t a, int64_t b)` | `CMGE Dd,Dm,Dn` | `Dd -> result` | A64 |

---

## CMGT

**Description:** Compare signed Greater than (vector). This instruction compares each vector element in the first source SIMD&FP register with the corresponding vector element in the second source SIMD&FP register and if the first signed integer value is greater than the second signed integer value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    test_passed = if cmp_eq then element1 >= element2 else element1 > element2;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vcgt_s8(int8x8_t a, int8x8_t b)` | `CMGT Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcgtq_s8(int8x16_t a, int8x16_t b)` | `CMGT Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcgt_s16(int16x4_t a, int16x4_t b)` | `CMGT Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcgtq_s16(int16x8_t a, int16x8_t b)` | `CMGT Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcgt_s32(int32x2_t a, int32x2_t b)` | `CMGT Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgtq_s32(int32x4_t a, int32x4_t b)` | `CMGT Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcgt_s64(int64x1_t a, int64x1_t b)` | `CMGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgtq_s64(int64x2_t a, int64x2_t b)` | `CMGT Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcgtd_s64(int64_t a, int64_t b)` | `CMGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vcgtz_s8(int8x8_t a)` | `CMGT Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vcgtzq_s8(int8x16_t a)` | `CMGT Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vcgtz_s16(int16x4_t a)` | `CMGT Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vcgtzq_s16(int16x8_t a)` | `CMGT Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vcgtz_s32(int32x2_t a)` | `CMGT Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcgtzq_s32(int32x4_t a)` | `CMGT Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcgtz_s64(int64x1_t a)` | `CMGT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcgtzq_s64(int64x2_t a)` | `CMGT Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint64_t vcgtzd_s64(int64_t a)` | `CMGT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint8x8_t vclt_s8(int8x8_t a, int8x8_t b)` | `CMGT Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcltq_s8(int8x16_t a, int8x16_t b)` | `CMGT Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vclt_s16(int16x4_t a, int16x4_t b)` | `CMGT Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcltq_s16(int16x8_t a, int16x8_t b)` | `CMGT Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vclt_s32(int32x2_t a, int32x2_t b)` | `CMGT Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcltq_s32(int32x4_t a, int32x4_t b)` | `CMGT Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vclt_s64(int64x1_t a, int64x1_t b)` | `CMGT Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcltq_s64(int64x2_t a, int64x2_t b)` | `CMGT Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcltd_s64(int64_t a, int64_t b)` | `CMGT Dd,Dm,Dn` | `Dd -> result` | A64 |

---

## CMHI

**Description:** Compare unsigned Higher (vector). This instruction compares each vector element in the first source SIMD&FP register with the corresponding vector element in the second source SIMD&FP register and if the first unsigned integer value is greater than the second unsigned integer value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    test_passed = if cmp_eq then element1 >= element2 else element1 > element2;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vcgt_u8(uint8x8_t a, uint8x8_t b)` | `CMHI Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcgtq_u8(uint8x16_t a, uint8x16_t b)` | `CMHI Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcgt_u16(uint16x4_t a, uint16x4_t b)` | `CMHI Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcgtq_u16(uint16x8_t a, uint16x8_t b)` | `CMHI Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcgt_u32(uint32x2_t a, uint32x2_t b)` | `CMHI Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgtq_u32(uint32x4_t a, uint32x4_t b)` | `CMHI Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcgt_u64(uint64x1_t a, uint64x1_t b)` | `CMHI Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgtq_u64(uint64x2_t a, uint64x2_t b)` | `CMHI Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcgtd_u64(uint64_t a, uint64_t b)` | `CMHI Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vclt_u8(uint8x8_t a, uint8x8_t b)` | `CMHI Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcltq_u8(uint8x16_t a, uint8x16_t b)` | `CMHI Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vclt_u16(uint16x4_t a, uint16x4_t b)` | `CMHI Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcltq_u16(uint16x8_t a, uint16x8_t b)` | `CMHI Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vclt_u32(uint32x2_t a, uint32x2_t b)` | `CMHI Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcltq_u32(uint32x4_t a, uint32x4_t b)` | `CMHI Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vclt_u64(uint64x1_t a, uint64x1_t b)` | `CMHI Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcltq_u64(uint64x2_t a, uint64x2_t b)` | `CMHI Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcltd_u64(uint64_t a, uint64_t b)` | `CMHI Dd,Dm,Dn` | `Dd -> result` | A64 |

---

## CMHS

**Description:** Compare unsigned Higher or Same (vector). This instruction compares each vector element in the first source SIMD&FP register with the corresponding vector element in the second source SIMD&FP register and if the first unsigned integer value is greater than or equal to the second unsigned integer value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    test_passed = if cmp_eq then element1 >= element2 else element1 > element2;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vcge_u8(uint8x8_t a, uint8x8_t b)` | `CMHS Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcgeq_u8(uint8x16_t a, uint8x16_t b)` | `CMHS Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcge_u16(uint16x4_t a, uint16x4_t b)` | `CMHS Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcgeq_u16(uint16x8_t a, uint16x8_t b)` | `CMHS Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcge_u32(uint32x2_t a, uint32x2_t b)` | `CMHS Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgeq_u32(uint32x4_t a, uint32x4_t b)` | `CMHS Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcge_u64(uint64x1_t a, uint64x1_t b)` | `CMHS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgeq_u64(uint64x2_t a, uint64x2_t b)` | `CMHS Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcged_u64(uint64_t a, uint64_t b)` | `CMHS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vcle_u8(uint8x8_t a, uint8x8_t b)` | `CMHS Vd.8B,Vm.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcleq_u8(uint8x16_t a, uint8x16_t b)` | `CMHS Vd.16B,Vm.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vcle_u16(uint16x4_t a, uint16x4_t b)` | `CMHS Vd.4H,Vm.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vcleq_u16(uint16x8_t a, uint16x8_t b)` | `CMHS Vd.8H,Vm.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vcle_u32(uint32x2_t a, uint32x2_t b)` | `CMHS Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcleq_u32(uint32x4_t a, uint32x4_t b)` | `CMHS Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcle_u64(uint64x1_t a, uint64x1_t b)` | `CMHS Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcleq_u64(uint64x2_t a, uint64x2_t b)` | `CMHS Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint64_t vcled_u64(uint64_t a, uint64_t b)` | `CMHS Dd,Dm,Dn` | `Dd -> result` | A64 |

---

## CMLE

**Description:** Compare signed Less than or Equal to zero (vector). This instruction reads each vector element in the source SIMD&FP register and if the signed integer value is less than or equal to zero sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;
boolean test_passed;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    case comparison of
        when CompareOp_GT test_passed = element > 0;
        when CompareOp_GE test_passed = element >= 0;
        when CompareOp_EQ test_passed = element == 0;
        when CompareOp_LE test_passed = element <= 0;
        when CompareOp_LT test_passed = element < 0;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vclez_s8(int8x8_t a)` | `CMLE Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vclezq_s8(int8x16_t a)` | `CMLE Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vclez_s16(int16x4_t a)` | `CMLE Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vclezq_s16(int16x8_t a)` | `CMLE Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vclez_s32(int32x2_t a)` | `CMLE Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vclezq_s32(int32x4_t a)` | `CMLE Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vclez_s64(int64x1_t a)` | `CMLE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vclezq_s64(int64x2_t a)` | `CMLE Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32x2_t vclez_f32(float32x2_t a)` | `CMLE Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint64_t vclezd_s64(int64_t a)` | `CMLE Dd,Dn,#0` | `Dd -> result` | A64 |

---

## CMLT

**Description:** Compare signed Less than zero (vector). This instruction reads each vector element in the source SIMD&FP register and if the signed integer value is less than zero sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;
boolean test_passed;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    case comparison of
        when CompareOp_GT test_passed = element > 0;
        when CompareOp_GE test_passed = element >= 0;
        when CompareOp_EQ test_passed = element == 0;
        when CompareOp_LE test_passed = element <= 0;
        when CompareOp_LT test_passed = element < 0;
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vcltz_s8(int8x8_t a)` | `CMLT Vd.8B,Vn.8B,#0` | `Vd.8B -> result` | A64 |
| `uint8x16_t vcltzq_s8(int8x16_t a)` | `CMLT Vd.16B,Vn.16B,#0` | `Vd.16B -> result` | A64 |
| `uint16x4_t vcltz_s16(int16x4_t a)` | `CMLT Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A64 |
| `uint16x8_t vcltzq_s16(int16x8_t a)` | `CMLT Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A64 |
| `uint32x2_t vcltz_s32(int32x2_t a)` | `CMLT Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcltzq_s32(int32x4_t a)` | `CMLT Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcltz_s64(int64x1_t a)` | `CMLT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcltzq_s64(int64x2_t a)` | `CMLT Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint64_t vcltzd_s64(int64_t a)` | `CMLT Dd,Dn,#0` | `Dd -> result` | A64 |

---

## CMTST

**Description:** Compare bitwise Test bits nonzero (vector). This instruction reads each vector element in the first source SIMD&FP register, performs an AND with the corresponding vector element in the second source SIMD&FP register, and if the result is not zero, sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
boolean test_passed;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if and_test then
        test_passed = !IsZero(element1 AND element2);
    else
        test_passed = (element1 == element2);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vtst_s8(int8x8_t a, int8x8_t b)` | `CMTST Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vtstq_s8(int8x16_t a, int8x16_t b)` | `CMTST Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vtst_s16(int16x4_t a, int16x4_t b)` | `CMTST Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vtstq_s16(int16x8_t a, int16x8_t b)` | `CMTST Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vtst_s32(int32x2_t a, int32x2_t b)` | `CMTST Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vtstq_s32(int32x4_t a, int32x4_t b)` | `CMTST Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vtst_u8(uint8x8_t a, uint8x8_t b)` | `CMTST Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vtstq_u8(uint8x16_t a, uint8x16_t b)` | `CMTST Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vtst_u16(uint16x4_t a, uint16x4_t b)` | `CMTST Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vtstq_u16(uint16x8_t a, uint16x8_t b)` | `CMTST Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vtst_u32(uint32x2_t a, uint32x2_t b)` | `CMTST Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vtstq_u32(uint32x4_t a, uint32x4_t b)` | `CMTST Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vtst_p8(poly8x8_t a, poly8x8_t b)` | `CMTST Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vtstq_p8(poly8x16_t a, poly8x16_t b)` | `CMTST Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vtst_s64(int64x1_t a, int64x1_t b)` | `CMTST Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vtstq_s64(int64x2_t a, int64x2_t b)` | `CMTST Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64x1_t vtst_u64(uint64x1_t a, uint64x1_t b)` | `CMTST Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vtstq_u64(uint64x2_t a, uint64x2_t b)` | `CMTST Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint64x1_t vtst_p64(poly64x1_t a, poly64x1_t b)` | `CMTST Dd,Dn,Dm` | `Dd -> result` | A32/A64 |
| `uint64x2_t vtstq_p64(poly64x2_t a, poly64x2_t b)` | `CMTST Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A32/A64 |
| `uint64_t vtstd_s64(int64_t a, int64_t b)` | `CMTST Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64_t vtstd_u64(uint64_t a, uint64_t b)` | `CMTST Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## CNT

**Description:** Population Count per byte. This instruction counts the number of bits that have a value of one in each vector element in the source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

integer count;
for e = 0 to elements-1
    count = BitCount(Elem[operand, e, esize]);
    Elem[result, e, esize] = count<esize-1:0>;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vcnt_s8(int8x8_t a)` | `CNT Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vcntq_s8(int8x16_t a)` | `CNT Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vcnt_u8(uint8x8_t a)` | `CNT Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vcntq_u8(uint8x16_t a)` | `CNT Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly8x8_t vcnt_p8(poly8x8_t a)` | `CNT Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vcntq_p8(poly8x16_t a)` | `CNT Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## CRC32B

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x04C11DB7 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32b(uint32_t a, uint8_t b)` | `CRC32B Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32CB

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x1EDC6F41 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32cb(uint32_t a, uint8_t b)` | `CRC32CB Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32CH

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x1EDC6F41 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32ch(uint32_t a, uint16_t b)` | `CRC32CH Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32CW

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x1EDC6F41 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32cw(uint32_t a, uint32_t b)` | `CRC32CW Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32CX

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x1EDC6F41 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32cd(uint32_t a, uint64_t b)` | `CRC32CX Wd,Wn,Xm` | `Wd -> result` | A32/A64 |

---

## CRC32H

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x04C11DB7 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32h(uint32_t a, uint16_t b)` | `CRC32H Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32W

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x04C11DB7 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32w(uint32_t a, uint32_t b)` | `CRC32W Wd,Wn,Wm` | `Wd -> result` | A32/A64 |

---

## CRC32X

**Description:** CRC32 checksum performs a cyclic redundancy check (CRC) calculation on a value held in a general-purpose register. It takes an input CRC value in the first source operand, performs a CRC on the input value in the second source operand, and returns the output CRC value. The second source operand can be 8, 16, 32, or 64 bits. To align with common usage, the bit order of the values is reversed as part of the operation, and the polynomial 0x04C11DB7 is used for the CRC calculation.

**Operation:**
```
bits(32)      acc     = X[n];   // accumulator
bits(size)    val     = X[m];   // input value
bits(32)      poly    = (if crc32c then 0x1EDC6F41 else 0x04C11DB7)<31:0>;

bits(32+size) tempacc = BitReverse(acc) : Zeros(size);
bits(size+32) tempval = BitReverse(val) : Zeros(32);

// Poly32Mod2 on a bitstring does a polynomial Modulus over {0,1} operation
X[d] = BitReverse(Poly32Mod2(tempacc EOR tempval, poly));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t __crc32d(uint32_t a, uint64_t b)` | `CRC32X Wd,Wn,Xm` | `Wd -> result` | A32/A64 |

---

## DUP

**Description:** Duplicate vector element to vector or scalar. This instruction duplicates the vector element at the specified element index in the source SIMD&FP register into a scalar or each element in a vector, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(idxdsize) operand = V[n];
bits(datasize) result;
bits(esize) element;

element = Elem[operand, index, esize];
for e = 0 to elements-1
    Elem[result, e, esize] = element;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int64x1_t vcopy_lane_s64(int64x1_t a, __builtin_constant_p(lane1), int64x1_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `uint64x1_t vcopy_lane_u64(uint64x1_t a, __builtin_constant_p(lane1), uint64x1_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `poly64x1_t vcopy_lane_p64(poly64x1_t a, __builtin_constant_p(lane1), poly64x1_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A32/A64 |
| `float64x1_t vcopy_lane_f64(float64x1_t a, __builtin_constant_p(lane1), float64x1_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `int64x1_t vcopy_laneq_s64(int64x1_t a, __builtin_constant_p(lane1), int64x2_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `uint64x1_t vcopy_laneq_u64(uint64x1_t a, __builtin_constant_p(lane1), uint64x2_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `poly64x1_t vcopy_laneq_p64(poly64x1_t a, __builtin_constant_p(lane1), poly64x2_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A32/A64 |
| `float64x1_t vcopy_laneq_f64(float64x1_t a, __builtin_constant_p(lane1), float64x2_t b, __builtin_constant_p(lane2))` | `DUP Dd,Vn.D[lane2]` | `Dd -> result` | A64 |
| `int8x8_t vdup_n_s8(int8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vdupq_n_s8(int8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vdup_n_s16(int16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vdupq_n_s16(int16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vdup_n_s32(int32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vdupq_n_s32(int32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vdupq_n_s64(int64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vdup_n_u8(uint8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vdupq_n_u8(uint8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vdup_n_u16(uint16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vdupq_n_u16(uint16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vdup_n_u32(uint32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vdupq_n_u32(uint32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vdupq_n_u64(uint64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x2_t vdupq_n_p64(poly64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | A32/A64 |
| `float32x2_t vdup_n_f32(float32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vdupq_n_f32(float32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x8_t vdup_n_p8(poly8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vdupq_n_p8(poly8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vdup_n_p16(poly16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vdupq_n_p16(poly16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `float64x2_t vdupq_n_f64(float64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | A64 |
| `mfloat8x8_t vdup_n_mf8(mfloat8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vdupq_n_mf8(mfloat8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | A64 |
| `int8x8_t vmov_n_s8(int8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmovq_n_s8(int8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmov_n_s16(int16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmovq_n_s16(int16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmov_n_s32(int32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmovq_n_s32(int32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vmov_n_s64(int64_t value)` | `DUP Vd.1D,rn` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x2_t vmovq_n_s64(int64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vmov_n_u8(uint8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmovq_n_u8(uint8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmov_n_u16(uint16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmovq_n_u16(uint16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmov_n_u32(uint32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmovq_n_u32(uint32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vmov_n_u64(uint64_t value)` | `DUP Vd.1D,rn` | `Vd.1D -> result` | v7/A32/A64 |
| `uint64x2_t vmovq_n_u64(uint64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | v7/A32/A64 |
| `float32x2_t vmov_n_f32(float32_t value)` | `DUP Vd.2S,rn` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vmovq_n_f32(float32_t value)` | `DUP Vd.4S,rn` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x8_t vmov_n_p8(poly8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vmovq_n_p8(poly8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vmov_n_p16(poly16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vmovq_n_p16(poly16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `float64x1_t vmov_n_f64(float64_t value)` | `DUP Vd.1D,rn` | `Vd.1D -> result` | A64 |
| `float64x2_t vmovq_n_f64(float64_t value)` | `DUP Vd.2D,rn` | `Vd.2D -> result` | A64 |
| `mfloat8x8_t vmov_n_mf8(mfloat8_t value)` | `DUP Vd.8B,rn` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vmovq_n_mf8(mfloat8_t value)` | `DUP Vd.16B,rn` | `Vd.16B -> result` | A64 |
| `int8x8_t vdup_lane_s8(int8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vdupq_lane_s8(int8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vdup_lane_s16(int16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vdupq_lane_s16(int16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vdup_lane_s32(int32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vdupq_lane_s32(int32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vdup_lane_s64(int64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vdupq_lane_s64(int64x1_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vdup_lane_u8(uint8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vdupq_lane_u8(uint8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vdup_lane_u16(uint16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vdupq_lane_u16(uint16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vdup_lane_u32(uint32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vdupq_lane_u32(uint32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vdup_lane_u64(uint64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vdupq_lane_u64(uint64x1_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x1_t vdup_lane_p64(poly64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A32/A64 |
| `poly64x2_t vdupq_lane_p64(poly64x1_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A32/A64 |
| `float32x2_t vdup_lane_f32(float32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vdupq_lane_f32(float32x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x8_t vdup_lane_p8(poly8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vdupq_lane_p8(poly8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vdup_lane_p16(poly16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vdupq_lane_p16(poly16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `float64x1_t vdup_lane_f64(float64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vdupq_lane_f64(float64x1_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A64 |
| `mfloat8x8_t vdup_lane_mf8(mfloat8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | /A64 |
| `mfloat8x16_t vdupq_lane_mf8(mfloat8x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | A64 |
| `int8x8_t vdup_laneq_s8(int8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | A64 |
| `int8x16_t vdupq_laneq_s8(int8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | A64 |
| `int16x4_t vdup_laneq_s16(int16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vdupq_laneq_s16(int16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vdup_laneq_s32(int32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vdupq_laneq_s32(int32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | A64 |
| `int64x1_t vdup_laneq_s64(int64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `int64x2_t vdupq_laneq_s64(int64x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A64 |
| `uint8x8_t vdup_laneq_u8(uint8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | A64 |
| `uint8x16_t vdupq_laneq_u8(uint8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | A64 |
| `uint16x4_t vdup_laneq_u16(uint16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vdupq_laneq_u16(uint16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vdup_laneq_u32(uint32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vdupq_laneq_u32(uint32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | A64 |
| `uint64x1_t vdup_laneq_u64(uint64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `uint64x2_t vdupq_laneq_u64(uint64x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A64 |
| `poly64x1_t vdup_laneq_p64(poly64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `poly64x2_t vdupq_laneq_p64(poly64x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A64 |
| `float32x2_t vdup_laneq_f32(float32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.2S,Vn.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vdupq_laneq_f32(float32x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4S,Vn.S[lane]` | `Vd.4S -> result` | A64 |
| `poly8x8_t vdup_laneq_p8(poly8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | A64 |
| `poly8x16_t vdupq_laneq_p8(poly8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | A64 |
| `poly16x4_t vdup_laneq_p16(poly16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A64 |
| `poly16x8_t vdupq_laneq_p16(poly16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A64 |
| `float64x1_t vdup_laneq_f64(float64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vdupq_laneq_f64(float64x2_t vec, __builtin_constant_p(lane))` | `DUP Vd.2D,Vn.D[lane]` | `Vd.2D -> result` | A64 |
| `mfloat8x8_t vdup_laneq_mf8(mfloat8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.8B,Vn.B[lane]` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vdupq_laneq_mf8(mfloat8x16_t vec, __builtin_constant_p(lane))` | `DUP Vd.16B,Vn.B[lane]` | `Vd.16B -> result` | A64 |
| `int8x16_t vcombine_s8(int8x8_t low, int8x8_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vcombine_s16(int16x4_t low, int16x4_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vcombine_s32(int32x2_t low, int32x2_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vcombine_s64(int64x1_t low, int64x1_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x16_t vcombine_u8(uint8x8_t low, uint8x8_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vcombine_u16(uint16x4_t low, uint16x4_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vcombine_u32(uint32x2_t low, uint32x2_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vcombine_u64(uint64x1_t low, uint64x1_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x2_t vcombine_p64(poly64x1_t low, poly64x1_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.2D -> result` | A32/A64 |
| `float16x8_t vcombine_f16(float16x4_t low, float16x4_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `float32x4_t vcombine_f32(float32x2_t low, float32x2_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vcombine_p8(poly8x8_t low, poly8x8_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vcombine_p16(poly16x4_t low, poly16x4_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `float64x2_t vcombine_f64(float64x1_t low, float64x1_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.2D -> result` | A64 |
| `mfloat8x16_t vcombine_mf8(mfloat8x8_t low, mfloat8x8_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.16B -> result` | A64 |
| `int8x8_t vget_high_s8(int8x16_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vget_high_s16(int16x8_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vget_high_s32(int32x4_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.2S -> result` | v7/A32/A64 |
| `int64x1_t vget_high_s64(int64x2_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.1D -> result` | v7/A32/A64 |
| `uint8x8_t vget_high_u8(uint8x16_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vget_high_u16(uint16x8_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vget_high_u32(uint32x4_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint64x1_t vget_high_u64(uint64x2_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.1D -> result` | v7/A32/A64 |
| `poly64x1_t vget_high_p64(poly64x2_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vget_high_f16(float16x8_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.4H -> result` | v7/A32/A64 |
| `float32x2_t vget_high_f32(float32x4_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vget_high_p8(poly8x16_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vget_high_p16(poly16x8_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.4H -> result` | v7/A32/A64 |
| `float64x1_t vget_high_f64(float64x2_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.1D -> result` | A64 |
| `mfloat8x8_t vget_high_mf8(mfloat8x16_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.8B -> result` | A64 |
| `int8x8_t vget_low_s8(int8x16_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vget_low_s16(int16x8_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vget_low_s32(int32x4_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int64x1_t vget_low_s64(int64x2_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.1D -> result` | v7/A32/A64 |
| `uint8x8_t vget_low_u8(uint8x16_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vget_low_u16(uint16x8_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vget_low_u32(uint32x4_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint64x1_t vget_low_u64(uint64x2_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.1D -> result` | v7/A32/A64 |
| `poly64x1_t vget_low_p64(poly64x2_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vget_low_f16(float16x8_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `float32x2_t vget_low_f32(float32x4_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vget_low_p8(poly8x16_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vget_low_p16(poly16x8_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `float64x1_t vget_low_f64(float64x2_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.1D -> result` | A64 |
| `mfloat8x8_t vget_low_mf8(mfloat8x16_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.8B -> result` | A64 |
| `int8_t vdupb_lane_s8(int8x8_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `int16_t vduph_lane_s16(int16x4_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `int32_t vdups_lane_s32(int32x2_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `int64_t vdupd_lane_s64(int64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `uint8_t vdupb_lane_u8(uint8x8_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `uint16_t vduph_lane_u16(uint16x4_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `uint32_t vdups_lane_u32(uint32x2_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `uint64_t vdupd_lane_u64(uint64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `float32_t vdups_lane_f32(float32x2_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `float64_t vdupd_lane_f64(float64x1_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `poly8_t vdupb_lane_p8(poly8x8_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `poly16_t vduph_lane_p16(poly16x4_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `mfloat8_t vdupb_lane_mf8(mfloat8x8_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `int8_t vdupb_laneq_s8(int8x16_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `int16_t vduph_laneq_s16(int16x8_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `int32_t vdups_laneq_s32(int32x4_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `int64_t vdupd_laneq_s64(int64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `uint8_t vdupb_laneq_u8(uint8x16_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `uint16_t vduph_laneq_u16(uint16x8_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `uint32_t vdups_laneq_u32(uint32x4_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `uint64_t vdupd_laneq_u64(uint64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `float32_t vdups_laneq_f32(float32x4_t vec, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | A64 |
| `float64_t vdupd_laneq_f64(float64x2_t vec, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `poly8_t vdupb_laneq_p8(poly8x16_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `poly16_t vduph_laneq_p16(poly16x8_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `mfloat8_t vdupb_laneq_mf8(mfloat8x16_t vec, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | A64 |
| `mfloat8_t vget_lane_mf8(mfloat8x8_t v, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | v7/A32/A64 |
| `float16_t vget_lane_f16(float16x4_t v, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | v7/A32/A64 |
| `float32_t vget_lane_f32(float32x2_t v, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | v7/A32/A64 |
| `float64_t vget_lane_f64(float64x1_t v, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `mfloat8_t vgetq_lane_mf8(mfloat8x16_t v, __builtin_constant_p(lane))` | `DUP Bd,Vn.B[lane]` | `Bd -> result` | v7/A32/A64 |
| `float16_t vgetq_lane_f16(float16x8_t v, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | v7/A32/A64 |
| `float32_t vgetq_lane_f32(float32x4_t v, __builtin_constant_p(lane))` | `DUP Sd,Vn.S[lane]` | `Sd -> result` | v7/A32/A64 |
| `float64_t vgetq_lane_f64(float64x2_t v, __builtin_constant_p(lane))` | `DUP Dd,Vn.D[lane]` | `Dd -> result` | A64 |
| `float16x4_t vmov_n_f16(float16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x8_t vmovq_n_f16(float16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `float16x4_t vdup_n_f16(float16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x8_t vdupq_n_f16(float16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | v7/A32/A64 |
| `float16x4_t vdup_lane_f16(float16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x8_t vdupq_lane_f16(float16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `float16x4_t vdup_laneq_f16(float16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vdupq_laneq_f16(float16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A64 |
| `float16_t vduph_lane_f16(float16x4_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `float16_t vduph_laneq_f16(float16x8_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A64 |
| `float16x4_t vcmla_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.4H, Vn.4H, Vm.H[lane % 2], #0` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_laneq_f32(float32x2_t r, float32x2_t a, float32x4_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.2S, Vn.2S, Vm.2S, #0` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot90_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.4H, Vn.4H, Vm.H[lane % 2], #90` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot90_laneq_f32(float32x2_t r, float32x2_t a, float32x4_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.2S, Vn.2S, Vm.2S, #90` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot180_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.4H, Vn.4H, Vm.H[lane % 2], #180` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot180_laneq_f32(float32x2_t r, float32x2_t a, float32x4_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.2S, Vn.2S, Vm.2S, #180` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot270_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.4H, Vn.4H, Vm.H[lane % 2], #270` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot270_laneq_f32(float32x2_t r, float32x2_t a, float32x4_t b, __builtin_constant_p(lane))` | `DUP Dm, Vm.D[1]; FCMLA Vd.2S, Vn.2S, Vm.2S, #270` | `Vd.2S -> result` | A32/A64 |
| `bfloat16x4_t vdup_n_bf16(bfloat16_t value)` | `DUP Vd.4H,rn` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vdupq_n_bf16(bfloat16_t value)` | `DUP Vd.8H,rn` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x4_t vdup_lane_bf16(bfloat16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vdupq_lane_bf16(bfloat16x4_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x4_t vdup_laneq_bf16(bfloat16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.4H,Vn.H[lane]` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vdupq_laneq_bf16(bfloat16x8_t vec, __builtin_constant_p(lane))` | `DUP Vd.8H,Vn.H[lane]` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vcombine_bf16(bfloat16x4_t low, bfloat16x4_t high)` | `DUP Vd.1D,Vn.D[0];INS Vd.D[1],Vm.D[0]` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x4_t vget_high_bf16(bfloat16x8_t a)` | `DUP Vd.1D,Vn.D[1]` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vget_low_bf16(bfloat16x8_t a)` | `DUP Vd.1D,Vn.D[0]` | `Vd.4H -> result` | A32/A64 |
| `bfloat16_t vget_lane_bf16(bfloat16x4_t v, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A32/A64 |
| `bfloat16_t vgetq_lane_bf16(bfloat16x8_t v, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A32/A64 |
| `bfloat16_t vduph_lane_bf16(bfloat16x4_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A32/A64 |
| `bfloat16_t vduph_laneq_bf16(bfloat16x8_t vec, __builtin_constant_p(lane))` | `DUP Hd,Vn.H[lane]` | `Hd -> result` | A32/A64 |

---

## EOR

**Description:** Bitwise Exclusive OR (vector). This instruction performs a bitwise Exclusive OR operation between the two source SIMD&FP registers, and places the result in the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1;
bits(datasize) operand2;
bits(datasize) operand3;
bits(datasize) operand4 = V[n];

case op of
    when VBitOp_VEOR
        operand1 = V[m];
        operand2 = Zeros();
        operand3 = Ones();
    when VBitOp_VBSL
        operand1 = V[m];
        operand2 = operand1;
        operand3 = V[d];
    when VBitOp_VBIT
        operand1 = V[d];
        operand2 = operand1;
        operand3 = V[m];
    when VBitOp_VBIF
        operand1 = V[d];
        operand2 = operand1;
        operand3 = NOT(V[m]);

V[d] = operand1 EOR ((operand2 EOR operand4) AND operand3);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t veor_s8(int8x8_t a, int8x8_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t veorq_s8(int8x16_t a, int8x16_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t veor_s16(int16x4_t a, int16x4_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t veorq_s16(int16x8_t a, int16x8_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t veor_s32(int32x2_t a, int32x2_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t veorq_s32(int32x4_t a, int32x4_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t veor_s64(int64x1_t a, int64x1_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t veorq_s64(int64x2_t a, int64x2_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t veor_u8(uint8x8_t a, uint8x8_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t veorq_u8(uint8x16_t a, uint8x16_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t veor_u16(uint16x4_t a, uint16x4_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t veorq_u16(uint16x8_t a, uint16x8_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t veor_u32(uint32x2_t a, uint32x2_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t veorq_u32(uint32x4_t a, uint32x4_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t veor_u64(uint64x1_t a, uint64x1_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t veorq_u64(uint64x2_t a, uint64x2_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly8x8_t vadd_p8(poly8x8_t a, poly8x8_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vadd_p16(poly16x4_t a, poly16x4_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly64x1_t vadd_p64(poly64x1_t a, poly64x1_t b)` | `EOR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vaddq_p8(poly8x16_t a, poly8x16_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vaddq_p16(poly16x8_t a, poly16x8_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly64x2_t vaddq_p64(poly64x2_t a, poly64x2_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly128_t vaddq_p128(poly128_t a, poly128_t b)` | `EOR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## EOR3

**Description:** Three-way Exclusive OR performs a three-way exclusive OR of the values in the three source SIMD&FP registers, and writes the result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Va = V[a];
V[d] = Vn EOR Vm EOR Va;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t veor3q_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint16x8_t veor3q_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint32x4_t veor3q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `uint64x2_t veor3q_u64(uint64x2_t a, uint64x2_t b, uint64x2_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int8x16_t veor3q_s8(int8x16_t a, int8x16_t b, int8x16_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int16x8_t veor3q_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int32x4_t veor3q_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |
| `int64x2_t veor3q_s64(int64x2_t a, int64x2_t b, int64x2_t c)` | `EOR3 Vd.16B, Vn.16B, Vm.16B, Va.16B` | `Vd.16B -> result` | A64 |

---

## EXT

**Description:** Extract vector from pair of vectors. This instruction extracts the lowest vector elements from the second source SIMD&FP register and the highest vector elements from the first source SIMD&FP register, concatenates the results into a vector, and writes the vector to the destination SIMD&FP register vector. The index value specifies the lowest vector element to extract from the first source register, and consecutive elements are extracted from the first, then second, source registers until the destination vector is filled.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) hi = V[m];
bits(datasize) lo = V[n];
bits(datasize*2) concat = hi : lo;

V[d] = concat<position+datasize-1:position>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vext_s8(int8x8_t a, int8x8_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vextq_s8(int8x16_t a, int8x16_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vext_s16(int16x4_t a, int16x4_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<1)` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vextq_s16(int16x8_t a, int16x8_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<1)` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vext_s32(int32x2_t a, int32x2_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<2)` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vextq_s32(int32x4_t a, int32x4_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<2)` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vext_s64(int64x1_t a, int64x1_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<3)` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t vextq_s64(int64x2_t a, int64x2_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<3)` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vext_u8(uint8x8_t a, uint8x8_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vextq_u8(uint8x16_t a, uint8x16_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vext_u16(uint16x4_t a, uint16x4_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<1)` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vextq_u16(uint16x8_t a, uint16x8_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<1)` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vext_u32(uint32x2_t a, uint32x2_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<2)` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vextq_u32(uint32x4_t a, uint32x4_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<2)` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vext_u64(uint64x1_t a, uint64x1_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<3)` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vextq_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<3)` | `Vd.16B -> result` | v7/A32/A64 |
| `poly64x1_t vext_p64(poly64x1_t a, poly64x1_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<3)` | `Vd.8B -> result` | A32/A64 |
| `poly64x2_t vextq_p64(poly64x2_t a, poly64x2_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<3)` | `Vd.16B -> result` | A32/A64 |
| `float32x2_t vext_f32(float32x2_t a, float32x2_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<2)` | `Vd.8B -> result` | v7/A32/A64 |
| `float32x4_t vextq_f32(float32x4_t a, float32x4_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<2)` | `Vd.16B -> result` | v7/A32/A64 |
| `float64x1_t vext_f64(float64x1_t a, float64x1_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<3)` | `Vd.8B -> result` | A64 |
| `float64x2_t vextq_f64(float64x2_t a, float64x2_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<3)` | `Vd.16B -> result` | A64 |
| `poly8x8_t vext_p8(poly8x8_t a, poly8x8_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vextq_p8(poly8x16_t a, poly8x16_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vext_p16(poly16x4_t a, poly16x4_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<1)` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x8_t vextq_p16(poly16x8_t a, poly16x8_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<1)` | `Vd.16B -> result` | v7/A32/A64 |
| `mfloat8x8_t vext_mf8(mfloat8x8_t a, mfloat8x8_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#n` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vextq_mf8(mfloat8x16_t a, mfloat8x16_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#n` | `Vd.16B -> result` | A64 |
| `float16x4_t vext_f16(float16x4_t a, float16x4_t b, __builtin_constant_p(n))` | `EXT Vd.8B,Vn.8B,Vm.8B,#(n<<1)` | `Vd.8B -> result` | v7/A32/A64 |
| `float16x8_t vextq_f16(float16x8_t a, float16x8_t b, __builtin_constant_p(n))` | `EXT Vd.16B,Vn.16B,Vm.16B,#(n<<1)` | `Vd.16B -> result` | v7/A32/A64 |

---

## F1CVTL

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vcvt1_f16_mf8_fpm(mfloat8x8_t vn, fpm_t fpm)` | `F1CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |
| `float16x8_t vcvt1_low_f16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `F1CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |

---

## F1CVTL2

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vcvt1_high_f16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `F1CVTL2 Vd.8H,Vn.16B` | `Vd.8H -> result` | A64 |

---

## F2CVTL

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vcvt2_f16_mf8_fpm(mfloat8x8_t vn, fpm_t fpm)` | `F2CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |
| `float16x8_t vcvt2_low_f16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `F2CVTL Vd.8H,Vn.8B` | `Vd.8H -> result` | A64 |

---

## F2CVTL2

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vcvt2_high_f16_mf8_fpm(mfloat8x16_t vn, fpm_t fpm)` | `F2CVTL2 Vd.8H,Vn.16B` | `Vd.8H -> result` | A64 |

---

## FABD

**Description:** Floating-point Absolute Difference (vector). This instruction subtracts the floating-point values in the elements of the second source SIMD&FP register, from the corresponding floating-point values in the elements of the first source SIMD&FP register, places the absolute value of each result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
bits(esize) diff;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[n] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    diff = FPSub(element1, element2, fpcr);
    Elem[result, e, esize] = if abs then FPAbs(diff) else diff;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vabd_f32(float32x2_t a, float32x2_t b)` | `FABD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vabdq_f32(float32x4_t a, float32x4_t b)` | `FABD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vabd_f64(float64x1_t a, float64x1_t b)` | `FABD Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vabdq_f64(float64x2_t a, float64x2_t b)` | `FABD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vabds_f32(float32_t a, float32_t b)` | `FABD Sd,Sn,Sm` | `Sd -> result` | A64 |
| `float64_t vabdd_f64(float64_t a, float64_t b)` | `FABD Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float16_t vabdh_f16(float16_t a, float16_t b)` | `FABD (scalar) Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vabd_f16(float16x4_t a, float16x4_t b)` | `FABD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vabdq_f16(float16x8_t a, float16x8_t b)` | `FABD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FABS

**Description:** Floating-point Absolute value (vector). This instruction calculates the absolute value of each vector element in the source SIMD&FP register, writes the result to a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    if neg then
        element = FPNeg(element);
    else
        element = FPAbs(element);
    Elem[result, e, esize] = element;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vabs_f32(float32x2_t a)` | `FABS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vabsq_f32(float32x4_t a)` | `FABS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vabs_f64(float64x1_t a)` | `FABS Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vabsq_f64(float64x2_t a)` | `FABS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vabsh_f16(float16_t a)` | `FABS Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vabs_f16(float16x4_t a)` | `FABS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vabsq_f16(float16x8_t a)` | `FABS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FACGE

**Description:** Floating-point Absolute Compare Greater than or Equal (vector). This instruction compares the absolute value of each floating-point value in the first source SIMD&FP register with the absolute value of the corresponding floating-point value in the second source SIMD&FP register and if the first value is greater than or equal to the second value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
boolean test_passed;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[m] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if abs then
        element1 = FPAbs(element1);
        element2 = FPAbs(element2);
    case cmp of
        when CompareOp_EQ test_passed = FPCompareEQ(element1, element2, fpcr);
        when CompareOp_GE test_passed = FPCompareGE(element1, element2, fpcr);
        when CompareOp_GT test_passed = FPCompareGT(element1, element2, fpcr);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcage_f32(float32x2_t a, float32x2_t b)` | `FACGE Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcageq_f32(float32x4_t a, float32x4_t b)` | `FACGE Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcage_f64(float64x1_t a, float64x1_t b)` | `FACGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcageq_f64(float64x2_t a, float64x2_t b)` | `FACGE Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcages_f32(float32_t a, float32_t b)` | `FACGE Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vcaged_f64(float64_t a, float64_t b)` | `FACGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint32x2_t vcale_f32(float32x2_t a, float32x2_t b)` | `FACGE Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcaleq_f32(float32x4_t a, float32x4_t b)` | `FACGE Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcale_f64(float64x1_t a, float64x1_t b)` | `FACGE Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcaleq_f64(float64x2_t a, float64x2_t b)` | `FACGE Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcales_f32(float32_t a, float32_t b)` | `FACGE Sd,Sm,Sn` | `Sd -> result` | A64 |
| `uint64_t vcaled_f64(float64_t a, float64_t b)` | `FACGE Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint16_t vcageh_f16(float16_t a, float16_t b)` | `FACGE Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16_t vcaleh_f16(float16_t a, float16_t b)` | `FACGE Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16x4_t vcage_f16(float16x4_t a, float16x4_t b)` | `FACGE Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcageq_f16(float16x8_t a, float16x8_t b)` | `FACGE Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcale_f16(float16x4_t a, float16x4_t b)` | `FACGE Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcaleq_f16(float16x8_t a, float16x8_t b)` | `FACGE Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FACGT

**Description:** Floating-point Absolute Compare Greater than (vector). This instruction compares the absolute value of each vector element in the first source SIMD&FP register with the absolute value of the corresponding vector element in the second source SIMD&FP register and if the first value is greater than the second value sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
boolean test_passed;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[m] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if abs then
        element1 = FPAbs(element1);
        element2 = FPAbs(element2);
    case cmp of
        when CompareOp_EQ test_passed = FPCompareEQ(element1, element2, fpcr);
        when CompareOp_GE test_passed = FPCompareGE(element1, element2, fpcr);
        when CompareOp_GT test_passed = FPCompareGT(element1, element2, fpcr);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcagt_f32(float32x2_t a, float32x2_t b)` | `FACGT Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcagtq_f32(float32x4_t a, float32x4_t b)` | `FACGT Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcagt_f64(float64x1_t a, float64x1_t b)` | `FACGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcagtq_f64(float64x2_t a, float64x2_t b)` | `FACGT Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcagts_f32(float32_t a, float32_t b)` | `FACGT Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vcagtd_f64(float64_t a, float64_t b)` | `FACGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint32x2_t vcalt_f32(float32x2_t a, float32x2_t b)` | `FACGT Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcaltq_f32(float32x4_t a, float32x4_t b)` | `FACGT Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcalt_f64(float64x1_t a, float64x1_t b)` | `FACGT Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcaltq_f64(float64x2_t a, float64x2_t b)` | `FACGT Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcalts_f32(float32_t a, float32_t b)` | `FACGT Sd,Sm,Sn` | `Sd -> result` | A64 |
| `uint64_t vcaltd_f64(float64_t a, float64_t b)` | `FACGT Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint16_t vcagth_f16(float16_t a, float16_t b)` | `FACGT Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16_t vcalth_f16(float16_t a, float16_t b)` | `FACGT Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16x4_t vcagt_f16(float16x4_t a, float16x4_t b)` | `FACGT Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcagtq_f16(float16x8_t a, float16x8_t b)` | `FACGT Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcalt_f16(float16x4_t a, float16x4_t b)` | `FACGT Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcaltq_f16(float16x8_t a, float16x8_t b)` | `FACGT Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FADD

**Description:** Floating-point Add (vector). This instruction adds corresponding vector elements in the two source SIMD&FP registers, writes the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPAdd(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vadd_f32(float32x2_t a, float32x2_t b)` | `FADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vaddq_f32(float32x4_t a, float32x4_t b)` | `FADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vadd_f64(float64x1_t a, float64x1_t b)` | `FADD Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vaddq_f64(float64x2_t a, float64x2_t b)` | `FADD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vaddh_f16(float16_t a, float16_t b)` | `FADD Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vadd_f16(float16x4_t a, float16x4_t b)` | `FADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vaddq_f16(float16x8_t a, float16x8_t b)` | `FADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FADDP

**Description:** Floating-point Add Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements from the concatenated vector, adds each pair of values together, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPAdd(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vpadd_f32(float32x2_t a, float32x2_t b)` | `FADDP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vpaddq_f32(float32x4_t a, float32x4_t b)` | `FADDP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vpaddq_f64(float64x2_t a, float64x2_t b)` | `FADDP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vpadds_f32(float32x2_t a)` | `FADDP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vpaddd_f64(float64x2_t a)` | `FADDP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float32_t vaddv_f32(float32x2_t a)` | `FADDP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float32_t vaddvq_f32(float32x4_t a)` | `FADDP Vt.4S,Vn.4S,Vm.4S;FADDP Sd,Vt.2S` | `Sd -> result` | A64 |
| `float64_t vaddvq_f64(float64x2_t a)` | `FADDP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float16x4_t vpadd_f16(float16x4_t a, float16x4_t b)` | `FADDP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vpaddq_f16(float16x8_t a, float16x8_t b)` | `FADDP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## FAMAX

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vamax_f16(float16x4_t vn, float16x4_t vm)` | `FAMAX Vd.4H, Vn.4H, Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vamaxq_f16(float16x8_t vn, float16x8_t vm)` | `FAMAX Vd.8H, Vn.8H, Vm.8H` | `Vd.8H -> result` | A64 |
| `float32x2_t vamax_f32(float32x2_t vn, float32x2_t vm)` | `FAMAX Vd.2S, Vn.2S, Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vamaxq_f32(float32x4_t vn, float32x4_t vm)` | `FAMAX Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vamaxq_f64(float64x2_t vn, float64x2_t vm)` | `FAMAX Vd.2D, Vn.2D, Vm.2D` | `Vd.2D -> result` | A64 |

---

## FAMIN

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vamin_f16(float16x4_t vn, float16x4_t vm)` | `FAMIN Vd.4H, Vn.4H, Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vaminq_f16(float16x8_t vn, float16x8_t vm)` | `FAMIN Vd.8H, Vn.8H, Vm.8H` | `Vd.8H -> result` | A64 |
| `float32x2_t vamin_f32(float32x2_t vn, float32x2_t vm)` | `FAMIN Vd.2S, Vn.2S, Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vaminq_f32(float32x4_t vn, float32x4_t vm)` | `FAMIN Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vaminq_f64(float64x2_t vn, float64x2_t vm)` | `FAMIN Vd.2D, Vn.2D, Vm.2D` | `Vd.2D -> result` | A64 |

---

## FCADD

**Description:** Floating-point Complex Add.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element3;

for e = 0 to (elements DIV 2) -1 
    case rot of 
        when '0'
            element1 = FPNeg(Elem[operand2, e*2+1, esize]); 
            element3 = Elem[operand2, e*2, esize];
        when '1'
            element1 = Elem[operand2, e*2+1, esize]; 
            element3 = FPNeg(Elem[operand2, e*2, esize]);   
    Elem[result, e*2,   esize] = FPAdd(Elem[operand1, e*2, esize], element1, FPCR[]);
    Elem[result, e*2+1, esize] = FPAdd(Elem[operand1, e*2+1, esize], element3, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vcadd_rot90_f16(float16x4_t a, float16x4_t b)` | `FCADD Vd.4H, Vn.4H, Vm.4H, #90` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcadd_rot90_f32(float32x2_t a, float32x2_t b)` | `FCADD Vd.2S, Vn.2S, Vm.2S, #90` | `Vd.2S -> result` | A32/A64 |
| `float16x8_t vcaddq_rot90_f16(float16x8_t a, float16x8_t b)` | `FCADD Vd.8H, Vn.8H, Vm.8H, #90` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcaddq_rot90_f32(float32x4_t a, float32x4_t b)` | `FCADD Vd.4S, Vn.4S, Vm.4S, #90` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcaddq_rot90_f64(float64x2_t a, float64x2_t b)` | `FCADD Vd.2D, Vn.2D, Vm.2D, #90` | `Vd.2D -> result` | A64 |
| `float16x4_t vcadd_rot270_f16(float16x4_t a, float16x4_t b)` | `FCADD Vd.4H, Vn.4H, Vm.4H, #270` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcadd_rot270_f32(float32x2_t a, float32x2_t b)` | `FCADD Vd.2S, Vn.2S, Vm.2S, #270` | `Vd.2S -> result` | A32/A64 |
| `float16x8_t vcaddq_rot270_f16(float16x8_t a, float16x8_t b)` | `FCADD Vd.8H, Vn.8H, Vm.8H, #270` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcaddq_rot270_f32(float32x4_t a, float32x4_t b)` | `FCADD Vd.4S, Vn.4S, Vm.4S, #270` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcaddq_rot270_f64(float64x2_t a, float64x2_t b)` | `FCADD Vd.2D, Vn.2D, Vm.2D, #270` | `Vd.2D -> result` | A64 |

---

## FCMEQ

**Description:** Floating-point Compare Equal (vector). This instruction compares each floating-point value from the first source SIMD&FP register, with the corresponding floating-point value from the second source SIMD&FP register, and if the comparison is equal sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
boolean test_passed;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[m] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if abs then
        element1 = FPAbs(element1);
        element2 = FPAbs(element2);
    case cmp of
        when CompareOp_EQ test_passed = FPCompareEQ(element1, element2, fpcr);
        when CompareOp_GE test_passed = FPCompareGE(element1, element2, fpcr);
        when CompareOp_GT test_passed = FPCompareGT(element1, element2, fpcr);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vceq_f32(float32x2_t a, float32x2_t b)` | `FCMEQ Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vceqq_f32(float32x4_t a, float32x4_t b)` | `FCMEQ Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vceq_f64(float64x1_t a, float64x1_t b)` | `FCMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vceqq_f64(float64x2_t a, float64x2_t b)` | `FCMEQ Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vceqs_f32(float32_t a, float32_t b)` | `FCMEQ Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vceqd_f64(float64_t a, float64_t b)` | `FCMEQ Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint32x2_t vceqz_f32(float32x2_t a)` | `FCMEQ Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vceqzq_f32(float32x4_t a)` | `FCMEQ Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vceqz_f64(float64x1_t a)` | `FCMEQ Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vceqzq_f64(float64x2_t a)` | `FCMEQ Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32_t vceqzs_f32(float32_t a)` | `FCMEQ Sd,Sn,#0` | `Sd -> result` | A64 |
| `uint64_t vceqzd_f64(float64_t a)` | `FCMEQ Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint16_t vceqzh_f16(float16_t a)` | `FCMEQ Hd,Hn,#0` | `Hd -> result` | A64 |
| `uint16_t vceqh_f16(float16_t a, float16_t b)` | `FCMEQ Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16x4_t vceqz_f16(float16x4_t a)` | `FCMEQ Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vceqzq_f16(float16x8_t a)` | `FCMEQ Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vceq_f16(float16x4_t a, float16x4_t b)` | `FCMEQ Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vceqq_f16(float16x8_t a, float16x8_t b)` | `FCMEQ Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCMGE

**Description:** Floating-point Compare Greater than or Equal (vector). This instruction reads each floating-point value in the first source SIMD&FP register and if the value is greater than or equal to the corresponding floating-point value in the second source SIMD&FP register sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
boolean test_passed;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[m] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if abs then
        element1 = FPAbs(element1);
        element2 = FPAbs(element2);
    case cmp of
        when CompareOp_EQ test_passed = FPCompareEQ(element1, element2, fpcr);
        when CompareOp_GE test_passed = FPCompareGE(element1, element2, fpcr);
        when CompareOp_GT test_passed = FPCompareGT(element1, element2, fpcr);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcge_f32(float32x2_t a, float32x2_t b)` | `FCMGE Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgeq_f32(float32x4_t a, float32x4_t b)` | `FCMGE Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcge_f64(float64x1_t a, float64x1_t b)` | `FCMGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgeq_f64(float64x2_t a, float64x2_t b)` | `FCMGE Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcges_f32(float32_t a, float32_t b)` | `FCMGE Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vcged_f64(float64_t a, float64_t b)` | `FCMGE Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint32x2_t vcgez_f32(float32x2_t a)` | `FCMGE Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcgezq_f32(float32x4_t a)` | `FCMGE Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcgez_f64(float64x1_t a)` | `FCMGE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcgezq_f64(float64x2_t a)` | `FCMGE Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32_t vcgezs_f32(float32_t a)` | `FCMGE Sd,Sn,#0` | `Sd -> result` | A64 |
| `uint64_t vcgezd_f64(float64_t a)` | `FCMGE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint32x2_t vcle_f32(float32x2_t a, float32x2_t b)` | `FCMGE Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcleq_f32(float32x4_t a, float32x4_t b)` | `FCMGE Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcle_f64(float64x1_t a, float64x1_t b)` | `FCMGE Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcleq_f64(float64x2_t a, float64x2_t b)` | `FCMGE Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcles_f32(float32_t a, float32_t b)` | `FCMGE Sd,Sm,Sn` | `Sd -> result` | A64 |
| `uint64_t vcled_f64(float64_t a, float64_t b)` | `FCMGE Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint16_t vcgezh_f16(float16_t a)` | `FCMGE Hd,Hn,#0` | `Hd -> result` | A64 |
| `uint16_t vcgeh_f16(float16_t a, float16_t b)` | `FCMGE Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16_t vcleh_f16(float16_t a, float16_t b)` | `FCMGE Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16x4_t vcgez_f16(float16x4_t a)` | `FCMGE Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcgezq_f16(float16x8_t a)` | `FCMGE Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcge_f16(float16x4_t a, float16x4_t b)` | `FCMGE Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcgeq_f16(float16x8_t a, float16x8_t b)` | `FCMGE Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcle_f16(float16x4_t a, float16x4_t b)` | `FCMGE Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcleq_f16(float16x8_t a, float16x8_t b)` | `FCMGE Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCMGT

**Description:** Floating-point Compare Greater than (vector). This instruction reads each floating-point value in the first source SIMD&FP register and if the value is greater than the corresponding floating-point value in the second source SIMD&FP register sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
boolean test_passed;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[m] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if abs then
        element1 = FPAbs(element1);
        element2 = FPAbs(element2);
    case cmp of
        when CompareOp_EQ test_passed = FPCompareEQ(element1, element2, fpcr);
        when CompareOp_GE test_passed = FPCompareGE(element1, element2, fpcr);
        when CompareOp_GT test_passed = FPCompareGT(element1, element2, fpcr);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcgt_f32(float32x2_t a, float32x2_t b)` | `FCMGT Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcgtq_f32(float32x4_t a, float32x4_t b)` | `FCMGT Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vcgt_f64(float64x1_t a, float64x1_t b)` | `FCMGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64x2_t vcgtq_f64(float64x2_t a, float64x2_t b)` | `FCMGT Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcgts_f32(float32_t a, float32_t b)` | `FCMGT Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vcgtd_f64(float64_t a, float64_t b)` | `FCMGT Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint32x2_t vcgtz_f32(float32x2_t a)` | `FCMGT Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcgtzq_f32(float32x4_t a)` | `FCMGT Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcgtz_f64(float64x1_t a)` | `FCMGT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcgtzq_f64(float64x2_t a)` | `FCMGT Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32_t vcgtzs_f32(float32_t a)` | `FCMGT Sd,Sn,#0` | `Sd -> result` | A64 |
| `uint64_t vcgtzd_f64(float64_t a)` | `FCMGT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint32x2_t vclt_f32(float32x2_t a, float32x2_t b)` | `FCMGT Vd.2S,Vm.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcltq_f32(float32x4_t a, float32x4_t b)` | `FCMGT Vd.4S,Vm.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vclt_f64(float64x1_t a, float64x1_t b)` | `FCMGT Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcltq_f64(float64x2_t a, float64x2_t b)` | `FCMGT Vd.2D,Vm.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vclts_f32(float32_t a, float32_t b)` | `FCMGT Sd,Sm,Sn` | `Sd -> result` | A64 |
| `uint64_t vcltd_f64(float64_t a, float64_t b)` | `FCMGT Dd,Dm,Dn` | `Dd -> result` | A64 |
| `uint16_t vcgtzh_f16(float16_t a)` | `FCMGT Hd,Hn,#0` | `Hd -> result` | A64 |
| `uint16_t vcgth_f16(float16_t a, float16_t b)` | `FCMGT Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16_t vclth_f16(float16_t a, float16_t b)` | `FCMGT Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint16x4_t vcgtz_f16(float16x4_t a)` | `FCMGT Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcgtzq_f16(float16x8_t a)` | `FCMGT Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcgt_f16(float16x4_t a, float16x4_t b)` | `FCMGT Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcgtq_f16(float16x8_t a, float16x8_t b)` | `FCMGT Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vclt_f16(float16x4_t a, float16x4_t b)` | `FCMGT Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcltq_f16(float16x8_t a, float16x8_t b)` | `FCMGT Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCMLA

**Description:** Floating-point Complex Multiply Accumulate.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
bits(esize) element3;
bits(esize) element4;
FPCRType fpcr = FPCR[];

for e = 0 to (elements DIV 2) -1
    case rot of
        when '00'
            element1 = Elem[operand2, e*2, esize];
            element2 = Elem[operand1, e*2, esize];
            element3 = Elem[operand2, e*2+1, esize];
            element4 = Elem[operand1, e*2, esize];
        when '01'
            element1 = FPNeg(Elem[operand2, e*2+1, esize]);
            element2 = Elem[operand1, e*2+1, esize];
            element3 = Elem[operand2, e*2, esize];
            element4 = Elem[operand1, e*2+1, esize];
        when '10'
            element1 = FPNeg(Elem[operand2, e*2, esize]);
            element2 = Elem[operand1, e*2, esize];
            element3 = FPNeg(Elem[operand2, e*2+1, esize]);
            element4 = Elem[operand1, e*2, esize];
        when '11'
            element1 = Elem[operand2, e*2+1, esize];
            element2 = Elem[operand1, e*2+1, esize];
            element3 = FPNeg(Elem[operand2, e*2, esize]);
            element4 = Elem[operand1, e*2+1, esize];

    Elem[result, e*2,   esize] = FPMulAdd(Elem[operand3, e*2, esize], element2, element1, fpcr);
    Elem[result, e*2+1, esize] = FPMulAdd(Elem[operand3, e*2+1, esize], element4, element3, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vcmla_f16(float16x4_t r, float16x4_t a, float16x4_t b)` | `FCMLA Vd.4H, Vn.4H, Vm.4H, #0` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_f32(float32x2_t r, float32x2_t a, float32x2_t b)` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #0` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_lane_f16(float16x4_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #0` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_lane_f32(float32x2_t r, float32x2_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #0` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #0` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcmlaq_f16(float16x8_t r, float16x8_t a, float16x8_t b)` | `FCMLA Vd.8H, Vn.8H, Vm.8H, #0` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_f32(float32x4_t r, float32x4_t a, float32x4_t b)` | `FCMLA Vd.4S, Vn.4S, Vm.4S, #0` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcmlaq_f64(float64x2_t r, float64x2_t a, float64x2_t b)` | `FCMLA Vd.2D, Vn.2D, Vm.2D, #0` | `Vd.2D -> result` | A64 |
| `float16x8_t vcmlaq_lane_f16(float16x8_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #0` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_lane_f32(float32x4_t r, float32x4_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #0` | `Vd.4S -> result` | A32/A64 |
| `float16x8_t vcmlaq_laneq_f16(float16x8_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #0` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_laneq_f32(float32x4_t r, float32x4_t a, float32x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #0` | `Vd.4S -> result` | A32/A64 |
| `float16x4_t vcmla_rot90_f16(float16x4_t r, float16x4_t a, float16x4_t b)` | `FCMLA Vd.4H, Vn.4H, Vm.4H, #90` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot90_f32(float32x2_t r, float32x2_t a, float32x2_t b)` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #90` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot90_lane_f16(float16x4_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #90` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot90_lane_f32(float32x2_t r, float32x2_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #90` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot90_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #90` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot90_f16(float16x8_t r, float16x8_t a, float16x8_t b)` | `FCMLA Vd.8H, Vn.8H, Vm.8H, #90` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot90_f32(float32x4_t r, float32x4_t a, float32x4_t b)` | `FCMLA Vd.4S, Vn.4S, Vm.4S, #90` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcmlaq_rot90_f64(float64x2_t r, float64x2_t a, float64x2_t b)` | `FCMLA Vd.2D, Vn.2D, Vm.2D, #90` | `Vd.2D -> result` | A64 |
| `float16x8_t vcmlaq_rot90_lane_f16(float16x8_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #90` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot90_lane_f32(float32x4_t r, float32x4_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #90` | `Vd.4S -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot90_laneq_f16(float16x8_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #90` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot90_laneq_f32(float32x4_t r, float32x4_t a, float32x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #90` | `Vd.4S -> result` | A32/A64 |
| `float16x4_t vcmla_rot180_f16(float16x4_t r, float16x4_t a, float16x4_t b)` | `FCMLA Vd.4H, Vn.4H, Vm.4H, #180` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot180_f32(float32x2_t r, float32x2_t a, float32x2_t b)` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #180` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot180_lane_f16(float16x4_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #180` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot180_lane_f32(float32x2_t r, float32x2_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #180` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot180_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #180` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot180_f16(float16x8_t r, float16x8_t a, float16x8_t b)` | `FCMLA Vd.8H, Vn.8H, Vm.8H, #180` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot180_f32(float32x4_t r, float32x4_t a, float32x4_t b)` | `FCMLA Vd.4S, Vn.4S, Vm.4S, #180` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcmlaq_rot180_f64(float64x2_t r, float64x2_t a, float64x2_t b)` | `FCMLA Vd.2D, Vn.2D, Vm.2D, #180` | `Vd.2D -> result` | A64 |
| `float16x8_t vcmlaq_rot180_lane_f16(float16x8_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #180` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot180_lane_f32(float32x4_t r, float32x4_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #180` | `Vd.4S -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot180_laneq_f16(float16x8_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #180` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot180_laneq_f32(float32x4_t r, float32x4_t a, float32x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #180` | `Vd.4S -> result` | A32/A64 |
| `float16x4_t vcmla_rot270_f16(float16x4_t r, float16x4_t a, float16x4_t b)` | `FCMLA Vd.4H, Vn.4H, Vm.4H, #270` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot270_f32(float32x2_t r, float32x2_t a, float32x2_t b)` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #270` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot270_lane_f16(float16x4_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #270` | `Vd.4H -> result` | A32/A64 |
| `float32x2_t vcmla_rot270_lane_f32(float32x2_t r, float32x2_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.2S, Vn.2S, Vm.2S, #270` | `Vd.2S -> result` | A32/A64 |
| `float16x4_t vcmla_rot270_laneq_f16(float16x4_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4H, Vn.4H, Vm.H[lane], #270` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot270_f16(float16x8_t r, float16x8_t a, float16x8_t b)` | `FCMLA Vd.8H, Vn.8H, Vm.8H, #270` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot270_f32(float32x4_t r, float32x4_t a, float32x4_t b)` | `FCMLA Vd.4S, Vn.4S, Vm.4S, #270` | `Vd.4S -> result` | A32/A64 |
| `float64x2_t vcmlaq_rot270_f64(float64x2_t r, float64x2_t a, float64x2_t b)` | `FCMLA Vd.2D, Vn.2D, Vm.2D, #270` | `Vd.2D -> result` | A64 |
| `float16x8_t vcmlaq_rot270_lane_f16(float16x8_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #270` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot270_lane_f32(float32x4_t r, float32x4_t a, float32x2_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #270` | `Vd.4S -> result` | A32/A64 |
| `float16x8_t vcmlaq_rot270_laneq_f16(float16x8_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FCMLA Vd.8H, Vn.8H, Vm.H[lane], #270` | `Vd.8H -> result` | A32/A64 |
| `float32x4_t vcmlaq_rot270_laneq_f32(float32x4_t r, float32x4_t a, float32x4_t b, __builtin_constant_p(lane))` | `FCMLA Vd.4S, Vn.4S, Vm.S[lane], #270` | `Vd.4S -> result` | A32/A64 |

---

## FCMLE

**Description:** Floating-point Compare Less than or Equal to zero (vector). This instruction reads each floating-point value in the source SIMD&FP register and if the value is less than or equal to zero sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) zero = FPZero('0');
bits(esize) element;
boolean test_passed;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    case comparison of
        when CompareOp_GT test_passed = FPCompareGT(element, zero, FPCR[]);
        when CompareOp_GE test_passed = FPCompareGE(element, zero, FPCR[]);
        when CompareOp_EQ test_passed = FPCompareEQ(element, zero, FPCR[]);
        when CompareOp_LE test_passed = FPCompareGE(zero, element, FPCR[]);
        when CompareOp_LT test_passed = FPCompareGT(zero, element, FPCR[]);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vclezq_f32(float32x4_t a)` | `FCMLE Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vclez_f64(float64x1_t a)` | `FCMLE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vclezq_f64(float64x2_t a)` | `FCMLE Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32_t vclezs_f32(float32_t a)` | `FCMLE Sd,Sn,#0` | `Sd -> result` | A64 |
| `uint64_t vclezd_f64(float64_t a)` | `FCMLE Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint16_t vclezh_f16(float16_t a)` | `FCMLE Hd,Hn,#0` | `Hd -> result` | A64 |
| `uint16x4_t vclez_f16(float16x4_t a)` | `FCMLE Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vclezq_f16(float16x8_t a)` | `FCMLE Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |

---

## FCMLT

**Description:** Floating-point Compare Less than zero (vector). This instruction reads each floating-point value in the source SIMD&FP register and if the value is less than zero sets every bit of the corresponding vector element in the destination SIMD&FP register to one, otherwise sets every bit of the corresponding vector element in the destination SIMD&FP register to zero.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) zero = FPZero('0');
bits(esize) element;
boolean test_passed;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    case comparison of
        when CompareOp_GT test_passed = FPCompareGT(element, zero, FPCR[]);
        when CompareOp_GE test_passed = FPCompareGE(element, zero, FPCR[]);
        when CompareOp_EQ test_passed = FPCompareEQ(element, zero, FPCR[]);
        when CompareOp_LE test_passed = FPCompareGE(zero, element, FPCR[]);
        when CompareOp_LT test_passed = FPCompareGT(zero, element, FPCR[]);
    Elem[result, e, esize] = if test_passed then Ones() else Zeros();

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcltz_f32(float32x2_t a)` | `FCMLT Vd.2S,Vn.2S,#0` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcltzq_f32(float32x4_t a)` | `FCMLT Vd.4S,Vn.4S,#0` | `Vd.4S -> result` | A64 |
| `uint64x1_t vcltz_f64(float64x1_t a)` | `FCMLT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint64x2_t vcltzq_f64(float64x2_t a)` | `FCMLT Vd.2D,Vn.2D,#0` | `Vd.2D -> result` | A64 |
| `uint32_t vcltzs_f32(float32_t a)` | `FCMLT Sd,Sn,#0` | `Sd -> result` | A64 |
| `uint64_t vcltzd_f64(float64_t a)` | `FCMLT Dd,Dn,#0` | `Dd -> result` | A64 |
| `uint16_t vcltzh_f16(float16_t a)` | `FCMLT Hd,Hn,#0` | `Hd -> result` | A64 |
| `uint16x4_t vcltz_f16(float16x4_t a)` | `FCMLT Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcltzq_f16(float16x8_t a)` | `FCMLT Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |

---

## FCVTAS

**Description:** Floating-point Convert to Signed integer, rounding to nearest with ties to Away (vector). This instruction converts each element in a vector from a floating-point value to a signed integer value using the Round to Nearest with Ties to Away rounding mode and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vcvta_s32_f32(float32x2_t a)` | `FCVTAS Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vcvtaq_s32_f32(float32x4_t a)` | `FCVTAS Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `int32_t vcvtas_s32_f32(float32_t a)` | `FCVTAS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vcvtas_s64_f32(float32_t a)` | `FCVTAS Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `int64x1_t vcvta_s64_f64(float64x1_t a)` | `FCVTAS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vcvtaq_s64_f64(float64x2_t a)` | `FCVTAS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int32_t vcvtad_s32_f64(float64_t a)` | `FCVTAS Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtad_s64_f64(float64_t a)` | `FCVTAS Dd,Dn` | `Dd -> result` | A64 |
| `int16_t vcvtah_s16_f16(float16_t a)` | `FCVTAS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vcvtah_s32_f16(float16_t a)` | `FCVTAS Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtah_s64_f16(float16_t a)` | `FCVTAS Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `int16x4_t vcvta_s16_f16(float16x4_t a)` | `FCVTAS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtaq_s16_f16(float16x8_t a)` | `FCVTAS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTAU

**Description:** Floating-point Convert to Unsigned integer, rounding to nearest with ties to Away (vector). This instruction converts each element in a vector from a floating-point value to an unsigned integer value using the Round to Nearest with Ties to Away rounding mode and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcvta_u32_f32(float32x2_t a)` | `FCVTAU Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vcvtaq_u32_f32(float32x4_t a)` | `FCVTAU Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `uint32_t vcvtas_u32_f32(float32_t a)` | `FCVTAU Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vcvtas_u64_f32(float32_t a)` | `FCVTAU Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `uint64x1_t vcvta_u64_f64(float64x1_t a)` | `FCVTAU Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcvtaq_u64_f64(float64x2_t a)` | `FCVTAU Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcvtad_u32_f64(float64_t a)` | `FCVTAU Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtad_u64_f64(float64_t a)` | `FCVTAU Dd,Dn` | `Dd -> result` | A64 |
| `uint16_t vcvtah_u16_f16(float16_t a)` | `FCVTAU Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vcvtah_u32_f16(float16_t a)` | `FCVTAU Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtah_u64_f16(float16_t a)` | `FCVTAU Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `uint16x4_t vcvta_u16_f16(float16x4_t a)` | `FCVTAU Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtaq_u16_f16(float16x8_t a)` | `FCVTAU Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTL

**Description:** Floating-point Convert to higher precision Long (vector). This instruction reads each element in a vector in the SIMD&FP source register, converts each value to double the precision of the source element using the rounding mode that is determined by the FPCR, and writes each result to the equivalent element of the vector in the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(2*datasize) result;

for e = 0 to elements-1
    Elem[result, e, 2*esize] = FPConvert(Elem[operand, e, esize], FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vcvt_f32_f16(float16x4_t a)` | `FCVTL Vd.4S,Vn.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x2_t vcvt_f64_f32(float32x2_t a)` | `FCVTL Vd.2D,Vn.2S` | `Vd.2D -> result` | A64 |

---

## FCVTL2

**Description:** Floating-point Convert to higher precision Long (vector). This instruction reads each element in a vector in the SIMD&FP source register, converts each value to double the precision of the source element using the rounding mode that is determined by the FPCR, and writes each result to the equivalent element of the vector in the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(2*datasize) result;

for e = 0 to elements-1
    Elem[result, e, 2*esize] = FPConvert(Elem[operand, e, esize], FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vcvt_high_f32_f16(float16x8_t a)` | `FCVTL2 Vd.4S,Vn.8H` | `Vd.4S -> result` | A64 |
| `float64x2_t vcvt_high_f64_f32(float32x4_t a)` | `FCVTL2 Vd.2D,Vn.4S` | `Vd.2D -> result` | A64 |

---

## FCVTMS

**Description:** Floating-point Convert to Signed integer, rounding toward Minus infinity (vector). This instruction converts a scalar or each element in a vector from a floating-point value to a signed integer value using the Round towards Minus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vcvtm_s32_f32(float32x2_t a)` | `FCVTMS Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vcvtmq_s32_f32(float32x4_t a)` | `FCVTMS Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `int32_t vcvtms_s32_f32(float32_t a)` | `FCVTMS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vcvtms_s64_f32(float32_t a)` | `FCVTMS Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `int64x1_t vcvtm_s64_f64(float64x1_t a)` | `FCVTMS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vcvtmq_s64_f64(float64x2_t a)` | `FCVTMS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int32_t vcvtmd_s32_f64(float64_t a)` | `FCVTMS Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtmd_s64_f64(float64_t a)` | `FCVTMS Dd,Dn` | `Dd -> result` | A64 |
| `int16_t vcvtmh_s16_f16(float16_t a)` | `FCVTMS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vcvtmh_s32_f16(float16_t a)` | `FCVTMS Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtmh_s64_f16(float16_t a)` | `FCVTMS Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `int16x4_t vcvtm_s16_f16(float16x4_t a)` | `FCVTMS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtmq_s16_f16(float16x8_t a)` | `FCVTMS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTMU

**Description:** Floating-point Convert to Unsigned integer, rounding toward Minus infinity (vector). This instruction converts a scalar or each element in a vector from a floating-point value to an unsigned integer value using the Round towards Minus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcvtm_u32_f32(float32x2_t a)` | `FCVTMU Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vcvtmq_u32_f32(float32x4_t a)` | `FCVTMU Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `uint32_t vcvtms_u32_f32(float32_t a)` | `FCVTMU Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vcvtms_u64_f32(float32_t a)` | `FCVTMU Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `uint64x1_t vcvtm_u64_f64(float64x1_t a)` | `FCVTMU Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcvtmq_u64_f64(float64x2_t a)` | `FCVTMU Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcvtmd_u32_f64(float64_t a)` | `FCVTMU Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtmd_u64_f64(float64_t a)` | `FCVTMU Dd,Dn` | `Dd -> result` | A64 |
| `uint16_t vcvtmh_u16_f16(float16_t a)` | `FCVTMU Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vcvtmh_u32_f16(float16_t a)` | `FCVTMU Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtmh_u64_f16(float16_t a)` | `FCVTMU Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `uint16x4_t vcvtm_u16_f16(float16x4_t a)` | `FCVTMU Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtmq_u16_f16(float16x8_t a)` | `FCVTMU Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTN

**Description:** Floating-point Convert to lower precision Narrow (vector). This instruction reads each vector element in the SIMD&FP source register, converts each result to half the precision of the source element, writes the final result to a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The rounding mode is determined by the FPCR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;

for e = 0 to elements-1
    Elem[result, e, esize] = FPConvert(Elem[operand, e, 2*esize], FPCR[]);

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vcvt_f16_f32(float32x4_t a)` | `FCVTN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `float32x2_t vcvt_f32_f64(float64x2_t a)` | `FCVTN Vd.2S,Vn.2D` | `Vd.2S -> result` | A64 |
| `mfloat8x8_t vcvt_mf8_f32_fpm(float32x4_t vn, float32x4_t vm, fpm_t fpm)` | `FCVTN Vd.8B, Vn.4S, Vm.4S` | `Vd.8B -> result` | A64 |
| `mfloat8x8_t vcvt_mf8_f16_fpm(float16x4_t vn, float16x4_t vm, fpm_t fpm)` | `FCVTN Vd.8B, Vn.4H, Vm.4H` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vcvtq_mf8_f16_fpm(float16x8_t vn, float16x8_t vm, fpm_t fpm)` | `FCVTN Vd.16B, Vn.8H, Vm.8H` | `Vd.16B -> result` | A64 |

---

## FCVTN2

**Description:** Floating-point Convert to lower precision Narrow (vector). This instruction reads each vector element in the SIMD&FP source register, converts each result to half the precision of the source element, writes the final result to a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The rounding mode is determined by the FPCR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;

for e = 0 to elements-1
    Elem[result, e, esize] = FPConvert(Elem[operand, e, 2*esize], FPCR[]);

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vcvt_high_f16_f32(float16x4_t r, float32x4_t a)` | `FCVTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | A64 |
| `float32x4_t vcvt_high_f32_f64(float32x2_t r, float64x2_t a)` | `FCVTN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | A64 |
| `mfloat8x16_t vcvt_high_mf8_f32_fpm(mfloat8x8_t vd, float32x4_t vn, float32x4_t vm, fpm_t fpm)` | `FCVTN2 Vd.16B, Vn.4S, Vm.4S` | `Vd.16B -> result` | A64 |

---

## FCVTNS

**Description:** Floating-point Convert to Signed integer, rounding to nearest with ties to even (vector). This instruction converts a scalar or each element in a vector from a floating-point value to a signed integer value using the Round to Nearest rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vcvtn_s32_f32(float32x2_t a)` | `FCVTNS Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vcvtnq_s32_f32(float32x4_t a)` | `FCVTNS Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `int32_t vcvtns_s32_f32(float32_t a)` | `FCVTNS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vcvtns_s64_f32(float32_t a)` | `FCVTNS Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `int64x1_t vcvtn_s64_f64(float64x1_t a)` | `FCVTNS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vcvtnq_s64_f64(float64x2_t a)` | `FCVTNS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int32_t vcvtnd_s32_f64(float64_t a)` | `FCVTNS Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtnd_s64_f64(float64_t a)` | `FCVTNS Dd,Dn` | `Dd -> result` | A64 |
| `int16_t vcvtnh_s16_f16(float16_t a)` | `FCVTNS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vcvtnh_s32_f16(float16_t a)` | `FCVTNS Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtnh_s64_f16(float16_t a)` | `FCVTNS Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `int16x4_t vcvtn_s16_f16(float16x4_t a)` | `FCVTNS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtnq_s16_f16(float16x8_t a)` | `FCVTNS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTNU

**Description:** Floating-point Convert to Unsigned integer, rounding to nearest with ties to even (vector). This instruction converts a scalar or each element in a vector from a floating-point value to an unsigned integer value using the Round to Nearest rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcvtn_u32_f32(float32x2_t a)` | `FCVTNU Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vcvtnq_u32_f32(float32x4_t a)` | `FCVTNU Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `uint32_t vcvtns_u32_f32(float32_t a)` | `FCVTNU Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vcvtns_u64_f32(float32_t a)` | `FCVTNU Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `uint64x1_t vcvtn_u64_f64(float64x1_t a)` | `FCVTNU Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcvtnq_u64_f64(float64x2_t a)` | `FCVTNU Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcvtnd_u32_f64(float64_t a)` | `FCVTNU Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtnd_u64_f64(float64_t a)` | `FCVTNU Dd,Dn` | `Dd -> result` | A64 |
| `uint16_t vcvtnh_u16_f16(float16_t a)` | `FCVTNU Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vcvtnh_u32_f16(float16_t a)` | `FCVTNU Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtnh_u64_f16(float16_t a)` | `FCVTNU Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `uint16x4_t vcvtn_u16_f16(float16x4_t a)` | `FCVTNU Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtnq_u16_f16(float16x8_t a)` | `FCVTNU Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTPS

**Description:** Floating-point Convert to Signed integer, rounding toward Plus infinity (vector). This instruction converts a scalar or each element in a vector from a floating-point value to a signed integer value using the Round towards Plus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vcvtp_s32_f32(float32x2_t a)` | `FCVTPS Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vcvtpq_s32_f32(float32x4_t a)` | `FCVTPS Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `int32_t vcvtps_s32_f32(float32_t a)` | `FCVTPS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vcvtps_s64_f32(float32_t a)` | `FCVTPS Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `int64x1_t vcvtp_s64_f64(float64x1_t a)` | `FCVTPS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vcvtpq_s64_f64(float64x2_t a)` | `FCVTPS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int32_t vcvtpd_s32_f64(float64_t a)` | `FCVTPS Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtpd_s64_f64(float64_t a)` | `FCVTPS Dd,Dn` | `Dd -> result` | A64 |
| `int16_t vcvtph_s16_f16(float16_t a)` | `FCVTPS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vcvtph_s32_f16(float16_t a)` | `FCVTPS Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtph_s64_f16(float16_t a)` | `FCVTPS Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `int16x4_t vcvtp_s16_f16(float16x4_t a)` | `FCVTPS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtpq_s16_f16(float16x8_t a)` | `FCVTPS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTPU

**Description:** Floating-point Convert to Unsigned integer, rounding toward Plus infinity (vector). This instruction converts a scalar or each element in a vector from a floating-point value to an unsigned integer value using the Round towards Plus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, 0, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcvtp_u32_f32(float32x2_t a)` | `FCVTPU Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vcvtpq_u32_f32(float32x4_t a)` | `FCVTPU Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `uint32_t vcvtps_u32_f32(float32_t a)` | `FCVTPU Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vcvtps_u64_f32(float32_t a)` | `FCVTPU Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `uint64x1_t vcvtp_u64_f64(float64x1_t a)` | `FCVTPU Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcvtpq_u64_f64(float64x2_t a)` | `FCVTPU Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcvtpd_u32_f64(float64_t a)` | `FCVTPU Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtpd_u64_f64(float64_t a)` | `FCVTPU Dd,Dn` | `Dd -> result` | A64 |
| `uint16_t vcvtph_u16_f16(float16_t a)` | `FCVTPU Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vcvtph_u32_f16(float16_t a)` | `FCVTPU Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtph_u64_f16(float16_t a)` | `FCVTPU Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `uint16x4_t vcvtp_u16_f16(float16x4_t a)` | `FCVTPU Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtpq_u16_f16(float16x8_t a)` | `FCVTPU Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FCVTXN

**Description:** Floating-point Convert to lower precision Narrow, rounding to odd (vector). This instruction reads each vector element in the source SIMD&FP register, narrows each value to half the precision of the source element using the Round to Odd rounding mode, writes the result to a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(2*datasize) operand = V[n];
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    Elem[result, e, esize] = FPConvert(Elem[operand, e, 2*esize], fpcr, FPRounding_ODD);

if merge then
    V[d] = result;
else
    Vpart[d, part] = Elem[result, 0, datasize];
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vcvtx_f32_f64(float64x2_t a)` | `FCVTXN Vd.2S,Vn.2D` | `Vd.2S -> result` | A64 |
| `float32_t vcvtxd_f32_f64(float64_t a)` | `FCVTXN Sd,Dn` | `Sd -> result` | A64 |

---

## FCVTXN2

**Description:** Floating-point Convert to lower precision Narrow, rounding to odd (vector). This instruction reads each vector element in the source SIMD&FP register, narrows each value to half the precision of the source element using the Round to Odd rounding mode, writes the result to a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(2*datasize) operand = V[n];
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    Elem[result, e, esize] = FPConvert(Elem[operand, e, 2*esize], fpcr, FPRounding_ODD);

if merge then
    V[d] = result;
else
    Vpart[d, part] = Elem[result, 0, datasize];
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vcvtx_high_f32_f64(float32x2_t r, float64x2_t a)` | `FCVTXN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | A64 |

---

## FCVTZS

**Description:** Floating-point Convert to Signed fixed-point, rounding toward Zero (vector). This instruction converts a scalar or each element in a vector from floating-point to fixed-point signed integer using the Round towards Zero rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();
for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, fracbits, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vcvt_s32_f32(float32x2_t a)` | `FCVTZS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vcvtq_s32_f32(float32x4_t a)` | `FCVTZS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int32_t vcvts_s32_f32(float32_t a)` | `FCVTZS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vcvts_s64_f32(float32_t a)` | `FCVTZS Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `int64x1_t vcvt_s64_f64(float64x1_t a)` | `FCVTZS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vcvtq_s64_f64(float64x2_t a)` | `FCVTZS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int32_t vcvtd_s32_f64(float64_t a)` | `FCVTZS Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvtd_s64_f64(float64_t a)` | `FCVTZS Dd,Dn` | `Dd -> result` | A64 |
| `int32x2_t vcvt_n_s32_f32(float32x2_t a, __builtin_constant_p(n))` | `FCVTZS Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vcvtq_n_s32_f32(float32x4_t a, __builtin_constant_p(n))` | `FCVTZS Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int32_t vcvts_n_s32_f32(float32_t a, __builtin_constant_p(n))` | `FCVTZS Sd,Sn,#n` | `Sd -> result` | A64 |
| `int64x1_t vcvt_n_s64_f64(float64x1_t a, __builtin_constant_p(n))` | `FCVTZS Dd,Dn,#n` | `Dd -> result` | A64 |
| `int64x2_t vcvtq_n_s64_f64(float64x2_t a, __builtin_constant_p(n))` | `FCVTZS Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A64 |
| `int64_t vcvtd_n_s64_f64(float64_t a, __builtin_constant_p(n))` | `FCVTZS Dd,Dn,#n` | `Dd -> result` | A64 |
| `int16_t vcvth_s16_f16(float16_t a)` | `FCVTZS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vcvth_s32_f16(float16_t a)` | `FCVTZS Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `int64_t vcvth_s64_f16(float16_t a)` | `FCVTZS Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `int16_t vcvth_n_s16_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZS Hd,Hn,#n` | `Hd -> result` | A64 |
| `int32_t vcvth_n_s32_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZS Hd,Hn,#n` | `Hd -> result` | A32/A64 |
| `int64_t vcvth_n_s64_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZS Hd,Hn,#n` | `Hd -> result` | A64 |
| `int16x4_t vcvt_s16_f16(float16x4_t a)` | `FCVTZS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtq_s16_f16(float16x8_t a)` | `FCVTZS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |
| `uint16x4_t vcvt_u16_f16(float16x4_t a)` | `FCVTZS Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtq_u16_f16(float16x8_t a)` | `FCVTZS Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |
| `int16x4_t vcvt_n_s16_f16(float16x4_t a, __builtin_constant_p(n))` | `FCVTZS Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | A32/A64 |
| `int16x8_t vcvtq_n_s16_f16(float16x8_t a, __builtin_constant_p(n))` | `FCVTZS Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | A32/A64 |

---

## FCVTZU

**Description:** Floating-point Convert to Unsigned fixed-point, rounding toward Zero (vector). This instruction converts a scalar or each element in a vector from floating-point to fixed-point unsigned integer using the Round towards Zero rounding mode, and writes the result to the general-purpose destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();
for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPToFixed(element, fracbits, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vcvt_u32_f32(float32x2_t a)` | `FCVTZU Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcvtq_u32_f32(float32x4_t a)` | `FCVTZU Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint32_t vcvts_u32_f32(float32_t a)` | `FCVTZU Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vcvts_u64_f32(float32_t a)` | `FCVTZU Dd/Xd,Sn` | `Dd/Xd -> result` | A64 |
| `uint64x1_t vcvt_u64_f64(float64x1_t a)` | `FCVTZU Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vcvtq_u64_f64(float64x2_t a)` | `FCVTZU Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint32_t vcvtd_u32_f64(float64_t a)` | `FCVTZU Sd/Wd,Dn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvtd_u64_f64(float64_t a)` | `FCVTZU Dd,Dn` | `Dd -> result` | A64 |
| `uint32x2_t vcvt_n_u32_f32(float32x2_t a, __builtin_constant_p(n))` | `FCVTZU Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vcvtq_n_u32_f32(float32x4_t a, __builtin_constant_p(n))` | `FCVTZU Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint32_t vcvts_n_u32_f32(float32_t a, __builtin_constant_p(n))` | `FCVTZU Sd,Sn,#n` | `Sd -> result` | A64 |
| `uint64x1_t vcvt_n_u64_f64(float64x1_t a, __builtin_constant_p(n))` | `FCVTZU Dd,Dn,#n` | `Dd -> result` | A64 |
| `uint64x2_t vcvtq_n_u64_f64(float64x2_t a, __builtin_constant_p(n))` | `FCVTZU Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A64 |
| `uint64_t vcvtd_n_u64_f64(float64_t a, __builtin_constant_p(n))` | `FCVTZU Dd,Dn,#n` | `Dd -> result` | A64 |
| `uint16_t vcvth_u16_f16(float16_t a)` | `FCVTZU Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vcvth_u32_f16(float16_t a)` | `FCVTZU Sd/Wd,Hn` | `Sd/Wd -> result` | A64 |
| `uint64_t vcvth_u64_f16(float16_t a)` | `FCVTZU Dd/Xd,Hn` | `Dd/Xd -> result` | A64 |
| `uint16_t vcvth_n_u16_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZU Hd,Hn,#n` | `Hd -> result` | A64 |
| `uint32_t vcvth_n_u32_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZU Hd,Hn,#n` | `Hd -> result` | A32/A64 |
| `uint64_t vcvth_n_u64_f16(float16_t a, __builtin_constant_p(n))` | `FCVTZU Hd,Hn,#n` | `Hd -> result` | A64 |
| `uint16x4_t vcvt_n_u16_f16(float16x4_t a, __builtin_constant_p(n))` | `FCVTZU Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | A32/A64 |
| `uint16x8_t vcvtq_n_u16_f16(float16x8_t a, __builtin_constant_p(n))` | `FCVTZU Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | A32/A64 |

---

## FDIV

**Description:** Floating-point Divide (vector). This instruction divides the floating-point values in the elements in the first source SIMD&FP register, by the floating-point values in the corresponding elements in the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPDiv(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vdiv_f32(float32x2_t a, float32x2_t b)` | `FDIV Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vdivq_f32(float32x4_t a, float32x4_t b)` | `FDIV Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x1_t vdiv_f64(float64x1_t a, float64x1_t b)` | `FDIV Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vdivq_f64(float64x2_t a, float64x2_t b)` | `FDIV Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vdivh_f16(float16_t a, float16_t b)` | `FDIV Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vdiv_f16(float16x4_t a, float16x4_t b)` | `FDIV Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vdivq_f16(float16x8_t a, float16x8_t b)` | `FDIV Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## FDOT

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vdot_f32_mf8_fpm(float32x2_t vd, mfloat8x8_t vn, mfloat8x8_t vm, fpm_t fpm)` | `FDOT Vd.2S, Vn.8B, Vm.8B` | `Vd.2S -> result` | A64 |
| `float32x4_t vdotq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FDOT Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |
| `float32x2_t vdot_lane_f32_mf8_fpm(float32x2_t vd, mfloat8x8_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.2S, Vn.8B, Vm.4B[lane]` | `Vd.2S -> result` | A64 |
| `float32x2_t vdot_laneq_f32_mf8_fpm(float32x2_t vd, mfloat8x8_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.2S, Vn.8B, Vm.4B[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vdotq_lane_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.4S, Vn.8B, Vm.4B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vdotq_laneq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.4S, Vn.8B, Vm.4B[lane]` | `Vd.4SB -> result` | A64 |
| `float16x4_t vdot_f16_mf8_fpm(float16x4_t vd, mfloat8x8_t vn, mfloat8x8_t vm, fpm_t fpm)` | `FDOT Vd.4H, Vn.8B, Vm.8B` | `Vd.4H -> result` | A64 |
| `float16x8_t vdotq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FDOT Vd.8H, Vn.16B, Vm.16B` | `Vd.8H -> result` | A64 |
| `float16x4_t vdot_lane_f16_mf8_fpm(float16x4_t vd, mfloat8x8_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.4H, Vn.8B, Vm.2B[lane]` | `Vd.4H -> result` | A64 |
| `float16x4_t vdot_laneq_f16_mf8_fpm(float16x4_t vd, mfloat8x8_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.4H, Vn.8B, Vm.2B[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vdotq_lane_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.8H, Vn.16B, Vm.2B[lane]` | `Vd.8H -> result` | A64 |
| `float16x8_t vdotq_laneq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FDOT Vd.8H, Vn.16B, Vm.2B[lane]` | `Vd.8H -> result` | A64 |

---

## FMADD

**Description:** Floating-point fused Multiply-Add (scalar). This instruction multiplies the values of the first two SIMD&FP source registers, adds the product to the value of the third SIMD&FP source register, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(esize) operanda = V[a];
bits(esize) operand1 = V[n];
bits(esize) operand2 = V[m];

FPCRType fpcr = FPCR[];
boolean merge    = IsMerging(fpcr);
bits(128) result = if merge then V[a] else Zeros();

if opa_neg then operanda = FPNeg(operanda);
if op1_neg then operand1 = FPNeg(operand1);
Elem[result, 0, esize] = FPMulAdd(operanda, operand1, operand2, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float64x1_t vfma_f64(float64x1_t a, float64x1_t b, float64x1_t c)` | `FMADD Dd,Dn,Dm,Da` | `Dd -> result` | A64 |
| `float64x1_t vfma_n_f64(float64x1_t a, float64x1_t b, float64_t n)` | `FMADD Dd,Dn,Dm,Da` | `Dd -> result` | A64 |
| `float16_t vfmah_f16(float16_t a, float16_t b, float16_t c)` | `FMADD Hd,Hn,Hm,Ha` | `Hd -> result` | A32/A64 |

---

## FMAX

**Description:** Floating-point Maximum (vector). This instruction compares corresponding vector elements in the two source SIMD&FP registers, places the larger of each of the two floating-point values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMin(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMax(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmax_f32(float32x2_t a, float32x2_t b)` | `FMAX Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vmaxq_f32(float32x4_t a, float32x4_t b)` | `FMAX Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vmax_f64(float64x1_t a, float64x1_t b)` | `FMAX Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vmaxq_f64(float64x2_t a, float64x2_t b)` | `FMAX Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vmaxh_f16(float16_t a, float16_t b)` | `FMAX Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vmax_f16(float16x4_t a, float16x4_t b)` | `FMAX Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vmaxq_f16(float16x8_t a, float16x8_t b)` | `FMAX Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FMAXNM

**Description:** Floating-point Maximum Number (vector). This instruction compares corresponding vector elements in the two source SIMD&FP registers, writes the larger of the two floating-point values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMinNum(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMaxNum(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmaxnm_f32(float32x2_t a, float32x2_t b)` | `FMAXNM Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vmaxnmq_f32(float32x4_t a, float32x4_t b)` | `FMAXNM Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vmaxnm_f64(float64x1_t a, float64x1_t b)` | `FMAXNM Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vmaxnmq_f64(float64x2_t a, float64x2_t b)` | `FMAXNM Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vmaxnmh_f16(float16_t a, float16_t b)` | `FMAXNM Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vmaxnm_f16(float16x4_t a, float16x4_t b)` | `FMAXNM Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vmaxnmq_f16(float16x8_t a, float16x8_t b)` | `FMAXNM Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FMAXNMP

**Description:** Floating-point Maximum Number Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the largest of each pair of values into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMinNum(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMaxNum(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vpmaxnm_f32(float32x2_t a, float32x2_t b)` | `FMAXNMP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vpmaxnmq_f32(float32x4_t a, float32x4_t b)` | `FMAXNMP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vpmaxnmq_f64(float64x2_t a, float64x2_t b)` | `FMAXNMP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vpmaxnms_f32(float32x2_t a)` | `FMAXNMP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vpmaxnmqd_f64(float64x2_t a)` | `FMAXNMP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float32_t vmaxnmv_f32(float32x2_t a)` | `FMAXNMP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vmaxnmvq_f64(float64x2_t a)` | `FMAXNMP  Dd,Vn.2D` | `Dd -> result` | A64 |
| `float16x4_t vpmaxnm_f16(float16x4_t a, float16x4_t b)` | `FMAXNMP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vpmaxnmq_f16(float16x8_t a, float16x8_t b)` | `FMAXNMP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `float16_t vmaxnmv_f16(float16x4_t a)` | `FMAXNMP Hd,Vn.4H` | `Hd -> result` | A64 |
| `float16_t vmaxnmvq_f16(float16x8_t a)` | `FMAXNMP Hd,Vn.8H` | `Hd -> result` | A64 |

---

## FMAXNMV

**Description:** Floating-point Maximum Number across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the largest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
boolean altfp = FALSE;
V[d] = Reduce(op, operand, esize, altfp);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32_t vmaxnmvq_f32(float32x4_t a)` | `FMAXNMV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## FMAXP

**Description:** Floating-point Maximum Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements from the concatenated vector, writes the larger of each pair of values into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMin(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMax(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vpmax_f32(float32x2_t a, float32x2_t b)` | `FMAXP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vpmaxq_f32(float32x4_t a, float32x4_t b)` | `FMAXP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vpmaxq_f64(float64x2_t a, float64x2_t b)` | `FMAXP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vpmaxs_f32(float32x2_t a)` | `FMAXP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vpmaxqd_f64(float64x2_t a)` | `FMAXP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float32_t vmaxv_f32(float32x2_t a)` | `FMAXP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vmaxvq_f64(float64x2_t a)` | `FMAXP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float16x4_t vpmax_f16(float16x4_t a, float16x4_t b)` | `FMAXP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vpmaxq_f16(float16x8_t a, float16x8_t b)` | `FMAXP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `float16_t vmaxv_f16(float16x4_t a)` | `FMAXP Hd,Vn.4H` | `Hd -> result` | A64 |
| `float16_t vmaxvq_f16(float16x8_t a)` | `FMAXP Hd,Vn.8H` | `Hd -> result` | A64 |

---

## FMAXV

**Description:** Floating-point Maximum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the largest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

V[d] = Reduce(op, operand, esize);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32_t vmaxvq_f32(float32x4_t a)` | `FMAXV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## FMIN

**Description:** Floating-point minimum (vector). This instruction compares corresponding elements in the vectors in the two source SIMD&FP registers, places the smaller of each of the two floating-point values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMin(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMax(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmin_f32(float32x2_t a, float32x2_t b)` | `FMIN Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vminq_f32(float32x4_t a, float32x4_t b)` | `FMIN Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vmin_f64(float64x1_t a, float64x1_t b)` | `FMIN Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vminq_f64(float64x2_t a, float64x2_t b)` | `FMIN Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vminh_f16(float16_t a, float16_t b)` | `FMIN Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vmin_f16(float16x4_t a, float16x4_t b)` | `FMIN Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vminq_f16(float16x8_t a, float16x8_t b)` | `FMIN Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FMINNM

**Description:** Floating-point Minimum Number (vector). This instruction compares corresponding vector elements in the two source SIMD&FP registers, writes the smaller of the two floating-point values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMinNum(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMaxNum(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vminnm_f32(float32x2_t a, float32x2_t b)` | `FMINNM Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vminnmq_f32(float32x4_t a, float32x4_t b)` | `FMINNM Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vminnm_f64(float64x1_t a, float64x1_t b)` | `FMINNM Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vminnmq_f64(float64x2_t a, float64x2_t b)` | `FMINNM Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vminnmh_f16(float16_t a, float16_t b)` | `FMINNM Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vminnm_f16(float16x4_t a, float16x4_t b)` | `FMINNM Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vminnmq_f16(float16x8_t a, float16x8_t b)` | `FMINNM Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FMINNMP

**Description:** Floating-point Minimum Number Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the smallest of each pair of floating-point values into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMinNum(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMaxNum(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vpminnm_f32(float32x2_t a, float32x2_t b)` | `FMINNMP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vpminnmq_f32(float32x4_t a, float32x4_t b)` | `FMINNMP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vpminnmq_f64(float64x2_t a, float64x2_t b)` | `FMINNMP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vpminnms_f32(float32x2_t a)` | `FMINNMP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vpminnmqd_f64(float64x2_t a)` | `FMINNMP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float32_t vminnmv_f32(float32x2_t a)` | `FMINNMP  Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vminnmvq_f64(float64x2_t a)` | `FMINNMP  Dd,Vn.2D` | `Dd -> result` | A64 |
| `float16x4_t vpminnm_f16(float16x4_t a, float16x4_t b)` | `FMINNMP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vpminnmq_f16(float16x8_t a, float16x8_t b)` | `FMINNMP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `float16_t vminnmv_f16(float16x4_t a)` | `FMINNMP Hd,Vn.4H` | `Hd -> result` | A64 |
| `float16_t vminnmvq_f16(float16x8_t a)` | `FMINNMP Hd,Vn.8H` | `Hd -> result` | A64 |

---

## FMINNMV

**Description:** Floating-point Minimum Number across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the smallest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
boolean altfp = FALSE;
V[d] = Reduce(op, operand, esize, altfp);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32_t vminnmvq_f32(float32x4_t a)` | `FMINNMV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## FMINP

**Description:** Floating-point Minimum Pairwise (vector). This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements from the concatenated vector, writes the smaller of each pair of values into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    if pair then
        element1 = Elem[concat, 2*e, esize];
        element2 = Elem[concat, (2*e)+1, esize];
    else
        element1 = Elem[operand1, e, esize];
        element2 = Elem[operand2, e, esize];

    if minimum then
        Elem[result, e, esize] = FPMin(element1, element2, FPCR[]);
    else
        Elem[result, e, esize] = FPMax(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vpmin_f32(float32x2_t a, float32x2_t b)` | `FMINP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vpminq_f32(float32x4_t a, float32x4_t b)` | `FMINP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vpminq_f64(float64x2_t a, float64x2_t b)` | `FMINP Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vpmins_f32(float32x2_t a)` | `FMINP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vpminqd_f64(float64x2_t a)` | `FMINP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float32_t vminv_f32(float32x2_t a)` | `FMINP Sd,Vn.2S` | `Sd -> result` | A64 |
| `float64_t vminvq_f64(float64x2_t a)` | `FMINP Dd,Vn.2D` | `Dd -> result` | A64 |
| `float16x4_t vpmin_f16(float16x4_t a, float16x4_t b)` | `FMINP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vpminq_f16(float16x8_t a, float16x8_t b)` | `FMINP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `float16_t vminv_f16(float16x4_t a)` | `FMINP Hd,Vn.4H` | `Hd -> result` | A64 |
| `float16_t vminvq_f16(float16x8_t a)` | `FMINP Hd,Vn.8H` | `Hd -> result` | A64 |

---

## FMINV

**Description:** Floating-point Minimum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the smallest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are floating-point values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

V[d] = Reduce(op, operand, esize);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32_t vminvq_f32(float32x4_t a)` | `FMINV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## FMLA

**Description:** Floating-point fused Multiply-Add to accumulator (vector). This instruction multiplies corresponding floating-point values in the vectors in the two source SIMD&FP registers, adds the product to the corresponding vector element of the destination SIMD&FP register, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if sub_op then element1 = FPNeg(element1);
    Elem[result, e, esize] = FPMulAdd(Elem[operand3, e, esize], element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfma_f32(float32x2_t a, float32x2_t b, float32x2_t c)` | `FMLA Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vfmaq_f32(float32x4_t a, float32x4_t b, float32x4_t c)` | `FMLA Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x2_t vfmaq_f64(float64x2_t a, float64x2_t b, float64x2_t c)` | `FMLA Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vfma_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vfmaq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vfma_lane_f64(float64x1_t a, float64x1_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLA Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vfmaq_lane_f64(float64x2_t a, float64x2_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLA Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vfmas_lane_f32(float32_t a, float32_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLA Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vfmad_lane_f64(float64_t a, float64_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLA Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float32x2_t vfma_laneq_f32(float32x2_t a, float32x2_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vfmaq_laneq_f32(float32x4_t a, float32x4_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vfma_laneq_f64(float64x1_t a, float64x1_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLA Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vfmaq_laneq_f64(float64x2_t a, float64x2_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLA Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vfmas_laneq_f32(float32_t a, float32_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLA Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vfmad_laneq_f64(float64_t a, float64_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLA Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float32x2_t vfma_n_f32(float32x2_t a, float32x2_t b, float32_t n)` | `FMLA Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vfmaq_n_f32(float32x4_t a, float32x4_t b, float32_t n)` | `FMLA Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x2_t vfmaq_n_f64(float64x2_t a, float64x2_t b, float64_t n)` | `FMLA Vd.2D,Vn.2D,Vm.D[0]` | `Vd.2D -> result` | A64 |
| `float16x4_t vfma_f16(float16x4_t a, float16x4_t b, float16x4_t c)` | `FMLA Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vfmaq_f16(float16x8_t a, float16x8_t b, float16x8_t c)` | `FMLA Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vfma_lane_f16(float16x4_t a, float16x4_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmaq_lane_f16(float16x8_t a, float16x8_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vfma_laneq_f16(float16x4_t a, float16x4_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmaq_laneq_f16(float16x8_t a, float16x8_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vfma_n_f16(float16x4_t a, float16x4_t b, float16_t n)` | `FMLA Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmaq_n_f16(float16x8_t a, float16x8_t b, float16_t n)` | `FMLA Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | A64 |
| `float16_t vfmah_lane_f16(float16_t a, float16_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLA Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `float16_t vfmah_laneq_f16(float16_t a, float16_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLA Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |

---

## FMLAL

**Description:** Floating-point fused Multiply-Add Long to accumulator (vector). This instruction multiplies corresponding half-precision floating-point values in the vectors in the two source SIMD&FP registers, and accumulates the product to the corresponding vector element of the destination SIMD&FP register. The instruction does not round the result of the multiply before the accumulation.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize DIV 2) operand1 = Vpart[n,part];
bits(datasize DIV 2) operand2 = Vpart[m,part];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize DIV 2) element1;
bits(esize DIV 2) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize DIV 2];
    element2 = Elem[operand2, e, esize DIV 2];
    if sub_op then element1 = FPNeg(element1);
    Elem[result,e,esize] = FPMulAddH(Elem[operand3, e, esize], element1, element2, FPCR[]);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfmlal_low_f16(float32x2_t r, float16x4_t a, float16x4_t b)` | `FMLAL Vd.2S, Vn.2H, Vm.2H` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlalq_low_f16(float32x4_t r, float16x8_t a, float16x8_t b)` | `FMLAL Vd.4S, Vn.4H, Vm.4H` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlal_lane_low_f16(float32x2_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLAL Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x2_t vfmlal_laneq_low_f16(float32x2_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLAL Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlalq_lane_low_f16(float32x4_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLAL Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vfmlalq_laneq_low_f16(float32x4_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLAL Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## FMLAL2

**Description:** Floating-point fused Multiply-Add Long to accumulator (vector). This instruction multiplies corresponding half-precision floating-point values in the vectors in the two source SIMD&FP registers, and accumulates the product to the corresponding vector element of the destination SIMD&FP register. The instruction does not round the result of the multiply before the accumulation.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize DIV 2) operand1 = Vpart[n,part];
bits(datasize DIV 2) operand2 = Vpart[m,part];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize DIV 2) element1;
bits(esize DIV 2) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize DIV 2];
    element2 = Elem[operand2, e, esize DIV 2];
    if sub_op then element1 = FPNeg(element1);
    Elem[result,e,esize] = FPMulAddH(Elem[operand3, e, esize], element1, element2, FPCR[]);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfmlal_high_f16(float32x2_t r, float16x4_t a, float16x4_t b)` | `FMLAL2 Vd.2S, Vn.2H, Vm.2H` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlalq_high_f16(float32x4_t r, float16x8_t a, float16x8_t b)` | `FMLAL2 Vd.4S, Vn.4H, Vm.4H` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlal_lane_high_f16(float32x2_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLAL2 Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlalq_lane_high_f16(float32x4_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLAL2 Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlal_laneq_high_f16(float32x2_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLAL2 Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlalq_laneq_high_f16(float32x4_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLAL2 Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## FMLALB

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vmlalbq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALB Vd.8H, Vn.16B, Vm.16B` | `Vd.8H -> result` | A64 |
| `float16x8_t vmlalbq_lane_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALB Vd.8H, Vn.16B, Vm.B[lane]` | `Vd.8H -> result` | A64 |
| `float16x8_t vmlalbq_laneq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALB Vd.8H, Vn.16B, Vm.B[lane]` | `Vd.8H -> result` | A64 |

---

## FMLALLBB

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vmlallbbq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallbbq_lane_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallbbq_laneq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallbtq_lane_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallbtq_laneq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlalltbq_lane_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlalltbq_laneq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallttq_lane_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |
| `float32x4_t vmlallttq_laneq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALLBB Vd.4S, Vn.16B, Vm.B[lane]` | `Vd.4S -> result` | A64 |

---

## FMLALLBT

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vmlallbtq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALLBT Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |

---

## FMLALLTB

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vmlalltbq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALLTB Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |

---

## FMLALLTT

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x4_t vmlallttq_f32_mf8_fpm(float32x4_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALLTT Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |

---

## FMLALT

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vmlaltq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, fpm_t fpm)` | `FMLALT Vd.8H, Vn.16B, Vm.16B` | `Vd.8H -> result` | A64 |
| `float16x8_t vmlaltq_lane_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x8_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALT Vd.8H, Vn.16B, Vm.B[lane]` | `Vd.8H -> result` | A64 |
| `float16x8_t vmlaltq_laneq_f16_mf8_fpm(float16x8_t vd, mfloat8x16_t vn, mfloat8x16_t vm, __builtin_constant_p(lane), fpm_t fpm)` | `FMLALT Vd.8H, Vn.16B, Vm.B[lane]` | `Vd.8H -> result` | A64 |

---

## FMLS

**Description:** Floating-point fused Multiply-Subtract from accumulator (vector). This instruction multiplies corresponding floating-point values in the vectors in the two source SIMD&FP registers, negates the product, adds the result to the corresponding vector element of the destination SIMD&FP register, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if sub_op then element1 = FPNeg(element1);
    Elem[result, e, esize] = FPMulAdd(Elem[operand3, e, esize], element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfms_f32(float32x2_t a, float32x2_t b, float32x2_t c)` | `FMLS Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vfmsq_f32(float32x4_t a, float32x4_t b, float32x4_t c)` | `FMLS Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x2_t vfmsq_f64(float64x2_t a, float64x2_t b, float64x2_t c)` | `FMLS Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vfms_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vfmsq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vfms_lane_f64(float64x1_t a, float64x1_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLS Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vfmsq_lane_f64(float64x2_t a, float64x2_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLS Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vfmss_lane_f32(float32_t a, float32_t b, float32x2_t v, __builtin_constant_p(lane))` | `FMLS Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vfmsd_lane_f64(float64_t a, float64_t b, float64x1_t v, __builtin_constant_p(lane))` | `FMLS Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float32x2_t vfms_laneq_f32(float32x2_t a, float32x2_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vfmsq_laneq_f32(float32x4_t a, float32x4_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vfms_laneq_f64(float64x1_t a, float64x1_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLS Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vfmsq_laneq_f64(float64x2_t a, float64x2_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLS Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vfmss_laneq_f32(float32_t a, float32_t b, float32x4_t v, __builtin_constant_p(lane))` | `FMLS Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vfmsd_laneq_f64(float64_t a, float64_t b, float64x2_t v, __builtin_constant_p(lane))` | `FMLS Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float32x2_t vfms_n_f32(float32x2_t a, float32x2_t b, float32_t n)` | `FMLS Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | A64 |
| `float32x4_t vfmsq_n_f32(float32x4_t a, float32x4_t b, float32_t n)` | `FMLS Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | A64 |
| `float64x2_t vfmsq_n_f64(float64x2_t a, float64x2_t b, float64_t n)` | `FMLS Vd.2D,Vn.2D,Vm.D[0]` | `Vd.2D -> result` | A64 |
| `float16x4_t vfms_f16(float16x4_t a, float16x4_t b, float16x4_t c)` | `FMLS Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vfmsq_f16(float16x8_t a, float16x8_t b, float16x8_t c)` | `FMLS Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vfms_lane_f16(float16x4_t a, float16x4_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmsq_lane_f16(float16x8_t a, float16x8_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vfms_laneq_f16(float16x4_t a, float16x4_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmsq_laneq_f16(float16x8_t a, float16x8_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vfms_n_f16(float16x4_t a, float16x4_t b, float16_t n)` | `FMLS Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | A64 |
| `float16x8_t vfmsq_n_f16(float16x8_t a, float16x8_t b, float16_t n)` | `FMLS Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | A64 |
| `float16_t vfmsh_lane_f16(float16_t a, float16_t b, float16x4_t v, __builtin_constant_p(lane))` | `FMLS Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `float16_t vfmsh_laneq_f16(float16_t a, float16_t b, float16x8_t v, __builtin_constant_p(lane))` | `FMLS Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |

---

## FMLSL

**Description:** Floating-point fused Multiply-Subtract Long from accumulator (vector). This instruction negates the values in the vector of one SIMD&FP register, multiplies these with the corresponding values in another vector, and accumulates the product to the corresponding vector element of the destination SIMD&FP register. The instruction does not round the result of the multiply before the accumulation.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize DIV 2) operand1 = Vpart[n,part];
bits(datasize DIV 2) operand2 = Vpart[m,part];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize DIV 2) element1;
bits(esize DIV 2) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize DIV 2];
    element2 = Elem[operand2, e, esize DIV 2];
    if sub_op then element1 = FPNeg(element1);
    Elem[result,e,esize] = FPMulAddH(Elem[operand3, e, esize], element1, element2, FPCR[]);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfmlsl_low_f16(float32x2_t r, float16x4_t a, float16x4_t b)` | `FMLSL Vd.2S, Vn.2H, Vm.2H` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlslq_low_f16(float32x4_t r, float16x8_t a, float16x8_t b)` | `FMLSL Vd.4S, Vn.4H, Vm.4H` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlsl_lane_low_f16(float32x2_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLSL Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x2_t vfmlsl_laneq_low_f16(float32x2_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLSL Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlslq_lane_low_f16(float32x4_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLSL Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vfmlslq_laneq_low_f16(float32x4_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLSL Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## FMLSL2

**Description:** Floating-point fused Multiply-Subtract Long from accumulator (vector). This instruction negates the values in the vector of one SIMD&FP register, multiplies these with the corresponding values in another vector, and accumulates the product to the corresponding vector element of the destination SIMD&FP register. The instruction does not round the result of the multiply before the accumulation.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize DIV 2) operand1 = Vpart[n,part];
bits(datasize DIV 2) operand2 = Vpart[m,part];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize DIV 2) element1;
bits(esize DIV 2) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize DIV 2];
    element2 = Elem[operand2, e, esize DIV 2];
    if sub_op then element1 = FPNeg(element1);
    Elem[result,e,esize] = FPMulAddH(Elem[operand3, e, esize], element1, element2, FPCR[]);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vfmlsl_high_f16(float32x2_t r, float16x4_t a, float16x4_t b)` | `FMLSL2 Vd.2S, Vn.2H, Vm.2H` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlslq_high_f16(float32x4_t r, float16x8_t a, float16x8_t b)` | `FMLSL2 Vd.4S, Vn.4H, Vm.4H` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlsl_lane_high_f16(float32x2_t r, float16x4_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLSL2 Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlslq_lane_high_f16(float32x4_t r, float16x8_t a, float16x4_t b, __builtin_constant_p(lane))` | `FMLSL2 Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |
| `float32x2_t vfmlsl_laneq_high_f16(float32x2_t r, float16x4_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLSL2 Vd.2S, Vn.2H, Vm.H[lane]` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vfmlslq_laneq_high_f16(float32x4_t r, float16x8_t a, float16x8_t b, __builtin_constant_p(lane))` | `FMLSL2 Vd.4S, Vn.4H, Vm.H[lane]` | `Vd.4S -> result` | A32/A64 |

---

## FMMLA

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x8_t vmmlaq_f16_mf8_fpm(float16x8_t r, mfloat8x16_t a, mfloat8x16_t b, fpm_t fpm)` | `FMMLA Vd.8H, Vn.16B, Vm.16B` | `Vd.8H -> result` | A64 |
| `float32x4_t vmmlaq_f32_mf8_fpm(float32x4_t r, mfloat8x16_t a, mfloat8x16_t b, fpm_t fpm)` | `FMMLA Vd.4S, Vn.16B, Vm.16B` | `Vd.4S -> result` | A64 |

---

## FMSUB

**Description:** Floating-point Fused Multiply-Subtract (scalar). This instruction multiplies the values of the first two SIMD&FP source registers, negates the product, adds that to the value of the third SIMD&FP source register, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(esize) operanda = V[a];
bits(esize) operand1 = V[n];
bits(esize) operand2 = V[m];

FPCRType fpcr = FPCR[];
boolean merge    = IsMerging(fpcr);
bits(128) result = if merge then V[a] else Zeros();

if opa_neg then operanda = FPNeg(operanda);
if op1_neg then operand1 = FPNeg(operand1);
Elem[result, 0, esize] = FPMulAdd(operanda, operand1, operand2, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float64x1_t vfms_f64(float64x1_t a, float64x1_t b, float64x1_t c)` | `FMSUB Dd,Dn,Dm,Da` | `Dd -> result` | A64 |
| `float64x1_t vfms_n_f64(float64x1_t a, float64x1_t b, float64_t n)` | `FMSUB Dd,Dn,Dm,Da` | `Dd -> result` | A64 |
| `float16_t vfmsh_f16(float16_t a, float16_t b, float16_t c)` | `FMSUB Hd,Hn,Hm,Ha` | `Hd -> result` | A32/A64 |

---

## FMUL

**Description:** Floating-point Multiply (vector). This instruction multiplies corresponding floating-point values in the vectors in the two source SIMD&FP registers, places the result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPMul(element1, element2, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmul_f32(float32x2_t a, float32x2_t b)` | `FMUL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vmulq_f32(float32x4_t a, float32x4_t b)` | `FMUL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vmul_f64(float64x1_t a, float64x1_t b)` | `FMUL Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vmulq_f64(float64x2_t a, float64x2_t b)` | `FMUL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vmul_n_f32(float32x2_t a, float32_t b)` | `FMUL Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vmulq_n_f32(float32x4_t a, float32_t b)` | `FMUL Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vmul_n_f64(float64x1_t a, float64_t b)` | `FMUL Dd,Dn,Vm.D[0]` | `Dd -> result` | A64 |
| `float64x2_t vmulq_n_f64(float64x2_t a, float64_t b)` | `FMUL Vd.2D,Vn.2D,Vm.D[0]` | `Vd.2D -> result` | A64 |
| `float32x2_t vmul_lane_f32(float32x2_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vmulq_lane_f32(float32x4_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vmul_lane_f64(float64x1_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMUL Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vmulq_lane_f64(float64x2_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMUL Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vmuls_lane_f32(float32_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMUL Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vmuld_lane_f64(float64_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMUL Dd,Dn,Vm.S[lane]` | `Dd -> result` | A64 |
| `float32x2_t vmul_laneq_f32(float32x2_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vmulq_laneq_f32(float32x4_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vmul_laneq_f64(float64x1_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMUL Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vmulq_laneq_f64(float64x2_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMUL Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vmuls_laneq_f32(float32_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMUL Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vmuld_laneq_f64(float64_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMUL Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float16_t vmulh_f16(float16_t a, float16_t b)` | `FMUL Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vmul_f16(float16x4_t a, float16x4_t b)` | `FMUL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vmulq_f16(float16x8_t a, float16x8_t b)` | `FMUL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vmul_lane_f16(float16x4_t a, float16x4_t v, __builtin_constant_p(lane))` | `FMUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vmulq_lane_f16(float16x8_t a, float16x4_t v, __builtin_constant_p(lane)) ` | `FMUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vmul_laneq_f16(float16x4_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vmulq_laneq_f16(float16x8_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vmul_n_f16(float16x4_t a, float16_t n) ` | `FMUL Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vmulq_n_f16(float16x8_t a, float16_t n) ` | `FMUL Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | A32/A64 |
| `float16_t vmulh_lane_f16(float16_t a, float16x4_t v, __builtin_constant_p(lane)) ` | `FMUL Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `float16_t vmulh_laneq_f16(float16_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMUL Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |

---

## FMULX

**Description:** Floating-point Multiply extended. This instruction multiplies corresponding floating-point values in the vectors of the two source SIMD&FP registers, places the resulting floating-point values in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[n] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPMulX(element1, element2, fpcr);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmulx_f32(float32x2_t a, float32x2_t b)` | `FMULX Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vmulxq_f32(float32x4_t a, float32x4_t b)` | `FMULX Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x1_t vmulx_f64(float64x1_t a, float64x1_t b)` | `FMULX Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vmulxq_f64(float64x2_t a, float64x2_t b)` | `FMULX Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vmulxs_f32(float32_t a, float32_t b)` | `FMULX Sd,Sn,Sm` | `Sd -> result` | A64 |
| `float64_t vmulxd_f64(float64_t a, float64_t b)` | `FMULX Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float32x2_t vmulx_lane_f32(float32x2_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMULX Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vmulxq_lane_f32(float32x4_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMULX Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vmulx_lane_f64(float64x1_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMULX Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vmulxq_lane_f64(float64x2_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMULX Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vmulxs_lane_f32(float32_t a, float32x2_t v, __builtin_constant_p(lane))` | `FMULX Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vmulxd_lane_f64(float64_t a, float64x1_t v, __builtin_constant_p(lane))` | `FMULX Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float32x2_t vmulx_laneq_f32(float32x2_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMULX Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `float32x4_t vmulxq_laneq_f32(float32x4_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMULX Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `float64x1_t vmulx_laneq_f64(float64x1_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMULX Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float64x2_t vmulxq_laneq_f64(float64x2_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMULX Vd.2D,Vn.2D,Vm.D[lane]` | `Vd.2D -> result` | A64 |
| `float32_t vmulxs_laneq_f32(float32_t a, float32x4_t v, __builtin_constant_p(lane))` | `FMULX Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `float64_t vmulxd_laneq_f64(float64_t a, float64x2_t v, __builtin_constant_p(lane))` | `FMULX Dd,Dn,Vm.D[lane]` | `Dd -> result` | A64 |
| `float16_t vmulxh_f16(float16_t a, float16_t b)` | `FMULX Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vmulx_f16(float16x4_t a, float16x4_t b)` | `FMULX Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vmulxq_f16(float16x8_t a, float16x8_t b)` | `FMULX Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `float16x4_t vmulx_lane_f16(float16x4_t a, float16x4_t v, __builtin_constant_p(lane))` | `FMULX Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vmulxq_lane_f16(float16x8_t a, float16x4_t v, __builtin_constant_p(lane)) ` | `FMULX Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vmulx_laneq_f16(float16x4_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMULX Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `float16x8_t vmulxq_laneq_f16(float16x8_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMULX Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `float16x4_t vmulx_n_f16(float16x4_t a, float16_t n) ` | `FMULX Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | A64 |
| `float16x8_t vmulxq_n_f16(float16x8_t a, float16_t n) ` | `FMULX Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | A64 |
| `float16_t vmulxh_lane_f16(float16_t a, float16x4_t v, __builtin_constant_p(lane)) ` | `FMULX Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `float16_t vmulxh_laneq_f16(float16_t a, float16x8_t v, __builtin_constant_p(lane)) ` | `FMULX Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |

---

## FNEG

**Description:** Floating-point Negate (vector). This instruction negates the value of each vector element in the source SIMD&FP register, writes the result to a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    if neg then
        element = FPNeg(element);
    else
        element = FPAbs(element);
    Elem[result, e, esize] = element;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vneg_f32(float32x2_t a)` | `FNEG Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vnegq_f32(float32x4_t a)` | `FNEG Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vneg_f64(float64x1_t a)` | `FNEG Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vnegq_f64(float64x2_t a)` | `FNEG Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vnegh_f16(float16_t a)` | `FNEG Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vneg_f16(float16x4_t a)` | `FNEG Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vnegq_f16(float16x8_t a)` | `FNEG Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRECPE

**Description:** Floating-point Reciprocal Estimate. This instruction finds an approximate reciprocal estimate for each vector element in the source SIMD&FP register, places the result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRecipEstimate(element, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrecpe_f32(float32x2_t a)` | `FRECPE Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vrecpeq_f32(float32x4_t a)` | `FRECPE Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vrecpe_f64(float64x1_t a)` | `FRECPE Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrecpeq_f64(float64x2_t a)` | `FRECPE Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float32_t vrecpes_f32(float32_t a)` | `FRECPE Sd,Sn` | `Sd -> result` | A64 |
| `float64_t vrecped_f64(float64_t a)` | `FRECPE Dd,Dn` | `Dd -> result` | A64 |
| `float16_t vrecpeh_f16(float16_t a)` | `FRECPE Hd,Hn` | `Hd -> result` | A64 |
| `float16x4_t vrecpe_f16(float16x4_t a)` | `FRECPE Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrecpeq_f16(float16x8_t a)` | `FRECPE Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRECPS

**Description:** Floating-point Reciprocal Step. This instruction multiplies the corresponding floating-point values in the vectors of the two source SIMD&FP registers, subtracts each of the products from 2.0, places the resulting floating-point values in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[n] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPRecipStepFused(element1, element2);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrecps_f32(float32x2_t a, float32x2_t b)` | `FRECPS Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vrecpsq_f32(float32x4_t a, float32x4_t b)` | `FRECPS Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vrecps_f64(float64x1_t a, float64x1_t b)` | `FRECPS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vrecpsq_f64(float64x2_t a, float64x2_t b)` | `FRECPS Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vrecpss_f32(float32_t a, float32_t b)` | `FRECPS Sd,Sn,Sm` | `Sd -> result` | A64 |
| `float64_t vrecpsd_f64(float64_t a, float64_t b)` | `FRECPS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float16_t vrecpsh_f16(float16_t a, float16_t b)` | `FRECPS Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vrecps_f16(float16x4_t a, float16x4_t b)` | `FRECPS Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrecpsq_f16(float16x8_t a, float16x8_t b)` | `FRECPS Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRECPX

**Description:** Floating-point Reciprocal exponent (scalar). This instruction finds an approximate reciprocal exponent for each vector element in the source SIMD&FP register, places the result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRecpX(element, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32_t vrecpxs_f32(float32_t a)` | `FRECPX Sd,Sn` | `Sd -> result` | A64 |
| `float64_t vrecpxd_f64(float64_t a)` | `FRECPX Dd,Dn` | `Dd -> result` | A64 |
| `float16_t vrecpxh_f16(float16_t a)` | `FRECPX Hd,Hn` | `Hd -> result` | A64 |

---

## FRINT32X

**Description:** Floating-point Round to 32-bit Integer, using current rounding mode (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values that fit into a 32-bit integer size using the rounding mode that is determined by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundIntN(element, FPCR[], rounding, intsize);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnd32x_f32(float32x2_t a)` | `FRINT32X Vd.2S,Vn.2S` | `Vd -> result` | A64 |
| `float32x4_t vrnd32xq_f32(float32x4_t a)` | `FRINT32X Vd.4S,Vn.4S` | `Vd -> result` | A64 |
| `float64x1_t vrnd32x_f64(float64x1_t a)` | `FRINT32X Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrnd32xq_f64(float64x2_t a)` | `FRINT32X Vd.2D,Vn.2D` | `Vd -> result` | A64 |

---

## FRINT32Z

**Description:** Floating-point Round to 32-bit Integer toward Zero (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values that fit into a 32-bit integer size using the Round towards Zero rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundIntN(element, FPCR[], rounding, intsize);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnd32z_f32(float32x2_t a)` | `FRINT32Z Vd.2S,Vn.2S` | `Vd -> result` | A64 |
| `float32x4_t vrnd32zq_f32(float32x4_t a)` | `FRINT32Z Vd.4S,Vn.4S` | `Vd -> result` | A64 |
| `float64x1_t vrnd32z_f64(float64x1_t a)` | `FRINT32Z Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrnd32zq_f64(float64x2_t a)` | `FRINT32Z Vd.2D,Vn.2D` | `Vd -> result` | A64 |

---

## FRINT64X

**Description:** Floating-point Round to 64-bit Integer, using current rounding mode (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values that fit into a 64-bit integer size using the rounding mode that is determined by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundIntN(element, FPCR[], rounding, intsize);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnd64x_f32(float32x2_t a)` | `FRINT64X Vd.2S,Vn.2S` | `Vd -> result` | A64 |
| `float32x4_t vrnd64xq_f32(float32x4_t a)` | `FRINT64X Vd.4S,Vn.4S` | `Vd -> result` | A64 |
| `float64x1_t vrnd64x_f64(float64x1_t a)` | `FRINT64X Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrnd64xq_f64(float64x2_t a)` | `FRINT64X Vd.2D,Vn.2D` | `Vd -> result` | A64 |

---

## FRINT64Z

**Description:** Floating-point Round to 64-bit Integer toward Zero (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values that fit into a 64-bit integer size using the Round towards Zero rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundIntN(element, FPCR[], rounding, intsize);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnd64z_f32(float32x2_t a)` | `FRINT64Z Vd.2S,Vn.2S` | `Vd -> result` | A64 |
| `float32x4_t vrnd64zq_f32(float32x4_t a)` | `FRINT64Z Vd.4S,Vn.4S` | `Vd -> result` | A64 |
| `float64x1_t vrnd64z_f64(float64x1_t a)` | `FRINT64Z Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrnd64zq_f64(float64x2_t a)` | `FRINT64Z Vd.2D,Vn.2D` | `Vd -> result` | A64 |

---

## FRINTA

**Description:** Floating-point Round to Integral, to nearest with ties to Away (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the Round to Nearest with Ties to Away rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnda_f32(float32x2_t a)` | `FRINTA Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndaq_f32(float32x4_t a)` | `FRINTA Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrnda_f64(float64x1_t a)` | `FRINTA Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndaq_f64(float64x2_t a)` | `FRINTA Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndah_f16(float16_t a)` | `FRINTA Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrnda_f16(float16x4_t a)` | `FRINTA Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndaq_f16(float16x8_t a)` | `FRINTA Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRINTI

**Description:** Floating-point Round to Integral, using current rounding mode (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the rounding mode that is determined by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrndi_f32(float32x2_t a)` | `FRINTI Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndiq_f32(float32x4_t a)` | `FRINTI Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrndi_f64(float64x1_t a)` | `FRINTI Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndiq_f64(float64x2_t a)` | `FRINTI Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndih_f16(float16_t a)` | `FRINTI Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrndi_f16(float16x4_t a)` | `FRINTI Vd.4H,Vn.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vrndiq_f16(float16x8_t a)` | `FRINTI Vd.8H,Vn.8H` | `Vd.8H -> result` | A64 |

---

## FRINTM

**Description:** Floating-point Round to Integral, toward Minus infinity (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the Round towards Minus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrndm_f32(float32x2_t a)` | `FRINTM Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndmq_f32(float32x4_t a)` | `FRINTM Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrndm_f64(float64x1_t a)` | `FRINTM Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndmq_f64(float64x2_t a)` | `FRINTM Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndmh_f16(float16_t a)` | `FRINTM Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrndm_f16(float16x4_t a)` | `FRINTM Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndmq_f16(float16x8_t a)` | `FRINTM Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRINTN

**Description:** Floating-point Round to Integral, to nearest with ties to even (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the Round to Nearest rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrndn_f32(float32x2_t a)` | `FRINTN Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndnq_f32(float32x4_t a)` | `FRINTN Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrndn_f64(float64x1_t a)` | `FRINTN Dd,Dn` | `Dd -> result` | A32/A64 |
| `float64x2_t vrndnq_f64(float64x2_t a)` | `FRINTN Vd.2D,Vn.2D` | `Vd.2D -> result` | A32/A64 |
| `float32_t vrndns_f32(float32_t a)` | `FRINTN Sd,Sn` | `Sd -> result` | A32/A64 |
| `float16_t vrndnh_f16(float16_t a)` | `FRINTN Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrndn_f16(float16x4_t a)` | `FRINTN Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndnq_f16(float16x8_t a)` | `FRINTN Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRINTP

**Description:** Floating-point Round to Integral, toward Plus infinity (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the Round towards Plus Infinity rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrndp_f32(float32x2_t a)` | `FRINTP Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndpq_f32(float32x4_t a)` | `FRINTP Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrndp_f64(float64x1_t a)` | `FRINTP Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndpq_f64(float64x2_t a)` | `FRINTP Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndph_f16(float16_t a)` | `FRINTP Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrndp_f16(float16x4_t a)` | `FRINTP Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndpq_f16(float16x8_t a)` | `FRINTP Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRINTX

**Description:** Floating-point Round to Integral exact, using current rounding mode (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the rounding mode that is determined by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrndx_f32(float32x2_t a)` | `FRINTX Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndxq_f32(float32x4_t a)` | `FRINTX Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrndx_f64(float64x1_t a)` | `FRINTX Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndxq_f64(float64x2_t a)` | `FRINTX Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndxh_f16(float16_t a)` | `FRINTX Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrndx_f16(float16x4_t a)` | `FRINTX Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndxq_f16(float16x8_t a)` | `FRINTX Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRINTZ

**Description:** Floating-point Round to Integral, toward Zero (vector). This instruction rounds a vector of floating-point values in the SIMD&FP source register to integral floating-point values of the same size using the Round towards Zero rounding mode, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRoundInt(element, FPCR[], rounding, exact);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrnd_f32(float32x2_t a)` | `FRINTZ Vd.2S,Vn.2S` | `Vd.2S -> result` | A32/A64 |
| `float32x4_t vrndq_f32(float32x4_t a)` | `FRINTZ Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |
| `float64x1_t vrnd_f64(float64x1_t a)` | `FRINTZ Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrndq_f64(float64x2_t a)` | `FRINTZ Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vrndh_f16(float16_t a)` | `FRINTZ Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vrnd_f16(float16x4_t a)` | `FRINTZ Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrndq_f16(float16x8_t a)` | `FRINTZ Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRSQRTE

**Description:** Floating-point Reciprocal Square Root Estimate. This instruction calculates an approximate square root for each vector element in the source SIMD&FP register, places the result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPRSqrtEstimate(element, fpcr);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrsqrte_f32(float32x2_t a)` | `FRSQRTE Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vrsqrteq_f32(float32x4_t a)` | `FRSQRTE Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vrsqrte_f64(float64x1_t a)` | `FRSQRTE Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vrsqrteq_f64(float64x2_t a)` | `FRSQRTE Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float32_t vrsqrtes_f32(float32_t a)` | `FRSQRTE Sd,Sn` | `Sd -> result` | A64 |
| `float64_t vrsqrted_f64(float64_t a)` | `FRSQRTE Dd,Dn` | `Dd -> result` | A64 |
| `float16_t vrsqrteh_f16(float16_t a)` | `FRSQRTE Hd,Hn` | `Hd -> result` | A64 |
| `float16x4_t vrsqrte_f16(float16x4_t a)` | `FRSQRTE Vd.4H,Vn.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrsqrteq_f16(float16x8_t a)` | `FRSQRTE Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |

---

## FRSQRTS

**Description:** Floating-point Reciprocal Square Root Step. This instruction multiplies corresponding floating-point values in the vectors of the two source SIMD&FP registers, subtracts each of the products from 3.0, divides these results by 2.0, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[n] else Zeros();

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, esize] = FPRSqrtStepFused(element1, element2);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vrsqrts_f32(float32x2_t a, float32x2_t b)` | `FRSQRTS Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vrsqrtsq_f32(float32x4_t a, float32x4_t b)` | `FRSQRTS Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vrsqrts_f64(float64x1_t a, float64x1_t b)` | `FRSQRTS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vrsqrtsq_f64(float64x2_t a, float64x2_t b)` | `FRSQRTS Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32_t vrsqrtss_f32(float32_t a, float32_t b)` | `FRSQRTS Sd,Sn,Sm` | `Sd -> result` | A64 |
| `float64_t vrsqrtsd_f64(float64_t a, float64_t b)` | `FRSQRTS Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float16_t vrsqrtsh_f16(float16_t a, float16_t b)` | `FRSQRTS Hd,Hn,Hm` | `Hd -> result` | A64 |
| `float16x4_t vrsqrts_f16(float16x4_t a, float16x4_t b)` | `FRSQRTS Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vrsqrtsq_f16(float16x8_t a, float16x8_t b)` | `FRSQRTS Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## FSCALE

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float16x4_t vscale_f16(float16x4_t vn, int16x4_t vm)` | `FSCALE Vd.4H, Vn.4H, Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vscaleq_f16(float16x8_t vn, int16x8_t vm)` | `FSCALE Vd.8H, Vn.8H, Vm.8H` | `Vd.8H -> result` | A64 |
| `float32x2_t vscale_f32(float32x2_t vn, int32x2_t vm)` | `FSCALE Vd.2S, Vn.2S, Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vscaleq_f32(float32x4_t vn, int32x4_t vm)` | `FSCALE Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vscaleq_f64(float64x2_t vn, int64x2_t vm)` | `FSCALE Vd.2D, Vn.2D, Vm.2D` | `Vd.2D -> result` | A64 |

---

## FSQRT

**Description:** Floating-point Square Root (vector). This instruction calculates the square root for each vector element in the source SIMD&FP register, places the result in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FPSqrt(element, FPCR[]);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vsqrt_f32(float32x2_t a)` | `FSQRT Vd.2S,Vn.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vsqrtq_f32(float32x4_t a)` | `FSQRT Vd.4S,Vn.4S` | `Vd.4S -> result` | A64 |
| `float64x1_t vsqrt_f64(float64x1_t a)` | `FSQRT Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vsqrtq_f64(float64x2_t a)` | `FSQRT Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float16_t vsqrth_f16(float16_t a)` | `FSQRT Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16x4_t vsqrt_f16(float16x4_t a)` | `FSQRT Vd.4H,Vn.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vsqrtq_f16(float16x8_t a)` | `FSQRT Vd.8H,Vn.8H` | `Vd.8H -> result` | A64 |

---

## FSUB

**Description:** Floating-point Subtract (vector). This instruction subtracts the elements in the vector in the second source SIMD&FP register, from the corresponding elements in the vector in the first source SIMD&FP register, places each result into elements of a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];

bits(esize) element1;
bits(esize) element2;
bits(esize) diff;
FPCRType fpcr = FPCR[];
bits(datasize) result;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    diff = FPSub(element1, element2, fpcr);
    Elem[result, e, esize] = if abs then FPAbs(diff) else diff;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vsub_f32(float32x2_t a, float32x2_t b)` | `FSUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vsubq_f32(float32x4_t a, float32x4_t b)` | `FSUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x1_t vsub_f64(float64x1_t a, float64x1_t b)` | `FSUB Dd,Dn,Dm` | `Dd -> result` | A64 |
| `float64x2_t vsubq_f64(float64x2_t a, float64x2_t b)` | `FSUB Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float16_t vsubh_f16(float16_t a, float16_t b)` | `FSUB Hd,Hn,Hm` | `Hd -> result` | A32/A64 |
| `float16x4_t vsub_f16(float16x4_t a, float16x4_t b)` | `FSUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vsubq_f16(float16x8_t a, float16x8_t b)` | `FSUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A32/A64 |

---

## INS

**Description:** Insert vector element from another vector element. This instruction copies the vector element of the source SIMD&FP register to the specified vector element of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(idxdsize) operand = V[n];
bits(128) result;

result = V[d];
Elem[result, dst_index, esize] = Elem[operand, src_index, esize];
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vcopy_lane_s8(int8x8_t a, __builtin_constant_p(lane1), int8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `int8x16_t vcopyq_lane_s8(int8x16_t a, __builtin_constant_p(lane1), int8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `int16x4_t vcopy_lane_s16(int16x4_t a, __builtin_constant_p(lane1), int16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `int16x8_t vcopyq_lane_s16(int16x8_t a, __builtin_constant_p(lane1), int16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `int32x2_t vcopy_lane_s32(int32x2_t a, __builtin_constant_p(lane1), int32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `int32x4_t vcopyq_lane_s32(int32x4_t a, __builtin_constant_p(lane1), int32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `int64x2_t vcopyq_lane_s64(int64x2_t a, __builtin_constant_p(lane1), int64x1_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `uint8x8_t vcopy_lane_u8(uint8x8_t a, __builtin_constant_p(lane1), uint8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `uint8x16_t vcopyq_lane_u8(uint8x16_t a, __builtin_constant_p(lane1), uint8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `uint16x4_t vcopy_lane_u16(uint16x4_t a, __builtin_constant_p(lane1), uint16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vcopyq_lane_u16(uint16x8_t a, __builtin_constant_p(lane1), uint16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vcopy_lane_u32(uint32x2_t a, __builtin_constant_p(lane1), uint32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcopyq_lane_u32(uint32x4_t a, __builtin_constant_p(lane1), uint32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vcopyq_lane_u64(uint64x2_t a, __builtin_constant_p(lane1), uint64x1_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `poly64x2_t vcopyq_lane_p64(poly64x2_t a, __builtin_constant_p(lane1), poly64x1_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A32/A64 |
| `float32x2_t vcopy_lane_f32(float32x2_t a, __builtin_constant_p(lane1), float32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `float32x4_t vcopyq_lane_f32(float32x4_t a, __builtin_constant_p(lane1), float32x2_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `float64x2_t vcopyq_lane_f64(float64x2_t a, __builtin_constant_p(lane1), float64x1_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `poly8x8_t vcopy_lane_p8(poly8x8_t a, __builtin_constant_p(lane1), poly8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `poly8x16_t vcopyq_lane_p8(poly8x16_t a, __builtin_constant_p(lane1), poly8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `poly16x4_t vcopy_lane_p16(poly16x4_t a, __builtin_constant_p(lane1), poly16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `poly16x8_t vcopyq_lane_p16(poly16x8_t a, __builtin_constant_p(lane1), poly16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vcopy_lane_mf8(mfloat8x8_t a, __builtin_constant_p(lane1), mfloat8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vcopyq_lane_mf8(mfloat8x16_t a, __builtin_constant_p(lane1), mfloat8x8_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `int8x8_t vcopy_laneq_s8(int8x8_t a, __builtin_constant_p(lane1), int8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `int8x16_t vcopyq_laneq_s8(int8x16_t a, __builtin_constant_p(lane1), int8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `int16x4_t vcopy_laneq_s16(int16x4_t a, __builtin_constant_p(lane1), int16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `int16x8_t vcopyq_laneq_s16(int16x8_t a, __builtin_constant_p(lane1), int16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `int32x2_t vcopy_laneq_s32(int32x2_t a, __builtin_constant_p(lane1), int32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `int32x4_t vcopyq_laneq_s32(int32x4_t a, __builtin_constant_p(lane1), int32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `int64x2_t vcopyq_laneq_s64(int64x2_t a, __builtin_constant_p(lane1), int64x2_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `uint8x8_t vcopy_laneq_u8(uint8x8_t a, __builtin_constant_p(lane1), uint8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `uint8x16_t vcopyq_laneq_u8(uint8x16_t a, __builtin_constant_p(lane1), uint8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `uint16x4_t vcopy_laneq_u16(uint16x4_t a, __builtin_constant_p(lane1), uint16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vcopyq_laneq_u16(uint16x8_t a, __builtin_constant_p(lane1), uint16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vcopy_laneq_u32(uint32x2_t a, __builtin_constant_p(lane1), uint32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vcopyq_laneq_u32(uint32x4_t a, __builtin_constant_p(lane1), uint32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vcopyq_laneq_u64(uint64x2_t a, __builtin_constant_p(lane1), uint64x2_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `poly64x2_t vcopyq_laneq_p64(poly64x2_t a, __builtin_constant_p(lane1), poly64x2_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A32/A64 |
| `float32x2_t vcopy_laneq_f32(float32x2_t a, __builtin_constant_p(lane1), float32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.2S -> result` | A64 |
| `float32x4_t vcopyq_laneq_f32(float32x4_t a, __builtin_constant_p(lane1), float32x4_t b, __builtin_constant_p(lane2))` | `INS Vd.S[lane1],Vn.S[lane2]` | `Vd.4S -> result` | A64 |
| `float64x2_t vcopyq_laneq_f64(float64x2_t a, __builtin_constant_p(lane1), float64x2_t b, __builtin_constant_p(lane2))` | `INS Vd.D[lane1],Vn.D[lane2]` | `Vd.2D -> result` | A64 |
| `poly8x8_t vcopy_laneq_p8(poly8x8_t a, __builtin_constant_p(lane1), poly8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `poly8x16_t vcopyq_laneq_p8(poly8x16_t a, __builtin_constant_p(lane1), poly8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `poly16x4_t vcopy_laneq_p16(poly16x4_t a, __builtin_constant_p(lane1), poly16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `poly16x8_t vcopyq_laneq_p16(poly16x8_t a, __builtin_constant_p(lane1), poly16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vcopy_laneq_mf8(mfloat8x8_t a, __builtin_constant_p(lane1), mfloat8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vcopyq_laneq_mf8(mfloat8x16_t a, __builtin_constant_p(lane1), mfloat8x16_t b, __builtin_constant_p(lane2))` | `INS Vd.B[lane1],Vn.B[lane2]` | `Vd.16B -> result` | A64 |
| `int8x8_t vcreate_s8(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vcreate_s16(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vcreate_s32(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.2S -> result` | v7/A32/A64 |
| `int64x1_t vcreate_s64(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.1D -> result` | v7/A32/A64 |
| `uint8x8_t vcreate_u8(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vcreate_u16(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vcreate_u32(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.2S -> result` | v7/A32/A64 |
| `uint64x1_t vcreate_u64(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.1D -> result` | v7/A32/A64 |
| `poly64x1_t vcreate_p64(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vcreate_f16(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.4H -> result` | v7/A32/A64 |
| `float32x2_t vcreate_f32(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vcreate_p8(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vcreate_p16(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.4H -> result` | v7/A32/A64 |
| `float64x1_t vcreate_f64(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.1D -> result` | A64 |
| `mfloat8x8_t vcreate_mf8(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.8B -> result` | A64 |
| `int64x1_t vdup_n_s64(int64_t value)` | `INS Dd.D[0],xn` | `Vd.1D -> result` | v7/A32/A64 |
| `uint64x1_t vdup_n_u64(uint64_t value)` | `INS Dd.D[0],xn` | `Vd.1D -> result` | v7/A32/A64 |
| `poly64x1_t vdup_n_p64(poly64_t value)` | `INS Dd.D[0],xn` | `Vd.1D -> result` | A32/A64 |
| `float64x1_t vdup_n_f64(float64_t value)` | `INS Dd.D[0],xn` | `Vd.1D -> result` | A64 |
| `bfloat16x4_t vcreate_bf16(uint64_t a)` | `INS Vd.D[0],Xn` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vset_lane_bf16(bfloat16_t a, bfloat16x4_t v, __builtin_constant_p(lane))` | `INS Vd.H[lane],Vn.H[0]` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vsetq_lane_bf16(bfloat16_t a, bfloat16x8_t v, __builtin_constant_p(lane))` | `INS Vd.H[lane],Vn.H[0]` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x4_t vcopy_lane_bf16(bfloat16x4_t a, __builtin_constant_p(lane1), bfloat16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `bfloat16x8_t vcopyq_lane_bf16(bfloat16x8_t a, __builtin_constant_p(lane1), bfloat16x4_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |
| `bfloat16x4_t vcopy_laneq_bf16(bfloat16x4_t a, __builtin_constant_p(lane1), bfloat16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.4H -> result` | A64 |
| `bfloat16x8_t vcopyq_laneq_bf16(bfloat16x8_t a, __builtin_constant_p(lane1), bfloat16x8_t b, __builtin_constant_p(lane2))` | `INS Vd.H[lane1],Vn.H[lane2]` | `Vd.8H -> result` | A64 |

---

## LD1

**Description:** Load multiple single-element structures to one, two, three, or four registers. This instruction loads multiple single-element structures from memory and writes the result to one, two, three, or four SIMD&FP registers.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vld1_s8(int8_t const *ptr)` | `LD1 {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `int8x16_t vld1q_s8(int8_t const *ptr)` | `LD1 {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `int16x4_t vld1_s16(int16_t const *ptr)` | `LD1 {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `int16x8_t vld1q_s16(int16_t const *ptr)` | `LD1 {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `int32x2_t vld1_s32(int32_t const *ptr)` | `LD1 {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `int32x4_t vld1q_s32(int32_t const *ptr)` | `LD1 {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `int64x1_t vld1_s64(int64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `int64x2_t vld1q_s64(int64_t const *ptr)` | `LD1 {Vt.2D},[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `uint8x8_t vld1_u8(uint8_t const *ptr)` | `LD1 {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `uint8x16_t vld1q_u8(uint8_t const *ptr)` | `LD1 {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `uint16x4_t vld1_u16(uint16_t const *ptr)` | `LD1 {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `uint16x8_t vld1q_u16(uint16_t const *ptr)` | `LD1 {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `uint32x2_t vld1_u32(uint32_t const *ptr)` | `LD1 {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `uint32x4_t vld1q_u32(uint32_t const *ptr)` | `LD1 {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `uint64x1_t vld1_u64(uint64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `uint64x2_t vld1q_u64(uint64_t const *ptr)` | `LD1 {Vt.2D},[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `poly64x1_t vld1_p64(poly64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | A32/A64 |
| `poly64x2_t vld1q_p64(poly64_t const *ptr)` | `LD1 {Vt.2D},[Xn]` | `Vt.2D -> result` | A32/A64 |
| `float16x4_t vld1_f16(float16_t const *ptr)` | `LD1 {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `float16x8_t vld1q_f16(float16_t const *ptr)` | `LD1 {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float32x2_t vld1_f32(float32_t const *ptr)` | `LD1 {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `float32x4_t vld1q_f32(float32_t const *ptr)` | `LD1 {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `poly8x8_t vld1_p8(poly8_t const *ptr)` | `LD1 {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `poly8x16_t vld1q_p8(poly8_t const *ptr)` | `LD1 {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `poly16x4_t vld1_p16(poly16_t const *ptr)` | `LD1 {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `poly16x8_t vld1q_p16(poly16_t const *ptr)` | `LD1 {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float64x1_t vld1_f64(float64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | A64 |
| `float64x2_t vld1q_f64(float64_t const *ptr)` | `LD1 {Vt.2D},[Xn]` | `Vt.2D -> result` | A64 |
| `mfloat8x8_t vld1_mf8(mfloat8_t const *ptr)` | `LD1 {Vt.8B},[Xn]` | `Vt.8B -> result` | A64 |
| `mfloat8x16_t vld1q_mf8(mfloat8_t const *ptr)` | `LD1 {Vt.16B},[Xn]` | `Vt.16B -> result` | A64 |
| `int8x8_t vld1_lane_s8(int8_t const *ptr, int8x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.b}[lane],[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `int8x16_t vld1q_lane_s8(int8_t const *ptr, int8x16_t src, __builtin_constant_p(lane))` | `LD1 {Vt.b}[lane],[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `int16x4_t vld1_lane_s16(int16_t const *ptr, int16x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `int16x8_t vld1q_lane_s16(int16_t const *ptr, int16x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `int32x2_t vld1_lane_s32(int32_t const *ptr, int32x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `int32x4_t vld1q_lane_s32(int32_t const *ptr, int32x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `int64x1_t vld1_lane_s64(int64_t const *ptr, int64x1_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `int64x2_t vld1q_lane_s64(int64_t const *ptr, int64x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `uint8x8_t vld1_lane_u8(uint8_t const *ptr, uint8x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.B}[lane],[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `uint8x16_t vld1q_lane_u8(uint8_t const *ptr, uint8x16_t src, __builtin_constant_p(lane))` | `LD1 {Vt.B}[lane],[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `uint16x4_t vld1_lane_u16(uint16_t const *ptr, uint16x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `uint16x8_t vld1q_lane_u16(uint16_t const *ptr, uint16x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `uint32x2_t vld1_lane_u32(uint32_t const *ptr, uint32x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `uint32x4_t vld1q_lane_u32(uint32_t const *ptr, uint32x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `uint64x1_t vld1_lane_u64(uint64_t const *ptr, uint64x1_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `uint64x2_t vld1q_lane_u64(uint64_t const *ptr, uint64x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `poly64x1_t vld1_lane_p64(poly64_t const *ptr, poly64x1_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A32/A64 |
| `poly64x2_t vld1q_lane_p64(poly64_t const *ptr, poly64x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A32/A64 |
| `float16x4_t vld1_lane_f16(float16_t const *ptr, float16x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `float16x8_t vld1q_lane_f16(float16_t const *ptr, float16x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float32x2_t vld1_lane_f32(float32_t const *ptr, float32x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `float32x4_t vld1q_lane_f32(float32_t const *ptr, float32x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.S}[lane],[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `poly8x8_t vld1_lane_p8(poly8_t const *ptr, poly8x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.B}[lane],[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `poly8x16_t vld1q_lane_p8(poly8_t const *ptr, poly8x16_t src, __builtin_constant_p(lane))` | `LD1 {Vt.B}[lane],[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `poly16x4_t vld1_lane_p16(poly16_t const *ptr, poly16x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `poly16x8_t vld1q_lane_p16(poly16_t const *ptr, poly16x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float64x1_t vld1_lane_f64(float64_t const *ptr, float64x1_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A64 |
| `float64x2_t vld1q_lane_f64(float64_t const *ptr, float64x2_t src, __builtin_constant_p(lane))` | `LD1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A64 |
| `mfloat8x8_t vld1_lane_mf8(mfloat8_t const *ptr, mfloat8x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.b}[lane],[Xn]` | `Vt.8B -> result` | A64 |
| `mfloat8x16_t vld1q_lane_mf8(mfloat8_t const *ptr, mfloat8x16_t src, __builtin_constant_p(lane))` | `LD1 {Vt.b}[lane],[Xn]` | `Vt.16B -> result` | A64 |
| `int64x1_t vld1_dup_s64(int64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `uint64x1_t vld1_dup_u64(uint64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | v7/A32/A64 |
| `poly64x1_t vld1_dup_p64(poly64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | A32/A64 |
| `float64x1_t vld1_dup_f64(float64_t const *ptr)` | `LD1 {Vt.1D},[Xn]` | `Vt.1D -> result` | A64 |
| `int64x1x2_t vld2_s64(int64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x2_t vld2_u64(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x2_t vld2_p64(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `float64x1x2_t vld2_f64(float64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int64x1x3_t vld3_s64(int64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x3_t vld3_u64(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x3_t vld3_p64(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `float64x1x3_t vld3_f64(float64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int64x1x4_t vld4_s64(int64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x4_t vld4_u64(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x4_t vld4_p64(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `float64x1x4_t vld4_f64(float64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int8x8x2_t vld1_s8_x2(int8_t const *ptr)` | `LD1 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x2_t vld1q_s8_x2(int8_t const *ptr)` | `LD1 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x2_t vld1_s16_x2(int16_t const *ptr)` | `LD1 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x2_t vld1q_s16_x2(int16_t const *ptr)` | `LD1 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x2_t vld1_s32_x2(int32_t const *ptr)` | `LD1 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x2_t vld1q_s32_x2(int32_t const *ptr)` | `LD1 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x2_t vld1_u8_x2(uint8_t const *ptr)` | `LD1 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x2_t vld1q_u8_x2(uint8_t const *ptr)` | `LD1 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x2_t vld1_u16_x2(uint16_t const *ptr)` | `LD1 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x2_t vld1q_u16_x2(uint16_t const *ptr)` | `LD1 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x2_t vld1_u32_x2(uint32_t const *ptr)` | `LD1 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x2_t vld1q_u32_x2(uint32_t const *ptr)` | `LD1 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x2_t vld1_f16_x2(float16_t const *ptr)` | `LD1 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x2_t vld1q_f16_x2(float16_t const *ptr)` | `LD1 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x2_t vld1_f32_x2(float32_t const *ptr)` | `LD1 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x2_t vld1q_f32_x2(float32_t const *ptr)` | `LD1 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x2_t vld1_p8_x2(poly8_t const *ptr)` | `LD1 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x2_t vld1q_p8_x2(poly8_t const *ptr)` | `LD1 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x2_t vld1_p16_x2(poly16_t const *ptr)` | `LD1 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x2_t vld1q_p16_x2(poly16_t const *ptr)` | `LD1 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x2_t vld1_s64_x2(int64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x2_t vld1_u64_x2(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x2_t vld1_p64_x2(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x2_t vld1q_s64_x2(int64_t const *ptr)` | `LD1 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `uint64x2x2_t vld1q_u64_x2(uint64_t const *ptr)` | `LD1 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `poly64x2x2_t vld1q_p64_x2(poly64_t const *ptr)` | `LD1 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A32/A64 |
| `float64x1x2_t vld1_f64_x2(float64_t const *ptr)` | `LD1 {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x2_t vld1q_f64_x2(float64_t const *ptr)` | `LD1 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x2_t vld1_mf8_x2(mfloat8_t const *ptr)` | `LD1 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x2_t vld1q_mf8_x2(mfloat8_t const *ptr)` | `LD1 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int8x8x3_t vld1_s8_x3(int8_t const *ptr)` | `LD1 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x3_t vld1q_s8_x3(int8_t const *ptr)` | `LD1 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x3_t vld1_s16_x3(int16_t const *ptr)` | `LD1 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x3_t vld1q_s16_x3(int16_t const *ptr)` | `LD1 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x3_t vld1_s32_x3(int32_t const *ptr)` | `LD1 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x3_t vld1q_s32_x3(int32_t const *ptr)` | `LD1 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x3_t vld1_u8_x3(uint8_t const *ptr)` | `LD1 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x3_t vld1q_u8_x3(uint8_t const *ptr)` | `LD1 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x3_t vld1_u16_x3(uint16_t const *ptr)` | `LD1 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x3_t vld1q_u16_x3(uint16_t const *ptr)` | `LD1 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x3_t vld1_u32_x3(uint32_t const *ptr)` | `LD1 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x3_t vld1q_u32_x3(uint32_t const *ptr)` | `LD1 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x3_t vld1_f16_x3(float16_t const *ptr)` | `LD1 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x3_t vld1q_f16_x3(float16_t const *ptr)` | `LD1 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x3_t vld1_f32_x3(float32_t const *ptr)` | `LD1 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x3_t vld1q_f32_x3(float32_t const *ptr)` | `LD1 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x3_t vld1_p8_x3(poly8_t const *ptr)` | `LD1 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x3_t vld1q_p8_x3(poly8_t const *ptr)` | `LD1 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x3_t vld1_p16_x3(poly16_t const *ptr)` | `LD1 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x3_t vld1q_p16_x3(poly16_t const *ptr)` | `LD1 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x3_t vld1_s64_x3(int64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x3_t vld1_u64_x3(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x3_t vld1_p64_x3(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x3_t vld1q_s64_x3(int64_t const *ptr)` | `LD1 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `uint64x2x3_t vld1q_u64_x3(uint64_t const *ptr)` | `LD1 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `poly64x2x3_t vld1q_p64_x3(poly64_t const *ptr)` | `LD1 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A32/A64 |
| `float64x1x3_t vld1_f64_x3(float64_t const *ptr)` | `LD1 {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x3_t vld1q_f64_x3(float64_t const *ptr)` | `LD1 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x3_t vld1_mf8_x3(mfloat8_t const *ptr)` | `LD1 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x3_t vld1q_mf8_x3(mfloat8_t const *ptr)` | `LD1 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int8x8x4_t vld1_s8_x4(int8_t const *ptr)` | `LD1 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x4_t vld1q_s8_x4(int8_t const *ptr)` | `LD1 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x4_t vld1_s16_x4(int16_t const *ptr)` | `LD1 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x4_t vld1q_s16_x4(int16_t const *ptr)` | `LD1 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x4_t vld1_s32_x4(int32_t const *ptr)` | `LD1 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x4_t vld1q_s32_x4(int32_t const *ptr)` | `LD1 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x4_t vld1_u8_x4(uint8_t const *ptr)` | `LD1 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x4_t vld1q_u8_x4(uint8_t const *ptr)` | `LD1 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x4_t vld1_u16_x4(uint16_t const *ptr)` | `LD1 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x4_t vld1q_u16_x4(uint16_t const *ptr)` | `LD1 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x4_t vld1_u32_x4(uint32_t const *ptr)` | `LD1 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x4_t vld1q_u32_x4(uint32_t const *ptr)` | `LD1 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x4_t vld1_f16_x4(float16_t const *ptr)` | `LD1 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x4_t vld1q_f16_x4(float16_t const *ptr)` | `LD1 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x4_t vld1_f32_x4(float32_t const *ptr)` | `LD1 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x4_t vld1q_f32_x4(float32_t const *ptr)` | `LD1 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x4_t vld1_p8_x4(poly8_t const *ptr)` | `LD1 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x4_t vld1q_p8_x4(poly8_t const *ptr)` | `LD1 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x4_t vld1_p16_x4(poly16_t const *ptr)` | `LD1 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x4_t vld1q_p16_x4(poly16_t const *ptr)` | `LD1 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x4_t vld1_s64_x4(int64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x4_t vld1_u64_x4(uint64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x4_t vld1_p64_x4(poly64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x4_t vld1q_s64_x4(int64_t const *ptr)` | `LD1 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `uint64x2x4_t vld1q_u64_x4(uint64_t const *ptr)` | `LD1 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | v7/A32/A64 |
| `poly64x2x4_t vld1q_p64_x4(poly64_t const *ptr)` | `LD1 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A32/A64 |
| `float64x1x4_t vld1_f64_x4(float64_t const *ptr)` | `LD1 {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x4_t vld1q_f64_x4(float64_t const *ptr)` | `LD1 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x4_t vld1_mf8_x4(mfloat8_t const *ptr)` | `LD1 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x4_t vld1q_mf8_x4(mfloat8_t const *ptr)` | `LD1 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4_t vld1_bf16(bfloat16_t const *ptr)` | `LD1 {Vt.4H},[Xn]` | `Vt.4H -> result` | A32/A64 |
| `bfloat16x8_t vld1q_bf16(bfloat16_t const *ptr)` | `LD1 {Vt.8H},[Xn]` | `Vt.8H -> result` | A32/A64 |
| `bfloat16x4_t vld1_lane_bf16(bfloat16_t const *ptr, bfloat16x4_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.4H -> result` | A32/A64 |
| `bfloat16x8_t vld1q_lane_bf16(bfloat16_t const *ptr, bfloat16x8_t src, __builtin_constant_p(lane))` | `LD1 {Vt.H}[lane],[Xn]` | `Vt.8H -> result` | A32/A64 |
| `bfloat16x4x2_t vld1_bf16_x2(bfloat16_t const *ptr)` | `LD1 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x2_t vld1q_bf16_x2(bfloat16_t const *ptr)` | `LD1 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |
| `bfloat16x4x3_t vld1_bf16_x3(bfloat16_t const *ptr)` | `LD1 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `bfloat16x8x3_t vld1q_bf16_x3(bfloat16_t const *ptr)` | `LD1 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `bfloat16x4x4_t vld1_bf16_x4(bfloat16_t const *ptr)` | `LD1 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x4_t vld1q_bf16_x4(bfloat16_t const *ptr)` | `LD1 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD1R

**Description:** Load one single-element structure and Replicate to all lanes (of one register). This instruction loads a single-element structure from memory and replicates the structure to all the lanes of the SIMD&FP register.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(128) rval;
bits(esize) element;
constant integer ebytes = esize DIV 8;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
if replicate then
    // load and replicate to all elements
    for s = 0 to selem-1
        element = Mem[address + offs, ebytes, AccType_VEC];
        // replicate to fill 128- or 64-bit register
        V[t] = Replicate(element, datasize DIV esize);
        offs = offs + ebytes;
        t = (t + 1) MOD 32;
else
    // load/store one element per register
    for s = 0 to selem-1
        rval = V[t];
        if memop == MemOp_LOAD then
            // insert into one lane of 128-bit register
            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];
            V[t] = rval;
        else // memop == MemOp_STORE
            // extract from one lane of 128-bit register
            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];
        offs = offs + ebytes;
        t = (t + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vld1_dup_s8(int8_t const *ptr)` | `LD1R {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `int8x16_t vld1q_dup_s8(int8_t const *ptr)` | `LD1R {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `int16x4_t vld1_dup_s16(int16_t const *ptr)` | `LD1R {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `int16x8_t vld1q_dup_s16(int16_t const *ptr)` | `LD1R {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `int32x2_t vld1_dup_s32(int32_t const *ptr)` | `LD1R {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `int32x4_t vld1q_dup_s32(int32_t const *ptr)` | `LD1R {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `int64x2_t vld1q_dup_s64(int64_t const *ptr)` | `LD1R {Vt.2D},[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `uint8x8_t vld1_dup_u8(uint8_t const *ptr)` | `LD1R {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `uint8x16_t vld1q_dup_u8(uint8_t const *ptr)` | `LD1R {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `uint16x4_t vld1_dup_u16(uint16_t const *ptr)` | `LD1R {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `uint16x8_t vld1q_dup_u16(uint16_t const *ptr)` | `LD1R {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `uint32x2_t vld1_dup_u32(uint32_t const *ptr)` | `LD1R {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `uint32x4_t vld1q_dup_u32(uint32_t const *ptr)` | `LD1R {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `uint64x2_t vld1q_dup_u64(uint64_t const *ptr)` | `LD1R {Vt.2D},[Xn]` | `Vt.2D -> result` | v7/A32/A64 |
| `poly64x2_t vld1q_dup_p64(poly64_t const *ptr)` | `LD1R {Vt.2D},[Xn]` | `Vt.2D -> result` | A32/A64 |
| `float16x4_t vld1_dup_f16(float16_t const *ptr)` | `LD1R {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `float16x8_t vld1q_dup_f16(float16_t const *ptr)` | `LD1R {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float32x2_t vld1_dup_f32(float32_t const *ptr)` | `LD1R {Vt.2S},[Xn]` | `Vt.2S -> result` | v7/A32/A64 |
| `float32x4_t vld1q_dup_f32(float32_t const *ptr)` | `LD1R {Vt.4S},[Xn]` | `Vt.4S -> result` | v7/A32/A64 |
| `poly8x8_t vld1_dup_p8(poly8_t const *ptr)` | `LD1R {Vt.8B},[Xn]` | `Vt.8B -> result` | v7/A32/A64 |
| `poly8x16_t vld1q_dup_p8(poly8_t const *ptr)` | `LD1R {Vt.16B},[Xn]` | `Vt.16B -> result` | v7/A32/A64 |
| `poly16x4_t vld1_dup_p16(poly16_t const *ptr)` | `LD1R {Vt.4H},[Xn]` | `Vt.4H -> result` | v7/A32/A64 |
| `poly16x8_t vld1q_dup_p16(poly16_t const *ptr)` | `LD1R {Vt.8H},[Xn]` | `Vt.8H -> result` | v7/A32/A64 |
| `float64x2_t vld1q_dup_f64(float64_t const *ptr)` | `LD1R {Vt.2D},[Xn]` | `Vt.2D -> result` | A64 |
| `mfloat8x8_t vld1_dup_mf8(mfloat8_t const *ptr)` | `LD1R {Vt.8B},[Xn]` | `Vt.8B -> result` | A64 |
| `mfloat8x16_t vld1q_dup_mf8(mfloat8_t const *ptr)` | `LD1R {Vt.16B},[Xn]` | `Vt.16B -> result` | A64 |
| `bfloat16x4_t vld1_dup_bf16(bfloat16_t const *ptr)` | `LD1R {Vt.4H},[Xn]` | `Vt.4H -> result` | A32/A64 |
| `bfloat16x8_t vld1q_dup_bf16(bfloat16_t const *ptr)` | `LD1R {Vt.8H},[Xn]` | `Vt.8H -> result` | A32/A64 |

---

## LD2

**Description:** Load multiple 2-element structures to two registers. This instruction loads multiple 2-element structures from memory and writes the result to the two SIMD&FP registers, with de-interleaving.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x2_t vld2_s8(int8_t const *ptr)` | `LD2 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x2_t vld2q_s8(int8_t const *ptr)` | `LD2 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x2_t vld2_s16(int16_t const *ptr)` | `LD2 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x2_t vld2q_s16(int16_t const *ptr)` | `LD2 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x2_t vld2_s32(int32_t const *ptr)` | `LD2 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x2_t vld2q_s32(int32_t const *ptr)` | `LD2 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x2_t vld2_u8(uint8_t const *ptr)` | `LD2 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x2_t vld2q_u8(uint8_t const *ptr)` | `LD2 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x2_t vld2_u16(uint16_t const *ptr)` | `LD2 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x2_t vld2q_u16(uint16_t const *ptr)` | `LD2 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x2_t vld2_u32(uint32_t const *ptr)` | `LD2 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x2_t vld2q_u32(uint32_t const *ptr)` | `LD2 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x2_t vld2_f16(float16_t const *ptr)` | `LD2 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x2_t vld2q_f16(float16_t const *ptr)` | `LD2 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x2_t vld2_f32(float32_t const *ptr)` | `LD2 {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x2_t vld2q_f32(float32_t const *ptr)` | `LD2 {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x2_t vld2_p8(poly8_t const *ptr)` | `LD2 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x2_t vld2q_p8(poly8_t const *ptr)` | `LD2 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x2_t vld2_p16(poly16_t const *ptr)` | `LD2 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x2_t vld2q_p16(poly16_t const *ptr)` | `LD2 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x2x2_t vld2q_s64(int64_t const *ptr)` | `LD2 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x2_t vld2q_u64(uint64_t const *ptr)` | `LD2 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x2_t vld2q_p64(poly64_t const *ptr)` | `LD2 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x2x2_t vld2q_f64(float64_t const *ptr)` | `LD2 {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x2_t vld2_mf8(mfloat8_t const *ptr)` | `LD2 {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x2_t vld2q_mf8(mfloat8_t const *ptr)` | `LD2 {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int16x4x2_t vld2_lane_s16(int16_t const *ptr, int16x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x2_t vld2q_lane_s16(int16_t const *ptr, int16x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x2_t vld2_lane_s32(int32_t const *ptr, int32x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x2_t vld2q_lane_s32(int32_t const *ptr, int32x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint16x4x2_t vld2_lane_u16(uint16_t const *ptr, uint16x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x2_t vld2q_lane_u16(uint16_t const *ptr, uint16x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x2_t vld2_lane_u32(uint32_t const *ptr, uint32x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x2_t vld2q_lane_u32(uint32_t const *ptr, uint32x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x2_t vld2_lane_f16(float16_t const *ptr, float16x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x2_t vld2q_lane_f16(float16_t const *ptr, float16x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x2_t vld2_lane_f32(float32_t const *ptr, float32x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x2_t vld2q_lane_f32(float32_t const *ptr, float32x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.s - Vt2.s}[lane],[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly16x4x2_t vld2_lane_p16(poly16_t const *ptr, poly16x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x2_t vld2q_lane_p16(poly16_t const *ptr, poly16x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int8x8x2_t vld2_lane_s8(int8_t const *ptr, int8x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x8x2_t vld2_lane_u8(uint8_t const *ptr, uint8x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x8x2_t vld2_lane_p8(poly8_t const *ptr, poly8x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x2_t vld2q_lane_s8(int8_t const *ptr, int8x16x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `uint8x16x2_t vld2q_lane_u8(uint8_t const *ptr, uint8x16x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `poly8x16x2_t vld2q_lane_p8(poly8_t const *ptr, poly8x16x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int64x1x2_t vld2_lane_s64(int64_t const *ptr, int64x1x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `ptr -> Xn;Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int64x2x2_t vld2q_lane_s64(int64_t const *ptr, int64x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `ptr -> Xn;Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x1x2_t vld2_lane_u64(uint64_t const *ptr, uint64x1x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `uint64x2x2_t vld2q_lane_u64(uint64_t const *ptr, uint64x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x1x2_t vld2_lane_p64(poly64_t const *ptr, poly64x1x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `poly64x2x2_t vld2q_lane_p64(poly64_t const *ptr, poly64x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x2_t vld2_lane_f64(float64_t const *ptr, float64x1x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x2_t vld2q_lane_f64(float64_t const *ptr, float64x2x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.d - Vt2.d}[lane],[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x2_t vld2_lane_mf8(mfloat8_t const *ptr, mfloat8x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x2_t vld2q_lane_mf8(mfloat8_t const *ptr, mfloat8x16x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.b - Vt2.b}[lane],[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x2_t vld2_bf16(bfloat16_t const *ptr)` | `LD2 {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x2_t vld2q_bf16(bfloat16_t const *ptr)` | `LD2 {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |
| `bfloat16x4x2_t vld2_lane_bf16(bfloat16_t const *ptr, bfloat16x4x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x2_t vld2q_lane_bf16(bfloat16_t const *ptr, bfloat16x8x2_t src, __builtin_constant_p(lane))` | `LD2 {Vt.h - Vt2.h}[lane],[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD2R

**Description:** Load single 2-element structure and Replicate to all lanes of two registers. This instruction loads a 2-element structure from memory and replicates the structure to all the lanes of the two SIMD&FP registers.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(128) rval;
bits(esize) element;
constant integer ebytes = esize DIV 8;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
if replicate then
    // load and replicate to all elements
    for s = 0 to selem-1
        element = Mem[address + offs, ebytes, AccType_VEC];
        // replicate to fill 128- or 64-bit register
        V[t] = Replicate(element, datasize DIV esize);
        offs = offs + ebytes;
        t = (t + 1) MOD 32;
else
    // load/store one element per register
    for s = 0 to selem-1
        rval = V[t];
        if memop == MemOp_LOAD then
            // insert into one lane of 128-bit register
            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];
            V[t] = rval;
        else // memop == MemOp_STORE
            // extract from one lane of 128-bit register
            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];
        offs = offs + ebytes;
        t = (t + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x2_t vld2_dup_s8(int8_t const *ptr)` | `LD2R {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x2_t vld2q_dup_s8(int8_t const *ptr)` | `LD2R {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x2_t vld2_dup_s16(int16_t const *ptr)` | `LD2R {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x2_t vld2q_dup_s16(int16_t const *ptr)` | `LD2R {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x2_t vld2_dup_s32(int32_t const *ptr)` | `LD2R {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x2_t vld2q_dup_s32(int32_t const *ptr)` | `LD2R {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x2_t vld2_dup_u8(uint8_t const *ptr)` | `LD2R {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x2_t vld2q_dup_u8(uint8_t const *ptr)` | `LD2R {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x2_t vld2_dup_u16(uint16_t const *ptr)` | `LD2R {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x2_t vld2q_dup_u16(uint16_t const *ptr)` | `LD2R {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x2_t vld2_dup_u32(uint32_t const *ptr)` | `LD2R {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x2_t vld2q_dup_u32(uint32_t const *ptr)` | `LD2R {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x2_t vld2_dup_f16(float16_t const *ptr)` | `LD2R {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x2_t vld2q_dup_f16(float16_t const *ptr)` | `LD2R {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x2_t vld2_dup_f32(float32_t const *ptr)` | `LD2R {Vt.2S - Vt2.2S},[Xn]` | `Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x2_t vld2q_dup_f32(float32_t const *ptr)` | `LD2R {Vt.4S - Vt2.4S},[Xn]` | `Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x2_t vld2_dup_p8(poly8_t const *ptr)` | `LD2R {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x2_t vld2q_dup_p8(poly8_t const *ptr)` | `LD2R {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x2_t vld2_dup_p16(poly16_t const *ptr)` | `LD2R {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x2_t vld2q_dup_p16(poly16_t const *ptr)` | `LD2R {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x2_t vld2_dup_s64(int64_t const *ptr)` | `LD2R {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x2_t vld2_dup_u64(uint64_t const *ptr)` | `LD2R {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x2_t vld2_dup_p64(poly64_t const *ptr)` | `LD2R {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x2_t vld2q_dup_s64(int64_t const *ptr)` | `LD2R {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x2_t vld2q_dup_u64(uint64_t const *ptr)` | `LD2R {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x2_t vld2q_dup_p64(poly64_t const *ptr)` | `LD2R {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x2_t vld2_dup_f64(float64_t const *ptr)` | `LD2R {Vt.1D - Vt2.1D},[Xn]` | `Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x2_t vld2q_dup_f64(float64_t const *ptr)` | `LD2R {Vt.2D - Vt2.2D},[Xn]` | `Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x2_t vld2_dup_mf8(mfloat8_t const *ptr)` | `LD2R {Vt.8B - Vt2.8B},[Xn]` | `Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x2_t vld2q_dup_mf8(mfloat8_t const *ptr)` | `LD2R {Vt.16B - Vt2.16B},[Xn]` | `Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x2_t vld2_dup_bf16(bfloat16_t const *ptr)` | `LD2R {Vt.4H - Vt2.4H},[Xn]` | `Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x2_t vld2q_dup_bf16(bfloat16_t const *ptr)` | `LD2R {Vt.8H - Vt2.8H},[Xn]` | `Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD3

**Description:** Load multiple 3-element structures to three registers. This instruction loads multiple 3-element structures from memory and writes the result to the three SIMD&FP registers, with de-interleaving.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x3_t vld3_s8(int8_t const *ptr)` | `LD3 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x3_t vld3q_s8(int8_t const *ptr)` | `LD3 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x3_t vld3_s16(int16_t const *ptr)` | `LD3 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x3_t vld3q_s16(int16_t const *ptr)` | `LD3 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x3_t vld3_s32(int32_t const *ptr)` | `LD3 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x3_t vld3q_s32(int32_t const *ptr)` | `LD3 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x3_t vld3_u8(uint8_t const *ptr)` | `LD3 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x3_t vld3q_u8(uint8_t const *ptr)` | `LD3 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x3_t vld3_u16(uint16_t const *ptr)` | `LD3 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x3_t vld3q_u16(uint16_t const *ptr)` | `LD3 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x3_t vld3_u32(uint32_t const *ptr)` | `LD3 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x3_t vld3q_u32(uint32_t const *ptr)` | `LD3 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x3_t vld3_f16(float16_t const *ptr)` | `LD3 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x3_t vld3q_f16(float16_t const *ptr)` | `LD3 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x3_t vld3_f32(float32_t const *ptr)` | `LD3 {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x3_t vld3q_f32(float32_t const *ptr)` | `LD3 {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x3_t vld3_p8(poly8_t const *ptr)` | `LD3 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x3_t vld3q_p8(poly8_t const *ptr)` | `LD3 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x3_t vld3_p16(poly16_t const *ptr)` | `LD3 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x3_t vld3q_p16(poly16_t const *ptr)` | `LD3 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x2x3_t vld3q_s64(int64_t const *ptr)` | `LD3 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x3_t vld3q_u64(uint64_t const *ptr)` | `LD3 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x3_t vld3q_p64(poly64_t const *ptr)` | `LD3 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x2x3_t vld3q_f64(float64_t const *ptr)` | `LD3 {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x3_t vld3_mf8(int8_t const *ptr)` | `LD3 {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x3_t vld3q_mf8(int8_t const *ptr)` | `LD3 {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int16x4x3_t vld3_lane_s16(int16_t const *ptr, int16x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x3_t vld3q_lane_s16(int16_t const *ptr, int16x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x3_t vld3_lane_s32(int32_t const *ptr, int32x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x3_t vld3q_lane_s32(int32_t const *ptr, int32x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint16x4x3_t vld3_lane_u16(uint16_t const *ptr, uint16x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x3_t vld3q_lane_u16(uint16_t const *ptr, uint16x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x3_t vld3_lane_u32(uint32_t const *ptr, uint32x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x3_t vld3q_lane_u32(uint32_t const *ptr, uint32x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x3_t vld3_lane_f16(float16_t const *ptr, float16x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x3_t vld3q_lane_f16(float16_t const *ptr, float16x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x3_t vld3_lane_f32(float32_t const *ptr, float32x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x3_t vld3q_lane_f32(float32_t const *ptr, float32x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.s - Vt3.s}[lane],[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly16x4x3_t vld3_lane_p16(poly16_t const *ptr, poly16x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x3_t vld3q_lane_p16(poly16_t const *ptr, poly16x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int8x8x3_t vld3_lane_s8(int8_t const *ptr, int8x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x8x3_t vld3_lane_u8(uint8_t const *ptr, uint8x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x8x3_t vld3_lane_p8(poly8_t const *ptr, poly8x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x3_t vld3q_lane_s8(int8_t const *ptr, int8x16x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `uint8x16x3_t vld3q_lane_u8(uint8_t const *ptr, uint8x16x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `poly8x16x3_t vld3q_lane_p8(poly8_t const *ptr, poly8x16x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int64x1x3_t vld3_lane_s64(int64_t const *ptr, int64x1x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int64x2x3_t vld3q_lane_s64(int64_t const *ptr, int64x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x1x3_t vld3_lane_u64(uint64_t const *ptr, uint64x1x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `uint64x2x3_t vld3q_lane_u64(uint64_t const *ptr, uint64x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x1x3_t vld3_lane_p64(poly64_t const *ptr, poly64x1x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `poly64x2x3_t vld3q_lane_p64(poly64_t const *ptr, poly64x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x3_t vld3_lane_f64(float64_t const *ptr, float64x1x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x3_t vld3q_lane_f64(float64_t const *ptr, float64x2x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.d - Vt3.d}[lane],[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x3_t vld3_lane_mf8(mfloat8_t const *ptr, mfloat8x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x3_t vld3q_lane_mf8(mfloat8_t const *ptr, mfloat8x16x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.b - Vt3.b}[lane],[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x3_t vld3_bf16(bfloat16_t const *ptr)` | `LD3 {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x3_t vld3q_bf16(bfloat16_t const *ptr)` | `LD3 {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |
| `bfloat16x4x3_t vld3_lane_bf16(bfloat16_t const *ptr, bfloat16x4x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x3_t vld3q_lane_bf16(bfloat16_t const *ptr, bfloat16x8x3_t src, __builtin_constant_p(lane))` | `LD3 {Vt.h - Vt3.h}[lane],[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD3R

**Description:** Load single 3-element structure and Replicate to all lanes of three registers. This instruction loads a 3-element structure from memory and replicates the structure to all the lanes of the three SIMD&FP registers.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(128) rval;
bits(esize) element;
constant integer ebytes = esize DIV 8;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
if replicate then
    // load and replicate to all elements
    for s = 0 to selem-1
        element = Mem[address + offs, ebytes, AccType_VEC];
        // replicate to fill 128- or 64-bit register
        V[t] = Replicate(element, datasize DIV esize);
        offs = offs + ebytes;
        t = (t + 1) MOD 32;
else
    // load/store one element per register
    for s = 0 to selem-1
        rval = V[t];
        if memop == MemOp_LOAD then
            // insert into one lane of 128-bit register
            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];
            V[t] = rval;
        else // memop == MemOp_STORE
            // extract from one lane of 128-bit register
            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];
        offs = offs + ebytes;
        t = (t + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x3_t vld3_dup_s8(int8_t const *ptr)` | `LD3R {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x3_t vld3q_dup_s8(int8_t const *ptr)` | `LD3R {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x3_t vld3_dup_s16(int16_t const *ptr)` | `LD3R {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x3_t vld3q_dup_s16(int16_t const *ptr)` | `LD3R {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x3_t vld3_dup_s32(int32_t const *ptr)` | `LD3R {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x3_t vld3q_dup_s32(int32_t const *ptr)` | `LD3R {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x3_t vld3_dup_u8(uint8_t const *ptr)` | `LD3R {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x3_t vld3q_dup_u8(uint8_t const *ptr)` | `LD3R {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x3_t vld3_dup_u16(uint16_t const *ptr)` | `LD3R {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x3_t vld3q_dup_u16(uint16_t const *ptr)` | `LD3R {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x3_t vld3_dup_u32(uint32_t const *ptr)` | `LD3R {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x3_t vld3q_dup_u32(uint32_t const *ptr)` | `LD3R {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x3_t vld3_dup_f16(float16_t const *ptr)` | `LD3R {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x3_t vld3q_dup_f16(float16_t const *ptr)` | `LD3R {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x3_t vld3_dup_f32(float32_t const *ptr)` | `LD3R {Vt.2S - Vt3.2S},[Xn]` | `Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x3_t vld3q_dup_f32(float32_t const *ptr)` | `LD3R {Vt.4S - Vt3.4S},[Xn]` | `Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x3_t vld3_dup_p8(poly8_t const *ptr)` | `LD3R {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x3_t vld3q_dup_p8(poly8_t const *ptr)` | `LD3R {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x3_t vld3_dup_p16(poly16_t const *ptr)` | `LD3R {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x3_t vld3q_dup_p16(poly16_t const *ptr)` | `LD3R {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x3_t vld3_dup_s64(int64_t const *ptr)` | `LD3R {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x3_t vld3_dup_u64(uint64_t const *ptr)` | `LD3R {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x3_t vld3_dup_p64(poly64_t const *ptr)` | `LD3R {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x3_t vld3q_dup_s64(int64_t const *ptr)` | `LD3R {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x3_t vld3q_dup_u64(uint64_t const *ptr)` | `LD3R {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x3_t vld3q_dup_p64(poly64_t const *ptr)` | `LD3R {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x3_t vld3_dup_f64(float64_t const *ptr)` | `LD3R {Vt.1D - Vt3.1D},[Xn]` | `Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x3_t vld3q_dup_f64(float64_t const *ptr)` | `LD3R {Vt.2D - Vt3.2D},[Xn]` | `Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x3_t vld3_dup_mf8(mfloat8_t const *ptr)` | `LD3R {Vt.8B - Vt3.8B},[Xn]` | `Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x3_t vld3q_dup_mf8(mfloat8_t const *ptr)` | `LD3R {Vt.16B - Vt3.16B},[Xn]` | `Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x3_t vld3_dup_bf16(bfloat16_t const *ptr)` | `LD3R {Vt.4H - Vt3.4H},[Xn]` | `Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x3_t vld3q_dup_bf16(bfloat16_t const *ptr)` | `LD3R {Vt.8H - Vt3.8H},[Xn]` | `Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD4

**Description:** Load multiple 4-element structures to four registers. This instruction loads multiple 4-element structures from memory and writes the result to the four SIMD&FP registers, with de-interleaving.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x4_t vld4_s8(int8_t const *ptr)` | `LD4 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x4_t vld4q_s8(int8_t const *ptr)` | `LD4 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x4_t vld4_s16(int16_t const *ptr)` | `LD4 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x4_t vld4q_s16(int16_t const *ptr)` | `LD4 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x4_t vld4_s32(int32_t const *ptr)` | `LD4 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x4_t vld4q_s32(int32_t const *ptr)` | `LD4 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x4_t vld4_u8(uint8_t const *ptr)` | `LD4 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x4_t vld4q_u8(uint8_t const *ptr)` | `LD4 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x4_t vld4_u16(uint16_t const *ptr)` | `LD4 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x4_t vld4q_u16(uint16_t const *ptr)` | `LD4 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x4_t vld4_u32(uint32_t const *ptr)` | `LD4 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x4_t vld4q_u32(uint32_t const *ptr)` | `LD4 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x4_t vld4_f16(float16_t const *ptr)` | `LD4 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x4_t vld4q_f16(float16_t const *ptr)` | `LD4 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x4_t vld4_f32(float32_t const *ptr)` | `LD4 {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x4_t vld4q_f32(float32_t const *ptr)` | `LD4 {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x4_t vld4_p8(poly8_t const *ptr)` | `LD4 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x4_t vld4q_p8(poly8_t const *ptr)` | `LD4 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x4_t vld4_p16(poly16_t const *ptr)` | `LD4 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x4_t vld4q_p16(poly16_t const *ptr)` | `LD4 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x2x4_t vld4q_s64(int64_t const *ptr)` | `LD4 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x4_t vld4q_u64(uint64_t const *ptr)` | `LD4 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x4_t vld4q_p64(poly64_t const *ptr)` | `LD4 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x2x4_t vld4q_f64(float64_t const *ptr)` | `LD4 {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x4_t vld4_mf8(mfloat8_t const *ptr)` | `LD4 {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x4_t vld4q_mf8(mfloat8_t const *ptr)` | `LD4 {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int16x4x4_t vld4_lane_s16(int16_t const *ptr, int16x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x4_t vld4q_lane_s16(int16_t const *ptr, int16x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x4_t vld4_lane_s32(int32_t const *ptr, int32x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x4_t vld4q_lane_s32(int32_t const *ptr, int32x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint16x4x4_t vld4_lane_u16(uint16_t const *ptr, uint16x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x4_t vld4q_lane_u16(uint16_t const *ptr, uint16x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x4_t vld4_lane_u32(uint32_t const *ptr, uint32x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x4_t vld4q_lane_u32(uint32_t const *ptr, uint32x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x4_t vld4_lane_f16(float16_t const *ptr, float16x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x4_t vld4q_lane_f16(float16_t const *ptr, float16x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x4_t vld4_lane_f32(float32_t const *ptr, float32x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x4_t vld4q_lane_f32(float32_t const *ptr, float32x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.s - Vt4.s}[lane],[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly16x4x4_t vld4_lane_p16(poly16_t const *ptr, poly16x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x4_t vld4q_lane_p16(poly16_t const *ptr, poly16x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int8x8x4_t vld4_lane_s8(int8_t const *ptr, int8x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x8x4_t vld4_lane_u8(uint8_t const *ptr, uint8x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x8x4_t vld4_lane_p8(poly8_t const *ptr, poly8x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x4_t vld4q_lane_s8(int8_t const *ptr, int8x16x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `uint8x16x4_t vld4q_lane_u8(uint8_t const *ptr, uint8x16x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `poly8x16x4_t vld4q_lane_p8(poly8_t const *ptr, poly8x16x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `int64x1x4_t vld4_lane_s64(int64_t const *ptr, int64x1x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `int64x2x4_t vld4q_lane_s64(int64_t const *ptr, int64x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x1x4_t vld4_lane_u64(uint64_t const *ptr, uint64x1x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `uint64x2x4_t vld4q_lane_u64(uint64_t const *ptr, uint64x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x1x4_t vld4_lane_p64(poly64_t const *ptr, poly64x1x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `poly64x2x4_t vld4q_lane_p64(poly64_t const *ptr, poly64x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x4_t vld4_lane_f64(float64_t const *ptr, float64x1x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x4_t vld4q_lane_f64(float64_t const *ptr, float64x2x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.d - Vt4.d}[lane],[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x4_t vld4_lane_mf8(mfloat8_t const *ptr, mfloat8x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x4_t vld4q_lane_mf8(mfloat8_t const *ptr, mfloat8x16x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.b - Vt4.b}[lane],[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x4_t vld4_bf16(bfloat16_t const *ptr)` | `LD4 {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x4_t vld4q_bf16(bfloat16_t const *ptr)` | `LD4 {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |
| `bfloat16x4x4_t vld4_lane_bf16(bfloat16_t const *ptr, bfloat16x4x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x4_t vld4q_lane_bf16(bfloat16_t const *ptr, bfloat16x8x4_t src, __builtin_constant_p(lane))` | `LD4 {Vt.h - Vt4.h}[lane],[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LD4R

**Description:** Load single 4-element structure and Replicate to all lanes of four registers. This instruction loads a 4-element structure from memory and replicates the structure to all the lanes of the four SIMD&FP registers.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(128) rval;
bits(esize) element;
constant integer ebytes = esize DIV 8;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
if replicate then
    // load and replicate to all elements
    for s = 0 to selem-1
        element = Mem[address + offs, ebytes, AccType_VEC];
        // replicate to fill 128- or 64-bit register
        V[t] = Replicate(element, datasize DIV esize);
        offs = offs + ebytes;
        t = (t + 1) MOD 32;
else
    // load/store one element per register
    for s = 0 to selem-1
        rval = V[t];
        if memop == MemOp_LOAD then
            // insert into one lane of 128-bit register
            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];
            V[t] = rval;
        else // memop == MemOp_STORE
            // extract from one lane of 128-bit register
            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];
        offs = offs + ebytes;
        t = (t + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8x4_t vld4_dup_s8(int8_t const *ptr)` | `LD4R {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `int8x16x4_t vld4q_dup_s8(int8_t const *ptr)` | `LD4R {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `int16x4x4_t vld4_dup_s16(int16_t const *ptr)` | `LD4R {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `int16x8x4_t vld4q_dup_s16(int16_t const *ptr)` | `LD4R {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int32x2x4_t vld4_dup_s32(int32_t const *ptr)` | `LD4R {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `int32x4x4_t vld4q_dup_s32(int32_t const *ptr)` | `LD4R {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `uint8x8x4_t vld4_dup_u8(uint8_t const *ptr)` | `LD4R {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `uint8x16x4_t vld4q_dup_u8(uint8_t const *ptr)` | `LD4R {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `uint16x4x4_t vld4_dup_u16(uint16_t const *ptr)` | `LD4R {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `uint16x8x4_t vld4q_dup_u16(uint16_t const *ptr)` | `LD4R {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `uint32x2x4_t vld4_dup_u32(uint32_t const *ptr)` | `LD4R {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `uint32x4x4_t vld4q_dup_u32(uint32_t const *ptr)` | `LD4R {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `float16x4x4_t vld4_dup_f16(float16_t const *ptr)` | `LD4R {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `float16x8x4_t vld4q_dup_f16(float16_t const *ptr)` | `LD4R {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `float32x2x4_t vld4_dup_f32(float32_t const *ptr)` | `LD4R {Vt.2S - Vt4.2S},[Xn]` | `Vt4.2S -> result.val[3];Vt3.2S -> result.val[2];Vt2.2S -> result.val[1];Vt.2S -> result.val[0]` | v7/A32/A64 |
| `float32x4x4_t vld4q_dup_f32(float32_t const *ptr)` | `LD4R {Vt.4S - Vt4.4S},[Xn]` | `Vt4.4S -> result.val[3];Vt3.4S -> result.val[2];Vt2.4S -> result.val[1];Vt.4S -> result.val[0]` | v7/A32/A64 |
| `poly8x8x4_t vld4_dup_p8(poly8_t const *ptr)` | `LD4R {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | v7/A32/A64 |
| `poly8x16x4_t vld4q_dup_p8(poly8_t const *ptr)` | `LD4R {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | v7/A32/A64 |
| `poly16x4x4_t vld4_dup_p16(poly16_t const *ptr)` | `LD4R {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | v7/A32/A64 |
| `poly16x8x4_t vld4q_dup_p16(poly16_t const *ptr)` | `LD4R {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | v7/A32/A64 |
| `int64x1x4_t vld4_dup_s64(int64_t const *ptr)` | `LD4R {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `uint64x1x4_t vld4_dup_u64(uint64_t const *ptr)` | `LD4R {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | v7/A32/A64 |
| `poly64x1x4_t vld4_dup_p64(poly64_t const *ptr)` | `LD4R {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A32/A64 |
| `int64x2x4_t vld4q_dup_s64(int64_t const *ptr)` | `LD4R {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `uint64x2x4_t vld4q_dup_u64(uint64_t const *ptr)` | `LD4R {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `poly64x2x4_t vld4q_dup_p64(poly64_t const *ptr)` | `LD4R {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `float64x1x4_t vld4_dup_f64(float64_t const *ptr)` | `LD4R {Vt.1D - Vt4.1D},[Xn]` | `Vt4.1D -> result.val[3];Vt3.1D -> result.val[2];Vt2.1D -> result.val[1];Vt.1D -> result.val[0]` | A64 |
| `float64x2x4_t vld4q_dup_f64(float64_t const *ptr)` | `LD4R {Vt.2D - Vt4.2D},[Xn]` | `Vt4.2D -> result.val[3];Vt3.2D -> result.val[2];Vt2.2D -> result.val[1];Vt.2D -> result.val[0]` | A64 |
| `mfloat8x8x4_t vld4_dup_mf8(mfloat8_t const *ptr)` | `LD4R {Vt.8B - Vt4.8B},[Xn]` | `Vt4.8B -> result.val[3];Vt3.8B -> result.val[2];Vt2.8B -> result.val[1];Vt.8B -> result.val[0]` | A64 |
| `mfloat8x16x4_t vld4q_dup_mf8(mfloat8_t const *ptr)` | `LD4R {Vt.16B - Vt4.16B},[Xn]` | `Vt4.16B -> result.val[3];Vt3.16B -> result.val[2];Vt2.16B -> result.val[1];Vt.16B -> result.val[0]` | A64 |
| `bfloat16x4x4_t vld4_dup_bf16(bfloat16_t const *ptr)` | `LD4R {Vt.4H - Vt4.4H},[Xn]` | `Vt4.4H -> result.val[3];Vt3.4H -> result.val[2];Vt2.4H -> result.val[1];Vt.4H -> result.val[0]` | A32/A64 |
| `bfloat16x8x4_t vld4q_dup_bf16(bfloat16_t const *ptr)` | `LD4R {Vt.8H - Vt4.8H},[Xn]` | `Vt4.8H -> result.val[3];Vt3.8H -> result.val[2];Vt2.8H -> result.val[1];Vt.8H -> result.val[0]` | A32/A64 |

---

## LDAP1

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x1_t vldap1_lane_u64(uint64_t const *ptr, uint64x1_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A64 |
| `uint64x2_t vldap1q_lane_u64(uint64_t const *ptr, uint64x2_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A64 |
| `int64x1_t vldap1_lane_s64(int64_t const *ptr, int64x1_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A64 |
| `int64x2_t vldap1q_lane_s64(int64_t const *ptr, int64x2_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A64 |
| `float64x1_t vldap1_lane_f64(float64_t const *ptr, float64x1_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A64 |
| `float64x2_t vldap1q_lane_f64(float64_t const *ptr, float64x2_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A64 |
| `poly64x1_t vldap1_lane_p64(poly64_t const *ptr, poly64x1_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.1D -> result` | A64 |
| `poly64x2_t vldap1q_lane_p64(poly64_t const *ptr, poly64x2_t src, __builtin_constant_p(lane))` | `LDAP1 {Vt.D}[lane],[Xn]` | `Vt.2D -> result` | A64 |

---

## LDR

**Description:** Load SIMD&FP Register (immediate offset). This instruction loads an element from memory, and writes the result as a scalar to the SIMD&FP register. The address that is used for the load is calculated from a base register value, a signed immediate offset, and an optional offset that is a multiple of the element size.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();
bits(64) address;
bits(datasize) data;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

if ! postindex then
    address = address + offset;

case memop of
    when MemOp_STORE
        data = V[t];
        Mem[address, datasize DIV 8, acctype] = data;

    when MemOp_LOAD
        data = Mem[address, datasize DIV 8, acctype];
        V[t] = data;

if wback then
    if postindex then
        address = address + offset;
    if n == 31 then
        SP[] = address;
    else
        X[n] = address;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `poly128_t vldrq_p128(poly128_t const *ptr)` | `LDR Qd,[Xn]` | `Qd -> result` | A32/A64 |

---

## LUTI2

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vluti2_lane_u8(uint8x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint8x16_t vluti2_laneq_u8(uint8x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint8x16_t vluti2q_lane_u8(uint8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint8x16_t vluti2q_laneq_u8(uint8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti2_lane_s8(int8x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti2_laneq_s8(int8x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti2q_lane_s8(int8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti2q_laneq_s8(int8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti2_lane_p8(poly8x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti2_laneq_p8(poly8x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti2q_lane_p8(poly8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti2q_laneq_p8(poly8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti2_lane_mf8(mfloat8x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti2_laneq_mf8(mfloat8x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti2q_lane_mf8(mfloat8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti2q_laneq_mf8(mfloat8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint16x8_t vluti2_lane_u16(uint16x4_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `uint16x8_t vluti2_laneq_u16(uint16x4_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `uint16x8_t vluti2q_lane_u16(uint16x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `uint16x8_t vluti2q_laneq_u16(uint16x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti2_lane_s16(int16x4_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti2_laneq_s16(int16x4_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti2q_lane_s16(int16x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti2q_laneq_s16(int16x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti2_lane_f16(float16x4_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti2_laneq_f16(float16x4_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti2q_lane_f16(float16x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti2q_laneq_f16(float16x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti2_lane_bf16(bfloat16x4_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti2_laneq_bf16(bfloat16x4_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti2q_lane_bf16(bfloat16x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti2q_laneq_bf16(bfloat16x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti2_lane_p16(poly16x4_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti2_laneq_p16(poly16x4_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti2q_lane_p16(poly16x8_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti2q_laneq_p16(poly16x8_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI2 Vd.8H, {Vn.8H}, Vm[index]` | `Vd.8H -> result` | A64 |

---

## LUTI4

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vluti4q_lane_u8(uint8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint8x16_t vluti4q_laneq_u8(uint8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti4q_lane_s8(int8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `int8x16_t vluti4q_laneq_s8(int8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti4q_lane_p8(poly8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `poly8x16_t vluti4q_laneq_p8(poly8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti4q_lane_mf8(mfloat8x16_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `mfloat8x16_t vluti4q_laneq_mf8(mfloat8x16_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.16B, {Vn.16B}, Vm[index]` | `Vd.16B -> result` | A64 |
| `uint16x8_t vluti4q_lane_u16_x2(uint16x8x2_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `uint16x8_t vluti4q_laneq_u16_x2(uint16x8x2_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti4q_lane_s16_x2(int16x8x2_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `int16x8_t vluti4q_laneq_s16_x2(int16x8x2_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti4q_lane_f16_x2(float16x8x2_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `float16x8_t vluti4q_laneq_f16_x2(float16x8x2_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti4q_lane_bf16_x2(bfloat16x8x2_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vluti4q_laneq_bf16_x2(bfloat16x8x2_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti4q_lane_p16_x2(poly16x8x2_t vn, uint8x8_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |
| `poly16x8_t vluti4q_laneq_p16_x2(poly16x8x2_t vn, uint8x16_t vm, __builtin_constant_p(index))` | `LUTI4 Vd.8H, {Vn1.8H, Vn2.8H}, Vm[index]` | `Vd.8H -> result` | A64 |

---

## MLA

**Description:** Multiply-Add to accumulator (vector). This instruction multiplies corresponding elements in the vectors of the two source SIMD&FP registers, and accumulates the results with the vector elements of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
bits(esize) product;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    product = (UInt(element1) * UInt(element2))<esize-1:0>;
    if sub_op then
        Elem[result, e, esize] = Elem[operand3, e, esize] - product;
    else
        Elem[result, e, esize] = Elem[operand3, e, esize] + product;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmla_s8(int8x8_t a, int8x8_t b, int8x8_t c)` | `MLA Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmlaq_s8(int8x16_t a, int8x16_t b, int8x16_t c)` | `MLA Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmla_s16(int16x4_t a, int16x4_t b, int16x4_t c)` | `MLA Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlaq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `MLA Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmla_s32(int32x2_t a, int32x2_t b, int32x2_t c)` | `MLA Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlaq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `MLA Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vmla_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c)` | `MLA Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmlaq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `MLA Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmla_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c)` | `MLA Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlaq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `MLA Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmla_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c)` | `MLA Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlaq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `MLA Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmla_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `MLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlaq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `MLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmla_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `MLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlaq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `MLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmla_lane_u16(uint16x4_t a, uint16x4_t b, uint16x4_t v, __builtin_constant_p(lane))` | `MLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlaq_lane_u16(uint16x8_t a, uint16x8_t b, uint16x4_t v, __builtin_constant_p(lane))` | `MLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmla_lane_u32(uint32x2_t a, uint32x2_t b, uint32x2_t v, __builtin_constant_p(lane))` | `MLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlaq_lane_u32(uint32x4_t a, uint32x4_t b, uint32x2_t v, __builtin_constant_p(lane))` | `MLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmla_laneq_s16(int16x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `MLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vmlaq_laneq_s16(int16x8_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `MLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vmla_laneq_s32(int32x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `MLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vmlaq_laneq_s32(int32x4_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `MLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `uint16x4_t vmla_laneq_u16(uint16x4_t a, uint16x4_t b, uint16x8_t v, __builtin_constant_p(lane))` | `MLA Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vmlaq_laneq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t v, __builtin_constant_p(lane))` | `MLA Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vmla_laneq_u32(uint32x2_t a, uint32x2_t b, uint32x4_t v, __builtin_constant_p(lane))` | `MLA Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vmlaq_laneq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t v, __builtin_constant_p(lane))` | `MLA Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16x4_t vmla_n_s16(int16x4_t a, int16x4_t b, int16_t c)` | `MLA Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlaq_n_s16(int16x8_t a, int16x8_t b, int16_t c)` | `MLA Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmla_n_s32(int32x2_t a, int32x2_t b, int32_t c)` | `MLA Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlaq_n_s32(int32x4_t a, int32x4_t b, int32_t c)` | `MLA Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmla_n_u16(uint16x4_t a, uint16x4_t b, uint16_t c)` | `MLA Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlaq_n_u16(uint16x8_t a, uint16x8_t b, uint16_t c)` | `MLA Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmla_n_u32(uint32x2_t a, uint32x2_t b, uint32_t c)` | `MLA Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlaq_n_u32(uint32x4_t a, uint32x4_t b, uint32_t c)` | `MLA Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |

---

## MLS

**Description:** Multiply-Subtract from accumulator (vector). This instruction multiplies corresponding elements in the vectors of the two source SIMD&FP registers, and subtracts the results from the vector elements of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
bits(esize) product;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    product = (UInt(element1) * UInt(element2))<esize-1:0>;
    if sub_op then
        Elem[result, e, esize] = Elem[operand3, e, esize] - product;
    else
        Elem[result, e, esize] = Elem[operand3, e, esize] + product;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmls_s8(int8x8_t a, int8x8_t b, int8x8_t c)` | `MLS Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmlsq_s8(int8x16_t a, int8x16_t b, int8x16_t c)` | `MLS Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmls_s16(int16x4_t a, int16x4_t b, int16x4_t c)` | `MLS Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlsq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `MLS Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmls_s32(int32x2_t a, int32x2_t b, int32x2_t c)` | `MLS Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlsq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `MLS Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vmls_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c)` | `MLS Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmlsq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `MLS Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmls_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c)` | `MLS Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlsq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `MLS Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmls_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c)` | `MLS Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlsq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `MLS Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmls_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `MLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlsq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `MLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmls_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `MLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlsq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `MLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmls_lane_u16(uint16x4_t a, uint16x4_t b, uint16x4_t v, __builtin_constant_p(lane))` | `MLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlsq_lane_u16(uint16x8_t a, uint16x8_t b, uint16x4_t v, __builtin_constant_p(lane))` | `MLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmls_lane_u32(uint32x2_t a, uint32x2_t b, uint32x2_t v, __builtin_constant_p(lane))` | `MLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlsq_lane_u32(uint32x4_t a, uint32x4_t b, uint32x2_t v, __builtin_constant_p(lane))` | `MLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmls_laneq_s16(int16x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `MLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vmlsq_laneq_s16(int16x8_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `MLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vmls_laneq_s32(int32x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `MLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vmlsq_laneq_s32(int32x4_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `MLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `uint16x4_t vmls_laneq_u16(uint16x4_t a, uint16x4_t b, uint16x8_t v, __builtin_constant_p(lane))` | `MLS Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vmlsq_laneq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t v, __builtin_constant_p(lane))` | `MLS Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vmls_laneq_u32(uint32x2_t a, uint32x2_t b, uint32x4_t v, __builtin_constant_p(lane))` | `MLS Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vmlsq_laneq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t v, __builtin_constant_p(lane))` | `MLS Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16x4_t vmls_n_s16(int16x4_t a, int16x4_t b, int16_t c)` | `MLS Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmlsq_n_s16(int16x8_t a, int16x8_t b, int16_t c)` | `MLS Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmls_n_s32(int32x2_t a, int32x2_t b, int32_t c)` | `MLS Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmlsq_n_s32(int32x4_t a, int32x4_t b, int32_t c)` | `MLS Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmls_n_u16(uint16x4_t a, uint16x4_t b, uint16_t c)` | `MLS Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmlsq_n_u16(uint16x8_t a, uint16x8_t b, uint16_t c)` | `MLS Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmls_n_u32(uint32x2_t a, uint32x2_t b, uint32_t c)` | `MLS Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmlsq_n_u32(uint32x4_t a, uint32x4_t b, uint32_t c)` | `MLS Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |

---

## MOV

**Description:** Move vector element to another vector element

**Operation:**
```
No operation information.
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vset_lane_u8(uint8_t a, uint8x8_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vset_lane_u16(uint16_t a, uint16x4_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vset_lane_u32(uint32_t a, uint32x2_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.2S -> result` | v7/A32/A64 |
| `uint64x1_t vset_lane_u64(uint64_t a, uint64x1_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.1D -> result` | v7/A32/A64 |
| `poly64x1_t vset_lane_p64(poly64_t a, poly64x1_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.1D -> result` | A32/A64 |
| `int8x8_t vset_lane_s8(int8_t a, int8x8_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vset_lane_s16(int16_t a, int16x4_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vset_lane_s32(int32_t a, int32x2_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.2S -> result` | v7/A32/A64 |
| `int64x1_t vset_lane_s64(int64_t a, int64x1_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.1D -> result` | v7/A32/A64 |
| `poly8x8_t vset_lane_p8(poly8_t a, poly8x8_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vset_lane_p16(poly16_t a, poly16x4_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x4_t vset_lane_f16(float16_t a, float16x4_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Vn.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x8_t vsetq_lane_f16(float16_t a, float16x8_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Vn.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `float32x2_t vset_lane_f32(float32_t a, float32x2_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.2S -> result` | v7/A32/A64 |
| `float64x1_t vset_lane_f64(float64_t a, float64x1_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.1D -> result` | A64 |
| `mfloat8x8_t vset_lane_mf8(mfloat8_t a, mfloat8x8_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.8B -> result` | A64 |
| `uint8x16_t vsetq_lane_u8(uint8_t a, uint8x16_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vsetq_lane_u16(uint16_t a, uint16x8_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vsetq_lane_u32(uint32_t a, uint32x4_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vsetq_lane_u64(uint64_t a, uint64x2_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x2_t vsetq_lane_p64(poly64_t a, poly64x2_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.2D -> result` | A32/A64 |
| `int8x16_t vsetq_lane_s8(int8_t a, int8x16_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vsetq_lane_s16(int16_t a, int16x8_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vsetq_lane_s32(int32_t a, int32x4_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vsetq_lane_s64(int64_t a, int64x2_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.2D -> result` | v7/A32/A64 |
| `poly8x16_t vsetq_lane_p8(poly8_t a, poly8x16_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vsetq_lane_p16(poly16_t a, poly16x8_t v, __builtin_constant_p(lane))` | `MOV Vd.H[lane],Rn` | `Vd.8H -> result` | v7/A32/A64 |
| `float32x4_t vsetq_lane_f32(float32_t a, float32x4_t v, __builtin_constant_p(lane))` | `MOV Vd.S[lane],Rn` | `Vd.4S -> result` | v7/A32/A64 |
| `float64x2_t vsetq_lane_f64(float64_t a, float64x2_t v, __builtin_constant_p(lane))` | `MOV Vd.D[lane],Rn` | `Vd.2D -> result` | A64 |
| `mfloat8x16_t vsetq_lane_mf8(mfloat8_t a, mfloat8x16_t v, __builtin_constant_p(lane))` | `MOV Vd.B[lane],Rn` | `Vd.16B -> result` | A64 |

---

## MOVI

**Description:** Table vector lookup extension

**Operation:**
```
No operation information.
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vtbx1_s8(int8x8_t a, int8x8_t b, int8x8_t idx)` | `MOVI Vtmp.8B,#8;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbx1_u8(uint8x8_t a, uint8x8_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#8;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbx1_p8(poly8x8_t a, poly8x8_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#8;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B, Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbx1_mf8(mfloat8x8_t a, mfloat8x8_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#8;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B, Vtmp.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vtbx3_s8(int8x8_t a, int8x8x3_t b, int8x8_t idx)` | `MOVI Vtmp.8B,#24;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B,Vn+1.16B},Vm.8;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbx3_u8(uint8x8_t a, uint8x8x3_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#24;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B,Vn+1.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbx3_p8(poly8x8_t a, poly8x8x3_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#24;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B,Vn+1.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbx3_mf8(mfloat8x8_t a, mfloat8x8x3_t b, uint8x8_t idx)` | `MOVI Vtmp.8B,#24;CMHS Vtmp.8B,Vm.8B,Vtmp.8B;TBL Vtmp1.8B,{Vn.16B,Vn+1.16B},Vm.8B;BIF Vd.8B,Vtmp1.8B,Vtmp.8B` | `Vd.8B -> result` | A64 |

---

## MUL

**Description:** Multiply (vector). This instruction multiplies corresponding elements in the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
bits(esize) product;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if poly then
        product = PolynomialMult(element1, element2)<esize-1:0>;
    else
        product = (UInt(element1) * UInt(element2))<esize-1:0>;
    Elem[result, e, esize] = product;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmul_s8(int8x8_t a, int8x8_t b)` | `MUL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmulq_s8(int8x16_t a, int8x16_t b)` | `MUL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmul_s16(int16x4_t a, int16x4_t b)` | `MUL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmulq_s16(int16x8_t a, int16x8_t b)` | `MUL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmul_s32(int32x2_t a, int32x2_t b)` | `MUL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmulq_s32(int32x4_t a, int32x4_t b)` | `MUL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vmul_u8(uint8x8_t a, uint8x8_t b)` | `MUL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmulq_u8(uint8x16_t a, uint8x16_t b)` | `MUL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmul_u16(uint16x4_t a, uint16x4_t b)` | `MUL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmulq_u16(uint16x8_t a, uint16x8_t b)` | `MUL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmul_u32(uint32x2_t a, uint32x2_t b)` | `MUL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmulq_u32(uint32x4_t a, uint32x4_t b)` | `MUL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmul_n_s16(int16x4_t a, int16_t b)` | `MUL Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmulq_n_s16(int16x8_t a, int16_t b)` | `MUL Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmul_n_s32(int32x2_t a, int32_t b)` | `MUL Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmulq_n_s32(int32x4_t a, int32_t b)` | `MUL Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmul_n_u16(uint16x4_t a, uint16_t b)` | `MUL Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmulq_n_u16(uint16x8_t a, uint16_t b)` | `MUL Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmul_n_u32(uint32x2_t a, uint32_t b)` | `MUL Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmulq_n_u32(uint32x4_t a, uint32_t b)` | `MUL Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmul_lane_s16(int16x4_t a, int16x4_t v, __builtin_constant_p(lane))` | `MUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmulq_lane_s16(int16x8_t a, int16x4_t v, __builtin_constant_p(lane))` | `MUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmul_lane_s32(int32x2_t a, int32x2_t v, __builtin_constant_p(lane))` | `MUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmulq_lane_s32(int32x4_t a, int32x2_t v, __builtin_constant_p(lane))` | `MUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x4_t vmul_lane_u16(uint16x4_t a, uint16x4_t v, __builtin_constant_p(lane))` | `MUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmulq_lane_u16(uint16x8_t a, uint16x4_t v, __builtin_constant_p(lane))` | `MUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmul_lane_u32(uint32x2_t a, uint32x2_t v, __builtin_constant_p(lane))` | `MUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmulq_lane_u32(uint32x4_t a, uint32x2_t v, __builtin_constant_p(lane))` | `MUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vmul_laneq_s16(int16x4_t a, int16x8_t v, __builtin_constant_p(lane))` | `MUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vmulq_laneq_s16(int16x8_t a, int16x8_t v, __builtin_constant_p(lane))` | `MUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vmul_laneq_s32(int32x2_t a, int32x4_t v, __builtin_constant_p(lane))` | `MUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vmulq_laneq_s32(int32x4_t a, int32x4_t v, __builtin_constant_p(lane))` | `MUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `uint16x4_t vmul_laneq_u16(uint16x4_t a, uint16x8_t v, __builtin_constant_p(lane))` | `MUL Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `uint16x8_t vmulq_laneq_u16(uint16x8_t a, uint16x8_t v, __builtin_constant_p(lane))` | `MUL Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `uint32x2_t vmul_laneq_u32(uint32x2_t a, uint32x4_t v, __builtin_constant_p(lane))` | `MUL Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `uint32x4_t vmulq_laneq_u32(uint32x4_t a, uint32x4_t v, __builtin_constant_p(lane))` | `MUL Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |

---

## MVN

**Description:** Bitwise NOT (vector). This instruction reads each vector element from the source SIMD&FP register, places the inverse of each value into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
The description of NOT gives the operational pseudocode for this instruction.
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmvn_s8(int8x8_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmvnq_s8(int8x16_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmvn_s16(int16x4_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vmvnq_s16(int16x8_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vmvn_s32(int32x2_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vmvnq_s32(int32x4_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vmvn_u8(uint8x8_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmvnq_u8(uint8x16_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmvn_u16(uint16x4_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vmvnq_u16(uint16x8_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vmvn_u32(uint32x2_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vmvnq_u32(uint32x4_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly8x8_t vmvn_p8(poly8x8_t a)` | `MVN Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vmvnq_p8(poly8x16_t a)` | `MVN Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## NEG

**Description:** Negate (vector). This instruction reads each vector element from the source SIMD&FP register, negates each value, puts the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    if neg then
        element = -element;
    else
        element = Abs(element);
    Elem[result, e, esize] = element<esize-1:0>;                

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vneg_s8(int8x8_t a)` | `NEG Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vnegq_s8(int8x16_t a)` | `NEG Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vneg_s16(int16x4_t a)` | `NEG Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vnegq_s16(int16x8_t a)` | `NEG Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vneg_s32(int32x2_t a)` | `NEG Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vnegq_s32(int32x4_t a)` | `NEG Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vneg_s64(int64x1_t a)` | `NEG Dd,Dn` | `Dd -> result` | A64 |
| `int64_t vnegd_s64(int64_t a)` | `NEG Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vnegq_s64(int64x2_t a)` | `NEG Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |

---

## NOP

**Description:** Vector reinterpret cast operation

**Operation:**
```
No operation information.
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vreinterpret_s16_s8(int8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_s8(int8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_s8(int8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_s8(int8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_s8(int8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_s8(int8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_s8(int8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_s8(int8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_s8(int8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_s8(int8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_s8(int8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_s8(int8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_s8(int8x8_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_s8(int8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_s16(int16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_s16(int16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_s16(int16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_s16(int16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_s16(int16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_s16(int16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_s16(int16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_s16(int16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_s16(int16x4_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_s16(int16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_s16(int16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_s16(int16x4_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_s16(int16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_s16(int16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_s32(int32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_s32(int32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_s32(int32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_s32(int32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_s32(int32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_s32(int32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_s32(int32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_s32(int32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_s32(int32x2_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_s32(int32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_s32(int32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_s32(int32x2_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_s32(int32x2_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_s32(int32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_f32(float32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_f32(float32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_f32(float32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_f32(float32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_f32(float32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_f32(float32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_f32(float32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_f32(float32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_f32(float32x2_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_f32(float32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_f32(float32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_f32(float32x2_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_f32(float32x2_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `poly64x1_t vreinterpret_p64_f64(float64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `float16x4_t vreinterpret_f16_f32(float32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_u8(uint8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_u8(uint8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_u8(uint8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_u8(uint8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_u8(uint8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_u8(uint8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_u8(uint8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_u8(uint8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_u8(uint8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_u8(uint8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_u8(uint8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_u8(uint8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_u8(uint8x8_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_u8(uint8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_u16(uint16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_u16(uint16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_u16(uint16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_u16(uint16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_u16(uint16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_u16(uint16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_u16(uint16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_u16(uint16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_u16(uint16x4_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_u16(uint16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_u16(uint16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_u16(uint16x4_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_u16(uint16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_u16(uint16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_u32(uint32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_u32(uint32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_u32(uint32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_u32(uint32x2_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_u32(uint32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_u32(uint32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_u32(uint32x2_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_u32(uint32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_u32(uint32x2_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_u32(uint32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_u32(uint32x2_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_u32(uint32x2_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_u32(uint32x2_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_u32(uint32x2_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_p8(poly8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_p8(poly8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_p8(poly8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_p8(poly8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_p8(poly8x8_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_p8(poly8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_p8(poly8x8_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_p8(poly8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint64x1_t vreinterpret_u64_p8(poly8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_p8(poly8x8_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_p8(poly8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_p8(poly8x8_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_p8(poly8x8_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_mf8(mfloat8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `int16x4_t vreinterpret_s16_mf8(mfloat8x8_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `int32x2_t vreinterpret_s32_mf8(mfloat8x8_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `float32x2_t vreinterpret_f32_mf8(mfloat8x8_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `uint8x8_t vreinterpret_u8_mf8(mfloat8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint16x4_t vreinterpret_u16_mf8(mfloat8x8_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `uint32x2_t vreinterpret_u32_mf8(mfloat8x8_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `poly16x4_t vreinterpret_p16_mf8(mfloat8x8_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `uint64x1_t vreinterpret_u64_mf8(mfloat8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `int64x1_t vreinterpret_s64_mf8(mfloat8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `float64x1_t vreinterpret_f64_mf8(mfloat8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_mf8(mfloat8x8_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `float16x4_t vreinterpret_f16_mf8(mfloat8x8_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `int8x8_t vreinterpret_s8_p16(poly16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_p16(poly16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_p16(poly16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_p16(poly16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_p16(poly16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_p16(poly16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_p16(poly16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_p16(poly16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_p16(poly16x4_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_p16(poly16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_p16(poly16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_p16(poly16x4_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_p16(poly16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_p16(poly16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_u64(uint64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_u64(uint64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_u64(uint64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_u64(uint64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_u64(uint64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_u64(uint64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_u64(uint64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_u64(uint64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_u64(uint64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_u64(uint64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `int64x1_t vreinterpret_s64_u64(uint64x1_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_u64(uint64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_u64(uint64x1_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_u64(uint64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_s64(int64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_s64(int64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_s64(int64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_s64(int64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_s64(int64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_s64(int64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_s64(int64x1_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_s64(int64x1_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_s64(int64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_s64(int64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_s64(int64x1_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_s64(int64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `uint64x1_t vreinterpret_u64_p64(poly64x1_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float16x4_t vreinterpret_f16_s64(int64x1_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int8x8_t vreinterpret_s8_f16(float16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vreinterpret_s16_f16(float16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vreinterpret_s32_f16(float16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x2_t vreinterpret_f32_f16(float16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vreinterpret_u8_f16(float16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vreinterpret_u16_f16(float16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vreinterpret_u32_f16(float16x4_t a)` | `NOP` | `Vd.2S -> result` | v7/A32/A64 |
| `poly8x8_t vreinterpret_p8_f16(float16x4_t a)` | `NOP` | `Vd.8B -> result` | v7/A32/A64 |
| `poly16x4_t vreinterpret_p16_f16(float16x4_t a)` | `NOP` | `Vd.4H -> result` | v7/A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_f16(float16x4_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_f16(float16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x1_t vreinterpret_s64_f16(float16x4_t a)` | `NOP` | `Vd.1D -> result` | v7/A32/A64 |
| `float64x1_t vreinterpret_f64_f16(float16x4_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_f16(float16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `int16x8_t vreinterpretq_s16_s8(int8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_s8(int8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_s8(int8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_s8(int8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_s8(int8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_s8(int8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_s8(int8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_s8(int8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_s8(int8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_s8(int8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_s8(int8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_s8(int8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_s8(int8x16_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_s8(int8x16_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_s8(int8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_s16(int16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_s16(int16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_s16(int16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_s16(int16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_s16(int16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_s16(int16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_s16(int16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_s16(int16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_s16(int16x8_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_s16(int16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_s16(int16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_s16(int16x8_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_s16(int16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_s16(int16x8_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_s16(int16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_s32(int32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_s32(int32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_s32(int32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_s32(int32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_s32(int32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_s32(int32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_s32(int32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_s32(int32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_s32(int32x4_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_s32(int32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_s32(int32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_s32(int32x4_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_s32(int32x4_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_s32(int32x4_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_s32(int32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_f32(float32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_f32(float32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_f32(float32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_f32(float32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_f32(float32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_f32(float32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_f32(float32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_f32(float32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_f32(float32x4_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_f32(float32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_f32(float32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_f32(float32x4_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_f32(float32x4_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_f32(float32x4_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `poly64x2_t vreinterpretq_p64_f64(float64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly128_t vreinterpretq_p128_f64(float64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `float16x8_t vreinterpretq_f16_f32(float32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_u8(uint8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_u8(uint8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_u8(uint8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_u8(uint8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_u8(uint8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_u8(uint8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_u8(uint8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_u8(uint8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_u8(uint8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_u8(uint8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_u8(uint8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_u8(uint8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_u8(uint8x16_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_u8(uint8x16_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_u8(uint8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_u16(uint16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_u16(uint16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_u16(uint16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_u16(uint16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_u16(uint16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_u16(uint16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_u16(uint16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_u16(uint16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_u16(uint16x8_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_u16(uint16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_u16(uint16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_u16(uint16x8_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_u16(uint16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_u16(uint16x8_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_u16(uint16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_u32(uint32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_u32(uint32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_u32(uint32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_u32(uint32x4_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_u32(uint32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_u32(uint32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_u32(uint32x4_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_u32(uint32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_u32(uint32x4_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_u32(uint32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_u32(uint32x4_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_u32(uint32x4_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_u32(uint32x4_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_u32(uint32x4_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_u32(uint32x4_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_p8(poly8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_p8(poly8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_p8(poly8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_p8(poly8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_p8(poly8x16_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_p8(poly8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_p8(poly8x16_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_p8(poly8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint64x2_t vreinterpretq_u64_p8(poly8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_p8(poly8x16_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_p8(poly8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_p8(poly8x16_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_p8(poly8x16_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_p8(poly8x16_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_mf8(mfloat8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `int16x8_t vreinterpretq_s16_mf8(mfloat8x16_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `int32x4_t vreinterpretq_s32_mf8(mfloat8x16_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `float32x4_t vreinterpretq_f32_mf8(mfloat8x16_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `uint8x16_t vreinterpretq_u8_mf8(mfloat8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint16x8_t vreinterpretq_u16_mf8(mfloat8x16_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `uint32x4_t vreinterpretq_u32_mf8(mfloat8x16_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `poly16x8_t vreinterpretq_p16_mf8(mfloat8x16_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_mf8(mfloat8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `int64x2_t vreinterpretq_s64_mf8(mfloat8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `float64x2_t vreinterpretq_f64_mf8(mfloat8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_mf8(mfloat8x16_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly128_t vreinterpretq_p128_mf8(mfloat8x16_t a)` | `NOP` | `Vd.1Q -> result` | A64 |
| `float16x8_t vreinterpretq_f16_mf8(mfloat8x16_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `int8x16_t vreinterpretq_s8_p16(poly16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_p16(poly16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_p16(poly16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_p16(poly16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_p16(poly16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_p16(poly16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_p16(poly16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_p16(poly16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_p16(poly16x8_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_p16(poly16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_p16(poly16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_p16(poly16x8_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_p16(poly16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_p16(poly16x8_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_p16(poly16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_u64(uint64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_u64(uint64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_u64(uint64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_u64(uint64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_u64(uint64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_u64(uint64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_u64(uint64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_u64(uint64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_u64(uint64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_u64(uint64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `int64x2_t vreinterpretq_s64_u64(uint64x2_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_u64(uint64x2_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_s64(int64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_s64(int64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_s64(int64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly64x2_t vreinterpretq_p64_u64(uint64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_u64(uint64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_u64(uint64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_s64(int64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_s64(int64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_s64(int64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_s64(int64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_s64(int64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_s64(int64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_s64(int64x2_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_s64(int64x2_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_s64(int64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_s64(int64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_s64(int64x2_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64x2_t vreinterpretq_u64_p64(poly64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `float16x8_t vreinterpretq_f16_s64(int64x2_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int8x16_t vreinterpretq_s8_f16(float16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vreinterpretq_s16_f16(float16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vreinterpretq_s32_f16(float16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x4_t vreinterpretq_f32_f16(float16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vreinterpretq_u8_f16(float16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vreinterpretq_u16_f16(float16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vreinterpretq_u32_f16(float16x8_t a)` | `NOP` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x16_t vreinterpretq_p8_f16(float16x8_t a)` | `NOP` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x8_t vreinterpretq_p16_f16(float16x8_t a)` | `NOP` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_f16(float16x8_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_f16(float16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `int64x2_t vreinterpretq_s64_f16(float16x8_t a)` | `NOP` | `Vd.2D -> result` | v7/A32/A64 |
| `float64x2_t vreinterpretq_f64_f16(float16x8_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_f16(float16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_f16(float16x8_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |
| `int8x8_t vreinterpret_s8_f64(float64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `int16x4_t vreinterpret_s16_f64(float64x1_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `int32x2_t vreinterpret_s32_f64(float64x1_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `uint8x8_t vreinterpret_u8_f64(float64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint16x4_t vreinterpret_u16_f64(float64x1_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `uint32x2_t vreinterpret_u32_f64(float64x1_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `poly8x8_t vreinterpret_p8_f64(float64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `poly16x4_t vreinterpret_p16_f64(float64x1_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `mfloat8x8_t vreinterpret_mf8_f64(float64x1_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_f64(float64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `int64x1_t vreinterpret_s64_f64(float64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `float16x4_t vreinterpret_f16_f64(float64x1_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `float32x2_t vreinterpret_f32_f64(float64x1_t a)` | `NOP` | `Vd.2S -> result` | A64 |
| `int8x16_t vreinterpretq_s8_f64(float64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `int16x8_t vreinterpretq_s16_f64(float64x2_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `int32x4_t vreinterpretq_s32_f64(float64x2_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `uint8x16_t vreinterpretq_u8_f64(float64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint16x8_t vreinterpretq_u16_f64(float64x2_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `uint32x4_t vreinterpretq_u32_f64(float64x2_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `poly8x16_t vreinterpretq_p8_f64(float64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `poly16x8_t vreinterpretq_p16_f64(float64x2_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `mfloat8x16_t vreinterpretq_mf8_f64(float64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_f64(float64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `int64x2_t vreinterpretq_s64_f64(float64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `float16x8_t vreinterpretq_f16_f64(float64x2_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `float32x4_t vreinterpretq_f32_f64(float64x2_t a)` | `NOP` | `Vd.4S -> result` | A64 |
| `int8x8_t vreinterpret_s8_p64(poly64x1_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `int16x4_t vreinterpret_s16_p64(poly64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `int32x2_t vreinterpret_s32_p64(poly64x1_t a)` | `NOP` | `Vd.2S -> result` | A32/A64 |
| `uint8x8_t vreinterpret_u8_p64(poly64x1_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `uint16x4_t vreinterpret_u16_p64(poly64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `uint32x2_t vreinterpret_u32_p64(poly64x1_t a)` | `NOP` | `Vd.2S -> result` | A32/A64 |
| `poly8x8_t vreinterpret_p8_p64(poly64x1_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `poly16x4_t vreinterpret_p16_p64(poly64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_p64(poly64x1_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `int64x1_t vreinterpret_s64_p64(poly64x1_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float64x1_t vreinterpret_f64_p64(poly64x1_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `float16x4_t vreinterpret_f16_p64(poly64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `int8x16_t vreinterpretq_s8_p64(poly64x2_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `int16x8_t vreinterpretq_s16_p64(poly64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `int32x4_t vreinterpretq_s32_p64(poly64x2_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `uint8x16_t vreinterpretq_u8_p64(poly64x2_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `uint16x8_t vreinterpretq_u16_p64(poly64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `uint32x4_t vreinterpretq_u32_p64(poly64x2_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `poly8x16_t vreinterpretq_p8_p64(poly64x2_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `poly16x8_t vreinterpretq_p16_p64(poly64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_p64(poly64x2_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `int64x2_t vreinterpretq_s64_p64(poly64x2_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `float64x2_t vreinterpretq_f64_p64(poly64x2_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `float16x8_t vreinterpretq_f16_p64(poly64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `int8x16_t vreinterpretq_s8_p128(poly128_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `int16x8_t vreinterpretq_s16_p128(poly128_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `int32x4_t vreinterpretq_s32_p128(poly128_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `uint8x16_t vreinterpretq_u8_p128(poly128_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `uint16x8_t vreinterpretq_u16_p128(poly128_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `uint32x4_t vreinterpretq_u32_p128(poly128_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `poly8x16_t vreinterpretq_p8_p128(poly128_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `poly16x8_t vreinterpretq_p16_p128(poly128_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_p128(poly128_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_p128(poly128_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `int64x2_t vreinterpretq_s64_p128(poly128_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `float64x2_t vreinterpretq_f64_p128(poly128_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `float16x8_t vreinterpretq_f16_p128(poly128_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_u8(uint8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vreinterpretq_mf8_u8(uint8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint8x8_t vreinterpret_u8_mf8(mfloat8x8_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint8x16_t vreinterpretq_u8_mf8(mfloat8x16_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `bfloat16x4_t vreinterpret_bf16_s8(int8x8_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_s16(int16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_s32(int32x2_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_f32(float32x2_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_u8(uint8x8_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_u16(uint16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_u32(uint32x2_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_p8(poly8x8_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_p16(poly16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_mf8(mfloat8x8_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `bfloat16x4_t vreinterpret_bf16_u64(uint64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_s64(int64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_s8(int8x16_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_s16(int16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_s32(int32x4_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_f32(float32x4_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_u8(uint8x16_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_u16(uint16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_u32(uint32x4_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_p8(poly8x16_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_p16(poly16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_mf8(mfloat8x16_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `bfloat16x8_t vreinterpretq_bf16_u64(uint64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_s64(int64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x4_t vreinterpret_bf16_f64(float64x1_t a)` | `NOP` | `Vd.4H -> result` | A64 |
| `bfloat16x8_t vreinterpretq_bf16_f64(float64x2_t a)` | `NOP` | `Vd.8H -> result` | A64 |
| `bfloat16x4_t vreinterpret_bf16_p64(poly64x1_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_p64(poly64x2_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `bfloat16x8_t vreinterpretq_bf16_p128(poly128_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `int8x8_t vreinterpret_s8_bf16(bfloat16x4_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `int16x4_t vreinterpret_s16_bf16(bfloat16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `int32x2_t vreinterpret_s32_bf16(bfloat16x4_t a)` | `NOP` | `Vd.2S -> result` | A32/A64 |
| `float32x2_t vreinterpret_f32_bf16(bfloat16x4_t a)` | `NOP` | `Vd.2S -> result` | A32/A64 |
| `uint8x8_t vreinterpret_u8_bf16(bfloat16x4_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `uint16x4_t vreinterpret_u16_bf16(bfloat16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `uint32x2_t vreinterpret_u32_bf16(bfloat16x4_t a)` | `NOP` | `Vd.2S -> result` | A32/A64 |
| `poly8x8_t vreinterpret_p8_bf16(bfloat16x4_t a)` | `NOP` | `Vd.8B -> result` | A32/A64 |
| `poly16x4_t vreinterpret_p16_bf16(bfloat16x4_t a)` | `NOP` | `Vd.4H -> result` | A32/A64 |
| `mfloat8x8_t vreinterpret_mf8_bf16(bfloat16x4_t a)` | `NOP` | `Vd.8B -> result` | A64 |
| `uint64x1_t vreinterpret_u64_bf16(bfloat16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `int64x1_t vreinterpret_s64_bf16(bfloat16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `float64x1_t vreinterpret_f64_bf16(bfloat16x4_t a)` | `NOP` | `Vd.1D -> result` | A64 |
| `poly64x1_t vreinterpret_p64_bf16(bfloat16x4_t a)` | `NOP` | `Vd.1D -> result` | A32/A64 |
| `int8x16_t vreinterpretq_s8_bf16(bfloat16x8_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `int16x8_t vreinterpretq_s16_bf16(bfloat16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `int32x4_t vreinterpretq_s32_bf16(bfloat16x8_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vreinterpretq_f32_bf16(bfloat16x8_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `uint8x16_t vreinterpretq_u8_bf16(bfloat16x8_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `uint16x8_t vreinterpretq_u16_bf16(bfloat16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `uint32x4_t vreinterpretq_u32_bf16(bfloat16x8_t a)` | `NOP` | `Vd.4S -> result` | A32/A64 |
| `poly8x16_t vreinterpretq_p8_bf16(bfloat16x8_t a)` | `NOP` | `Vd.16B -> result` | A32/A64 |
| `poly16x8_t vreinterpretq_p16_bf16(bfloat16x8_t a)` | `NOP` | `Vd.8H -> result` | A32/A64 |
| `mfloat8x16_t vreinterpretq_mf8_bf16(bfloat16x8_t a)` | `NOP` | `Vd.16B -> result` | A64 |
| `uint64x2_t vreinterpretq_u64_bf16(bfloat16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `int64x2_t vreinterpretq_s64_bf16(bfloat16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `float64x2_t vreinterpretq_f64_bf16(bfloat16x8_t a)` | `NOP` | `Vd.2D -> result` | A64 |
| `poly64x2_t vreinterpretq_p64_bf16(bfloat16x8_t a)` | `NOP` | `Vd.2D -> result` | A32/A64 |
| `poly128_t vreinterpretq_p128_bf16(bfloat16x8_t a)` | `NOP` | `Vd.1Q -> result` | A32/A64 |

---

## ORN

**Description:** Bitwise inclusive OR NOT (vector). This instruction performs a bitwise OR NOT between the two source SIMD&FP registers, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

if invert then operand2 = NOT(operand2);

case op of
    when LogicalOp_AND
        result = operand1 AND operand2;
    when LogicalOp_ORR
        result = operand1 OR operand2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vorn_s8(int8x8_t a, int8x8_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vornq_s8(int8x16_t a, int8x16_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vorn_s16(int16x4_t a, int16x4_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vornq_s16(int16x8_t a, int16x8_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vorn_s32(int32x2_t a, int32x2_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vornq_s32(int32x4_t a, int32x4_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vorn_s64(int64x1_t a, int64x1_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t vornq_s64(int64x2_t a, int64x2_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vorn_u8(uint8x8_t a, uint8x8_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vornq_u8(uint8x16_t a, uint8x16_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vorn_u16(uint16x4_t a, uint16x4_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vornq_u16(uint16x8_t a, uint16x8_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vorn_u32(uint32x2_t a, uint32x2_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vornq_u32(uint32x4_t a, uint32x4_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vorn_u64(uint64x1_t a, uint64x1_t b)` | `ORN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vornq_u64(uint64x2_t a, uint64x2_t b)` | `ORN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## ORR

**Description:** Bitwise inclusive OR (vector, register). This instruction performs a bitwise OR between the two source SIMD&FP registers, and writes the result to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

if invert then operand2 = NOT(operand2);

case op of
    when LogicalOp_AND
        result = operand1 AND operand2;
    when LogicalOp_ORR
        result = operand1 OR operand2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vorr_s8(int8x8_t a, int8x8_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vorrq_s8(int8x16_t a, int8x16_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vorr_s16(int16x4_t a, int16x4_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x8_t vorrq_s16(int16x8_t a, int16x8_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int32x2_t vorr_s32(int32x2_t a, int32x2_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int32x4_t vorrq_s32(int32x4_t a, int32x4_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int64x1_t vorr_s64(int64x1_t a, int64x1_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int64x2_t vorrq_s64(int64x2_t a, int64x2_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vorr_u8(uint8x8_t a, uint8x8_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vorrq_u8(uint8x16_t a, uint8x16_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vorr_u16(uint16x4_t a, uint16x4_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x8_t vorrq_u16(uint16x8_t a, uint16x8_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint32x2_t vorr_u32(uint32x2_t a, uint32x2_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint32x4_t vorrq_u32(uint32x4_t a, uint32x4_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint64x1_t vorr_u64(uint64x1_t a, uint64x1_t b)` | `ORR Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint64x2_t vorrq_u64(uint64x2_t a, uint64x2_t b)` | `ORR Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## PMUL

**Description:** Polynomial Multiply. This instruction multiplies corresponding elements in the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;
bits(esize) product;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if poly then
        product = PolynomialMult(element1, element2)<esize-1:0>;
    else
        product = (UInt(element1) * UInt(element2))<esize-1:0>;
    Elem[result, e, esize] = product;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `poly8x8_t vmul_p8(poly8x8_t a, poly8x8_t b)` | `PMUL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vmulq_p8(poly8x16_t a, poly8x16_t b)` | `PMUL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |

---

## PMULL

**Description:** Polynomial Multiply Long. This instruction multiplies corresponding elements in the lower or upper half of the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, 2*esize] = PolynomialMult(element1, element2);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `poly16x8_t vmull_p8(poly8x8_t a, poly8x8_t b)` | `PMULL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `poly128_t vmull_p64(poly64_t a, poly64_t b)` | `PMULL Vd.1Q,Vn.1D,Vm.1D` | `Vd.1Q -> result` | A32/A64 |

---

## PMULL2

**Description:** Polynomial Multiply Long. This instruction multiplies corresponding elements in the lower or upper half of the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    Elem[result, e, 2*esize] = PolynomialMult(element1, element2);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `poly16x8_t vmull_high_p8(poly8x16_t a, poly8x16_t b)` | `PMULL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `poly128_t vmull_high_p64(poly64x2_t a, poly64x2_t b)` | `PMULL2 Vd.1Q,Vn.2D,Vm.2D` | `Vd.1Q -> result` | A32/A64 |

---

## RADDHN

**Description:** Rounding Add returning High Narrow. This instruction adds each vector element in the first source SIMD&FP register to the corresponding vector element in the second source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vraddhn_s16(int16x8_t a, int16x8_t b)` | `RADDHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vraddhn_s32(int32x4_t a, int32x4_t b)` | `RADDHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vraddhn_s64(int64x2_t a, int64x2_t b)` | `RADDHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vraddhn_u16(uint16x8_t a, uint16x8_t b)` | `RADDHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vraddhn_u32(uint32x4_t a, uint32x4_t b)` | `RADDHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vraddhn_u64(uint64x2_t a, uint64x2_t b)` | `RADDHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |

---

## RADDHN2

**Description:** Rounding Add returning High Narrow. This instruction adds each vector element in the first source SIMD&FP register to the corresponding vector element in the second source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vraddhn_high_s16(int8x8_t r, int16x8_t a, int16x8_t b)` | `RADDHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `int16x8_t vraddhn_high_s32(int16x4_t r, int32x4_t a, int32x4_t b)` | `RADDHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `int32x4_t vraddhn_high_s64(int32x2_t r, int64x2_t a, int64x2_t b)` | `RADDHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |
| `uint8x16_t vraddhn_high_u16(uint8x8_t r, uint16x8_t a, uint16x8_t b)` | `RADDHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vraddhn_high_u32(uint16x4_t r, uint32x4_t a, uint32x4_t b)` | `RADDHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vraddhn_high_u64(uint32x2_t r, uint64x2_t a, uint64x2_t b)` | `RADDHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |

---

## RAX1

**Description:** Rotate and Exclusive OR rotates each 64-bit element of the 128-bit vector in a source SIMD&FP register left by 1, performs a bitwise exclusive OR of the resulting 128-bit vector and the vector in another source SIMD&FP register, and writes the result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
V[d] = Vn EOR (ROL(Vm<127:64>,1):ROL(Vm<63:0>, 1));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vrax1q_u64(uint64x2_t a, uint64x2_t b)` | `RAX1 Vd.2D, Vn.2D, Vm.2D` | `Vd.2D -> result` | A64 |

---

## RBIT

**Description:** Reverse Bit order (vector). This instruction reads each vector element from the source SIMD&FP register, reverses the bits of the element, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(esize) element;
bits(esize) rev;

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    for i = 0 to esize-1
        rev<esize-1-i> = element<i>;
    Elem[result, e, esize] = rev;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrbit_s8(int8x8_t a)` | `RBIT Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vrbitq_s8(int8x16_t a)` | `RBIT Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vrbit_u8(uint8x8_t a)` | `RBIT Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vrbitq_u8(uint8x16_t a)` | `RBIT Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vrbit_p8(poly8x8_t a)` | `RBIT Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vrbitq_p8(poly8x16_t a)` | `RBIT Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |

---

## REV16

**Description:** Reverse elements in 16-bit halfwords (vector). This instruction reverses the order of 8-bit elements in each halfword of the vector in the source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element = 0;
integer rev_element;
for c = 0 to containers-1
    rev_element = element + elements_per_container - 1;
    for e = 0 to elements_per_container-1
        Elem[result, rev_element, esize] = Elem[operand, element, esize];
        element = element + 1;
        rev_element = rev_element - 1;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrev16_s8(int8x8_t vec)` | `REV16 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrev16q_s8(int8x16_t vec)` | `REV16 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint8x8_t vrev16_u8(uint8x8_t vec)` | `REV16 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrev16q_u8(uint8x16_t vec)` | `REV16 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly8x8_t vrev16_p8(poly8x8_t vec)` | `REV16 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vrev16q_p8(poly8x16_t vec)` | `REV16 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `mfloat8x8_t vrev16_mf8(mfloat8x8_t vec)` | `REV16 Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vrev16q_mf8(mfloat8x16_t vec)` | `REV16 Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |

---

## REV32

**Description:** Reverse elements in 32-bit words (vector). This instruction reverses the order of 8-bit or 16-bit elements in each word of the vector in the source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element = 0;
integer rev_element;
for c = 0 to containers-1
    rev_element = element + elements_per_container - 1;
    for e = 0 to elements_per_container-1
        Elem[result, rev_element, esize] = Elem[operand, element, esize];
        element = element + 1;
        rev_element = rev_element - 1;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrev32_s8(int8x8_t vec)` | `REV32 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrev32q_s8(int8x16_t vec)` | `REV32 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrev32_s16(int16x4_t vec)` | `REV32 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrev32q_s16(int16x8_t vec)` | `REV32 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint8x8_t vrev32_u8(uint8x8_t vec)` | `REV32 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrev32q_u8(uint8x16_t vec)` | `REV32 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrev32_u16(uint16x4_t vec)` | `REV32 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrev32q_u16(uint16x8_t vec)` | `REV32 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `poly8x8_t vrev32_p8(poly8x8_t vec)` | `REV32 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vrev32q_p8(poly8x16_t vec)` | `REV32 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vrev32_p16(poly16x4_t vec)` | `REV32 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vrev32q_p16(poly16x8_t vec)` | `REV32 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x8_t vrev32_mf8(mfloat8x8_t vec)` | `REV32 Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vrev32q_mf8(mfloat8x16_t vec)` | `REV32 Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |

---

## REV64

**Description:** Reverse elements in 64-bit doublewords (vector). This instruction reverses the order of 8-bit, 16-bit, or 32-bit elements in each doubleword of the vector in the source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element = 0;
integer rev_element;
for c = 0 to containers-1
    rev_element = element + elements_per_container - 1;
    for e = 0 to elements_per_container-1
        Elem[result, rev_element, esize] = Elem[operand, element, esize];
        element = element + 1;
        rev_element = rev_element - 1;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrev64_s8(int8x8_t vec)` | `REV64 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrev64q_s8(int8x16_t vec)` | `REV64 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrev64_s16(int16x4_t vec)` | `REV64 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrev64q_s16(int16x8_t vec)` | `REV64 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vrev64_s32(int32x2_t vec)` | `REV64 Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vrev64q_s32(int32x4_t vec)` | `REV64 Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x8_t vrev64_u8(uint8x8_t vec)` | `REV64 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrev64q_u8(uint8x16_t vec)` | `REV64 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrev64_u16(uint16x4_t vec)` | `REV64 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrev64q_u16(uint16x8_t vec)` | `REV64 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vrev64_u32(uint32x2_t vec)` | `REV64 Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrev64q_u32(uint32x4_t vec)` | `REV64 Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float32x2_t vrev64_f32(float32x2_t vec)` | `REV64 Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vrev64q_f32(float32x4_t vec)` | `REV64 Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `poly8x8_t vrev64_p8(poly8x8_t vec)` | `REV64 Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vrev64q_p8(poly8x16_t vec)` | `REV64 Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vrev64_p16(poly16x4_t vec)` | `REV64 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vrev64q_p16(poly16x8_t vec)` | `REV64 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `mfloat8x8_t vrev64_mf8(mfloat8x8_t vec)` | `REV64 Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vrev64q_mf8(mfloat8x16_t vec)` | `REV64 Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |
| `float16x4_t vrev64_f16(float16x4_t vec)` | `REV64 Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `float16x8_t vrev64q_f16(float16x8_t vec)` | `REV64 Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |

---

## RSHRN

**Description:** Rounding Shift Right Narrow (immediate). This instruction reads each unsigned integer value from the vector in the source SIMD&FP register, right shifts each result by an immediate value, writes the final result to a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The results are rounded. For truncated results, see SHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

for e = 0 to elements-1
    element = (UInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    Elem[result, e, esize] = element<esize-1:0>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrshrn_n_s16(int16x8_t a, __builtin_constant_p(n))` | `RSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vrshrn_n_s32(int32x4_t a, __builtin_constant_p(n))` | `RSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vrshrn_n_s64(int64x2_t a, __builtin_constant_p(n))` | `RSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vrshrn_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `RSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vrshrn_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `RSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vrshrn_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `RSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |

---

## RSHRN2

**Description:** Rounding Shift Right Narrow (immediate). This instruction reads each unsigned integer value from the vector in the source SIMD&FP register, right shifts each result by an immediate value, writes the final result to a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The results are rounded. For truncated results, see SHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

for e = 0 to elements-1
    element = (UInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    Elem[result, e, esize] = element<esize-1:0>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vrshrn_high_n_s16(int8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `int16x8_t vrshrn_high_n_s32(int16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vrshrn_high_n_s64(int32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |
| `uint8x16_t vrshrn_high_n_u16(uint8x8_t r, uint16x8_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vrshrn_high_n_u32(uint16x4_t r, uint32x4_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vrshrn_high_n_u64(uint32x2_t r, uint64x2_t a, __builtin_constant_p(n))` | `RSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## RSUBHN

**Description:** Rounding Subtract returning High Narrow. This instruction subtracts each vector element of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrsubhn_s16(int16x8_t a, int16x8_t b)` | `RSUBHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vrsubhn_s32(int32x4_t a, int32x4_t b)` | `RSUBHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vrsubhn_s64(int64x2_t a, int64x2_t b)` | `RSUBHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vrsubhn_u16(uint16x8_t a, uint16x8_t b)` | `RSUBHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vrsubhn_u32(uint32x4_t a, uint32x4_t b)` | `RSUBHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vrsubhn_u64(uint64x2_t a, uint64x2_t b)` | `RSUBHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |

---

## RSUBHN2

**Description:** Rounding Subtract returning High Narrow. This instruction subtracts each vector element of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vrsubhn_high_s16(int8x8_t r, int16x8_t a, int16x8_t b)` | `RSUBHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `int16x8_t vrsubhn_high_s32(int16x4_t r, int32x4_t a, int32x4_t b)` | `RSUBHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `int32x4_t vrsubhn_high_s64(int32x2_t r, int64x2_t a, int64x2_t b)` | `RSUBHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |
| `uint8x16_t vrsubhn_high_u16(uint8x8_t r, uint16x8_t a, uint16x8_t b)` | `RSUBHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vrsubhn_high_u32(uint16x4_t r, uint32x4_t a, uint32x4_t b)` | `RSUBHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vrsubhn_high_u64(uint32x2_t r, uint64x2_t a, uint64x2_t b)` | `RSUBHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |

---

## SABA

**Description:** Signed Absolute difference and Accumulate. This instruction subtracts the elements of the vector of the second source SIMD&FP register from the corresponding elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the elements of the vector of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
bits(esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<esize-1:0>;
    Elem[result, e, esize] = Elem[result, e, esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vaba_s8(int8x8_t a, int8x8_t b, int8x8_t c)` | `SABA Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vabaq_s8(int8x16_t a, int8x16_t b, int8x16_t c)` | `SABA Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vaba_s16(int16x4_t a, int16x4_t b, int16x4_t c)` | `SABA Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vabaq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `SABA Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vaba_s32(int32x2_t a, int32x2_t b, int32x2_t c)` | `SABA Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vabaq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `SABA Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SABAL

**Description:** Signed Absolute difference and Accumulate Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vabal_s8(int16x8_t a, int8x8_t b, int8x8_t c)` | `SABAL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vabal_s16(int32x4_t a, int16x4_t b, int16x4_t c)` | `SABAL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vabal_s32(int64x2_t a, int32x2_t b, int32x2_t c)` | `SABAL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SABAL2

**Description:** Signed Absolute difference and Accumulate Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vabal_high_s8(int16x8_t a, int8x16_t b, int8x16_t c)` | `SABAL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vabal_high_s16(int32x4_t a, int16x8_t b, int16x8_t c)` | `SABAL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vabal_high_s32(int64x2_t a, int32x4_t b, int32x4_t c)` | `SABAL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## SABD

**Description:** Signed Absolute Difference. This instruction subtracts the elements of the vector of the second source SIMD&FP register from the corresponding elements of the first source SIMD&FP register, places the the absolute values of the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
bits(esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<esize-1:0>;
    Elem[result, e, esize] = Elem[result, e, esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vabd_s8(int8x8_t a, int8x8_t b)` | `SABD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vabdq_s8(int8x16_t a, int8x16_t b)` | `SABD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vabd_s16(int16x4_t a, int16x4_t b)` | `SABD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vabdq_s16(int16x8_t a, int16x8_t b)` | `SABD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vabd_s32(int32x2_t a, int32x2_t b)` | `SABD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vabdq_s32(int32x4_t a, int32x4_t b)` | `SABD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SABDL

**Description:** Signed Absolute Difference Long. This instruction subtracts the vector elements of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, places the absolute value of the results into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vabdl_s8(int8x8_t a, int8x8_t b)` | `SABDL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vabdl_s16(int16x4_t a, int16x4_t b)` | `SABDL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vabdl_s32(int32x2_t a, int32x2_t b)` | `SABDL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SABDL2

**Description:** Signed Absolute Difference Long. This instruction subtracts the vector elements of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, places the absolute value of the results into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vabdl_high_s8(int8x16_t a, int8x16_t b)` | `SABDL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vabdl_high_s16(int16x8_t a, int16x8_t b)` | `SABDL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vabdl_high_s32(int32x4_t a, int32x4_t b)` | `SABDL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## SADALP

**Description:** Signed Add and Accumulate Long Pairwise. This instruction adds pairs of adjacent signed integer values from the vector in the source SIMD&FP register and accumulates the results into the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(2*esize) sum;
integer op1;
integer op2;

if acc then result = V[d];
for e = 0 to elements-1
    op1 = Int(Elem[operand, 2*e+0, esize], unsigned);
    op2 = Int(Elem[operand, 2*e+1, esize], unsigned);
    sum = (op1 + op2)<2*esize-1:0>;
    if acc then
        Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + sum;
    else
        Elem[result, e, 2*esize] = sum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vpadal_s8(int16x4_t a, int8x8_t b)` | `SADALP Vd.4H,Vn.8B` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vpadalq_s8(int16x8_t a, int8x16_t b)` | `SADALP Vd.8H,Vn.16B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vpadal_s16(int32x2_t a, int16x4_t b)` | `SADALP Vd.2S,Vn.4H` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vpadalq_s16(int32x4_t a, int16x8_t b)` | `SADALP Vd.4S,Vn.8H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vpadal_s32(int64x1_t a, int32x2_t b)` | `SADALP Vd.1D,Vn.2S` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x2_t vpadalq_s32(int64x2_t a, int32x4_t b)` | `SADALP Vd.2D,Vn.4S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SADDL

**Description:** Signed Add Long (vector). This instruction adds each vector element in the lower or upper half of the first source SIMD&FP register to the corresponding vector element of the second source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vaddl_s8(int8x8_t a, int8x8_t b)` | `SADDL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vaddl_s16(int16x4_t a, int16x4_t b)` | `SADDL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vaddl_s32(int32x2_t a, int32x2_t b)` | `SADDL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SADDL2

**Description:** Signed Add Long (vector). This instruction adds each vector element in the lower or upper half of the first source SIMD&FP register to the corresponding vector element of the second source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vaddl_high_s8(int8x16_t a, int8x16_t b)` | `SADDL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vaddl_high_s16(int16x8_t a, int16x8_t b)` | `SADDL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vaddl_high_s32(int32x4_t a, int32x4_t b)` | `SADDL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## SADDLP

**Description:** Signed Add Long Pairwise. This instruction adds pairs of adjacent signed integer values from the vector in the source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(2*esize) sum;
integer op1;
integer op2;

if acc then result = V[d];
for e = 0 to elements-1
    op1 = Int(Elem[operand, 2*e+0, esize], unsigned);
    op2 = Int(Elem[operand, 2*e+1, esize], unsigned);
    sum = (op1 + op2)<2*esize-1:0>;
    if acc then
        Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + sum;
    else
        Elem[result, e, 2*esize] = sum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vpaddl_s8(int8x8_t a)` | `SADDLP Vd.4H,Vn.8B` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vpaddlq_s8(int8x16_t a)` | `SADDLP Vd.8H,Vn.16B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vpaddl_s16(int16x4_t a)` | `SADDLP Vd.2S,Vn.4H` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vpaddlq_s16(int16x8_t a)` | `SADDLP Vd.4S,Vn.8H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vpaddl_s32(int32x2_t a)` | `SADDLP Vd.1D,Vn.2S` | `Vd.1D -> result` | v7/A32/A64 |
| `int64x2_t vpaddlq_s32(int32x4_t a)` | `SADDLP Vd.2D,Vn.4S` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vaddlv_s32(int32x2_t a)` | `SADDLP Vd.1D,Vn.2S` | `Dd -> result` | A64 |

---

## SADDLV

**Description:** Signed Add Long across Vector. This instruction adds every vector element in the source SIMD&FP register together, and writes the scalar result to the destination SIMD&FP register. The destination scalar is twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer sum;

sum = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    sum = sum + Int(Elem[operand, e, esize], unsigned);

V[d] = sum<2*esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16_t vaddlv_s8(int8x8_t a)` | `SADDLV Hd,Vn.8B` | `Hd -> result` | A64 |
| `int16_t vaddlvq_s8(int8x16_t a)` | `SADDLV Hd,Vn.16B` | `Hd -> result` | A64 |
| `int32_t vaddlv_s16(int16x4_t a)` | `SADDLV Sd,Vn.4H` | `Sd -> result` | A64 |
| `int32_t vaddlvq_s16(int16x8_t a)` | `SADDLV Sd,Vn.8H` | `Sd -> result` | A64 |
| `int64_t vaddlvq_s32(int32x4_t a)` | `SADDLV Dd,Vn.4S` | `Dd -> result` | A64 |

---

## SADDW

**Description:** Signed Add Wide. This instruction adds vector elements of the first source SIMD&FP register to the corresponding vector elements in the lower or upper half of the second source SIMD&FP register, places the results in a vector, and writes the vector to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vaddw_s8(int16x8_t a, int8x8_t b)` | `SADDW Vd.8H,Vn.8H,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vaddw_s16(int32x4_t a, int16x4_t b)` | `SADDW Vd.4S,Vn.4S,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vaddw_s32(int64x2_t a, int32x2_t b)` | `SADDW Vd.2D,Vn.2D,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SADDW2

**Description:** Signed Add Wide. This instruction adds vector elements of the first source SIMD&FP register to the corresponding vector elements in the lower or upper half of the second source SIMD&FP register, places the results in a vector, and writes the vector to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vaddw_high_s8(int16x8_t a, int8x16_t b)` | `SADDW2 Vd.8H,Vn.8H,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vaddw_high_s16(int32x4_t a, int16x8_t b)` | `SADDW2 Vd.4S,Vn.4S,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vaddw_high_s32(int64x2_t a, int32x4_t b)` | `SADDW2 Vd.2D,Vn.2D,Vm.4S` | `Vd.2D -> result` | A64 |

---

## SCVTF

**Description:** Signed fixed-point Convert to Floating-point (vector). This instruction converts each element in a vector from fixed-point to floating-point using the rounding mode that is specified by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FixedToFP(element, fracbits, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vcvt_f32_s32(int32x2_t a)` | `SCVTF Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vcvtq_f32_s32(int32x4_t a)` | `SCVTF Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float32_t vcvts_f32_s32(int32_t a)` | `SCVTF Sd,Sn` | `Sd -> result` | A64 |
| `float64x1_t vcvt_f64_s64(int64x1_t a)` | `SCVTF Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vcvtq_f64_s64(int64x2_t a)` | `SCVTF Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float64_t vcvtd_f64_s64(int64_t a)` | `SCVTF Dd,Dn` | `Dd -> result` | A64 |
| `float32x2_t vcvt_n_f32_s32(int32x2_t a, __builtin_constant_p(n))` | `SCVTF Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vcvtq_n_f32_s32(int32x4_t a, __builtin_constant_p(n))` | `SCVTF Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `float32_t vcvts_n_f32_s32(int32_t a, __builtin_constant_p(n))` | `SCVTF Sd,Sn,#n` | `Sd -> result` | A64 |
| `float64x1_t vcvt_n_f64_s64(int64x1_t a, __builtin_constant_p(n))` | `SCVTF Dd,Dn,#n` | `Dd -> result` | A64 |
| `float64x2_t vcvtq_n_f64_s64(int64x2_t a, __builtin_constant_p(n))` | `SCVTF Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A64 |
| `float64_t vcvtd_n_f64_s64(int64_t a, __builtin_constant_p(n))` | `SCVTF Dd,Dn,#n` | `Dd -> result` | A64 |
| `float16_t vcvth_f16_s16(int16_t a)` | `SCVTF Hd,Hn` | `Hd -> result` | A64 |
| `float16_t vcvth_f16_s32(int32_t a)` | `SCVTF Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16_t vcvth_f16_s64(int64_t a)` | `SCVTF Hd,Hn` | `Hd -> result` | A64 |
| `float16_t vcvth_n_f16_s16(int16_t a, __builtin_constant_p(n))` | `SCVTF Hd,Hn,#n` | `Hd -> result` | A64 |
| `float16_t vcvth_n_f16_s32(int32_t a, __builtin_constant_p(n))` | `SCVTF Hd,Hn,#n` | `Hd -> result` | A32/A64 |
| `float16_t vcvth_n_f16_s64(int64_t a, __builtin_constant_p(n))` | `SCVTF Hd,Hn,#n` | `Hd -> result` | A64 |
| `float16x4_t vcvt_f16_s16(int16x4_t a)` | `SCVTF Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcvtq_f16_s16(int16x8_t a)` | `SCVTF Vd.8H,Vn.8H,#0` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vcvt_n_f16_s16(int16x4_t a, __builtin_constant_p(n))` | `SCVTF Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcvtq_n_f16_s16(int16x8_t a, __builtin_constant_p(n))` | `SCVTF Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | A32/A64 |

---

## SDOT

**Description:** Dot Product signed arithmetic (vector). This instruction performs the dot product of the four signed 8-bit elements in each 32-bit element of the first source register with the four signed 8-bit elements of the corresponding 32-bit element in the second source register, accumulating the result into the corresponding 32-bit element of the destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

result = V[d];
for e = 0 to elements-1 
    integer res = 0;
    integer element1, element2;
    for i = 0 to 3 
        if signed then
            element1 = SInt(Elem[operand1, 4 * e + i, esize DIV 4]); 
            element2 = SInt(Elem[operand2, 4 * e + i, esize DIV 4]);
        else 
            element1 = UInt(Elem[operand1, 4 * e + i, esize DIV 4]); 
            element2 = UInt(Elem[operand2, 4 * e + i, esize DIV 4]);
        res = res + element1 * element2; 
    Elem[result, e, esize] = Elem[result, e, esize] + res;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vdot_s32(int32x2_t r, int8x8_t a, int8x8_t b)` | `SDOT Vd.2S,Vn.8B,Vm.8B` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vdotq_s32(int32x4_t r, int8x16_t a, int8x16_t b)` | `SDOT Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |
| `int32x2_t vdot_lane_s32(int32x2_t r, int8x8_t a, int8x8_t b, __builtin_constant_p(lane))` | `SDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vdotq_laneq_s32(int32x4_t r, int8x16_t a, int8x16_t b, __builtin_constant_p(lane))` | `SDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |
| `int32x2_t vdot_laneq_s32(int32x2_t r, int8x8_t a, int8x16_t b, __builtin_constant_p(lane))` | `SDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vdotq_lane_s32(int32x4_t r, int8x16_t a, int8x8_t b, __builtin_constant_p(lane))` | `SDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |

---

## SHA1C

**Description:** SHA1 hash update (choose).

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) X = V[d];
bits(32)  Y = V[n];     // Note: 32 not 128 bits wide
bits(128) W = V[m];
bits(32)  t;

for e = 0 to 3
    t = SHAchoose(X<63:32>, X<95:64>, X<127:96>);
    Y = Y + ROL(X<31:0>, 5) + t + Elem[W, e, 32];
    X<63:32> = ROL(X<63:32>, 30);
    <Y, X> = ROL(Y : X, 32);
V[d] = X;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha1cq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk)` | `SHA1C Qd,Sn,Vm.4S` | `Qd -> result` | A32/A64 |

---

## SHA1H

**Description:** SHA1 fixed rotate.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(32) operand = V[n];        // read element [0] only,  [1-3] zeroed
V[d] = ROL(operand, 30);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32_t vsha1h_u32(uint32_t hash_e)` | `SHA1H Sd,Sn` | `Sd -> result` | A32/A64 |

---

## SHA1M

**Description:** SHA1 hash update (majority).

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) X = V[d];
bits(32)  Y = V[n];     // Note: 32 not 128 bits wide
bits(128) W = V[m];
bits(32)  t;

for e = 0 to 3
    t = SHAmajority(X<63:32>, X<95:64>, X<127:96>);
    Y = Y + ROL(X<31:0>, 5) + t + Elem[W, e, 32];
    X<63:32> = ROL(X<63:32>, 30);
    <Y, X> = ROL(Y : X, 32);
V[d] = X;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha1mq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk)` | `SHA1M Qd,Sn,Vm.4S` | `Qd -> result` | A32/A64 |

---

## SHA1P

**Description:** SHA1 hash update (parity).

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) X = V[d];
bits(32)  Y = V[n];     // Note: 32 not 128 bits wide
bits(128) W = V[m];
bits(32)  t;

for e = 0 to 3
    t = SHAparity(X<63:32>, X<95:64>, X<127:96>);
    Y = Y + ROL(X<31:0>, 5) + t + Elem[W, e, 32];
    X<63:32> = ROL(X<63:32>, 30);
    <Y, X> = ROL(Y : X, 32);
V[d] = X;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha1pq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk)` | `SHA1P Qd,Sn,Vm.4S` | `Qd -> result` | A32/A64 |

---

## SHA1SU0

**Description:** SHA1 schedule update 0.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) operand3 = V[m];
bits(128) result;

result = operand2<63:0> : operand1<127:64>;
result = result EOR operand1 EOR operand3;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha1su0q_u32(uint32x4_t w0_3, uint32x4_t w4_7, uint32x4_t w8_11)` | `SHA1SU0 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A32/A64 |

---

## SHA1SU1

**Description:** SHA1 schedule update 1.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) result;
bits(128) T = operand1 EOR LSR(operand2, 32);
result<31:0>   = ROL(T<31:0>,   1);
result<63:32>  = ROL(T<63:32>,  1);
result<95:64>  = ROL(T<95:64>,  1);
result<127:96> = ROL(T<127:96>, 1) EOR ROL(T<31:0>, 2);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha1su1q_u32(uint32x4_t tw0_3, uint32x4_t w12_15)` | `SHA1SU1 Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |

---

## SHA256H

**Description:** SHA256 hash update (part 1).

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) result;
if part1 then
    result = SHA256hash(V[d], V[n], V[m], TRUE);
else
    result = SHA256hash(V[n], V[d], V[m], FALSE);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha256hq_u32(uint32x4_t hash_abcd, uint32x4_t hash_efgh, uint32x4_t wk)` | `SHA256H Qd,Qn,Vm.4S` | `Qd -> result` | A32/A64 |

---

## SHA256H2

**Description:** SHA256 hash update (part 2).

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) result;
if part1 then
    result = SHA256hash(V[d], V[n], V[m], TRUE);
else
    result = SHA256hash(V[n], V[d], V[m], FALSE);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha256h2q_u32(uint32x4_t hash_efgh, uint32x4_t hash_abcd, uint32x4_t wk)` | `SHA256H2 Qd,Qn,Vm.4S` | `Qd -> result` | A32/A64 |

---

## SHA256SU0

**Description:** SHA256 schedule update 0.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) result;
bits(128) T = operand2<31:0> : operand1<127:32>;
bits(32) elt;

for e = 0 to 3
    elt = Elem[T, e, 32];
    elt = ROR(elt, 7) EOR ROR(elt, 18) EOR LSR(elt, 3);
    Elem[result, e, 32] = elt + Elem[operand1, e, 32];
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha256su0q_u32(uint32x4_t w0_3, uint32x4_t w4_7)` | `SHA256SU0 Vd.4S,Vn.4S` | `Vd.4S -> result` | A32/A64 |

---

## SHA256SU1

**Description:** SHA256 schedule update 1.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) operand1 = V[d];
bits(128) operand2 = V[n];
bits(128) operand3 = V[m];
bits(128) result;
bits(128) T0 = operand3<31:0> : operand2<127:32>;
bits(64) T1;
bits(32) elt;

T1 = operand3<127:64>;
for e = 0 to 1
    elt = Elem[T1, e, 32];
    elt = ROR(elt, 17) EOR ROR(elt, 19) EOR LSR(elt, 10);
    elt = elt + Elem[operand1, e, 32] + Elem[T0, e, 32];
    Elem[result, e, 32] = elt;

T1 = result<63:0>;
for e = 2 to 3
    elt = Elem[T1, e - 2, 32];
    elt = ROR(elt, 17) EOR ROR(elt, 19) EOR LSR(elt, 10);
    elt = elt + Elem[operand1, e, 32] + Elem[T0, e, 32];
    Elem[result, e, 32] = elt;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsha256su1q_u32(uint32x4_t tw0_3, uint32x4_t w8_11, uint32x4_t w12_15)` | `SHA256SU1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A32/A64 |

---

## SHA512H

**Description:** SHA512 Hash update part 1 takes the values from the three 128-bit source SIMD&FP registers and produces a 128-bit output value that combines the sigma1 and chi functions of two iterations of the SHA512 computation. It returns this value to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vtmp;  
bits(64)  MSigma1;
bits(64)  tmp;
bits(128) X = V[n];
bits(128) Y = V[m];
bits(128) W = V[d];

MSigma1 =  ROR(Y<127:64>, 14) EOR ROR(Y<127:64>,18) EOR ROR(Y<127:64>,41);
Vtmp<127:64> =  (Y<127:64> AND X<63:0>) EOR (NOT(Y<127:64>) AND X<127:64>);
Vtmp<127:64> = (Vtmp<127:64> + MSigma1 +  W<127:64>);
tmp = Vtmp<127:64> + Y<63:0>;
MSigma1 = ROR(tmp, 14) EOR ROR(tmp,18) EOR ROR(tmp,41);
Vtmp<63:0> = (tmp AND Y<127:64>) EOR (NOT(tmp) AND X<63:0>);
Vtmp<63:0> = (Vtmp<63:0> + MSigma1 + W<63:0>);
V[d] =  Vtmp;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vsha512hq_u64(uint64x2_t hash_ed, uint64x2_t hash_gf, uint64x2_t kwh_kwh2)` | `SHA512H Qd, Qn, Vm.2D` | `Qd -> result` | A64 |

---

## SHA512H2

**Description:** SHA512 Hash update part 2 takes the values from the three 128-bit source SIMD&FP registers and produces a 128-bit output value that combines the sigma0 and majority functions of two iterations of the SHA512 computation. It returns this value to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vtmp;  
bits(64) NSigma0;
bits(64) tmp;
bits(128) X = V[n];
bits(128) Y = V[m];
bits(128) W = V[d];

NSigma0 =  ROR(Y<63:0>, 28) EOR ROR(Y<63:0>,34) EOR ROR(Y<63:0>,39);
Vtmp<127:64> = (X<63:0> AND Y<127:64>) EOR (X<63:0> AND Y<63:0>) EOR (Y<127:64> AND Y<63:0>);
Vtmp<127:64> = (Vtmp<127:64> + NSigma0 +  W<127:64>);
NSigma0 =  ROR(Vtmp<127:64>, 28) EOR ROR(Vtmp<127:64>,34) EOR ROR(Vtmp<127:64>,39);
Vtmp<63:0> =   (Vtmp<127:64> AND Y<63:0>) EOR (Vtmp<127:64> AND Y<127:64>) EOR (Y<127:64> AND Y<63:0>);
Vtmp<63:0> =   (Vtmp<63:0> + NSigma0 + W<63:0>);

V[d] = Vtmp;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vsha512h2q_u64(uint64x2_t sum_ab, uint64x2_t hash_c_, uint64x2_t hash_ab)` | `SHA512H2 Qd, Qn, Vm.2D` | `Qd -> result` | A64 |

---

## SHA512SU0

**Description:** SHA512 Schedule Update 0 takes the values from the two 128-bit source SIMD&FP registers and produces a 128-bit output value that combines the gamma0 functions of two iterations of the SHA512 schedule update that are performed after the first 16 iterations within a block. It returns this value to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(64) sig0;
bits(128) Vtmp;
bits(128) X = V[n];
bits(128) W = V[d]; 
sig0 = ROR(W<127:64>, 1) EOR ROR(W<127:64>, 8) EOR ('0000000':W<127:71>);
Vtmp<63:0> = W<63:0> + sig0;
sig0 = ROR(X<63:0>, 1) EOR ROR(X<63:0>, 8) EOR ('0000000':X<63:7>);
Vtmp<127:64> = W<127:64> + sig0;
V[d] = Vtmp;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vsha512su0q_u64(uint64x2_t w0_1, uint64x2_t w2_)` | `SHA512SU0 Vd.2D, Vn.2D` | `Vd.2D -> result` | A64 |

---

## SHA512SU1

**Description:** SHA512 Schedule Update 1 takes the values from the three source SIMD&FP registers and produces a 128-bit output value that combines the gamma1 functions of two iterations of the SHA512 schedule update that are performed after the first 16 iterations within a block. It returns this value to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(64) sig1;
bits(128) Vtmp;
bits(128) X = V[n];
bits(128) Y = V[m];
bits(128) W = V[d];

sig1 = ROR(X<127:64>, 19) EOR ROR(X<127:64>,61) EOR ('000000':X<127:70>);
Vtmp<127:64> = W<127:64> + sig1 + Y<127:64>;
sig1 = ROR(X<63:0>, 19) EOR ROR(X<63:0>,61) EOR ('000000':X<63:6>);
Vtmp<63:0> = W<63:0> + sig1 + Y<63:0>;
V[d] = Vtmp;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vsha512su1q_u64(uint64x2_t s01_s02, uint64x2_t w14_15, uint64x2_t w9_10)` | `SHA512SU1 Vd.2D, Vn.2D, Vm.2D` | `Vd.2D -> result` | A64 |

---

## SHADD

**Description:** Signed Halving Add. This instruction adds corresponding signed integer values from the two source SIMD&FP registers, shifts each result right one bit, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    sum = element1 + element2;
    Elem[result, e, esize] = sum<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vhadd_s8(int8x8_t a, int8x8_t b)` | `SHADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vhaddq_s8(int8x16_t a, int8x16_t b)` | `SHADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vhadd_s16(int16x4_t a, int16x4_t b)` | `SHADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vhaddq_s16(int16x8_t a, int16x8_t b)` | `SHADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vhadd_s32(int32x2_t a, int32x2_t b)` | `SHADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vhaddq_s32(int32x4_t a, int32x4_t b)` | `SHADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SHL

**Description:** Shift Left (immediate). This instruction reads each value from a vector, left shifts each result by an immediate value, writes the final result to a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) result;

for e = 0 to elements-1
    Elem[result, e, esize] = LSL(Elem[operand, e, esize], shift);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vshl_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SHL Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vshlq_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SHL Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vshl_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SHL Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vshlq_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SHL Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vshl_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SHL Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vshlq_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SHL Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vshl_n_s64(int64x1_t a, __builtin_constant_p(n))` | `SHL Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vshlq_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SHL Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vshl_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `SHL Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vshlq_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `SHL Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vshl_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `SHL Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vshlq_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `SHL Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vshl_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `SHL Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vshlq_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `SHL Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vshl_n_u64(uint64x1_t a, __builtin_constant_p(n))` | `SHL Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vshlq_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `SHL Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vshld_n_s64(int64_t a, __builtin_constant_p(n))` | `SHL Dd,Dn,#n` | `Dd -> result` | A64 |
| `uint64_t vshld_n_u64(uint64_t a, __builtin_constant_p(n))` | `SHL Dd,Dn,#n` | `Dd -> result` | A64 |
| `float32_t vcvtah_f32_bf16(bfloat16_t a)` | `SHL Dd,Dn, #16` | `Sd -> result` | A32/A64 |

---

## SHLL

**Description:** Signed Shift Left Long (immediate). This instruction reads each vector element from the source SIMD&FP register, left shifts each vector element by the specified shift amount, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vshll_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SHLL Vd.8H,Vn.8B,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vshll_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SHLL Vd.4S,Vn.4H,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vshll_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SHLL Vd.2D,Vn.2S,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint16x8_t vshll_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `SHLL Vd.8H,Vn.8B,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vshll_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `SHLL Vd.4S,Vn.4H,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vshll_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `SHLL Vd.2D,Vn.2S,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `float32x4_t vcvt_f32_bf16(bfloat16x4_t a)` | `SHLL Vd.4S,Vn.8H, #16` | `Vd.4S -> result` | A32/A64 |
| `float32x4_t vcvtq_low_f32_bf16(bfloat16x8_t a)` | `SHLL Vd.4S,Vn.8H, #16` | `Vd.4S -> result` | A32/A64 |

---

## SHLL2

**Description:** Signed Shift Left Long (immediate). This instruction reads each vector element from the source SIMD&FP register, left shifts each vector element by the specified shift amount, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vshll_high_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SHLL2 Vd.8H,Vn.16B,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vshll_high_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SHLL2 Vd.4S,Vn.8H,#n` | `Vd.4S -> result` | A64 |
| `int64x2_t vshll_high_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SHLL2 Vd.2D,Vn.4S,#n` | `Vd.2D -> result` | A64 |
| `uint16x8_t vshll_high_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `SHLL2 Vd.8H,Vn.16B,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vshll_high_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `SHLL2 Vd.4S,Vn.8H,#n` | `Vd.4S -> result` | A64 |
| `uint64x2_t vshll_high_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `SHLL2 Vd.2D,Vn.4S,#n` | `Vd.2D -> result` | A64 |
| `float32x4_t vcvtq_high_f32_bf16(bfloat16x8_t a)` | `SHLL2 Vd.4S,Vn.8H, #16` | `Vd.4S -> result` | A32/A64 |

---

## SHRN

**Description:** Shift Right Narrow (immediate). This instruction reads each unsigned integer value from the source SIMD&FP register, right shifts each result by an immediate value, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The results are truncated. For rounded results, see RSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

for e = 0 to elements-1
    element = (UInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    Elem[result, e, esize] = element<esize-1:0>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vshrn_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vshrn_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vshrn_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vshrn_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `SHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vshrn_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `SHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vshrn_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `SHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |

---

## SHRN2

**Description:** Shift Right Narrow (immediate). This instruction reads each unsigned integer value from the source SIMD&FP register, right shifts each result by an immediate value, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. The results are truncated. For rounded results, see RSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

for e = 0 to elements-1
    element = (UInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    Elem[result, e, esize] = element<esize-1:0>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vshrn_high_n_s16(int8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `SHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `int16x8_t vshrn_high_n_s32(int16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `SHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vshrn_high_n_s64(int32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `SHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |
| `uint8x16_t vshrn_high_n_u16(uint8x8_t r, uint16x8_t a, __builtin_constant_p(n))` | `SHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vshrn_high_n_u32(uint16x4_t r, uint32x4_t a, __builtin_constant_p(n))` | `SHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vshrn_high_n_u64(uint32x2_t r, uint64x2_t a, __builtin_constant_p(n))` | `SHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## SHSUB

**Description:** Signed Halving Subtract. This instruction subtracts the elements in the vector in the second source SIMD&FP register from the corresponding elements in the vector in the first source SIMD&FP register, shifts each result right one bit, places each result into elements of a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer diff;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    diff = element1 - element2;
    Elem[result, e, esize] = diff<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vhsub_s8(int8x8_t a, int8x8_t b)` | `SHSUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vhsubq_s8(int8x16_t a, int8x16_t b)` | `SHSUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vhsub_s16(int16x4_t a, int16x4_t b)` | `SHSUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vhsubq_s16(int16x8_t a, int16x8_t b)` | `SHSUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vhsub_s32(int32x2_t a, int32x2_t b)` | `SHSUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vhsubq_s32(int32x4_t a, int32x4_t b)` | `SHSUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SLI

**Description:** Shift Left and Insert (immediate). This instruction reads each vector element in the source SIMD&FP register, left shifts each vector element by an immediate value, and inserts the result into the corresponding vector element in the destination SIMD&FP register such that the new zero bits created by the shift are not inserted but retain their existing value. Bits shifted out of the left of each vector element in the source register are lost.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2 = V[d];
bits(datasize) result;
bits(esize) mask = LSL(Ones(esize), shift);
bits(esize) shifted;

for e = 0 to elements-1
    shifted = LSL(Elem[operand, e, esize], shift);
    Elem[result, e, esize] = (Elem[operand2, e, esize] AND NOT(mask)) OR shifted;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vsli_n_s8(int8x8_t a, int8x8_t b, __builtin_constant_p(n))` | `SLI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vsliq_n_s8(int8x16_t a, int8x16_t b, __builtin_constant_p(n))` | `SLI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vsli_n_s16(int16x4_t a, int16x4_t b, __builtin_constant_p(n))` | `SLI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vsliq_n_s16(int16x8_t a, int16x8_t b, __builtin_constant_p(n))` | `SLI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vsli_n_s32(int32x2_t a, int32x2_t b, __builtin_constant_p(n))` | `SLI Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vsliq_n_s32(int32x4_t a, int32x4_t b, __builtin_constant_p(n))` | `SLI Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vsli_n_s64(int64x1_t a, int64x1_t b, __builtin_constant_p(n))` | `SLI Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vsliq_n_s64(int64x2_t a, int64x2_t b, __builtin_constant_p(n))` | `SLI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vsli_n_u8(uint8x8_t a, uint8x8_t b, __builtin_constant_p(n))` | `SLI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vsliq_n_u8(uint8x16_t a, uint8x16_t b, __builtin_constant_p(n))` | `SLI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vsli_n_u16(uint16x4_t a, uint16x4_t b, __builtin_constant_p(n))` | `SLI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vsliq_n_u16(uint16x8_t a, uint16x8_t b, __builtin_constant_p(n))` | `SLI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vsli_n_u32(uint32x2_t a, uint32x2_t b, __builtin_constant_p(n))` | `SLI Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vsliq_n_u32(uint32x4_t a, uint32x4_t b, __builtin_constant_p(n))` | `SLI Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vsli_n_u64(uint64x1_t a, uint64x1_t b, __builtin_constant_p(n))` | `SLI Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vsliq_n_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p(n))` | `SLI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x1_t vsli_n_p64(poly64x1_t a, poly64x1_t b, __builtin_constant_p(n))` | `SLI Dd,Dn,#n` | `Dd -> result` | A32/A64 |
| `poly64x2_t vsliq_n_p64(poly64x2_t a, poly64x2_t b, __builtin_constant_p(n))` | `SLI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A32/A64 |
| `poly8x8_t vsli_n_p8(poly8x8_t a, poly8x8_t b, __builtin_constant_p(n))` | `SLI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vsliq_n_p8(poly8x16_t a, poly8x16_t b, __builtin_constant_p(n))` | `SLI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vsli_n_p16(poly16x4_t a, poly16x4_t b, __builtin_constant_p(n))` | `SLI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vsliq_n_p16(poly16x8_t a, poly16x8_t b, __builtin_constant_p(n))` | `SLI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int64_t vslid_n_s64(int64_t a, int64_t b, __builtin_constant_p(n))` | `SLI Dd,Dn,#n` | `Dd -> result` | A64 |
| `uint64_t vslid_n_u64(uint64_t a, uint64_t b, __builtin_constant_p(n))` | `SLI Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SM3PARTW1

**Description:** SM3PARTW1 takes three 128-bit vectors from the three source SIMD&FP registers and returns a 128-bit result in the destination SIMD&FP register. The result is obtained by a three-way exclusive OR of the elements within the input vectors with some fixed rotations, see the Operation pseudocode for more information.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(128) result; 

result<95:0> = (Vd EOR Vn)<95:0> EOR (ROL(Vm<127:96>,15):ROL(Vm<95:64>,15):ROL(Vm<63:32>,15));

for i = 0 to 3
    if i == 3 then 
        result<127:96> = (Vd EOR Vn)<127:96> EOR (ROL(result<31:0>,15));
    result<(32*i)+31:(32*i)> = result<(32*i)+31:(32*i)> EOR ROL(result<(32*i)+31:(32*i)>,15) EOR ROL(result<(32*i)+31:(32*i)>,23);
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3partw1q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `SM3PARTW1 Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |

---

## SM3PARTW2

**Description:** SM3PARTW2 takes three 128-bit vectors from three source SIMD&FP registers and returns a 128-bit result in the destination SIMD&FP register. The result is obtained by a three-way exclusive OR of the elements within the input vectors with some fixed rotations, see the Operation pseudocode for more information.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(128) result; 
bits(128) tmp;
bits(32) tmp2;
tmp<127:0> = Vn EOR (ROL(Vm<127:96>,7):ROL(Vm<95:64>,7):ROL(Vm<63:32>,7):ROL(Vm<31:0>,7)); 
result<127:0> = Vd<127:0> EOR tmp<127:0>;
tmp2 = ROL(tmp<31:0>,15);
tmp2 = tmp2 EOR ROL(tmp2,15) EOR ROL(tmp2,23);
result<127:96> = result<127:96> EOR tmp2;
V[d]= result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3partw2q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `SM3PARTW2 Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |

---

## SM3SS1

**Description:** SM3SS1 rotates the top 32 bits of the 128-bit vector in the first source SIMD&FP register by 12, and adds that 32-bit value to the two other 32-bit values held in the top 32 bits of each of the 128-bit vectors in the second and third source SIMD&FP registers, rotating this result left by 7 and writing the final result into the top 32 bits of the vector in the destination SIMD&FP register, with the bottom 96 bits of the vector being written to 0.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(128) Va = V[a];
Vd<127:96> = ROL((ROL(Vn<127:96>,12) + Vm<127:96> + Va<127:96>) , 7);
Vd<95:0> = Zeros();
V[d] = Vd;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3ss1q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `SM3SS1 Vd.4S, Vn.4S, Vm.4S, Va.4S` | `Vd.4S -> result` | A64 |

---

## SM3TT1A

**Description:** SM3TT1A takes three 128-bit vectors from three source SIMD&FP registers and a 2-bit immediate index value, and returns a 128-bit result in the destination SIMD&FP register. It performs a three-way exclusive OR of the three 32-bit fields held in the upper three elements of the first source vector, and adds the resulting 32-bit value and the following three other 32-bit values:

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(32) WjPrime;
bits(128) result; 
bits(32) TT1;
bits(32) SS2;

WjPrime = Elem[Vm,i,32];
SS2 = Vn<127:96> EOR ROL(Vd<127:96>,12); 
TT1 = Vd<63:32> EOR (Vd<127:96> EOR Vd<95:64>);
TT1 = (TT1 + Vd<31:0> + SS2 + WjPrime)<31:0>;
result<31:0> = Vd<63:32>;
result<63:32> = ROL(Vd<95:64>,9); 
result<95:64> = Vd<127:96>; 
result<127:96> = TT1; 
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3tt1aq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, __builtin_constant_p (imm2))` | `SM3TT1A Vd.4S, Vn.4S, Vm.4S[imm2]` | `Vd.4S -> result` | A64 |

---

## SM3TT1B

**Description:** SM3TT1B takes three 128-bit vectors from three source SIMD&FP registers and a 2-bit immediate index value, and returns a 128-bit result in the destination SIMD&FP register. It performs a 32-bit majority function between the three 32-bit fields held in the upper three elements of the first source vector, and adds the resulting 32-bit value and the following three other 32-bit values:

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(32) WjPrime;
bits(128) result; 
bits(32) TT1;
bits(32) SS2;

WjPrime = Elem[Vm,i,32];
SS2 = Vn<127:96> EOR ROL(Vd<127:96>,12); 
TT1 = (Vd<127:96> AND Vd<63:32>) OR (Vd<127:96> AND Vd<95:64>) OR (Vd<63:32> AND Vd<95:64>); 
TT1 = (TT1 + Vd<31:0> + SS2 + WjPrime)<31:0>;
result<31:0> = Vd<63:32>;
result<63:32> = ROL(Vd<95:64>,9); 
result<95:64> = Vd<127:96>; 
result<127:96> = TT1; 
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3tt1bq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, __builtin_constant_p (imm2))` | `SM3TT1B Vd.4S, Vn.4S, Vm.4S[imm2]` | `Vd.4S -> result` | A64 |

---

## SM3TT2A

**Description:** SM3TT2A takes three 128-bit vectors from three source SIMD&FP register and a 2-bit immediate index value, and returns a 128-bit result in the destination SIMD&FP register. It performs a three-way exclusive OR of the three 32-bit fields held in the upper three elements of the first source vector, and adds the resulting 32-bit value and the following three other 32-bit values:

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(32) Wj;
bits(128) result; 
bits(32) TT2;

Wj = Elem[Vm,i,32];
TT2 = Vd<63:32> EOR (Vd<127:96> EOR Vd<95:64>);
TT2 = (TT2 + Vd<31:0> + Vn<127:96> + Wj)<31:0>;

result<31:0> = Vd<63:32>;
result<63:32> = ROL(Vd<95:64>,19); 
result<95:64> = Vd<127:96>; 
result<127:96> = TT2 EOR ROL(TT2,9) EOR ROL(TT2,17); 
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3tt2aq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, __builtin_constant_p (imm2))` | `SM3TT2A Vd.4S, Vn.4S, Vm.4S[imm2]` | `Vd.4S -> result` | A64 |

---

## SM3TT2B

**Description:** SM3TT2B takes three 128-bit vectors from three source SIMD&FP registers, and a 2-bit immediate index value, and returns a 128-bit result in the destination SIMD&FP register. It performs a 32-bit majority function between the three 32-bit fields held in the upper three elements of the first source vector, and adds the resulting 32-bit value and the following three other 32-bit values:

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) Vd = V[d];
bits(32) Wj;
bits(128) result; 
bits(32) TT2;

Wj = Elem[Vm,i,32];
TT2 = (Vd<127:96> AND Vd<95:64>) OR (NOT(Vd<127:96>) AND Vd<63:32>); 
TT2 = (TT2 + Vd<31:0> + Vn<127:96> + Wj)<31:0>;

result<31:0> = Vd<63:32>;
result<63:32> = ROL(Vd<95:64>,19); 
result<95:64> = Vd<127:96>; 
result<127:96> = TT2 EOR ROL(TT2,9) EOR ROL(TT2,17); 
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm3tt2bq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, __builtin_constant_p (imm2))` | `SM3TT2B Vd.4S, Vn.4S, Vm.4S[imm2]` | `Vd.4S -> result` | A64 |

---

## SM4E

**Description:** SM4 Encode takes input data as a 128-bit vector from the first source SIMD&FP register, and four iterations of the round key held as the elements of the 128-bit vector in the second source SIMD&FP register. It encrypts the data by four rounds, in accordance with the SM4 standard, returning the 128-bit result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vn = V[n];
bits(32) intval; 
bits(8) sboxout;
bits(128) roundresult;
bits(32) roundkey;

roundresult=V[d];
for index = 0 to 3
    roundkey = Elem[Vn,index,32];

    intval = roundresult<127:96> EOR roundresult<95:64> EOR roundresult<63:32> EOR roundkey; 

    for i = 0 to 3  
        Elem[intval,i,8]  = Sbox(Elem[intval,i,8]); 

    intval = intval EOR ROL(intval,2) EOR ROL(intval,10) EOR ROL(intval,18) EOR ROL(intval,24);
    intval = intval EOR roundresult<31:0>; 

    roundresult<31:0> = roundresult<63:32>;
    roundresult<63:32> = roundresult<95:64>;
    roundresult<95:64> = roundresult<127:96>;
    roundresult<127:96> = intval; 
V[d] = roundresult;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm4eq_u32(uint32x4_t a, uint32x4_t b)` | `SM4E Vd.4S, Vn.4S` | `Vd.4S -> result` | A64 |

---

## SM4EKEY

**Description:** SM4 Key takes an input as a 128-bit vector from the first source SIMD&FP register and a 128-bit constant from the second SIMD&FP register. It derives four iterations of the output key, in accordance with the SM4 standard, returning the 128-bit result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(32) intval; 
bits(8) sboxout;
bits(128) result;
bits(32) const;
bits(128) roundresult;

roundresult = V[n];
for index = 0 to 3 
    const = Elem[Vm,index,32];

    intval = roundresult<127:96> EOR roundresult<95:64> EOR roundresult<63:32> EOR const; 

    for i = 0 to 3  
        Elem[intval,i,8] = Sbox(Elem[intval,i,8]); 

    intval = intval EOR ROL(intval,13) EOR ROL(intval,23);
    intval = intval EOR roundresult<31:0>; 

    roundresult<31:0> = roundresult<63:32>;
    roundresult<63:32> = roundresult<95:64>;
    roundresult<95:64> = roundresult<127:96>;
    roundresult<127:96> = intval; 
V[d] = roundresult;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vsm4ekeyq_u32(uint32x4_t a, uint32x4_t b)` | `SM4EKEY Vd.4S, Vn.4S, Vm.4S` | `Vd.4S -> result` | A64 |

---

## SMAX

**Description:** Signed Maximum (vector). This instruction compares corresponding elements in the vectors in the two source SIMD&FP registers, places the larger of each pair of signed integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmax_s8(int8x8_t a, int8x8_t b)` | `SMAX Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vmaxq_s8(int8x16_t a, int8x16_t b)` | `SMAX Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmax_s16(int16x4_t a, int16x4_t b)` | `SMAX Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vmaxq_s16(int16x8_t a, int16x8_t b)` | `SMAX Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmax_s32(int32x2_t a, int32x2_t b)` | `SMAX Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vmaxq_s32(int32x4_t a, int32x4_t b)` | `SMAX Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SMAXP

**Description:** Signed Maximum Pairwise. This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the largest of each pair of signed integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[concat, 2*e, esize], unsigned);
    element2 = Int(Elem[concat, (2*e)+1, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vpmax_s8(int8x8_t a, int8x8_t b)` | `SMAXP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vpmax_s16(int16x4_t a, int16x4_t b)` | `SMAXP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vpmax_s32(int32x2_t a, int32x2_t b)` | `SMAXP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int8x16_t vpmaxq_s8(int8x16_t a, int8x16_t b)` | `SMAXP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x8_t vpmaxq_s16(int16x8_t a, int16x8_t b)` | `SMAXP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x4_t vpmaxq_s32(int32x4_t a, int32x4_t b)` | `SMAXP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int32_t vmaxv_s32(int32x2_t a)` | `SMAXP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |

---

## SMAXV

**Description:** Signed Maximum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the largest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer maxmin;
integer element;

maxmin = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    element = Int(Elem[operand, e, esize], unsigned);
    maxmin = if min then Min(maxmin, element) else Max(maxmin, element);

V[d] = maxmin<esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8_t vmaxv_s8(int8x8_t a)` | `SMAXV Bd,Vn.8B` | `Bd -> result` | A64 |
| `int8_t vmaxvq_s8(int8x16_t a)` | `SMAXV Bd,Vn.16B` | `Bd -> result` | A64 |
| `int16_t vmaxv_s16(int16x4_t a)` | `SMAXV Hd,Vn.4H` | `Hd -> result` | A64 |
| `int16_t vmaxvq_s16(int16x8_t a)` | `SMAXV Hd,Vn.8H` | `Hd -> result` | A64 |
| `int32_t vmaxvq_s32(int32x4_t a)` | `SMAXV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## SMIN

**Description:** Signed Minimum (vector). This instruction compares corresponding elements in the vectors in the two source SIMD&FP registers, places the smaller of each of the two signed integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmin_s8(int8x8_t a, int8x8_t b)` | `SMIN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vminq_s8(int8x16_t a, int8x16_t b)` | `SMIN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vmin_s16(int16x4_t a, int16x4_t b)` | `SMIN Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vminq_s16(int16x8_t a, int16x8_t b)` | `SMIN Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vmin_s32(int32x2_t a, int32x2_t b)` | `SMIN Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vminq_s32(int32x4_t a, int32x4_t b)` | `SMIN Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SMINP

**Description:** Signed Minimum Pairwise. This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the smallest of each pair of signed integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[concat, 2*e, esize], unsigned);
    element2 = Int(Elem[concat, (2*e)+1, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vpmin_s8(int8x8_t a, int8x8_t b)` | `SMINP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vpmin_s16(int16x4_t a, int16x4_t b)` | `SMINP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vpmin_s32(int32x2_t a, int32x2_t b)` | `SMINP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int8x16_t vpminq_s8(int8x16_t a, int8x16_t b)` | `SMINP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x8_t vpminq_s16(int16x8_t a, int16x8_t b)` | `SMINP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x4_t vpminq_s32(int32x4_t a, int32x4_t b)` | `SMINP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int32_t vminv_s32(int32x2_t a)` | `SMINP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |

---

## SMINV

**Description:** Signed Minimum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the smallest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer maxmin;
integer element;

maxmin = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    element = Int(Elem[operand, e, esize], unsigned);
    maxmin = if min then Min(maxmin, element) else Max(maxmin, element);

V[d] = maxmin<esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8_t vminv_s8(int8x8_t a)` | `SMINV Bd,Vn.8B` | `Bd -> result` | A64 |
| `int8_t vminvq_s8(int8x16_t a)` | `SMINV Bd,Vn.16B` | `Bd -> result` | A64 |
| `int16_t vminv_s16(int16x4_t a)` | `SMINV Hd,Vn.4H` | `Hd -> result` | A64 |
| `int16_t vminvq_s16(int16x8_t a)` | `SMINV Hd,Vn.8H` | `Hd -> result` | A64 |
| `int32_t vminvq_s32(int32x4_t a)` | `SMINV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## SMLAL

**Description:** Signed Multiply-Add Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, and accumulates the results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmlal_s8(int16x8_t a, int8x8_t b, int8x8_t c)` | `SMLAL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vmlal_s16(int32x4_t a, int16x4_t b, int16x4_t c)` | `SMLAL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlal_s32(int64x2_t a, int32x2_t b, int32x2_t c)` | `SMLAL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmlal_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlal_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmlal_laneq_s16(int32x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlal_laneq_s32(int64x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlal_n_s16(int32x4_t a, int16x4_t b, int16_t c)` | `SMLAL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlal_n_s32(int64x2_t a, int32x2_t b, int32_t c)` | `SMLAL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## SMLAL2

**Description:** Signed Multiply-Add Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, and accumulates the results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmlal_high_s8(int16x8_t a, int8x16_t b, int8x16_t c)` | `SMLAL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vmlal_high_s16(int32x4_t a, int16x8_t b, int16x8_t c)` | `SMLAL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlal_high_s32(int64x2_t a, int32x4_t b, int32x4_t c)` | `SMLAL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlal_high_lane_s16(int32x4_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlal_high_lane_s32(int64x2_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlal_high_laneq_s16(int32x4_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlal_high_laneq_s32(int64x2_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlal_high_n_s16(int32x4_t a, int16x8_t b, int16_t c)` | `SMLAL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlal_high_n_s32(int64x2_t a, int32x4_t b, int32_t c)` | `SMLAL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## SMLSL

**Description:** Signed Multiply-Subtract Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, and subtracts the results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmlsl_s8(int16x8_t a, int8x8_t b, int8x8_t c)` | `SMLSL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vmlsl_s16(int32x4_t a, int16x4_t b, int16x4_t c)` | `SMLSL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlsl_s32(int64x2_t a, int32x2_t b, int32x2_t c)` | `SMLSL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmlsl_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlsl_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmlsl_laneq_s16(int32x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlsl_laneq_s32(int64x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlsl_n_s16(int32x4_t a, int16x4_t b, int16_t c)` | `SMLSL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmlsl_n_s32(int64x2_t a, int32x2_t b, int32_t c)` | `SMLSL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## SMLSL2

**Description:** Signed Multiply-Subtract Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, and subtracts the results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmlsl_high_s8(int16x8_t a, int8x16_t b, int8x16_t c)` | `SMLSL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vmlsl_high_s16(int32x4_t a, int16x8_t b, int16x8_t c)` | `SMLSL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlsl_high_s32(int64x2_t a, int32x4_t b, int32x4_t c)` | `SMLSL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlsl_high_lane_s16(int32x4_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlsl_high_lane_s32(int64x2_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlsl_high_laneq_s16(int32x4_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlsl_high_laneq_s32(int64x2_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmlsl_high_n_s16(int32x4_t a, int16x8_t b, int16_t c)` | `SMLSL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmlsl_high_n_s32(int64x2_t a, int32x4_t b, int32_t c)` | `SMLSL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## SMMLA

**Description:** Signed 8-bit integer matrix multiply-accumulate. This instruction multiplies the 2x8 matrix of signed 8-bit integer values in the first source vector by the 8x2 matrix of signed 8-bit integer values in the second source vector. The resulting 2x2 32-bit integer matrix product is destructively added to the 32-bit integer matrix accumulator in the destination vector. This is equivalent to performing an 8-way dot product per destination element.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand1 = V[n];
bits(128) operand2 = V[m];
bits(128) addend   = V[d];

V[d] = MatMulAdd(addend, operand1, operand2, op1_unsigned, op2_unsigned);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vmmlaq_s32(int32x4_t r, int8x16_t a, int8x16_t b)` | `SMMLA Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |

---

## SMOV

**Description:** Signed Move vector element to general-purpose register. This instruction reads the signed integer from the source SIMD&FP register, sign-extends it to form a 32-bit or 64-bit value, and writes the result to destination general-purpose register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(idxdsize) operand = V[n];

X[d] = SignExtend(Elem[operand, index, esize], datasize);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8_t vget_lane_s8(int8x8_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `int16_t vget_lane_s16(int16x4_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |
| `int32_t vget_lane_s32(int32x2_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.S[lane]` | `Rd -> result` | v7/A32/A64 |
| `int8_t vgetq_lane_s8(int8x16_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `int16_t vgetq_lane_s16(int16x8_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |
| `int32_t vgetq_lane_s32(int32x4_t v, __builtin_constant_p(lane))` | `SMOV Rd,Vn.S[lane]` | `Rd -> result` | v7/A32/A64 |

---

## SMULL

**Description:** Signed Multiply Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, 2*esize] = (element1 * element2)<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmull_s8(int8x8_t a, int8x8_t b)` | `SMULL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vmull_s16(int16x4_t a, int16x4_t b)` | `SMULL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmull_s32(int32x2_t a, int32x2_t b)` | `SMULL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmull_n_s16(int16x4_t a, int16_t b)` | `SMULL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmull_n_s32(int32x2_t a, int32_t b)` | `SMULL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmull_lane_s16(int16x4_t a, int16x4_t v, __builtin_constant_p(lane))` | `SMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmull_lane_s32(int32x2_t a, int32x2_t v, __builtin_constant_p(lane))` | `SMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vmull_laneq_s16(int16x4_t a, int16x8_t v, __builtin_constant_p(lane))` | `SMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmull_laneq_s32(int32x2_t a, int32x4_t v, __builtin_constant_p(lane))` | `SMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |

---

## SMULL2

**Description:** Signed Multiply Long (vector). This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, 2*esize] = (element1 * element2)<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vmull_high_s8(int8x16_t a, int8x16_t b)` | `SMULL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vmull_high_s16(int16x8_t a, int16x8_t b)` | `SMULL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vmull_high_s32(int32x4_t a, int32x4_t b)` | `SMULL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vmull_high_n_s16(int16x8_t a, int16_t b)` | `SMULL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmull_high_n_s32(int32x4_t a, int32_t b)` | `SMULL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmull_high_lane_s16(int16x8_t a, int16x4_t v, __builtin_constant_p(lane))` | `SMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmull_high_lane_s32(int32x4_t a, int32x2_t v, __builtin_constant_p(lane))` | `SMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vmull_high_laneq_s16(int16x8_t a, int16x8_t v, __builtin_constant_p(lane))` | `SMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vmull_high_laneq_s32(int32x4_t a, int32x4_t v, __builtin_constant_p(lane))` | `SMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |

---

## SQABS

**Description:** Signed saturating Absolute value. This instruction reads each vector element from the source SIMD&FP register, puts the absolute value of the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;
boolean sat;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    if neg then
        element = -element;
    else
        element = Abs(element);
    (Elem[result, e, esize], sat) = SignedSatQ(element, esize);         
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqabs_s8(int8x8_t a)` | `SQABS Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqabsq_s8(int8x16_t a)` | `SQABS Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqabs_s16(int16x4_t a)` | `SQABS Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqabsq_s16(int16x8_t a)` | `SQABS Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqabs_s32(int32x2_t a)` | `SQABS Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqabsq_s32(int32x4_t a)` | `SQABS Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqabs_s64(int64x1_t a)` | `SQABS Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vqabsq_s64(int64x2_t a)` | `SQABS Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int8_t vqabsb_s8(int8_t a)` | `SQABS Bd,Bn` | `Bd -> result` | A64 |
| `int16_t vqabsh_s16(int16_t a)` | `SQABS Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vqabss_s32(int32_t a)` | `SQABS Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vqabsd_s64(int64_t a)` | `SQABS Dd,Dn` | `Dd -> result` | A64 |

---

## SQADD

**Description:** Signed saturating Add. This instruction adds the values of corresponding elements of the two source SIMD&FP registers, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer sum;
boolean sat;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    sum = element1 + element2;
    (Elem[result, e, esize], sat) = SatQ(sum, esize, unsigned);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqadd_s8(int8x8_t a, int8x8_t b)` | `SQADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqaddq_s8(int8x16_t a, int8x16_t b)` | `SQADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqadd_s16(int16x4_t a, int16x4_t b)` | `SQADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqaddq_s16(int16x8_t a, int16x8_t b)` | `SQADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqadd_s32(int32x2_t a, int32x2_t b)` | `SQADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqaddq_s32(int32x4_t a, int32x4_t b)` | `SQADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqadd_s64(int64x1_t a, int64x1_t b)` | `SQADD Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vqaddq_s64(int64x2_t a, int64x2_t b)` | `SQADD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int8_t vqaddb_s8(int8_t a, int8_t b)` | `SQADD Bd,Bn,Bm` | `Bd -> result` | A64 |
| `int16_t vqaddh_s16(int16_t a, int16_t b)` | `SQADD Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqadds_s32(int32_t a, int32_t b)` | `SQADD Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int64_t vqaddd_s64(int64_t a, int64_t b)` | `SQADD Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SQDMLAL

**Description:** Signed saturating Doubling Multiply-Add Long. This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, doubles the results, and accumulates the final results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
integer accum;
boolean sat1;
boolean sat2;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat1) = SignedSatQ(2 * element1 * element2, 2*esize);
    if sub_op then
        accum = SInt(Elem[operand3, e, 2*esize]) - SInt(product);
    else
        accum = SInt(Elem[operand3, e, 2*esize]) + SInt(product);
    (Elem[result, e, 2*esize], sat2) = SignedSatQ(accum, 2*esize);
    if sat1 || sat2 then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmlal_s16(int32x4_t a, int16x4_t b, int16x4_t c)` | `SQDMLAL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlal_s32(int64x2_t a, int32x2_t b, int32x2_t c)` | `SQDMLAL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmlalh_s16(int32_t a, int16_t b, int16_t c)` | `SQDMLAL Sd,Hn,Hm` | `Sd -> result` | A64 |
| `int64_t vqdmlals_s32(int64_t a, int32_t b, int32_t c)` | `SQDMLAL Dd,Sn,Sm` | `Dd -> result` | A64 |
| `int32x4_t vqdmlal_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlal_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmlalh_lane_s16(int32_t a, int16_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLAL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmlals_lane_s32(int64_t a, int32_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLAL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |
| `int32x4_t vqdmlal_laneq_s16(int32x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlal_laneq_s32(int64x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32_t vqdmlalh_laneq_s16(int32_t a, int16_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLAL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmlals_laneq_s32(int64_t a, int32_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLAL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |
| `int32x4_t vqdmlal_n_s16(int32x4_t a, int16x4_t b, int16_t c)` | `SQDMLAL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlal_n_s32(int64x2_t a, int32x2_t b, int32_t c)` | `SQDMLAL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## SQDMLAL2

**Description:** Signed saturating Doubling Multiply-Add Long. This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, doubles the results, and accumulates the final results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
integer accum;
boolean sat1;
boolean sat2;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat1) = SignedSatQ(2 * element1 * element2, 2*esize);
    if sub_op then
        accum = SInt(Elem[operand3, e, 2*esize]) - SInt(product);
    else
        accum = SInt(Elem[operand3, e, 2*esize]) + SInt(product);
    (Elem[result, e, 2*esize], sat2) = SignedSatQ(accum, 2*esize);
    if sat1 || sat2 then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmlal_high_s16(int32x4_t a, int16x8_t b, int16x8_t c)` | `SQDMLAL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlal_high_s32(int64x2_t a, int32x4_t b, int32x4_t c)` | `SQDMLAL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlal_high_lane_s16(int32x4_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlal_high_lane_s32(int64x2_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlal_high_laneq_s16(int32x4_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlal_high_laneq_s32(int64x2_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlal_high_n_s16(int32x4_t a, int16x8_t b, int16_t c)` | `SQDMLAL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlal_high_n_s32(int64x2_t a, int32x4_t b, int32_t c)` | `SQDMLAL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## SQDMLSL

**Description:** Signed saturating Doubling Multiply-Subtract Long. This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, doubles the results, and subtracts the final results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
integer accum;
boolean sat1;
boolean sat2;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat1) = SignedSatQ(2 * element1 * element2, 2*esize);
    if sub_op then
        accum = SInt(Elem[operand3, e, 2*esize]) - SInt(product);
    else
        accum = SInt(Elem[operand3, e, 2*esize]) + SInt(product);
    (Elem[result, e, 2*esize], sat2) = SignedSatQ(accum, 2*esize);
    if sat1 || sat2 then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmlsl_s16(int32x4_t a, int16x4_t b, int16x4_t c)` | `SQDMLSL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlsl_s32(int64x2_t a, int32x2_t b, int32x2_t c)` | `SQDMLSL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmlslh_s16(int32_t a, int16_t b, int16_t c)` | `SQDMLSL Sd,Hn,Hm` | `Sd -> result` | A64 |
| `int64_t vqdmlsls_s32(int64_t a, int32_t b, int32_t c)` | `SQDMLSL Dd,Sn,Sm` | `Dd -> result` | A64 |
| `int32x4_t vqdmlsl_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlsl_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmlslh_lane_s16(int32_t a, int16_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLSL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmlsls_lane_s32(int64_t a, int32_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLSL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |
| `int32x4_t vqdmlsl_laneq_s16(int32x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlsl_laneq_s32(int64x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32_t vqdmlslh_laneq_s16(int32_t a, int16_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLSL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmlsls_laneq_s32(int64_t a, int32_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLSL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |
| `int32x4_t vqdmlsl_n_s16(int32x4_t a, int16x4_t b, int16_t c)` | `SQDMLSL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmlsl_n_s32(int64x2_t a, int32x2_t b, int32_t c)` | `SQDMLSL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## SQDMLSL2

**Description:** Signed saturating Doubling Multiply-Subtract Long. This instruction multiplies corresponding signed integer values in the lower or upper half of the vectors of the two source SIMD&FP registers, doubles the results, and subtracts the final results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
integer accum;
boolean sat1;
boolean sat2;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat1) = SignedSatQ(2 * element1 * element2, 2*esize);
    if sub_op then
        accum = SInt(Elem[operand3, e, 2*esize]) - SInt(product);
    else
        accum = SInt(Elem[operand3, e, 2*esize]) + SInt(product);
    (Elem[result, e, 2*esize], sat2) = SignedSatQ(accum, 2*esize);
    if sat1 || sat2 then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmlsl_high_s16(int32x4_t a, int16x8_t b, int16x8_t c)` | `SQDMLSL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlsl_high_s32(int64x2_t a, int32x4_t b, int32x4_t c)` | `SQDMLSL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlsl_high_lane_s16(int32x4_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQDMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlsl_high_lane_s32(int64x2_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQDMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlsl_high_laneq_s16(int32x4_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQDMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlsl_high_laneq_s32(int64x2_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQDMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmlsl_high_n_s16(int32x4_t a, int16x8_t b, int16_t c)` | `SQDMLSL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmlsl_high_n_s32(int64x2_t a, int32x4_t b, int32_t c)` | `SQDMLSL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## SQDMULH

**Description:** Signed saturating Doubling Multiply returning High half. This instruction multiplies the values of corresponding elements of the two source SIMD&FP registers, doubles the results, places the most significant half of the final results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer round_const = if rounding then 1 << (esize - 1) else 0;
integer element1;
integer element2;
integer product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    product = (2 * element1 * element2) + round_const;
    (Elem[result, e, esize], sat) = SignedSatQ(product >> esize, esize);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vqdmulh_s16(int16x4_t a, int16x4_t b)` | `SQDMULH Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqdmulhq_s16(int16x8_t a, int16x8_t b)` | `SQDMULH Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqdmulh_s32(int32x2_t a, int32x2_t b)` | `SQDMULH Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqdmulhq_s32(int32x4_t a, int32x4_t b)` | `SQDMULH Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int16_t vqdmulhh_s16(int16_t a, int16_t b)` | `SQDMULH Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqdmulhs_s32(int32_t a, int32_t b)` | `SQDMULH Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int16x4_t vqdmulh_n_s16(int16x4_t a, int16_t b)` | `SQDMULH Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqdmulhq_n_s16(int16x8_t a, int16_t b)` | `SQDMULH Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqdmulh_n_s32(int32x2_t a, int32_t b)` | `SQDMULH Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqdmulhq_n_s32(int32x4_t a, int32_t b)` | `SQDMULH Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vqdmulh_lane_s16(int16x4_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqdmulhq_lane_s16(int16x8_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqdmulh_lane_s32(int32x2_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqdmulhq_lane_s32(int32x4_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16_t vqdmulhh_lane_s16(int16_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqdmulhs_lane_s32(int32_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULH Sd,Sn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int16x4_t vqdmulh_laneq_s16(int16x4_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqdmulhq_laneq_s16(int16x8_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vqdmulh_laneq_s32(int32x2_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqdmulhq_laneq_s32(int32x4_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16_t vqdmulhh_laneq_s16(int16_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqdmulhs_laneq_s32(int32_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULH Sd,Sn,Vm.H[lane]` | `Sd -> result` | A64 |

---

## SQDMULL

**Description:** Signed saturating Doubling Multiply Long. This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, doubles the results, places the final results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat) = SignedSatQ(2 * element1 * element2, 2*esize);
    Elem[result, e, 2*esize] = product;
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmull_s16(int16x4_t a, int16x4_t b)` | `SQDMULL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmull_s32(int32x2_t a, int32x2_t b)` | `SQDMULL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmullh_s16(int16_t a, int16_t b)` | `SQDMULL Sd,Hn,Hm` | `Sd -> result` | A64 |
| `int64_t vqdmulls_s32(int32_t a, int32_t b)` | `SQDMULL Dd,Sn,Sm` | `Dd -> result` | A64 |
| `int32x4_t vqdmull_n_s16(int16x4_t a, int16_t b)` | `SQDMULL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmull_n_s32(int32x2_t a, int32_t b)` | `SQDMULL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32x4_t vqdmull_lane_s16(int16x4_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vqdmull_lane_s32(int32x2_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `int32_t vqdmullh_lane_s16(int16_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmulls_lane_s32(int32_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |
| `int32x4_t vqdmull_laneq_s16(int16x4_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmull_laneq_s32(int32x2_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32_t vqdmullh_laneq_s16(int16_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULL Sd,Hn,Vm.H[lane]` | `Sd -> result` | A64 |
| `int64_t vqdmulls_laneq_s32(int32_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULL Dd,Sn,Vm.S[lane]` | `Dd -> result` | A64 |

---

## SQDMULL2

**Description:** Signed saturating Doubling Multiply Long. This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, doubles the results, places the final results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    (product, sat) = SignedSatQ(2 * element1 * element2, 2*esize);
    Elem[result, e, 2*esize] = product;
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vqdmull_high_s16(int16x8_t a, int16x8_t b)` | `SQDMULL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmull_high_s32(int32x4_t a, int32x4_t b)` | `SQDMULL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmull_high_n_s16(int16x8_t a, int16_t b)` | `SQDMULL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmull_high_n_s32(int32x4_t a, int32_t b)` | `SQDMULL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmull_high_lane_s16(int16x8_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQDMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmull_high_lane_s32(int32x4_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQDMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `int32x4_t vqdmull_high_laneq_s16(int16x8_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQDMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `int64x2_t vqdmull_high_laneq_s32(int32x4_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQDMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |

---

## SQNEG

**Description:** Signed saturating Negate. This instruction reads each vector element from the source SIMD&FP register, negates each value, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
integer element;
boolean sat;

for e = 0 to elements-1
    element = SInt(Elem[operand, e, esize]);
    if neg then
        element = -element;
    else
        element = Abs(element);
    (Elem[result, e, esize], sat) = SignedSatQ(element, esize);         
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqneg_s8(int8x8_t a)` | `SQNEG Vd.8B,Vn.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqnegq_s8(int8x16_t a)` | `SQNEG Vd.16B,Vn.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqneg_s16(int16x4_t a)` | `SQNEG Vd.4H,Vn.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqnegq_s16(int16x8_t a)` | `SQNEG Vd.8H,Vn.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqneg_s32(int32x2_t a)` | `SQNEG Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqnegq_s32(int32x4_t a)` | `SQNEG Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqneg_s64(int64x1_t a)` | `SQNEG Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vqnegq_s64(int64x2_t a)` | `SQNEG Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int8_t vqnegb_s8(int8_t a)` | `SQNEG Bd,Bn` | `Bd -> result` | A64 |
| `int16_t vqnegh_s16(int16_t a)` | `SQNEG Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vqnegs_s32(int32_t a)` | `SQNEG Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vqnegd_s64(int64_t a)` | `SQNEG Dd,Dn` | `Dd -> result` | A64 |

---

## SQRDMLAH

**Description:** Signed Saturating Rounding Doubling Multiply Accumulate returning High Half (vector). This instruction multiplies the vector elements of the first source SIMD&FP register with the corresponding vector elements of the second source SIMD&FP register without saturating the multiply results, doubles the results, and accumulates the most significant half of the final results with the vector elements of the destination SIMD&FP register. The results are rounded.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
integer rounding_const = if rounding then 1 << (esize - 1) else 0;
integer element1;
integer element2;
integer element3;
integer product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    element3 = SInt(Elem[operand3, e, esize]);
    if sub_op then
        accum = ((element3 << esize) - 2 * (element1 * element2) + rounding_const);
    else
        accum = ((element3 << esize) + 2 * (element1 * element2) + rounding_const);
    (Elem[result, e, esize], sat) = SignedSatQ(accum >> esize, esize);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vqrdmlah_s16(int16x4_t a, int16x4_t b, int16x4_t c)` | `SQRDMLAH Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int32x2_t vqrdmlah_s32(int32x2_t a, int32x2_t b, int32x2_t c)` | `SQRDMLAH Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int16x8_t vqrdmlahq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `SQRDMLAH Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x4_t vqrdmlahq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `SQRDMLAH Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int16x4_t vqrdmlah_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqrdmlahq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int16x4_t vqrdmlah_laneq_s16(int16x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqrdmlahq_laneq_s16(int16x8_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vqrdmlah_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqrdmlahq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int32x2_t vqrdmlah_laneq_s32(int32x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqrdmlahq_laneq_s32(int32x4_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16_t vqrdmlahh_lane_s16(int16_t a, int16_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int16_t vqrdmlahh_laneq_s16(int16_t a, int16_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLAH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqrdmlahs_lane_s32(int32_t a, int32_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLAH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `int32_t vqrdmlahs_laneq_s32(int32_t a, int32_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLAH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |

---

## SQRDMLSH

**Description:** Signed Saturating Rounding Doubling Multiply Subtract returning High Half (vector). This instruction multiplies the vector elements of the first source SIMD&FP register with the corresponding vector elements of the second source SIMD&FP register without saturating the multiply results, doubles the results, and subtracts the most significant half of the final results from the vector elements of the destination SIMD&FP register. The results are rounded.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;
integer rounding_const = if rounding then 1 << (esize - 1) else 0;
integer element1;
integer element2;
integer element3;
integer product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    element3 = SInt(Elem[operand3, e, esize]);
    if sub_op then
        accum = ((element3 << esize) - 2 * (element1 * element2) + rounding_const);
    else
        accum = ((element3 << esize) + 2 * (element1 * element2) + rounding_const);
    (Elem[result, e, esize], sat) = SignedSatQ(accum >> esize, esize);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vqrdmlsh_s16(int16x4_t a, int16x4_t b, int16x4_t c)` | `SQRDMLSH Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int32x2_t vqrdmlsh_s32(int32x2_t a, int32x2_t b, int32x2_t c)` | `SQRDMLSH Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int16x8_t vqrdmlshq_s16(int16x8_t a, int16x8_t b, int16x8_t c)` | `SQRDMLSH Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x4_t vqrdmlshq_s32(int32x4_t a, int32x4_t b, int32x4_t c)` | `SQRDMLSH Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int16x4_t vqrdmlsh_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqrdmlshq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int16x4_t vqrdmlsh_laneq_s16(int16x4_t a, int16x4_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqrdmlshq_laneq_s16(int16x8_t a, int16x8_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vqrdmlsh_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqrdmlshq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int32x2_t vqrdmlsh_laneq_s32(int32x2_t a, int32x2_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqrdmlshq_laneq_s32(int32x4_t a, int32x4_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16_t vqrdmlahh_s16(int16_t a, int16_t b, int16_t c)` | `SQRDMLSH Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqrdmlahs_s32(int32_t a, int32_t b, int32_t c)` | `SQRDMLSH Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int16_t vqrdmlshh_s16(int16_t a, int16_t b, int16_t c)` | `SQRDMLSH Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqrdmlshs_s32(int32_t a, int32_t b, int32_t c)` | `SQRDMLSH Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int16_t vqrdmlshh_lane_s16(int16_t a, int16_t b, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int16_t vqrdmlshh_laneq_s16(int16_t a, int16_t b, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMLSH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqrdmlshs_lane_s32(int32_t a, int32_t b, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMLSH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `int32_t vqrdmlshs_laneq_s32(int32_t a, int32_t b, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMLSH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |

---

## SQRDMULH

**Description:** Signed saturating Rounding Doubling Multiply returning High half. This instruction multiplies the values of corresponding elements of the two source SIMD&FP registers, doubles the results, places the most significant half of the final results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer round_const = if rounding then 1 << (esize - 1) else 0;
integer element1;
integer element2;
integer product;
boolean sat;

for e = 0 to elements-1
    element1 = SInt(Elem[operand1, e, esize]);
    element2 = SInt(Elem[operand2, e, esize]);
    product = (2 * element1 * element2) + round_const;
    (Elem[result, e, esize], sat) = SignedSatQ(product >> esize, esize);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x4_t vqrdmulh_s16(int16x4_t a, int16x4_t b)` | `SQRDMULH Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqrdmulhq_s16(int16x8_t a, int16x8_t b)` | `SQRDMULH Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqrdmulh_s32(int32x2_t a, int32x2_t b)` | `SQRDMULH Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqrdmulhq_s32(int32x4_t a, int32x4_t b)` | `SQRDMULH Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int16_t vqrdmulhh_s16(int16_t a, int16_t b)` | `SQRDMULH Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqrdmulhs_s32(int32_t a, int32_t b)` | `SQRDMULH Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int16x4_t vqrdmulh_n_s16(int16x4_t a, int16_t b)` | `SQRDMULH Vd.4H,Vn.4H,Vm.H[0]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqrdmulhq_n_s16(int16x8_t a, int16_t b)` | `SQRDMULH Vd.8H,Vn.8H,Vm.H[0]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqrdmulh_n_s32(int32x2_t a, int32_t b)` | `SQRDMULH Vd.2S,Vn.2S,Vm.S[0]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqrdmulhq_n_s32(int32x4_t a, int32_t b)` | `SQRDMULH Vd.4S,Vn.4S,Vm.S[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16x4_t vqrdmulh_lane_s16(int16x4_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqrdmulhq_lane_s16(int16x8_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqrdmulh_lane_s32(int32x2_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqrdmulhq_lane_s32(int32x4_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `int16_t vqrdmulhh_lane_s16(int16_t a, int16x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqrdmulhs_lane_s32(int32_t a, int32x2_t v, __builtin_constant_p(lane))` | `SQRDMULH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |
| `int16x4_t vqrdmulh_laneq_s16(int16x4_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.4H,Vn.4H,Vm.H[lane]` | `Vd.4H -> result` | A64 |
| `int16x8_t vqrdmulhq_laneq_s16(int16x8_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.8H,Vn.8H,Vm.H[lane]` | `Vd.8H -> result` | A64 |
| `int32x2_t vqrdmulh_laneq_s32(int32x2_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.2S,Vn.2S,Vm.S[lane]` | `Vd.2S -> result` | A64 |
| `int32x4_t vqrdmulhq_laneq_s32(int32x4_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Vd.4S,Vn.4S,Vm.S[lane]` | `Vd.4S -> result` | A64 |
| `int16_t vqrdmulhh_laneq_s16(int16_t a, int16x8_t v, __builtin_constant_p(lane))` | `SQRDMULH Hd,Hn,Vm.H[lane]` | `Hd -> result` | A64 |
| `int32_t vqrdmulhs_laneq_s32(int32_t a, int32x4_t v, __builtin_constant_p(lane))` | `SQRDMULH Sd,Sn,Vm.S[lane]` | `Sd -> result` | A64 |

---

## SQRSHL

**Description:** Signed saturating Rounding Shift Left (register). This instruction takes each vector element in the first source SIMD&FP register, shifts it by a value from the least significant byte of the corresponding vector element of the second source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqrshl_s8(int8x8_t a, int8x8_t b)` | `SQRSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqrshlq_s8(int8x16_t a, int8x16_t b)` | `SQRSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqrshl_s16(int16x4_t a, int16x4_t b)` | `SQRSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqrshlq_s16(int16x8_t a, int16x8_t b)` | `SQRSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqrshl_s32(int32x2_t a, int32x2_t b)` | `SQRSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqrshlq_s32(int32x4_t a, int32x4_t b)` | `SQRSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqrshl_s64(int64x1_t a, int64x1_t b)` | `SQRSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vqrshlq_s64(int64x2_t a, int64x2_t b)` | `SQRSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int8_t vqrshlb_s8(int8_t a, int8_t b)` | `SQRSHL Bd,Bn,Bm` | `Bd -> result` | A64 |
| `int16_t vqrshlh_s16(int16_t a, int16_t b)` | `SQRSHL Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqrshls_s32(int32_t a, int32_t b)` | `SQRSHL Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int64_t vqrshld_s64(int64_t a, int64_t b)` | `SQRSHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SQRSHRN

**Description:** Signed saturating Rounded Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are half as long as the source vector elements. The results are rounded. For truncated results, see SQSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqrshrn_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQRSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vqrshrn_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQRSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vqrshrn_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQRSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int8_t vqrshrnh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQRSHRN Bd,Hn,#n` | `Bd -> result` | A64 |
| `int16_t vqrshrns_n_s32(int32_t a, __builtin_constant_p(n))` | `SQRSHRN Hd,Sn,#n` | `Hd -> result` | A64 |
| `int32_t vqrshrnd_n_s64(int64_t a, __builtin_constant_p(n))` | `SQRSHRN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## SQRSHRN2

**Description:** Signed saturating Rounded Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are half as long as the source vector elements. The results are rounded. For truncated results, see SQSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vqrshrn_high_n_s16(int8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `SQRSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `int16x8_t vqrshrn_high_n_s32(int16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `SQRSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vqrshrn_high_n_s64(int32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `SQRSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## SQRSHRUN

**Description:** Signed saturating Rounded Shift Right Unsigned Narrow (immediate). This instruction reads each signed integer value in the vector of the source SIMD&FP register, right shifts each value by an immediate value, saturates the result to an unsigned integer value that is half the original width, places the final result into a vector, and writes the vector to the destination SIMD&FP register. The results are rounded. For truncated results, see SQSHRUN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (SInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    (Elem[result, e, esize], sat) = UnsignedSatQ(element, esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqrshrun_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQRSHRUN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqrshrun_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQRSHRUN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqrshrun_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQRSHRUN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqrshrunh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQRSHRUN Bd,Hn,#n` | `Bd -> result` | A64 |
| `uint16_t vqrshruns_n_s32(int32_t a, __builtin_constant_p(n))` | `SQRSHRUN Hd,Sn,#n` | `Hd -> result` | A64 |
| `uint32_t vqrshrund_n_s64(int64_t a, __builtin_constant_p(n))` | `SQRSHRUN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## SQRSHRUN2

**Description:** Signed saturating Rounded Shift Right Unsigned Narrow (immediate). This instruction reads each signed integer value in the vector of the source SIMD&FP register, right shifts each value by an immediate value, saturates the result to an unsigned integer value that is half the original width, places the final result into a vector, and writes the vector to the destination SIMD&FP register. The results are rounded. For truncated results, see SQSHRUN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (SInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    (Elem[result, e, esize], sat) = UnsignedSatQ(element, esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqrshrun_high_n_s16(uint8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `SQRSHRUN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqrshrun_high_n_s32(uint16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `SQRSHRUN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqrshrun_high_n_s64(uint32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `SQRSHRUN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## SQSHL

**Description:** Signed saturating Shift Left (register). This instruction takes each element in the vector of the first source SIMD&FP register, shifts each element by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqshl_s8(int8x8_t a, int8x8_t b)` | `SQSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqshlq_s8(int8x16_t a, int8x16_t b)` | `SQSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqshl_s16(int16x4_t a, int16x4_t b)` | `SQSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqshlq_s16(int16x8_t a, int16x8_t b)` | `SQSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqshl_s32(int32x2_t a, int32x2_t b)` | `SQSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqshlq_s32(int32x4_t a, int32x4_t b)` | `SQSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqshl_s64(int64x1_t a, int64x1_t b)` | `SQSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vqshlq_s64(int64x2_t a, int64x2_t b)` | `SQSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int8_t vqshlb_s8(int8_t a, int8_t b)` | `SQSHL Bd,Bn,Bm` | `Bd -> result` | A64 |
| `int16_t vqshlh_s16(int16_t a, int16_t b)` | `SQSHL Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqshls_s32(int32_t a, int32_t b)` | `SQSHL Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int64_t vqshld_s64(int64_t a, int64_t b)` | `SQSHL Dd,Dn,Dm` | `Dd -> result` | A64 |
| `int8x8_t vqshl_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SQSHL Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqshlq_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SQSHL Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqshl_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SQSHL Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqshlq_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQSHL Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqshl_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SQSHL Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqshlq_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQSHL Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqshl_n_s64(int64x1_t a, __builtin_constant_p(n))` | `SQSHL Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vqshlq_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQSHL Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int8_t vqshlb_n_s8(int8_t a, __builtin_constant_p(n))` | `SQSHL Bd,Bn,#n` | `Bd -> result` | A64 |
| `int16_t vqshlh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQSHL Hd,Hn,#n` | `Hd -> result` | A64 |
| `int32_t vqshls_n_s32(int32_t a, __builtin_constant_p(n))` | `SQSHL Sd,Sn,#n` | `Sd -> result` | A64 |
| `int64_t vqshld_n_s64(int64_t a, __builtin_constant_p(n))` | `SQSHL Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SQSHLU

**Description:** Signed saturating Shift Left Unsigned (immediate). This instruction reads each signed integer value in the vector of the source SIMD&FP register, shifts each value by an immediate value, saturates the shifted result to an unsigned integer value, places the result in a vector, and writes the vector to the destination SIMD&FP register. The results are truncated. For rounded results, see UQRSHL.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) result;
integer element;
boolean sat;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], src_unsigned) << shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, dst_unsigned);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqshlu_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SQSHLU Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqshluq_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SQSHLU Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqshlu_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SQSHLU Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqshluq_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQSHLU Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqshlu_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SQSHLU Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqshluq_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQSHLU Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqshlu_n_s64(int64x1_t a, __builtin_constant_p(n))` | `SQSHLU Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqshluq_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQSHLU Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqshlub_n_s8(int8_t a, __builtin_constant_p(n))` | `SQSHLU Bd,Bn,#n` | `Bd -> result` | A64 |
| `uint16_t vqshluh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQSHLU Hd,Hn,#n` | `Hd -> result` | A64 |
| `uint32_t vqshlus_n_s32(int32_t a, __builtin_constant_p(n))` | `SQSHLU Sd,Sn,#n` | `Sd -> result` | A64 |
| `uint64_t vqshlud_n_s64(int64_t a, __builtin_constant_p(n))` | `SQSHLU Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SQSHRN

**Description:** Signed saturating Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts and truncates each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are half as long as the source vector elements. For rounded results, see SQRSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqshrn_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vqshrn_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vqshrn_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int8_t vqshrnh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQSHRN Bd,Hn,#n` | `Bd -> result` | A64 |
| `int16_t vqshrns_n_s32(int32_t a, __builtin_constant_p(n))` | `SQSHRN Hd,Sn,#n` | `Hd -> result` | A64 |
| `int32_t vqshrnd_n_s64(int64_t a, __builtin_constant_p(n))` | `SQSHRN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## SQSHRN2

**Description:** Signed saturating Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts and truncates each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are half as long as the source vector elements. For rounded results, see SQRSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vqshrn_high_n_s16(int8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `SQSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `int16x8_t vqshrn_high_n_s32(int16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `SQSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vqshrn_high_n_s64(int32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `SQSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## SQSHRUN

**Description:** Signed saturating Shift Right Unsigned Narrow (immediate). This instruction reads each signed integer value in the vector of the source SIMD&FP register, right shifts each value by an immediate value, saturates the result to an unsigned integer value that is half the original width, places the final result into a vector, and writes the vector to the destination SIMD&FP register. The results are truncated. For rounded results, see SQRSHRUN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (SInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    (Elem[result, e, esize], sat) = UnsignedSatQ(element, esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqshrun_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SQSHRUN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqshrun_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SQSHRUN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqshrun_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SQSHRUN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqshrunh_n_s16(int16_t a, __builtin_constant_p(n))` | `SQSHRUN Bd,Hn,#n` | `Bd -> result` | A64 |
| `uint16_t vqshruns_n_s32(int32_t a, __builtin_constant_p(n))` | `SQSHRUN Hd,Sn,#n` | `Hd -> result` | A64 |
| `uint32_t vqshrund_n_s64(int64_t a, __builtin_constant_p(n))` | `SQSHRUN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## SQSHRUN2

**Description:** Signed saturating Shift Right Unsigned Narrow (immediate). This instruction reads each signed integer value in the vector of the source SIMD&FP register, right shifts each value by an immediate value, saturates the result to an unsigned integer value that is half the original width, places the final result into a vector, and writes the vector to the destination SIMD&FP register. The results are truncated. For rounded results, see SQRSHRUN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (SInt(Elem[operand, e, 2*esize]) + round_const) >> shift;
    (Elem[result, e, esize], sat) = UnsignedSatQ(element, esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqshrun_high_n_s16(uint8x8_t r, int16x8_t a, __builtin_constant_p(n))` | `SQSHRUN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqshrun_high_n_s32(uint16x4_t r, int32x4_t a, __builtin_constant_p(n))` | `SQSHRUN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqshrun_high_n_s64(uint32x2_t r, int64x2_t a, __builtin_constant_p(n))` | `SQSHRUN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## SQSUB

**Description:** Signed saturating Subtract. This instruction subtracts the element values of the second source SIMD&FP register from the corresponding element values of the first source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer diff;
boolean sat;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    diff = element1 - element2;
    (Elem[result, e, esize], sat) = SatQ(diff, esize, unsigned);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqsub_s8(int8x8_t a, int8x8_t b)` | `SQSUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vqsubq_s8(int8x16_t a, int8x16_t b)` | `SQSUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vqsub_s16(int16x4_t a, int16x4_t b)` | `SQSUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vqsubq_s16(int16x8_t a, int16x8_t b)` | `SQSUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vqsub_s32(int32x2_t a, int32x2_t b)` | `SQSUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vqsubq_s32(int32x4_t a, int32x4_t b)` | `SQSUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vqsub_s64(int64x1_t a, int64x1_t b)` | `SQSUB Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vqsubq_s64(int64x2_t a, int64x2_t b)` | `SQSUB Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int8_t vqsubb_s8(int8_t a, int8_t b)` | `SQSUB Bd,Bn,Bm` | `Bd -> result` | A64 |
| `int16_t vqsubh_s16(int16_t a, int16_t b)` | `SQSUB Hd,Hn,Hm` | `Hd -> result` | A64 |
| `int32_t vqsubs_s32(int32_t a, int32_t b)` | `SQSUB Sd,Sn,Sm` | `Sd -> result` | A64 |
| `int64_t vqsubd_s64(int64_t a, int64_t b)` | `SQSUB Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SQXTN

**Description:** Signed saturating extract Narrow. This instruction reads each vector element from the source SIMD&FP register, saturates the value to half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = SatQ(Int(element, unsigned), esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vqmovn_s16(int16x8_t a)` | `SQXTN Vd.8B,Vn.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vqmovn_s32(int32x4_t a)` | `SQXTN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vqmovn_s64(int64x2_t a)` | `SQXTN Vd.2S,Vn.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `int8_t vqmovnh_s16(int16_t a)` | `SQXTN Bd,Hn` | `Bd -> result` | A64 |
| `int16_t vqmovns_s32(int32_t a)` | `SQXTN Hd,Sn` | `Hd -> result` | A64 |
| `int32_t vqmovnd_s64(int64_t a)` | `SQXTN Sd,Dn` | `Sd -> result` | A64 |

---

## SQXTN2

**Description:** Signed saturating extract Narrow. This instruction reads each vector element from the source SIMD&FP register, saturates the value to half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = SatQ(Int(element, unsigned), esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vqmovn_high_s16(int8x8_t r, int16x8_t a)` | `SQXTN2 Vd.16B,Vn.8H` | `Vd.16B -> result` | A64 |
| `int16x8_t vqmovn_high_s32(int16x4_t r, int32x4_t a)` | `SQXTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | A64 |
| `int32x4_t vqmovn_high_s64(int32x2_t r, int64x2_t a)` | `SQXTN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | A64 |

---

## SQXTUN

**Description:** Signed saturating extract Unsigned Narrow. This instruction reads each signed integer value in the vector of the source SIMD&FP register, saturates the value to an unsigned integer value that is half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = UnsignedSatQ(SInt(element), esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqmovun_s16(int16x8_t a)` | `SQXTUN Vd.8B,Vn.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqmovun_s32(int32x4_t a)` | `SQXTUN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqmovun_s64(int64x2_t a)` | `SQXTUN Vd.2S,Vn.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqmovunh_s16(int16_t a)` | `SQXTUN Bd,Hn` | `Bd -> result` | A64 |
| `uint16_t vqmovuns_s32(int32_t a)` | `SQXTUN Hd,Sn` | `Hd -> result` | A64 |
| `uint32_t vqmovund_s64(int64_t a)` | `SQXTUN Sd,Dn` | `Sd -> result` | A64 |

---

## SQXTUN2

**Description:** Signed saturating extract Unsigned Narrow. This instruction reads each signed integer value in the vector of the source SIMD&FP register, saturates the value to an unsigned integer value that is half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = UnsignedSatQ(SInt(element), esize);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqmovun_high_s16(uint8x8_t r, int16x8_t a)` | `SQXTUN2 Vd.16B,Vn.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqmovun_high_s32(uint16x4_t r, int32x4_t a)` | `SQXTUN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqmovun_high_s64(uint32x2_t r, int64x2_t a)` | `SQXTUN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | A64 |

---

## SRHADD

**Description:** Signed Rounding Halving Add. This instruction adds corresponding signed integer values from the two source SIMD&FP registers, shifts each result right one bit, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, esize] = (element1 + element2 + 1)<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrhadd_s8(int8x8_t a, int8x8_t b)` | `SRHADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrhaddq_s8(int8x16_t a, int8x16_t b)` | `SRHADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrhadd_s16(int16x4_t a, int16x4_t b)` | `SRHADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrhaddq_s16(int16x8_t a, int16x8_t b)` | `SRHADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vrhadd_s32(int32x2_t a, int32x2_t b)` | `SRHADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vrhaddq_s32(int32x4_t a, int32x4_t b)` | `SRHADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## SRI

**Description:** Shift Right and Insert (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each vector element by an immediate value, and inserts the result into the corresponding vector element in the destination SIMD&FP register such that the new zero bits created by the shift are not inserted but retain their existing value. Bits shifted out of the right of each vector element of the source register are lost.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2 = V[d];
bits(datasize) result;
bits(esize) mask = LSR(Ones(esize), shift);
bits(esize) shifted;

for e = 0 to elements-1
    shifted = LSR(Elem[operand, e, esize], shift);
    Elem[result, e, esize] = (Elem[operand2, e, esize] AND NOT(mask)) OR shifted;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vsri_n_s8(int8x8_t a, int8x8_t b, __builtin_constant_p(n))` | `SRI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vsriq_n_s8(int8x16_t a, int8x16_t b, __builtin_constant_p(n))` | `SRI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vsri_n_s16(int16x4_t a, int16x4_t b, __builtin_constant_p(n))` | `SRI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vsriq_n_s16(int16x8_t a, int16x8_t b, __builtin_constant_p(n))` | `SRI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vsri_n_s32(int32x2_t a, int32x2_t b, __builtin_constant_p(n))` | `SRI Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vsriq_n_s32(int32x4_t a, int32x4_t b, __builtin_constant_p(n))` | `SRI Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vsri_n_s64(int64x1_t a, int64x1_t b, __builtin_constant_p(n))` | `SRI Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vsriq_n_s64(int64x2_t a, int64x2_t b, __builtin_constant_p(n))` | `SRI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vsri_n_u8(uint8x8_t a, uint8x8_t b, __builtin_constant_p(n))` | `SRI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vsriq_n_u8(uint8x16_t a, uint8x16_t b, __builtin_constant_p(n))` | `SRI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vsri_n_u16(uint16x4_t a, uint16x4_t b, __builtin_constant_p(n))` | `SRI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vsriq_n_u16(uint16x8_t a, uint16x8_t b, __builtin_constant_p(n))` | `SRI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vsri_n_u32(uint32x2_t a, uint32x2_t b, __builtin_constant_p(n))` | `SRI Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vsriq_n_u32(uint32x4_t a, uint32x4_t b, __builtin_constant_p(n))` | `SRI Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vsri_n_u64(uint64x1_t a, uint64x1_t b, __builtin_constant_p(n))` | `SRI Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vsriq_n_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p(n))` | `SRI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `poly64x1_t vsri_n_p64(poly64x1_t a, poly64x1_t b, __builtin_constant_p(n))` | `SRI Dd,Dn,#n` | `Dd -> result` | A32/A64 |
| `poly64x2_t vsriq_n_p64(poly64x2_t a, poly64x2_t b, __builtin_constant_p(n))` | `SRI Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A32/A64 |
| `poly8x8_t vsri_n_p8(poly8x8_t a, poly8x8_t b, __builtin_constant_p(n))` | `SRI Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x16_t vsriq_n_p8(poly8x16_t a, poly8x16_t b, __builtin_constant_p(n))` | `SRI Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `poly16x4_t vsri_n_p16(poly16x4_t a, poly16x4_t b, __builtin_constant_p(n))` | `SRI Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `poly16x8_t vsriq_n_p16(poly16x8_t a, poly16x8_t b, __builtin_constant_p(n))` | `SRI Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int64_t vsrid_n_s64(int64_t a, int64_t b, __builtin_constant_p(n))` | `SRI Dd,Dn,#n` | `Dd -> result` | A64 |
| `uint64_t vsrid_n_u64(uint64_t a, uint64_t b, __builtin_constant_p(n))` | `SRI Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SRSHL

**Description:** Signed Rounding Shift Left (register). This instruction takes each signed integer value in the vector of the first source SIMD&FP register, shifts it by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrshl_s8(int8x8_t a, int8x8_t b)` | `SRSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrshlq_s8(int8x16_t a, int8x16_t b)` | `SRSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrshl_s16(int16x4_t a, int16x4_t b)` | `SRSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrshlq_s16(int16x8_t a, int16x8_t b)` | `SRSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vrshl_s32(int32x2_t a, int32x2_t b)` | `SRSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vrshlq_s32(int32x4_t a, int32x4_t b)` | `SRSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vrshl_s64(int64x1_t a, int64x1_t b)` | `SRSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vrshlq_s64(int64x2_t a, int64x2_t b)` | `SRSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vrshld_s64(int64_t a, int64_t b)` | `SRSHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SRSHR

**Description:** Signed Rounding Shift Right (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, places the final result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values. The results are rounded. For truncated results, see SSHR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrshr_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SRSHR Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrshrq_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SRSHR Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrshr_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SRSHR Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrshrq_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SRSHR Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vrshr_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SRSHR Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vrshrq_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SRSHR Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vrshr_n_s64(int64x1_t a, __builtin_constant_p(n))` | `SRSHR Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vrshrq_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SRSHR Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vrshrd_n_s64(int64_t a, __builtin_constant_p(n))` | `SRSHR Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SRSRA

**Description:** Signed Rounding Shift Right and Accumulate (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, and accumulates the final results with the vector elements of the destination SIMD&FP register. All the values in this instruction are signed integer values. The results are rounded. For truncated results, see SSRA.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vrsra_n_s8(int8x8_t a, int8x8_t b, __builtin_constant_p(n))` | `SRSRA Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vrsraq_n_s8(int8x16_t a, int8x16_t b, __builtin_constant_p(n))` | `SRSRA Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vrsra_n_s16(int16x4_t a, int16x4_t b, __builtin_constant_p(n))` | `SRSRA Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vrsraq_n_s16(int16x8_t a, int16x8_t b, __builtin_constant_p(n))` | `SRSRA Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vrsra_n_s32(int32x2_t a, int32x2_t b, __builtin_constant_p(n))` | `SRSRA Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vrsraq_n_s32(int32x4_t a, int32x4_t b, __builtin_constant_p(n))` | `SRSRA Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vrsra_n_s64(int64x1_t a, int64x1_t b, __builtin_constant_p(n))` | `SRSRA Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vrsraq_n_s64(int64x2_t a, int64x2_t b, __builtin_constant_p(n))` | `SRSRA Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vrsrad_n_s64(int64_t a, int64_t b, __builtin_constant_p(n))` | `SRSRA Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SSHL

**Description:** Signed Shift Left (register). This instruction takes each signed integer value in the vector of the first source SIMD&FP register, shifts each value by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vshl_s8(int8x8_t a, int8x8_t b)` | `SSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vshlq_s8(int8x16_t a, int8x16_t b)` | `SSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vshl_s16(int16x4_t a, int16x4_t b)` | `SSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vshlq_s16(int16x8_t a, int16x8_t b)` | `SSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vshl_s32(int32x2_t a, int32x2_t b)` | `SSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vshlq_s32(int32x4_t a, int32x4_t b)` | `SSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vshl_s64(int64x1_t a, int64x1_t b)` | `SSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vshlq_s64(int64x2_t a, int64x2_t b)` | `SSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vshld_s64(int64_t a, int64_t b)` | `SSHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SSHLL

**Description:** Signed Shift Left Long (immediate). This instruction reads each vector element from the source SIMD&FP register, left shifts each vector element by the specified shift amount, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vshll_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SSHLL Vd.8H,Vn.8B,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vshll_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SSHLL Vd.4S,Vn.4H,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vshll_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SSHLL Vd.2D,Vn.2S,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int16x8_t vmovl_s8(int8x8_t a)` | `SSHLL Vd.8H,Vn.8B,#0` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vmovl_s16(int16x4_t a)` | `SSHLL Vd.4S,Vn.4H,#0` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vmovl_s32(int32x2_t a)` | `SSHLL Vd.2D,Vn.2S,#0` | `Vd.2D -> result` | v7/A32/A64 |

---

## SSHLL2

**Description:** Signed Shift Left Long (immediate). This instruction reads each vector element from the source SIMD&FP register, left shifts each vector element by the specified shift amount, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vshll_high_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SSHLL2 Vd.8H,Vn.16B,#n` | `Vd.8H -> result` | A64 |
| `int32x4_t vshll_high_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SSHLL2 Vd.4S,Vn.8H,#n` | `Vd.4S -> result` | A64 |
| `int64x2_t vshll_high_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SSHLL2 Vd.2D,Vn.4S,#n` | `Vd.2D -> result` | A64 |
| `int16x8_t vmovl_high_s8(int8x16_t a)` | `SSHLL2 Vd.8H,Vn.16B,#0` | `Vd.8H -> result` | A64 |
| `int32x4_t vmovl_high_s16(int16x8_t a)` | `SSHLL2 Vd.4S,Vn.8H,#0` | `Vd.4S -> result` | A64 |
| `int64x2_t vmovl_high_s32(int32x4_t a)` | `SSHLL2 Vd.2D,Vn.4S,#0` | `Vd.2D -> result` | A64 |

---

## SSHR

**Description:** Signed Shift Right (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, places the final result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values. The results are truncated. For rounded results, see SRSHR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vshr_n_s8(int8x8_t a, __builtin_constant_p(n))` | `SSHR Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vshrq_n_s8(int8x16_t a, __builtin_constant_p(n))` | `SSHR Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vshr_n_s16(int16x4_t a, __builtin_constant_p(n))` | `SSHR Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vshrq_n_s16(int16x8_t a, __builtin_constant_p(n))` | `SSHR Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vshr_n_s32(int32x2_t a, __builtin_constant_p(n))` | `SSHR Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vshrq_n_s32(int32x4_t a, __builtin_constant_p(n))` | `SSHR Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vshr_n_s64(int64x1_t a, __builtin_constant_p(n))` | `SSHR Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vshrq_n_s64(int64x2_t a, __builtin_constant_p(n))` | `SSHR Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vshrd_n_s64(int64_t a, __builtin_constant_p(n))` | `SSHR Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SSRA

**Description:** Signed Shift Right and Accumulate (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, and accumulates the final results with the vector elements of the destination SIMD&FP register. All the values in this instruction are signed integer values. The results are truncated. For rounded results, see SRSRA.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vsra_n_s8(int8x8_t a, int8x8_t b, __builtin_constant_p(n))` | `SSRA Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vsraq_n_s8(int8x16_t a, int8x16_t b, __builtin_constant_p(n))` | `SSRA Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vsra_n_s16(int16x4_t a, int16x4_t b, __builtin_constant_p(n))` | `SSRA Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vsraq_n_s16(int16x8_t a, int16x8_t b, __builtin_constant_p(n))` | `SSRA Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vsra_n_s32(int32x2_t a, int32x2_t b, __builtin_constant_p(n))` | `SSRA Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vsraq_n_s32(int32x4_t a, int32x4_t b, __builtin_constant_p(n))` | `SSRA Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vsra_n_s64(int64x1_t a, int64x1_t b, __builtin_constant_p(n))` | `SSRA Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vsraq_n_s64(int64x2_t a, int64x2_t b, __builtin_constant_p(n))` | `SSRA Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vsrad_n_s64(int64_t a, int64_t b, __builtin_constant_p(n))` | `SSRA Dd,Dn,#n` | `Dd -> result` | A64 |

---

## SSUBL

**Description:** Signed Subtract Long. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vsubl_s8(int8x8_t a, int8x8_t b)` | `SSUBL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vsubl_s16(int16x4_t a, int16x4_t b)` | `SSUBL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vsubl_s32(int32x2_t a, int32x2_t b)` | `SSUBL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SSUBL2

**Description:** Signed Subtract Long. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are signed integer values. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vsubl_high_s8(int8x16_t a, int8x16_t b)` | `SSUBL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vsubl_high_s16(int16x8_t a, int16x8_t b)` | `SSUBL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vsubl_high_s32(int32x4_t a, int32x4_t b)` | `SSUBL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## SSUBW

**Description:** Signed Subtract Wide. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element in the first source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vsubw_s8(int16x8_t a, int8x8_t b)` | `SSUBW Vd.8H,Vn.8H,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vsubw_s16(int32x4_t a, int16x4_t b)` | `SSUBW Vd.4S,Vn.4S,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x2_t vsubw_s32(int64x2_t a, int32x2_t b)` | `SSUBW Vd.2D,Vn.2D,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## SSUBW2

**Description:** Signed Subtract Wide. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element in the first source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int16x8_t vsubw_high_s8(int16x8_t a, int8x16_t b)` | `SSUBW2 Vd.8H,Vn.8H,Vm.16B` | `Vd.8H -> result` | A64 |
| `int32x4_t vsubw_high_s16(int32x4_t a, int16x8_t b)` | `SSUBW2 Vd.4S,Vn.4S,Vm.8H` | `Vd.4S -> result` | A64 |
| `int64x2_t vsubw_high_s32(int64x2_t a, int32x4_t b)` | `SSUBW2 Vd.2D,Vn.2D,Vm.4S` | `Vd.2D -> result` | A64 |

---

## ST1

**Description:** Store multiple single-element structures from one, two, three, or four registers. This instruction stores elements to memory from one, two, three, or four SIMD&FP registers, without interleaving. Every element of each register is stored.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vst1_s8(int8_t *ptr, int8x8_t val)` | `ST1 {Vt.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s8(int8_t *ptr, int8x16_t val)` | `ST1 {Vt.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s16(int16_t *ptr, int16x4_t val)` | `ST1 {Vt.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s16(int16_t *ptr, int16x8_t val)` | `ST1 {Vt.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s32(int32_t *ptr, int32x2_t val)` | `ST1 {Vt.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s32(int32_t *ptr, int32x4_t val)` | `ST1 {Vt.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s64(int64_t *ptr, int64x1_t val)` | `ST1 {Vt.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s64(int64_t *ptr, int64x2_t val)` | `ST1 {Vt.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u8(uint8_t *ptr, uint8x8_t val)` | `ST1 {Vt.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u8(uint8_t *ptr, uint8x16_t val)` | `ST1 {Vt.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u16(uint16_t *ptr, uint16x4_t val)` | `ST1 {Vt.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u16(uint16_t *ptr, uint16x8_t val)` | `ST1 {Vt.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u32(uint32_t *ptr, uint32x2_t val)` | `ST1 {Vt.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u32(uint32_t *ptr, uint32x4_t val)` | `ST1 {Vt.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u64(uint64_t *ptr, uint64x1_t val)` | `ST1 {Vt.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u64(uint64_t *ptr, uint64x2_t val)` | `ST1 {Vt.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p64(poly64_t *ptr, poly64x1_t val)` | `ST1 {Vt.1D},[Xn]` | `` | A32/A64 |
| `void vst1q_p64(poly64_t *ptr, poly64x2_t val)` | `ST1 {Vt.2D},[Xn]` | `` | A32/A64 |
| `void vst1_f16(float16_t *ptr, float16x4_t val)` | `ST1 {Vt.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f16(float16_t *ptr, float16x8_t val)` | `ST1 {Vt.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f32(float32_t *ptr, float32x2_t val)` | `ST1 {Vt.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f32(float32_t *ptr, float32x4_t val)` | `ST1 {Vt.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p8(poly8_t *ptr, poly8x8_t val)` | `ST1 {Vt.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p8(poly8_t *ptr, poly8x16_t val)` | `ST1 {Vt.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p16(poly16_t *ptr, poly16x4_t val)` | `ST1 {Vt.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p16(poly16_t *ptr, poly16x8_t val)` | `ST1 {Vt.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f64(float64_t *ptr, float64x1_t val)` | `ST1 {Vt.1D},[Xn]` | `` | A64 |
| `void vst1q_f64(float64_t *ptr, float64x2_t val)` | `ST1 {Vt.2D},[Xn]` | `` | A64 |
| `void vst1_mf8(mfloat8_t *ptr, mfloat8x8_t val)` | `ST1 {Vt.8B},[Xn]` | `` | A64 |
| `void vst1q_mf8(mfloat8_t *ptr, mfloat8x16_t val)` | `ST1 {Vt.16B},[Xn]` | `` | A64 |
| `void vst1_lane_s8(int8_t *ptr, int8x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_s8(int8_t *ptr, int8x16_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_s16(int16_t *ptr, int16x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_s16(int16_t *ptr, int16x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_s32(int32_t *ptr, int32x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_s32(int32_t *ptr, int32x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_s64(int64_t *ptr, int64x1_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_s64(int64_t *ptr, int64x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_u8(uint8_t *ptr, uint8x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_u8(uint8_t *ptr, uint8x16_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_u16(uint16_t *ptr, uint16x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_u16(uint16_t *ptr, uint16x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_u32(uint32_t *ptr, uint32x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_u32(uint32_t *ptr, uint32x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_u64(uint64_t *ptr, uint64x1_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_u64(uint64_t *ptr, uint64x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_p64(poly64_t *ptr, poly64x1_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | A32/A64 |
| `void vst1q_lane_p64(poly64_t *ptr, poly64x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | A32/A64 |
| `void vst1_lane_f16(float16_t *ptr, float16x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_f16(float16_t *ptr, float16x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_f32(float32_t *ptr, float32x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_f32(float32_t *ptr, float32x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_p8(poly8_t *ptr, poly8x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_p8(poly8_t *ptr, poly8x16_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_p16(poly16_t *ptr, poly16x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1q_lane_p16(poly16_t *ptr, poly16x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst1_lane_f64(float64_t *ptr, float64x1_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vst1q_lane_f64(float64_t *ptr, float64x2_t val, __builtin_constant_p(lane))` | `ST1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vst1_lane_mf8(mfloat8_t *ptr, mfloat8x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | A64 |
| `void vst1q_lane_mf8(mfloat8_t *ptr, mfloat8x16_t val, __builtin_constant_p(lane))` | `ST1 {Vt.b}[lane],[Xn]` | `` | A64 |
| `void vst2_s64(int64_t *ptr, int64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst2_u64(uint64_t *ptr, uint64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst2_p64(poly64_t *ptr, poly64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | A32/A64 |
| `void vst2_f64(float64_t *ptr, float64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | A64 |
| `void vst3_s64(int64_t *ptr, int64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst3_u64(uint64_t *ptr, uint64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst3_p64(poly64_t *ptr, poly64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | A32/A64 |
| `void vst3_f64(float64_t *ptr, float64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | A64 |
| `void vst4_s64(int64_t *ptr, int64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst4_u64(uint64_t *ptr, uint64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst4_p64(poly64_t *ptr, poly64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | A32/A64 |
| `void vst4_f64(float64_t *ptr, float64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | A64 |
| `void vst1_s8_x2(int8_t *ptr, int8x8x2_t val)` | `ST1 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s8_x2(int8_t *ptr, int8x16x2_t val)` | `ST1 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s16_x2(int16_t *ptr, int16x4x2_t val)` | `ST1 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s16_x2(int16_t *ptr, int16x8x2_t val)` | `ST1 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s32_x2(int32_t *ptr, int32x2x2_t val)` | `ST1 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s32_x2(int32_t *ptr, int32x4x2_t val)` | `ST1 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u8_x2(uint8_t *ptr, uint8x8x2_t val)` | `ST1 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u8_x2(uint8_t *ptr, uint8x16x2_t val)` | `ST1 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u16_x2(uint16_t *ptr, uint16x4x2_t val)` | `ST1 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u16_x2(uint16_t *ptr, uint16x8x2_t val)` | `ST1 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u32_x2(uint32_t *ptr, uint32x2x2_t val)` | `ST1 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u32_x2(uint32_t *ptr, uint32x4x2_t val)` | `ST1 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f16_x2(float16_t *ptr, float16x4x2_t val)` | `ST1 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f16_x2(float16_t *ptr, float16x8x2_t val)` | `ST1 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f32_x2(float32_t *ptr, float32x2x2_t val)` | `ST1 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f32_x2(float32_t *ptr, float32x4x2_t val)` | `ST1 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p8_x2(poly8_t *ptr, poly8x8x2_t val)` | `ST1 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p8_x2(poly8_t *ptr, poly8x16x2_t val)` | `ST1 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p16_x2(poly16_t *ptr, poly16x4x2_t val)` | `ST1 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p16_x2(poly16_t *ptr, poly16x8x2_t val)` | `ST1 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s64_x2(int64_t *ptr, int64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u64_x2(uint64_t *ptr, uint64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p64_x2(poly64_t *ptr, poly64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | A32/A64 |
| `void vst1q_s64_x2(int64_t *ptr, int64x2x2_t val)` | `ST1 {Vt.2D - Vt2.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u64_x2(uint64_t *ptr, uint64x2x2_t val)` | `ST1 {Vt.2D - Vt2.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p64_x2(poly64_t *ptr, poly64x2x2_t val)` | `ST1 {Vt.2D - Vt2.2D},[Xn]` | `` | A32/A64 |
| `void vst1_f64_x2(float64_t *ptr, float64x1x2_t val)` | `ST1 {Vt.1D - Vt2.1D},[Xn]` | `` | A64 |
| `void vst1q_f64_x2(float64_t *ptr, float64x2x2_t val)` | `ST1 {Vt.2D - Vt2.2D},[Xn]` | `` | A64 |
| `void vst1_mf8_x2(mfloat8_t *ptr, mfloat8x8x2_t val)` | `ST1 {Vt.8B - Vt2.8B},[Xn]` | `` | A64 |
| `void vst1q_mf8_x2(mfloat8_t *ptr, mfloat8x16x2_t val)` | `ST1 {Vt.16B - Vt2.16B},[Xn]` | `` | A64 |
| `void vst1_s8_x3(int8_t *ptr, int8x8x3_t val)` | `ST1 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s8_x3(int8_t *ptr, int8x16x3_t val)` | `ST1 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s16_x3(int16_t *ptr, int16x4x3_t val)` | `ST1 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s16_x3(int16_t *ptr, int16x8x3_t val)` | `ST1 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s32_x3(int32_t *ptr, int32x2x3_t val)` | `ST1 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s32_x3(int32_t *ptr, int32x4x3_t val)` | `ST1 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u8_x3(uint8_t *ptr, uint8x8x3_t val)` | `ST1 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u8_x3(uint8_t *ptr, uint8x16x3_t val)` | `ST1 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u16_x3(uint16_t *ptr, uint16x4x3_t val)` | `ST1 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u16_x3(uint16_t *ptr, uint16x8x3_t val)` | `ST1 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u32_x3(uint32_t *ptr, uint32x2x3_t val)` | `ST1 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u32_x3(uint32_t *ptr, uint32x4x3_t val)` | `ST1 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f16_x3(float16_t *ptr, float16x4x3_t val)` | `ST1 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f16_x3(float16_t *ptr, float16x8x3_t val)` | `ST1 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f32_x3(float32_t *ptr, float32x2x3_t val)` | `ST1 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f32_x3(float32_t *ptr, float32x4x3_t val)` | `ST1 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p8_x3(poly8_t *ptr, poly8x8x3_t val)` | `ST1 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p8_x3(poly8_t *ptr, poly8x16x3_t val)` | `ST1 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p16_x3(poly16_t *ptr, poly16x4x3_t val)` | `ST1 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p16_x3(poly16_t *ptr, poly16x8x3_t val)` | `ST1 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s64_x3(int64_t *ptr, int64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u64_x3(uint64_t *ptr, uint64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p64_x3(poly64_t *ptr, poly64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | A32/A64 |
| `void vst1q_s64_x3(int64_t *ptr, int64x2x3_t val)` | `ST1 {Vt.2D - Vt3.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u64_x3(uint64_t *ptr, uint64x2x3_t val)` | `ST1 {Vt.2D - Vt3.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p64_x3(poly64_t *ptr, poly64x2x3_t val)` | `ST1 {Vt.2D - Vt3.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f64_x3(float64_t *ptr, float64x1x3_t val)` | `ST1 {Vt.1D - Vt3.1D},[Xn]` | `` | A64 |
| `void vst1q_f64_x3(float64_t *ptr, float64x2x3_t val)` | `ST1 {Vt.2D - Vt3.2D},[Xn]` | `` | A64 |
| `void vst1_mf8_x3(mfloat8_t *ptr, mfloat8x8x3_t val)` | `ST1 {Vt.8B - Vt3.8B},[Xn]` | `` | A64 |
| `void vst1q_mf8_x3(mfloat8_t *ptr, mfloat8x16x3_t val)` | `ST1 {Vt.16B - Vt3.16B},[Xn]` | `` | A64 |
| `void vst1_s8_x4(int8_t *ptr, int8x8x4_t val)` | `ST1 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s8_x4(int8_t *ptr, int8x16x4_t val)` | `ST1 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s16_x4(int16_t *ptr, int16x4x4_t val)` | `ST1 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s16_x4(int16_t *ptr, int16x8x4_t val)` | `ST1 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s32_x4(int32_t *ptr, int32x2x4_t val)` | `ST1 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_s32_x4(int32_t *ptr, int32x4x4_t val)` | `ST1 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u8_x4(uint8_t *ptr, uint8x8x4_t val)` | `ST1 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u8_x4(uint8_t *ptr, uint8x16x4_t val)` | `ST1 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u16_x4(uint16_t *ptr, uint16x4x4_t val)` | `ST1 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u16_x4(uint16_t *ptr, uint16x8x4_t val)` | `ST1 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u32_x4(uint32_t *ptr, uint32x2x4_t val)` | `ST1 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u32_x4(uint32_t *ptr, uint32x4x4_t val)` | `ST1 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f16_x4(float16_t *ptr, float16x4x4_t val)` | `ST1 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f16_x4(float16_t *ptr, float16x8x4_t val)` | `ST1 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_f32_x4(float32_t *ptr, float32x2x4_t val)` | `ST1 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_f32_x4(float32_t *ptr, float32x4x4_t val)` | `ST1 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p8_x4(poly8_t *ptr, poly8x8x4_t val)` | `ST1 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p8_x4(poly8_t *ptr, poly8x16x4_t val)` | `ST1 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p16_x4(poly16_t *ptr, poly16x4x4_t val)` | `ST1 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p16_x4(poly16_t *ptr, poly16x8x4_t val)` | `ST1 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst1_s64_x4(int64_t *ptr, int64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_u64_x4(uint64_t *ptr, uint64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | v7/A32/A64 |
| `void vst1_p64_x4(poly64_t *ptr, poly64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | A32/A64 |
| `void vst1q_s64_x4(int64_t *ptr, int64x2x4_t val)` | `ST1 {Vt.2D - Vt4.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_u64_x4(uint64_t *ptr, uint64x2x4_t val)` | `ST1 {Vt.2D - Vt4.2D},[Xn]` | `` | v7/A32/A64 |
| `void vst1q_p64_x4(poly64_t *ptr, poly64x2x4_t val)` | `ST1 {Vt.2D - Vt4.2D},[Xn]` | `` | A32/A64 |
| `void vst1_f64_x4(float64_t *ptr, float64x1x4_t val)` | `ST1 {Vt.1D - Vt4.1D},[Xn]` | `` | A64 |
| `void vst1q_f64_x4(float64_t *ptr, float64x2x4_t val)` | `ST1 {Vt.2D - Vt4.2D},[Xn]` | `` | A64 |
| `void vst1_mf8_x4(int8_t *ptr, int8x8x4_t val)` | `ST1 {Vt.8B - Vt4.8B},[Xn]` | `` | A64 |
| `void vst1q_mf8_x4(int8_t *ptr, int8x16x4_t val)` | `ST1 {Vt.16B - Vt4.16B},[Xn]` | `` | A64 |
| `void vst1_bf16(bfloat16_t *ptr, bfloat16x4_t val)` | `ST1 {Vt.4H},[Xn]` | `` | A32/A64 |
| `void vst1q_bf16(bfloat16_t *ptr, bfloat16x8_t val)` | `ST1 {Vt.8H},[Xn]` | `` | A32/A64 |
| `void vst1_lane_bf16(bfloat16_t *ptr, bfloat16x4_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | A32/A64 |
| `void vst1q_lane_bf16(bfloat16_t *ptr, bfloat16x8_t val, __builtin_constant_p(lane))` | `ST1 {Vt.h}[lane],[Xn]` | `` | A32/A64 |
| `void vst1_bf16_x2(bfloat16_t *ptr, bfloat16x4x2_t val)` | `ST1 {Vt.4H - Vt2.4H},[Xn]` | `` | A32/A64 |
| `void vst1q_bf16_x2(bfloat16_t *ptr, bfloat16x8x2_t val)` | `ST1 {Vt.8H - Vt2.8H},[Xn]` | `` | A32/A64 |
| `void vst1_bf16_x3(bfloat16_t *ptr, bfloat16x4x3_t val)` | `ST1 {Vt.4H - Vt3.4H},[Xn]` | `` | A32/A64 |
| `void vst1q_bf16_x3(bfloat16_t *ptr, bfloat16x8x3_t val)` | `ST1 {Vt.8H - Vt3.8H},[Xn]` | `` | A32/A64 |
| `void vst1_bf16_x4(bfloat16_t *ptr, bfloat16x4x4_t val)` | `ST1 {Vt.4H - Vt4.4H},[Xn]` | `` | A32/A64 |
| `void vst1q_bf16_x4(bfloat16_t *ptr, bfloat16x8x4_t val)` | `ST1 {Vt.8H - Vt4.8H},[Xn]` | `` | A32/A64 |

---

## ST2

**Description:** Store multiple 2-element structures from two registers. This instruction stores multiple 2-element structures from two SIMD&FP registers to memory, with interleaving. Every element of each register is stored.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vst2_s8(int8_t *ptr, int8x8x2_t val)` | `ST2 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_s8(int8_t *ptr, int8x16x2_t val)` | `ST2 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst2_s16(int16_t *ptr, int16x4x2_t val)` | `ST2 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_s16(int16_t *ptr, int16x8x2_t val)` | `ST2 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst2_s32(int32_t *ptr, int32x2x2_t val)` | `ST2 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_s32(int32_t *ptr, int32x4x2_t val)` | `ST2 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst2_u8(uint8_t *ptr, uint8x8x2_t val)` | `ST2 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_u8(uint8_t *ptr, uint8x16x2_t val)` | `ST2 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst2_u16(uint16_t *ptr, uint16x4x2_t val)` | `ST2 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_u16(uint16_t *ptr, uint16x8x2_t val)` | `ST2 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst2_u32(uint32_t *ptr, uint32x2x2_t val)` | `ST2 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_u32(uint32_t *ptr, uint32x4x2_t val)` | `ST2 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst2_f16(float16_t *ptr, float16x4x2_t val)` | `ST2 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_f16(float16_t *ptr, float16x8x2_t val)` | `ST2 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst2_f32(float32_t *ptr, float32x2x2_t val)` | `ST2 {Vt.2S - Vt2.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_f32(float32_t *ptr, float32x4x2_t val)` | `ST2 {Vt.4S - Vt2.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst2_p8(poly8_t *ptr, poly8x8x2_t val)` | `ST2 {Vt.8B - Vt2.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_p8(poly8_t *ptr, poly8x16x2_t val)` | `ST2 {Vt.16B - Vt2.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst2_p16(poly16_t *ptr, poly16x4x2_t val)` | `ST2 {Vt.4H - Vt2.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_p16(poly16_t *ptr, poly16x8x2_t val)` | `ST2 {Vt.8H - Vt2.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst2q_s64(int64_t *ptr, int64x2x2_t val)` | `ST2 {Vt.2D - Vt2.2D},[Xn]` | `` | A64 |
| `void vst2q_u64(uint64_t *ptr, uint64x2x2_t val)` | `ST2 {Vt.2D - Vt2.2D},[Xn]` | `` | A64 |
| `void vst2q_p64(poly64_t *ptr, poly64x2x2_t val)` | `ST2 {Vt.2D - Vt2.2D},[Xn]` | `` | A64 |
| `void vst2q_f64(float64_t *ptr, float64x2x2_t val)` | `ST2 {Vt.2D - Vt2.2D},[Xn]` | `` | A64 |
| `void vst2_mf8(mfloat8_t *ptr, mfloat8x8x2_t val)` | `ST2 {Vt.8B - Vt2.8B},[Xn]` | `` | A64 |
| `void vst2q_mf8(mfloat8_t *ptr, mfloat8x16x2_t val)` | `ST2 {Vt.16B - Vt2.16B},[Xn]` | `` | A64 |
| `void vst2_lane_s8(int8_t *ptr, int8x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_u8(uint8_t *ptr, uint8x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_p8(poly8_t *ptr, poly8x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_mf8(mfloat8_t *ptr, mfloat8x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | A64 |
| `void vst2_lane_s16(int16_t *ptr, int16x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_s16(int16_t *ptr, int16x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_s32(int32_t *ptr, int32x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_s32(int32_t *ptr, int32x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_u16(uint16_t *ptr, uint16x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_u16(uint16_t *ptr, uint16x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_u32(uint32_t *ptr, uint32x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_u32(uint32_t *ptr, uint32x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_f16(float16_t *ptr, float16x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_f16(float16_t *ptr, float16x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_f32(float32_t *ptr, float32x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_f32(float32_t *ptr, float32x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.s - Vt2.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2_lane_p16(poly16_t *ptr, poly16x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_p16(poly16_t *ptr, poly16x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst2q_lane_s8(int8_t *ptr, int8x16x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_u8(uint8_t *ptr, uint8x16x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_p8(poly8_t *ptr, poly8x16x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_mf8(mfloat8_t *ptr, mfloat8x16x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.b - Vt2.b}[lane],[Xn]` | `` | A64 |
| `void vst2_lane_s64(int64_t *ptr, int64x1x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_s64(int64_t *ptr, int64x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2_lane_u64(uint64_t *ptr, uint64x1x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_u64(uint64_t *ptr, uint64x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2_lane_p64(poly64_t *ptr, poly64x1x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_p64(poly64_t *ptr, poly64x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2_lane_f64(float64_t *ptr, float64x1x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2q_lane_f64(float64_t *ptr, float64x2x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.d - Vt2.d}[lane],[Xn]` | `` | A64 |
| `void vst2_bf16(bfloat16_t *ptr, bfloat16x4x2_t val)` | `ST2 {Vt.4H - Vt2.4H},[Xn]` | `` | A32/A64 |
| `void vst2q_bf16(bfloat16_t *ptr, bfloat16x8x2_t val)` | `ST2 {Vt.8H - Vt2.8H},[Xn]` | `` | A32/A64 |
| `void vst2_lane_bf16(bfloat16_t *ptr, bfloat16x4x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | A32/A64 |
| `void vst2q_lane_bf16(bfloat16_t *ptr, bfloat16x8x2_t val, __builtin_constant_p(lane))` | `ST2 {Vt.h - Vt2.h}[lane],[Xn]` | `` | A32/A64 |

---

## ST3

**Description:** Store multiple 3-element structures from three registers. This instruction stores multiple 3-element structures to memory from three SIMD&FP registers, with interleaving. Every element of each register is stored.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vst3_s8(int8_t *ptr, int8x8x3_t val)` | `ST3 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_s8(int8_t *ptr, int8x16x3_t val)` | `ST3 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst3_s16(int16_t *ptr, int16x4x3_t val)` | `ST3 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_s16(int16_t *ptr, int16x8x3_t val)` | `ST3 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst3_s32(int32_t *ptr, int32x2x3_t val)` | `ST3 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_s32(int32_t *ptr, int32x4x3_t val)` | `ST3 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst3_u8(uint8_t *ptr, uint8x8x3_t val)` | `ST3 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_u8(uint8_t *ptr, uint8x16x3_t val)` | `ST3 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst3_u16(uint16_t *ptr, uint16x4x3_t val)` | `ST3 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_u16(uint16_t *ptr, uint16x8x3_t val)` | `ST3 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst3_u32(uint32_t *ptr, uint32x2x3_t val)` | `ST3 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_u32(uint32_t *ptr, uint32x4x3_t val)` | `ST3 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst3_f16(float16_t *ptr, float16x4x3_t val)` | `ST3 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_f16(float16_t *ptr, float16x8x3_t val)` | `ST3 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst3_f32(float32_t *ptr, float32x2x3_t val)` | `ST3 {Vt.2S - Vt3.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_f32(float32_t *ptr, float32x4x3_t val)` | `ST3 {Vt.4S - Vt3.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst3_p8(poly8_t *ptr, poly8x8x3_t val)` | `ST3 {Vt.8B - Vt3.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_p8(poly8_t *ptr, poly8x16x3_t val)` | `ST3 {Vt.16B - Vt3.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst3_p16(poly16_t *ptr, poly16x4x3_t val)` | `ST3 {Vt.4H - Vt3.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_p16(poly16_t *ptr, poly16x8x3_t val)` | `ST3 {Vt.8H - Vt3.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst3q_s64(int64_t *ptr, int64x2x3_t val)` | `ST3 {Vt.2D - Vt3.2D},[Xn]` | `` | A64 |
| `void vst3q_u64(uint64_t *ptr, uint64x2x3_t val)` | `ST3 {Vt.2D - Vt3.2D},[Xn]` | `` | A64 |
| `void vst3q_p64(poly64_t *ptr, poly64x2x3_t val)` | `ST3 {Vt.2D - Vt3.2D},[Xn]` | `` | A64 |
| `void vst3q_f64(float64_t *ptr, float64x2x3_t val)` | `ST3 {Vt.2D - Vt3.2D},[Xn]` | `` | A64 |
| `void vst3_mf8(mfloat8_t *ptr, mfloat8x8x3_t val)` | `ST3 {Vt.8B - Vt3.8B},[Xn]` | `` | A64 |
| `void vst3q_mf8(mfloat8_t *ptr, mfloat8x16x3_t val)` | `ST3 {Vt.16B - Vt3.16B},[Xn]` | `` | A64 |
| `void vst3_lane_s8(int8_t *ptr, int8x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_u8(uint8_t *ptr, uint8x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_p8(poly8_t *ptr, poly8x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_mf8(mfloat8_t *ptr, mfloat8x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | A64 |
| `void vst3_lane_s16(int16_t *ptr, int16x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_s16(int16_t *ptr, int16x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_s32(int32_t *ptr, int32x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_s32(int32_t *ptr, int32x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_u16(uint16_t *ptr, uint16x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_u16(uint16_t *ptr, uint16x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_u32(uint32_t *ptr, uint32x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_u32(uint32_t *ptr, uint32x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_f16(float16_t *ptr, float16x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_f16(float16_t *ptr, float16x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_f32(float32_t *ptr, float32x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_f32(float32_t *ptr, float32x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.s - Vt3.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_p16(poly16_t *ptr, poly16x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_p16(poly16_t *ptr, poly16x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_s8(int8_t *ptr, int8x16x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_u8(uint8_t *ptr, uint8x16x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3q_lane_p8(poly8_t *ptr, poly8x16x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst3_lane_s64(int64_t *ptr, int64x1x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3q_lane_s64(int64_t *ptr, int64x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3_lane_u64(uint64_t *ptr, uint64x1x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3q_lane_u64(uint64_t *ptr, uint64x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3_lane_p64(poly64_t *ptr, poly64x1x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3q_lane_p64(poly64_t *ptr, poly64x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3_lane_f64(float64_t *ptr, float64x1x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3q_lane_f64(float64_t *ptr, float64x2x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.d - Vt3.d}[lane],[Xn]` | `` | A64 |
| `void vst3q_lane_mf8(mfloat8_t *ptr, mfloat8x16x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.b - Vt3.b}[lane],[Xn]` | `` | A64 |
| `void vst3_bf16(bfloat16_t *ptr, bfloat16x4x3_t val)` | `ST3 {Vt.4H - Vt3.4H},[Xn]` | `` | A32/A64 |
| `void vst3q_bf16(bfloat16_t *ptr, bfloat16x8x3_t val)` | `ST3 {Vt.8H - Vt3.8H},[Xn]` | `` | A32/A64 |
| `void vst3_lane_bf16(bfloat16_t *ptr, bfloat16x4x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | A32/A64 |
| `void vst3q_lane_bf16(bfloat16_t *ptr, bfloat16x8x3_t val, __builtin_constant_p(lane))` | `ST3 {Vt.h - Vt3.h}[lane],[Xn]` | `` | A32/A64 |

---

## ST4

**Description:** Store multiple 4-element structures from four registers. This instruction stores multiple 4-element structures to memory from four SIMD&FP registers, with interleaving. Every element of each register is stored.

**Operation:**
```
CheckFPAdvSIMDEnabled64();

bits(64) address;
bits(64) offs;
bits(datasize) rval;
integer tt;
constant integer ebytes = esize DIV 8;

if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

offs = Zeros();
for r = 0 to rpt-1
    for e = 0 to elements-1
        tt = (t + r) MOD 32;
        for s = 0 to selem-1
            rval = V[tt];
            if memop == MemOp_LOAD then
                Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
                V[tt] = rval;
            else // memop == MemOp_STORE
                Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
            offs = offs + ebytes;
            tt = (tt + 1) MOD 32;

if wback then
    if m != 31 then
        offs = X[m];
    if n == 31 then
        SP[] = address + offs;
    else
        X[n] = address + offs;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vst4_s8(int8_t *ptr, int8x8x4_t val)` | `ST4 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_s8(int8_t *ptr, int8x16x4_t val)` | `ST4 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst4_s16(int16_t *ptr, int16x4x4_t val)` | `ST4 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_s16(int16_t *ptr, int16x8x4_t val)` | `ST4 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst4_s32(int32_t *ptr, int32x2x4_t val)` | `ST4 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_s32(int32_t *ptr, int32x4x4_t val)` | `ST4 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst4_u8(uint8_t *ptr, uint8x8x4_t val)` | `ST4 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_u8(uint8_t *ptr, uint8x16x4_t val)` | `ST4 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst4_u16(uint16_t *ptr, uint16x4x4_t val)` | `ST4 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_u16(uint16_t *ptr, uint16x8x4_t val)` | `ST4 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst4_u32(uint32_t *ptr, uint32x2x4_t val)` | `ST4 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_u32(uint32_t *ptr, uint32x4x4_t val)` | `ST4 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst4_f16(float16_t *ptr, float16x4x4_t val)` | `ST4 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_f16(float16_t *ptr, float16x8x4_t val)` | `ST4 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst4_f32(float32_t *ptr, float32x2x4_t val)` | `ST4 {Vt.2S - Vt4.2S},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_f32(float32_t *ptr, float32x4x4_t val)` | `ST4 {Vt.4S - Vt4.4S},[Xn]` | `` | v7/A32/A64 |
| `void vst4_p8(poly8_t *ptr, poly8x8x4_t val)` | `ST4 {Vt.8B - Vt4.8B},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_p8(poly8_t *ptr, poly8x16x4_t val)` | `ST4 {Vt.16B - Vt4.16B},[Xn]` | `` | v7/A32/A64 |
| `void vst4_p16(poly16_t *ptr, poly16x4x4_t val)` | `ST4 {Vt.4H - Vt4.4H},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_p16(poly16_t *ptr, poly16x8x4_t val)` | `ST4 {Vt.8H - Vt4.8H},[Xn]` | `` | v7/A32/A64 |
| `void vst4q_s64(int64_t *ptr, int64x2x4_t val)` | `ST4 {Vt.2D - Vt4.2D},[Xn]` | `` | A64 |
| `void vst4q_u64(uint64_t *ptr, uint64x2x4_t val)` | `ST4 {Vt.2D - Vt4.2D},[Xn]` | `` | A64 |
| `void vst4q_p64(poly64_t *ptr, poly64x2x4_t val)` | `ST4 {Vt.2D - Vt4.2D},[Xn]` | `` | A64 |
| `void vst4q_f64(float64_t *ptr, float64x2x4_t val)` | `ST4 {Vt.2D - Vt4.2D},[Xn]` | `` | A64 |
| `void vst4_mf8(mfloat8_t *ptr, mfloat8x8x4_t val)` | `ST4 {Vt.8B - Vt4.8B},[Xn]` | `` | A64 |
| `void vst4q_mf8(mfloat8_t *ptr, mfloat8x16x4_t val)` | `ST4 {Vt.16B - Vt4.16B},[Xn]` | `` | A64 |
| `void vst4_lane_s8(int8_t *ptr, int8x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_u8(uint8_t *ptr, uint8x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_p8(poly8_t *ptr, poly8x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_mf8(mfloat8_t *ptr, mfloat8x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | A64 |
| `void vst4_lane_s16(int16_t *ptr, int16x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_s16(int16_t *ptr, int16x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_s32(int32_t *ptr, int32x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_s32(int32_t *ptr, int32x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_u16(uint16_t *ptr, uint16x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_u16(uint16_t *ptr, uint16x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_u32(uint32_t *ptr, uint32x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_u32(uint32_t *ptr, uint32x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_f16(float16_t *ptr, float16x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_f16(float16_t *ptr, float16x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_f32(float32_t *ptr, float32x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_f32(float32_t *ptr, float32x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.s - Vt4.s}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4_lane_p16(poly16_t *ptr, poly16x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_p16(poly16_t *ptr, poly16x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | v7/A32/A64 |
| `void vst4q_lane_s8(int8_t *ptr, int8x16x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_u8(uint8_t *ptr, uint8x16x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_p8(poly8_t *ptr, poly8x16x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | A64 |
| `void vst4_lane_s64(int64_t *ptr, int64x1x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_s64(int64_t *ptr, int64x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4_lane_u64(uint64_t *ptr, uint64x1x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_u64(uint64_t *ptr, uint64x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4_lane_p64(poly64_t *ptr, poly64x1x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_p64(poly64_t *ptr, poly64x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4_lane_f64(float64_t *ptr, float64x1x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_f64(float64_t *ptr, float64x2x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.d - Vt4.d}[lane],[Xn]` | `` | A64 |
| `void vst4q_lane_mf8(mfloat8_t *ptr, mfloat8x16x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.b - Vt4.b}[lane],[Xn]` | `` | A64 |
| `void vst4_bf16(bfloat16_t *ptr, bfloat16x4x4_t val)` | `ST4 {Vt.4H - Vt4.4H},[Xn]` | `` | A32/A64 |
| `void vst4q_bf16(bfloat16_t *ptr, bfloat16x8x4_t val)` | `ST4 {Vt.8H - Vt4.8H},[Xn]` | `` | A32/A64 |
| `void vst4_lane_bf16(bfloat16_t *ptr, bfloat16x4x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | A32/A64 |
| `void vst4q_lane_bf16(bfloat16_t *ptr, bfloat16x8x4_t val, __builtin_constant_p(lane))` | `ST4 {Vt.h - Vt4.h}[lane],[Xn]` | `` | A32/A64 |

---

## STL1

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vstl1_lane_u64(uint64_t *ptr, uint64x1_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1q_lane_u64(uint64_t *ptr, uint64x2_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1_lane_s64(int64_t *ptr, int64x1_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1q_lane_s64(int64_t *ptr, int64x2_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1_lane_f64(float64_t *ptr, float64x1_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1q_lane_f64(float64_t *ptr, float64x2_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1_lane_p64(poly64_t *ptr, poly64x1_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |
| `void vstl1q_lane_p64(poly64_t *ptr, poly64x2_t val, __builtin_constant_p(lane))` | `STL1 {Vt.d}[lane],[Xn]` | `` | A64 |

---

## STR

**Description:** Store SIMD&FP register (immediate offset). This instruction stores a single SIMD&FP register to memory. The address that is used for the store is calculated from a base register value and an immediate offset.

**Operation:**
```
if HaveMTE2Ext() then
    SetTagCheckedInstruction(tag_checked);

CheckFPAdvSIMDEnabled64();
bits(64) address;
bits(datasize) data;

if n == 31 then
    CheckSPAlignment();
    address = SP[];
else
    address = X[n];

if ! postindex then
    address = address + offset;

case memop of
    when MemOp_STORE
        data = V[t];
        Mem[address, datasize DIV 8, acctype] = data;

    when MemOp_LOAD
        data = Mem[address, datasize DIV 8, acctype];
        V[t] = data;

if wback then
    if postindex then
        address = address + offset;
    if n == 31 then
        SP[] = address;
    else
        X[n] = address;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `void vstrq_p128(poly128_t *ptr, poly128_t val)` | `STR Qt,[Xn]` | `` | A32/A64 |

---

## SUB

**Description:** Subtract (vector). This instruction subtracts each vector element in the second source SIMD&FP register from the corresponding vector element in the first source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(esize) element1;
bits(esize) element2;

for e = 0 to elements-1
    element1 = Elem[operand1, e, esize];
    element2 = Elem[operand2, e, esize];
    if sub_op then
        Elem[result, e, esize] = element1 - element2;
    else
        Elem[result, e, esize] = element1 + element2;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vsub_s8(int8x8_t a, int8x8_t b)` | `SUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `int8x16_t vsubq_s8(int8x16_t a, int8x16_t b)` | `SUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x4_t vsub_s16(int16x4_t a, int16x4_t b)` | `SUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `int16x8_t vsubq_s16(int16x8_t a, int16x8_t b)` | `SUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x2_t vsub_s32(int32x2_t a, int32x2_t b)` | `SUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `int32x4_t vsubq_s32(int32x4_t a, int32x4_t b)` | `SUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `int64x1_t vsub_s64(int64x1_t a, int64x1_t b)` | `SUB Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `int64x2_t vsubq_s64(int64x2_t a, int64x2_t b)` | `SUB Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8x8_t vsub_u8(uint8x8_t a, uint8x8_t b)` | `SUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vsubq_u8(uint8x16_t a, uint8x16_t b)` | `SUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vsub_u16(uint16x4_t a, uint16x4_t b)` | `SUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vsubq_u16(uint16x8_t a, uint16x8_t b)` | `SUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vsub_u32(uint32x2_t a, uint32x2_t b)` | `SUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vsubq_u32(uint32x4_t a, uint32x4_t b)` | `SUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vsub_u64(uint64x1_t a, uint64x1_t b)` | `SUB Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vsubq_u64(uint64x2_t a, uint64x2_t b)` | `SUB Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `int64_t vsubd_s64(int64_t a, int64_t b)` | `SUB Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint64_t vsubd_u64(uint64_t a, uint64_t b)` | `SUB Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## SUBHN

**Description:** Subtract returning High Narrow. This instruction subtracts each vector element in the second source SIMD&FP register from the corresponding vector element in the first source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vsubhn_s16(int16x8_t a, int16x8_t b)` | `SUBHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vsubhn_s32(int32x4_t a, int32x4_t b)` | `SUBHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vsubhn_s64(int64x2_t a, int64x2_t b)` | `SUBHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vsubhn_u16(uint16x8_t a, uint16x8_t b)` | `SUBHN Vd.8B,Vn.8H,Vm.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vsubhn_u32(uint32x4_t a, uint32x4_t b)` | `SUBHN Vd.4H,Vn.4S,Vm.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vsubhn_u64(uint64x2_t a, uint64x2_t b)` | `SUBHN Vd.2S,Vn.2D,Vm.2D` | `Vd.2S -> result` | v7/A32/A64 |

---

## SUBHN2

**Description:** Subtract returning High Narrow. This instruction subtracts each vector element in the second source SIMD&FP register from the corresponding vector element in the first source SIMD&FP register, places the most significant half of the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(2*datasize) operand2 = V[m];
bits(datasize)   result;
integer round_const = if round then 1 << (esize - 1) else 0;
bits(2*esize) element1;
bits(2*esize) element2;
bits(2*esize) sum;

for e = 0 to elements-1
    element1 = Elem[operand1, e, 2*esize];
    element2 = Elem[operand2, e, 2*esize];
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    sum = sum + round_const;
    Elem[result, e, esize] = sum<2*esize-1:esize>;

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vsubhn_high_s16(int8x8_t r, int16x8_t a, int16x8_t b)` | `SUBHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `int16x8_t vsubhn_high_s32(int16x4_t r, int32x4_t a, int32x4_t b)` | `SUBHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `int32x4_t vsubhn_high_s64(int32x2_t r, int64x2_t a, int64x2_t b)` | `SUBHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |
| `uint8x16_t vsubhn_high_u16(uint8x8_t r, uint16x8_t a, uint16x8_t b)` | `SUBHN2 Vd.16B,Vn.8H,Vm.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vsubhn_high_u32(uint16x4_t r, uint32x4_t a, uint32x4_t b)` | `SUBHN2 Vd.8H,Vn.4S,Vm.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vsubhn_high_u64(uint32x2_t r, uint64x2_t a, uint64x2_t b)` | `SUBHN2 Vd.4S,Vn.2D,Vm.2D` | `Vd.4S -> result` | A64 |

---

## SUDOT

**Description:** Dot product index form with signed and unsigned integers. This instruction performs the dot product of the four signed 8-bit integer values in each 32-bit element of the first source register with the four unsigned 8-bit integer values in an indexed 32-bit element of the second source register, accumulating the result into the corresponding 32-bit element of the destination vector.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(128)      operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;

for e = 0 to elements-1
    bits(32) res = Elem[operand3, e, 32];
    for b = 0 to 3
        integer element1 = Int(Elem[operand1, 4 * e + b, 8], op1_unsigned);
        integer element2 = Int(Elem[operand2, 4 * i + b, 8], op2_unsigned);
        res = res + element1 * element2;
    Elem[result, e, 32] = res;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vsudot_lane_s32(int32x2_t r, int8x8_t a, uint8x8_t b, __builtin_constant_p(lane))` | `SUDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x2_t vsudot_laneq_s32(int32x2_t r, int8x8_t a, uint8x16_t b, __builtin_constant_p(lane))` | `SUDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vsudotq_lane_s32(int32x4_t r, int8x16_t a, uint8x8_t b, __builtin_constant_p(lane))` | `SUDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |
| `int32x4_t vsudotq_laneq_s32(int32x4_t r, int8x16_t a, uint8x16_t b, __builtin_constant_p(lane))` | `SUDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |

---

## SUQADD

**Description:** Signed saturating Accumulate of Unsigned value. This instruction adds the unsigned integer values of the vector elements in the source SIMD&FP register to corresponding signed integer values of the vector elements in the destination SIMD&FP register, and writes the resulting signed integer values to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(datasize) operand2 = V[d];
integer op1;
integer op2;
boolean sat;

for e = 0 to elements-1
    op1 = Int(Elem[operand, e, esize], !unsigned);
    op2 = Int(Elem[operand2, e, esize], unsigned);
    (Elem[result, e, esize], sat) = SatQ(op1 + op2, esize, unsigned);
    if sat then FPSR.QC = '1';
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vuqadd_s8(int8x8_t a, uint8x8_t b)` | `SUQADD Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vuqaddq_s8(int8x16_t a, uint8x16_t b)` | `SUQADD Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vuqadd_s16(int16x4_t a, uint16x4_t b)` | `SUQADD Vd.4H,Vn.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vuqaddq_s16(int16x8_t a, uint16x8_t b)` | `SUQADD Vd.8H,Vn.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vuqadd_s32(int32x2_t a, uint32x2_t b)` | `SUQADD Vd.2S,Vn.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vuqaddq_s32(int32x4_t a, uint32x4_t b)` | `SUQADD Vd.4S,Vn.4S` | `Vd.4S -> result` | A64 |
| `int64x1_t vuqadd_s64(int64x1_t a, uint64x1_t b)` | `SUQADD Dd,Dn` | `Dd -> result` | A64 |
| `int64x2_t vuqaddq_s64(int64x2_t a, uint64x2_t b)` | `SUQADD Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `int8_t vuqaddb_s8(int8_t a, uint8_t b)` | `SUQADD Bd,Bn` | `Bd -> result` | A64 |
| `int16_t vuqaddh_s16(int16_t a, uint16_t b)` | `SUQADD Hd,Hn` | `Hd -> result` | A64 |
| `int32_t vuqadds_s32(int32_t a, uint32_t b)` | `SUQADD Sd,Sn` | `Sd -> result` | A64 |
| `int64_t vuqaddd_s64(int64_t a, uint64_t b)` | `SUQADD Dd,Dn` | `Dd -> result` | A64 |

---

## TBL

**Description:** Table vector Lookup. This instruction reads each value from the vector elements in the index source SIMD&FP register, uses each result as an index to perform a lookup in a table of bytes that is described by one to four source table SIMD&FP registers, places the lookup result in a vector, and writes the vector to the destination SIMD&FP register. If an index is out of range for the table, the result for that lookup is 0. If more than one source register is used to describe the table, the first source register describes the lowest bytes of the table.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) indices = V[m];
bits(128*regs) table = Zeros();
bits(datasize) result;
integer index;

// Create table from registers
for i = 0 to regs - 1
    table<128*i+127:128*i> = V[n];
    n = (n + 1) MOD 32;

result = if is_tbl then Zeros() else V[d];
for i = 0 to elements - 1
    index = UInt(Elem[indices, i, 8]);
    if index < 16 * regs then
        Elem[result, i, 8] = Elem[table, index, 8];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vtbl1_s8(int8x8_t a, int8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbl1_u8(uint8x8_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbl1_p8(poly8x8_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbl1_mf8(mfloat8x8_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vtbl2_s8(int8x8x2_t a, int8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbl2_u8(uint8x8x2_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbl2_p8(poly8x8x2_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbl2_mf8(mfloat8x8x2_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vtbl3_s8(int8x8x3_t a, int8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbl3_u8(uint8x8x3_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbl3_p8(poly8x8x3_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbl3_mf8(mfloat8x8x3_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vtbl4_s8(int8x8x4_t a, int8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbl4_u8(uint8x8x4_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbl4_p8(poly8x8x4_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbl4_mf8(mfloat8x8x4_t a, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vqtbl1_s8(int8x16_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbl1q_s8(int8x16_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbl1_u8(uint8x16_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbl1q_u8(uint8x16_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbl1_p8(poly8x16_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbl1q_p8(poly8x16_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbl1_mf8(mfloat8x16_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbl1q_mf8(mfloat8x16_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbl2_s8(int8x16x2_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbl2q_s8(int8x16x2_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbl2_u8(uint8x16x2_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbl2q_u8(uint8x16x2_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbl2_p8(poly8x16x2_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbl2q_p8(poly8x16x2_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbl2_mf8(mfloat8x16x2_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbl2q_mf8(mfloat8x16x2_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbl3_s8(int8x16x3_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbl3q_s8(int8x16x3_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbl3_u8(uint8x16x3_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbl3q_u8(uint8x16x3_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbl3_p8(poly8x16x3_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbl3q_p8(poly8x16x3_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbl3_mf8(mfloat8x16x3_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbl3q_mf8(mfloat8x16x3_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbl4_s8(int8x16x4_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbl4q_s8(int8x16x4_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbl4_u8(uint8x16x4_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbl4q_u8(uint8x16x4_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbl4_p8(poly8x16x4_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbl4q_p8(poly8x16x4_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbl4_mf8(mfloat8x16x4_t t, uint8x8_t idx)` | `TBL Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbl4q_mf8(mfloat8x16x4_t t, uint8x16_t idx)` | `TBL Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |

---

## TBX

**Description:** Table vector lookup extension. This instruction reads each value from the vector elements in the index source SIMD&FP register, uses each result as an index to perform a lookup in a table of bytes that is described by one to four source table SIMD&FP registers, places the lookup result in a vector, and writes the vector to the destination SIMD&FP register. If an index is out of range for the table, the existing value in the vector element of the destination register is left unchanged. If more than one source register is used to describe the table, the first source register describes the lowest bytes of the table.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) indices = V[m];
bits(128*regs) table = Zeros();
bits(datasize) result;
integer index;

// Create table from registers
for i = 0 to regs - 1
    table<128*i+127:128*i> = V[n];
    n = (n + 1) MOD 32;

result = if is_tbl then Zeros() else V[d];
for i = 0 to elements - 1
    index = UInt(Elem[indices, i, 8]);
    if index < 16 * regs then
        Elem[result, i, 8] = Elem[table, index, 8];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vtbx2_s8(int8x8_t a, int8x8x2_t b, int8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbx2_u8(uint8x8_t a, uint8x8x2_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbx2_p8(poly8x8_t a, poly8x8x2_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbx2_mf8(mfloat8x8_t a, mfloat8x8x2_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vtbx4_s8(int8x8_t a, int8x8x4_t b, int8x8_t idx)` | `TBX Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x8_t vtbx4_u8(uint8x8_t a, uint8x8x4_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `poly8x8_t vtbx4_p8(poly8x8_t a, poly8x8x4_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `mfloat8x8_t vtbx4_mf8(mfloat8x8_t a, mfloat8x8x4_t b, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B,Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x8_t vqtbx1_s8(int8x8_t a, int8x16_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbx1q_s8(int8x16_t a, int8x16_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbx1_u8(uint8x8_t a, uint8x16_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbx1q_u8(uint8x16_t a, uint8x16_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbx1_p8(poly8x8_t a, poly8x16_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbx1q_p8(poly8x16_t a, poly8x16_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbx1_mf8(mfloat8x8_t a, mfloat8x16_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbx1q_mf8(mfloat8x16_t a, mfloat8x16_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbx2_s8(int8x8_t a, int8x16x2_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbx2q_s8(int8x16_t a, int8x16x2_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbx2_u8(uint8x8_t a, uint8x16x2_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbx2q_u8(uint8x16_t a, uint8x16x2_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbx2_p8(poly8x8_t a, poly8x16x2_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbx2q_p8(poly8x16_t a, poly8x16x2_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbx2_mf8(mfloat8x8_t a, mfloat8x16x2_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+1.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbx2q_mf8(mfloat8x16_t a, mfloat8x16x2_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+1.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbx3_s8(int8x8_t a, int8x16x3_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbx3q_s8(int8x16_t a, int8x16x3_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbx3_u8(uint8x8_t a, uint8x16x3_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbx3q_u8(uint8x16_t a, uint8x16x3_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbx3_p8(poly8x8_t a, poly8x16x3_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbx3q_p8(poly8x16_t a, poly8x16x3_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbx3_mf8(mfloat8x8_t a, mfloat8x16x3_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+2.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbx3q_mf8(mfloat8x16_t a, mfloat8x16x3_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+2.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8_t vqtbx4_s8(int8x8_t a, int8x16x4_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vqtbx4q_s8(int8x16_t a, int8x16x4_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `uint8x8_t vqtbx4_u8(uint8x8_t a, uint8x16x4_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vqtbx4q_u8(uint8x16_t a, uint8x16x4_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `poly8x8_t vqtbx4_p8(poly8x8_t a, poly8x16x4_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vqtbx4q_p8(poly8x16_t a, poly8x16x4_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |
| `mfloat8x8_t vqtbx4_mf8(mfloat8x8_t a, mfloat8x16x4_t t, uint8x8_t idx)` | `TBX Vd.8B,{Vn.16B - Vn+3.16B},Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vqtbx4q_mf8(mfloat8x16_t a, mfloat8x16x4_t t, uint8x16_t idx)` | `TBX Vd.16B,{Vn.16B - Vn+3.16B},Vm.16B` | `Vd.16B -> result` | A64 |

---

## TRN1

**Description:** Transpose vectors (primary). This instruction reads corresponding even-numbered vector elements from the two source SIMD&FP registers, starting at zero, places each result into consecutive elements of a vector, and writes the vector to the destination SIMD&FP register. Vector elements from the first source register are placed into even-numbered elements of the destination vector, starting at zero, while vector elements from the second source register are placed into odd-numbered elements of the destination vector.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

for p = 0 to pairs-1
    Elem[result, 2*p+0, esize] = Elem[operand1, 2*p+part, esize];
    Elem[result, 2*p+1, esize] = Elem[operand2, 2*p+part, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vtrn1_s8(int8x8_t a, int8x8_t b)` | `TRN1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vtrn1q_s8(int8x16_t a, int8x16_t b)` | `TRN1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vtrn1_s16(int16x4_t a, int16x4_t b)` | `TRN1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vtrn1q_s16(int16x8_t a, int16x8_t b)` | `TRN1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vtrn1_s32(int32x2_t a, int32x2_t b)` | `TRN1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vtrn1q_s32(int32x4_t a, int32x4_t b)` | `TRN1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vtrn1q_s64(int64x2_t a, int64x2_t b)` | `TRN1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vtrn1_u8(uint8x8_t a, uint8x8_t b)` | `TRN1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vtrn1q_u8(uint8x16_t a, uint8x16_t b)` | `TRN1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vtrn1_u16(uint16x4_t a, uint16x4_t b)` | `TRN1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vtrn1q_u16(uint16x8_t a, uint16x8_t b)` | `TRN1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vtrn1_u32(uint32x2_t a, uint32x2_t b)` | `TRN1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vtrn1q_u32(uint32x4_t a, uint32x4_t b)` | `TRN1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vtrn1q_u64(uint64x2_t a, uint64x2_t b)` | `TRN1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vtrn1q_p64(poly64x2_t a, poly64x2_t b)` | `TRN1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vtrn1_f32(float32x2_t a, float32x2_t b)` | `TRN1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vtrn1q_f32(float32x4_t a, float32x4_t b)` | `TRN1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vtrn1q_f64(float64x2_t a, float64x2_t b)` | `TRN1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vtrn1_p8(poly8x8_t a, poly8x8_t b)` | `TRN1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vtrn1q_p8(poly8x16_t a, poly8x16_t b)` | `TRN1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vtrn1_p16(poly16x4_t a, poly16x4_t b)` | `TRN1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vtrn1q_p16(poly16x8_t a, poly16x8_t b)` | `TRN1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vtrn1_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `TRN1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vtrn1q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `TRN1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8x2_t vtrn_s8(int8x8_t a, int8x8_t b)` | `TRN1 Vd1.8B,Vn.8B,Vm.8B;TRN2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `int16x4x2_t vtrn_s16(int16x4_t a, int16x4_t b)` | `TRN1 Vd1.4H,Vn.4H,Vm.4H;TRN2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `uint8x8x2_t vtrn_u8(uint8x8_t a, uint8x8_t b)` | `TRN1 Vd1.8B,Vn.8B,Vm.8B;TRN2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `uint16x4x2_t vtrn_u16(uint16x4_t a, uint16x4_t b)` | `TRN1 Vd1.4H,Vn.4H,Vm.4H;TRN2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `poly8x8x2_t vtrn_p8(poly8x8_t a, poly8x8_t b)` | `TRN1 Vd1.8B,Vn.8B,Vm.8B;TRN2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `poly16x4x2_t vtrn_p16(poly16x4_t a, poly16x4_t b)` | `TRN1 Vd1.4H,Vn.4H,Vm.4H;TRN2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `int32x2x2_t vtrn_s32(int32x2_t a, int32x2_t b)` | `TRN1 Vd1.2S,Vn.2S,Vm.2S;TRN2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `float32x2x2_t vtrn_f32(float32x2_t a, float32x2_t b)` | `TRN1 Vd1.2S,Vn.2S,Vm.2S;TRN2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `uint32x2x2_t vtrn_u32(uint32x2_t a, uint32x2_t b)` | `TRN1 Vd1.2S,Vn.2S,Vm.2S;TRN2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `mfloat8x8x2_t vtrn_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `TRN1 Vd1.8B,Vn.8B,Vm.8B;TRN2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | A64 |
| `int8x16x2_t vtrnq_s8(int8x16_t a, int8x16_t b)` | `TRN1 Vd1.16B,Vn.16B,Vm.16B;TRN2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `int16x8x2_t vtrnq_s16(int16x8_t a, int16x8_t b)` | `TRN1 Vd1.8H,Vn.8H,Vm.8H;TRN2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `int32x4x2_t vtrnq_s32(int32x4_t a, int32x4_t b)` | `TRN1 Vd1.4S,Vn.4S,Vm.4S;TRN2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `float32x4x2_t vtrnq_f32(float32x4_t a, float32x4_t b)` | `TRN1 Vd1.4S,Vn.4S,Vm.4S;TRN2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `uint8x16x2_t vtrnq_u8(uint8x16_t a, uint8x16_t b)` | `TRN1 Vd1.16B,Vn.16B,Vm.16B;TRN2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `uint16x8x2_t vtrnq_u16(uint16x8_t a, uint16x8_t b)` | `TRN1 Vd1.8H,Vn.8H,Vm.8H;TRN2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `uint32x4x2_t vtrnq_u32(uint32x4_t a, uint32x4_t b)` | `TRN1 Vd1.4S,Vn.4S,Vm.4S;TRN2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `poly8x16x2_t vtrnq_p8(poly8x16_t a, poly8x16_t b)` | `TRN1 Vd1.16B,Vn.16B,Vm.16B;TRN2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `poly16x8x2_t vtrnq_p16(poly16x8_t a, poly16x8_t b)` | `TRN1 Vd1.8H,Vn.8H,Vm.8H;TRN2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `mfloat8x16x2_t vtrnq_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `TRN1 Vd1.16B,Vn.16B,Vm.16B;TRN2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | A64 |
| `float16x4x2_t vtrn_f16(float16x4_t a, float16x4_t b)` | `TRN1 Vd1.4H,Vn.4H,Vm.4H;TRN2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `float16x8x2_t vtrnq_f16(float16x8_t a, float16x8_t b)` | `TRN1 Vd1.8H,Vn.8H,Vm.8H;TRN2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `float16x4_t vtrn1_f16(float16x4_t a, float16x4_t b)` | `TRN1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vtrn1q_f16(float16x8_t a, float16x8_t b)` | `TRN1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## TRN2

**Description:** Transpose vectors (secondary). This instruction reads corresponding odd-numbered vector elements from the two source SIMD&FP registers, places each result into consecutive elements of a vector, and writes the vector to the destination SIMD&FP register. Vector elements from the first source register are placed into even-numbered elements of the destination vector, starting at zero, while vector elements from the second source register are placed into odd-numbered elements of the destination vector.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

for p = 0 to pairs-1
    Elem[result, 2*p+0, esize] = Elem[operand1, 2*p+part, esize];
    Elem[result, 2*p+1, esize] = Elem[operand2, 2*p+part, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vtrn2_s8(int8x8_t a, int8x8_t b)` | `TRN2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vtrn2q_s8(int8x16_t a, int8x16_t b)` | `TRN2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vtrn2_s16(int16x4_t a, int16x4_t b)` | `TRN2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vtrn2q_s16(int16x8_t a, int16x8_t b)` | `TRN2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vtrn2_s32(int32x2_t a, int32x2_t b)` | `TRN2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vtrn2q_s32(int32x4_t a, int32x4_t b)` | `TRN2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vtrn2q_s64(int64x2_t a, int64x2_t b)` | `TRN2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vtrn2_u8(uint8x8_t a, uint8x8_t b)` | `TRN2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vtrn2q_u8(uint8x16_t a, uint8x16_t b)` | `TRN2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vtrn2_u16(uint16x4_t a, uint16x4_t b)` | `TRN2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vtrn2q_u16(uint16x8_t a, uint16x8_t b)` | `TRN2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vtrn2_u32(uint32x2_t a, uint32x2_t b)` | `TRN2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vtrn2q_u32(uint32x4_t a, uint32x4_t b)` | `TRN2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vtrn2q_u64(uint64x2_t a, uint64x2_t b)` | `TRN2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vtrn2q_p64(poly64x2_t a, poly64x2_t b)` | `TRN2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vtrn2_f32(float32x2_t a, float32x2_t b)` | `TRN2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vtrn2q_f32(float32x4_t a, float32x4_t b)` | `TRN2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vtrn2q_f64(float64x2_t a, float64x2_t b)` | `TRN2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vtrn2_p8(poly8x8_t a, poly8x8_t b)` | `TRN2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vtrn2q_p8(poly8x16_t a, poly8x16_t b)` | `TRN2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vtrn2_p16(poly16x4_t a, poly16x4_t b)` | `TRN2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vtrn2q_p16(poly16x8_t a, poly16x8_t b)` | `TRN2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vtrn2_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `TRN2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vtrn2q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `TRN2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `float16x4_t vtrn2_f16(float16x4_t a, float16x4_t b)` | `TRN2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vtrn2q_f16(float16x8_t a, float16x8_t b)` | `TRN2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## UABA

**Description:** Unsigned Absolute difference and Accumulate. This instruction subtracts the elements of the vector of the second source SIMD&FP register from the corresponding elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the elements of the vector of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
bits(esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<esize-1:0>;
    Elem[result, e, esize] = Elem[result, e, esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vaba_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c)` | `UABA Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vabaq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c)` | `UABA Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vaba_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c)` | `UABA Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vabaq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c)` | `UABA Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vaba_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c)` | `UABA Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vabaq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c)` | `UABA Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UABAL

**Description:** Unsigned Absolute difference and Accumulate Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vabal_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c)` | `UABAL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vabal_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c)` | `UABAL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vabal_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c)` | `UABAL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## UABAL2

**Description:** Unsigned Absolute difference and Accumulate Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, and accumulates the absolute values of the results into the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vabal_high_u8(uint16x8_t a, uint8x16_t b, uint8x16_t c)` | `UABAL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vabal_high_u16(uint32x4_t a, uint16x8_t b, uint16x8_t c)` | `UABAL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vabal_high_u32(uint64x2_t a, uint32x4_t b, uint32x4_t c)` | `UABAL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## UABD

**Description:** Unsigned Absolute Difference (vector). This instruction subtracts the elements of the vector of the second source SIMD&FP register from the corresponding elements of the first source SIMD&FP register, places the the absolute values of the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
bits(esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<esize-1:0>;
    Elem[result, e, esize] = Elem[result, e, esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vabd_u8(uint8x8_t a, uint8x8_t b)` | `UABD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vabdq_u8(uint8x16_t a, uint8x16_t b)` | `UABD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vabd_u16(uint16x4_t a, uint16x4_t b)` | `UABD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vabdq_u16(uint16x8_t a, uint16x8_t b)` | `UABD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vabd_u32(uint32x2_t a, uint32x2_t b)` | `UABD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vabdq_u32(uint32x4_t a, uint32x4_t b)` | `UABD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UABDL

**Description:** Unsigned Absolute Difference Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, places the absolute value of the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vabdl_u8(uint8x8_t a, uint8x8_t b)` | `UABDL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vabdl_u16(uint16x4_t a, uint16x4_t b)` | `UABDL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vabdl_u32(uint32x2_t a, uint32x2_t b)` | `UABDL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## UABDL2

**Description:** Unsigned Absolute Difference Long. This instruction subtracts the vector elements in the lower or upper half of the second source SIMD&FP register from the corresponding vector elements of the first source SIMD&FP register, places the absolute value of the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) absdiff;

result = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    absdiff = Abs(element1 - element2)<2*esize-1:0>;
    Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + absdiff;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vabdl_high_u8(uint8x16_t a, uint8x16_t b)` | `UABDL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vabdl_high_u16(uint16x8_t a, uint16x8_t b)` | `UABDL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vabdl_high_u32(uint32x4_t a, uint32x4_t b)` | `UABDL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## UADALP

**Description:** Unsigned Add and Accumulate Long Pairwise. This instruction adds pairs of adjacent unsigned integer values from the vector in the source SIMD&FP register and accumulates the results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(2*esize) sum;
integer op1;
integer op2;

if acc then result = V[d];
for e = 0 to elements-1
    op1 = Int(Elem[operand, 2*e+0, esize], unsigned);
    op2 = Int(Elem[operand, 2*e+1, esize], unsigned);
    sum = (op1 + op2)<2*esize-1:0>;
    if acc then
        Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + sum;
    else
        Elem[result, e, 2*esize] = sum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x4_t vpadal_u8(uint16x4_t a, uint8x8_t b)` | `UADALP Vd.4H,Vn.8B` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vpadalq_u8(uint16x8_t a, uint8x16_t b)` | `UADALP Vd.8H,Vn.16B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vpadal_u16(uint32x2_t a, uint16x4_t b)` | `UADALP Vd.2S,Vn.4H` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vpadalq_u16(uint32x4_t a, uint16x8_t b)` | `UADALP Vd.4S,Vn.8H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vpadal_u32(uint64x1_t a, uint32x2_t b)` | `UADALP Vd.1D,Vn.2S` | `Vd.1D -> result` | v7/A32/A64 |
| `uint64x2_t vpadalq_u32(uint64x2_t a, uint32x4_t b)` | `UADALP Vd.2D,Vn.4S` | `Vd.2D -> result` | v7/A32/A64 |

---

## UADDL

**Description:** Unsigned Add Long (vector). This instruction adds each vector element in the lower or upper half of the first source SIMD&FP register to the corresponding vector element of the second source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vaddl_u8(uint8x8_t a, uint8x8_t b)` | `UADDL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vaddl_u16(uint16x4_t a, uint16x4_t b)` | `UADDL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vaddl_u32(uint32x2_t a, uint32x2_t b)` | `UADDL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## UADDL2

**Description:** Unsigned Add Long (vector). This instruction adds each vector element in the lower or upper half of the first source SIMD&FP register to the corresponding vector element of the second source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vaddl_high_u8(uint8x16_t a, uint8x16_t b)` | `UADDL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vaddl_high_u16(uint16x8_t a, uint16x8_t b)` | `UADDL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vaddl_high_u32(uint32x4_t a, uint32x4_t b)` | `UADDL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## UADDLP

**Description:** Unsigned Add Long Pairwise. This instruction adds pairs of adjacent unsigned integer values from the vector in the source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(2*esize) sum;
integer op1;
integer op2;

if acc then result = V[d];
for e = 0 to elements-1
    op1 = Int(Elem[operand, 2*e+0, esize], unsigned);
    op2 = Int(Elem[operand, 2*e+1, esize], unsigned);
    sum = (op1 + op2)<2*esize-1:0>;
    if acc then
        Elem[result, e, 2*esize] = Elem[result, e, 2*esize] + sum;
    else
        Elem[result, e, 2*esize] = sum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x4_t vpaddl_u8(uint8x8_t a)` | `UADDLP Vd.4H,Vn.8B` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vpaddlq_u8(uint8x16_t a)` | `UADDLP Vd.8H,Vn.16B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vpaddl_u16(uint16x4_t a)` | `UADDLP Vd.2S,Vn.4H` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vpaddlq_u16(uint16x8_t a)` | `UADDLP Vd.4S,Vn.8H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vpaddl_u32(uint32x2_t a)` | `UADDLP Vd.1D,Vn.2S` | `Vd.1D -> result` | v7/A32/A64 |
| `uint64x2_t vpaddlq_u32(uint32x4_t a)` | `UADDLP Vd.2D,Vn.4S` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vaddlv_u32(uint32x2_t a)` | `UADDLP Vd.1D,Vn.2S` | `Dd -> result` | A64 |

---

## UADDLV

**Description:** Unsigned sum Long across Vector. This instruction adds every vector element in the source SIMD&FP register together, and writes the scalar result to the destination SIMD&FP register. The destination scalar is twice as long as the source vector elements. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer sum;

sum = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    sum = sum + Int(Elem[operand, e, esize], unsigned);

V[d] = sum<2*esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16_t vaddlv_u8(uint8x8_t a)` | `UADDLV Hd,Vn.8B` | `Hd -> result` | A64 |
| `uint16_t vaddlvq_u8(uint8x16_t a)` | `UADDLV Hd,Vn.16B` | `Hd -> result` | A64 |
| `uint32_t vaddlv_u16(uint16x4_t a)` | `UADDLV Sd,Vn.4H` | `Sd -> result` | A64 |
| `uint32_t vaddlvq_u16(uint16x8_t a)` | `UADDLV Sd,Vn.8H` | `Sd -> result` | A64 |
| `uint64_t vaddlvq_u32(uint32x4_t a)` | `UADDLV Dd,Vn.4S` | `Dd -> result` | A64 |

---

## UADDW

**Description:** Unsigned Add Wide. This instruction adds the vector elements of the first source SIMD&FP register to the corresponding vector elements in the lower or upper half of the second source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. The vector elements of the destination register and the first source register are twice as long as the vector elements of the second source register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vaddw_u8(uint16x8_t a, uint8x8_t b)` | `UADDW Vd.8H,Vn.8H,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vaddw_u16(uint32x4_t a, uint16x4_t b)` | `UADDW Vd.4S,Vn.4S,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vaddw_u32(uint64x2_t a, uint32x2_t b)` | `UADDW Vd.2D,Vn.2D,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## UADDW2

**Description:** Unsigned Add Wide. This instruction adds the vector elements of the first source SIMD&FP register to the corresponding vector elements in the lower or upper half of the second source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. The vector elements of the destination register and the first source register are twice as long as the vector elements of the second source register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vaddw_high_u8(uint16x8_t a, uint8x16_t b)` | `UADDW2 Vd.8H,Vn.8H,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vaddw_high_u16(uint32x4_t a, uint16x8_t b)` | `UADDW2 Vd.4S,Vn.4S,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vaddw_high_u32(uint64x2_t a, uint32x4_t b)` | `UADDW2 Vd.2D,Vn.2D,Vm.4S` | `Vd.2D -> result` | A64 |

---

## UCVTF

**Description:** Unsigned fixed-point Convert to Floating-point (vector). This instruction converts each element in a vector from fixed-point to floating-point using the rounding mode that is specified by the FPCR, and writes the result to the SIMD&FP destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];

bits(esize) element;
FPCRType fpcr    = FPCR[];
boolean merge    = elements == 1 && IsMerging(fpcr);
bits(128) result = if merge then V[d] else Zeros();

for e = 0 to elements-1
    element = Elem[operand, e, esize];
    Elem[result, e, esize] = FixedToFP(element, fracbits, unsigned, fpcr, rounding);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vcvt_f32_u32(uint32x2_t a)` | `UCVTF Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vcvtq_f32_u32(uint32x4_t a)` | `UCVTF Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `float32_t vcvts_f32_u32(uint32_t a)` | `UCVTF Sd,Sn` | `Sd -> result` | A64 |
| `float64x1_t vcvt_f64_u64(uint64x1_t a)` | `UCVTF Dd,Dn` | `Dd -> result` | A64 |
| `float64x2_t vcvtq_f64_u64(uint64x2_t a)` | `UCVTF Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `float64_t vcvtd_f64_u64(uint64_t a)` | `UCVTF Dd,Dn` | `Dd -> result` | A64 |
| `float32x2_t vcvt_n_f32_u32(uint32x2_t a, __builtin_constant_p(n))` | `UCVTF Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `float32x4_t vcvtq_n_f32_u32(uint32x4_t a, __builtin_constant_p(n))` | `UCVTF Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `float32_t vcvts_n_f32_u32(uint32_t a, __builtin_constant_p(n))` | `UCVTF Sd,Sn,#n` | `Sd -> result` | A64 |
| `float64x1_t vcvt_n_f64_u64(uint64x1_t a, __builtin_constant_p(n))` | `UCVTF Dd,Dn,#n` | `Dd -> result` | A64 |
| `float64x2_t vcvtq_n_f64_u64(uint64x2_t a, __builtin_constant_p(n))` | `UCVTF Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | A64 |
| `float64_t vcvtd_n_f64_u64(uint64_t a, __builtin_constant_p(n))` | `UCVTF Dd,Dn,#n` | `Dd -> result` | A64 |
| `float16_t vcvth_f16_u16(uint16_t a)` | `UCVTF Hd,Hn` | `Hd -> result` | A64 |
| `float16_t vcvth_f16_u32(uint32_t a)` | `UCVTF Hd,Hn` | `Hd -> result` | A32/A64 |
| `float16_t vcvth_f16_u64(uint64_t a)` | `UCVTF Hd,Hn` | `Hd -> result` | A64 |
| `float16_t vcvth_n_f16_u16(uint16_t a, __builtin_constant_p(n))` | `UCVTF Hd,Hn,#n` | `Hd -> result` | A64 |
| `float16_t vcvth_n_f16_u32(uint32_t a, __builtin_constant_p(n))` | `UCVTF Hd,Hn,#n` | `Hd -> result` | A32/A64 |
| `float16_t vcvth_n_f16_u64(uint64_t a, __builtin_constant_p(n))` | `UCVTF Hd,Hn,#n` | `Hd -> result` | A64 |
| `float16x4_t vcvt_f16_u16(uint16x4_t a)` | `UCVTF Vd.4H,Vn.4H,#0` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcvtq_f16_u16(uint16x8_t a)` | `UCVTF Vd.8H,Vn.8H` | `Vd.8H -> result` | A32/A64 |
| `float16x4_t vcvt_n_f16_u16(uint16x4_t a, __builtin_constant_p(n))` | `UCVTF Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | A32/A64 |
| `float16x8_t vcvtq_n_f16_u16(uint16x8_t a, __builtin_constant_p(n))` | `UCVTF Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | A32/A64 |

---

## UDOT

**Description:** Dot Product unsigned arithmetic (vector). This instruction performs the dot product of the four unsigned 8-bit elements in each 32-bit element of the first source register with the four unsigned 8-bit elements of the corresponding 32-bit element in the second source register, accumulating the result into the corresponding 32-bit element of the destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

result = V[d];
for e = 0 to elements-1 
    integer res = 0;
    integer element1, element2;
    for i = 0 to 3 
        if signed then
            element1 = SInt(Elem[operand1, 4 * e + i, esize DIV 4]); 
            element2 = SInt(Elem[operand2, 4 * e + i, esize DIV 4]);
        else 
            element1 = UInt(Elem[operand1, 4 * e + i, esize DIV 4]); 
            element2 = UInt(Elem[operand2, 4 * e + i, esize DIV 4]);
        res = res + element1 * element2; 
    Elem[result, e, esize] = Elem[result, e, esize] + res;
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vdot_u32(uint32x2_t r, uint8x8_t a, uint8x8_t b)` | `UDOT Vd.2S,Vn.8B,Vm.8B` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vdotq_u32(uint32x4_t r, uint8x16_t a, uint8x16_t b)` | `UDOT Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |
| `uint32x2_t vdot_lane_u32(uint32x2_t r, uint8x8_t a, uint8x8_t b, __builtin_constant_p(lane))` | `UDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vdotq_laneq_u32(uint32x4_t r, uint8x16_t a, uint8x16_t b, __builtin_constant_p(lane))` | `UDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |
| `uint32x2_t vdot_laneq_u32(uint32x2_t r, uint8x8_t a, uint8x16_t b, __builtin_constant_p(lane))` | `UDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `uint32x4_t vdotq_lane_u32(uint32x4_t r, uint8x16_t a, uint8x8_t b, __builtin_constant_p(lane))` | `UDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |

---

## UHADD

**Description:** Unsigned Halving Add. This instruction adds corresponding unsigned integer values from the two source SIMD&FP registers, shifts each result right one bit, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    sum = element1 + element2;
    Elem[result, e, esize] = sum<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vhadd_u8(uint8x8_t a, uint8x8_t b)` | `UHADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vhaddq_u8(uint8x16_t a, uint8x16_t b)` | `UHADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vhadd_u16(uint16x4_t a, uint16x4_t b)` | `UHADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vhaddq_u16(uint16x8_t a, uint16x8_t b)` | `UHADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vhadd_u32(uint32x2_t a, uint32x2_t b)` | `UHADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vhaddq_u32(uint32x4_t a, uint32x4_t b)` | `UHADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UHSUB

**Description:** Unsigned Halving Subtract. This instruction subtracts the vector elements in the second source SIMD&FP register from the corresponding vector elements in the first source SIMD&FP register, shifts each result right one bit, places each result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer diff;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    diff = element1 - element2;
    Elem[result, e, esize] = diff<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vhsub_u8(uint8x8_t a, uint8x8_t b)` | `UHSUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vhsubq_u8(uint8x16_t a, uint8x16_t b)` | `UHSUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vhsub_u16(uint16x4_t a, uint16x4_t b)` | `UHSUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vhsubq_u16(uint16x8_t a, uint16x8_t b)` | `UHSUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vhsub_u32(uint32x2_t a, uint32x2_t b)` | `UHSUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vhsubq_u32(uint32x4_t a, uint32x4_t b)` | `UHSUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UMAX

**Description:** Unsigned Maximum (vector). This instruction compares corresponding elements in the vectors in the two source SIMD&FP registers, places the larger of each pair of unsigned integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b)` | `UMAX Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vmaxq_u8(uint8x16_t a, uint8x16_t b)` | `UMAX Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmax_u16(uint16x4_t a, uint16x4_t b)` | `UMAX Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vmaxq_u16(uint16x8_t a, uint16x8_t b)` | `UMAX Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmax_u32(uint32x2_t a, uint32x2_t b)` | `UMAX Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vmaxq_u32(uint32x4_t a, uint32x4_t b)` | `UMAX Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UMAXP

**Description:** Unsigned Maximum Pairwise. This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the largest of each pair of unsigned integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[concat, 2*e, esize], unsigned);
    element2 = Int(Elem[concat, (2*e)+1, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vpmax_u8(uint8x8_t a, uint8x8_t b)` | `UMAXP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vpmax_u16(uint16x4_t a, uint16x4_t b)` | `UMAXP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vpmax_u32(uint32x2_t a, uint32x2_t b)` | `UMAXP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x16_t vpmaxq_u8(uint8x16_t a, uint8x16_t b)` | `UMAXP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x8_t vpmaxq_u16(uint16x8_t a, uint16x8_t b)` | `UMAXP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x4_t vpmaxq_u32(uint32x4_t a, uint32x4_t b)` | `UMAXP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint32_t vmaxv_u32(uint32x2_t a)` | `UMAXP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |

---

## UMAXV

**Description:** Unsigned Maximum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the largest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer maxmin;
integer element;

maxmin = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    element = Int(Elem[operand, e, esize], unsigned);
    maxmin = if min then Min(maxmin, element) else Max(maxmin, element);

V[d] = maxmin<esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8_t vmaxv_u8(uint8x8_t a)` | `UMAXV Bd,Vn.8B` | `Bd -> result` | A64 |
| `uint8_t vmaxvq_u8(uint8x16_t a)` | `UMAXV Bd,Vn.16B` | `Bd -> result` | A64 |
| `uint16_t vmaxv_u16(uint16x4_t a)` | `UMAXV Hd,Vn.4H` | `Hd -> result` | A64 |
| `uint16_t vmaxvq_u16(uint16x8_t a)` | `UMAXV Hd,Vn.8H` | `Hd -> result` | A64 |
| `uint32_t vmaxvq_u32(uint32x4_t a)` | `UMAXV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## UMIN

**Description:** Unsigned Minimum (vector). This instruction compares corresponding vector elements in the two source SIMD&FP registers, places the smaller of each of the two unsigned integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b)` | `UMIN Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vminq_u8(uint8x16_t a, uint8x16_t b)` | `UMIN Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vmin_u16(uint16x4_t a, uint16x4_t b)` | `UMIN Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vminq_u16(uint16x8_t a, uint16x8_t b)` | `UMIN Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vmin_u32(uint32x2_t a, uint32x2_t b)` | `UMIN Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vminq_u32(uint32x4_t a, uint32x4_t b)` | `UMIN Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## UMINP

**Description:** Unsigned Minimum Pairwise. This instruction creates a vector by concatenating the vector elements of the first source SIMD&FP register after the vector elements of the second source SIMD&FP register, reads each pair of adjacent vector elements in the two source SIMD&FP registers, writes the smallest of each pair of unsigned integer values into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
bits(2*datasize) concat = operand2:operand1;
integer element1;
integer element2;
integer maxmin;

for e = 0 to elements-1
    element1 = Int(Elem[concat, 2*e, esize], unsigned);
    element2 = Int(Elem[concat, (2*e)+1, esize], unsigned);
    maxmin = if minimum then Min(element1, element2) else Max(element1, element2);
    Elem[result, e, esize] = maxmin<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vpmin_u8(uint8x8_t a, uint8x8_t b)` | `UMINP Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vpmin_u16(uint16x4_t a, uint16x4_t b)` | `UMINP Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vpmin_u32(uint32x2_t a, uint32x2_t b)` | `UMINP Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x16_t vpminq_u8(uint8x16_t a, uint8x16_t b)` | `UMINP Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x8_t vpminq_u16(uint16x8_t a, uint16x8_t b)` | `UMINP Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x4_t vpminq_u32(uint32x4_t a, uint32x4_t b)` | `UMINP Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint32_t vminv_u32(uint32x2_t a)` | `UMINP  Vd.2S,Vn.2S,Vm.2S` | `Vd.S[0] -> result` | A64 |

---

## UMINV

**Description:** Unsigned Minimum across Vector. This instruction compares all the vector elements in the source SIMD&FP register, and writes the smallest of the values as a scalar to the destination SIMD&FP register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
integer maxmin;
integer element;

maxmin = Int(Elem[operand, 0, esize], unsigned);
for e = 1 to elements-1
    element = Int(Elem[operand, e, esize], unsigned);
    maxmin = if min then Min(maxmin, element) else Max(maxmin, element);

V[d] = maxmin<esize-1:0>;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8_t vminv_u8(uint8x8_t a)` | `UMINV Bd,Vn.8B` | `Bd -> result` | A64 |
| `uint8_t vminvq_u8(uint8x16_t a)` | `UMINV Bd,Vn.16B` | `Bd -> result` | A64 |
| `uint16_t vminv_u16(uint16x4_t a)` | `UMINV Hd,Vn.4H` | `Hd -> result` | A64 |
| `uint16_t vminvq_u16(uint16x8_t a)` | `UMINV Hd,Vn.8H` | `Hd -> result` | A64 |
| `uint32_t vminvq_u32(uint32x4_t a)` | `UMINV Sd,Vn.4S` | `Sd -> result` | A64 |

---

## UMLAL

**Description:** Unsigned Multiply-Add Long (vector). This instruction multiplies the vector elements in the lower or upper half of the first source SIMD&FP register by the corresponding vector elements of the second source SIMD&FP register, and accumulates the results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmlal_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c)` | `UMLAL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vmlal_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c)` | `UMLAL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlal_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c)` | `UMLAL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmlal_lane_u16(uint32x4_t a, uint16x4_t b, uint16x4_t v, __builtin_constant_p(lane))` | `UMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlal_lane_u32(uint64x2_t a, uint32x2_t b, uint32x2_t v, __builtin_constant_p(lane))` | `UMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmlal_laneq_u16(uint32x4_t a, uint16x4_t b, uint16x8_t v, __builtin_constant_p(lane))` | `UMLAL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlal_laneq_u32(uint64x2_t a, uint32x2_t b, uint32x4_t v, __builtin_constant_p(lane))` | `UMLAL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlal_n_u16(uint32x4_t a, uint16x4_t b, uint16_t c)` | `UMLAL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlal_n_u32(uint64x2_t a, uint32x2_t b, uint32_t c)` | `UMLAL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## UMLAL2

**Description:** Unsigned Multiply-Add Long (vector). This instruction multiplies the vector elements in the lower or upper half of the first source SIMD&FP register by the corresponding vector elements of the second source SIMD&FP register, and accumulates the results with the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmlal_high_u8(uint16x8_t a, uint8x16_t b, uint8x16_t c)` | `UMLAL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vmlal_high_u16(uint32x4_t a, uint16x8_t b, uint16x8_t c)` | `UMLAL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlal_high_u32(uint64x2_t a, uint32x4_t b, uint32x4_t c)` | `UMLAL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlal_high_lane_u16(uint32x4_t a, uint16x8_t b, uint16x4_t v, __builtin_constant_p(lane))` | `UMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlal_high_lane_u32(uint64x2_t a, uint32x4_t b, uint32x2_t v, __builtin_constant_p(lane))` | `UMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlal_high_laneq_u16(uint32x4_t a, uint16x8_t b, uint16x8_t v, __builtin_constant_p(lane))` | `UMLAL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlal_high_laneq_u32(uint64x2_t a, uint32x4_t b, uint32x4_t v, __builtin_constant_p(lane))` | `UMLAL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlal_high_n_u16(uint32x4_t a, uint16x8_t b, uint16_t c)` | `UMLAL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlal_high_n_u32(uint64x2_t a, uint32x4_t b, uint32_t c)` | `UMLAL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## UMLSL

**Description:** Unsigned Multiply-Subtract Long (vector). This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, and subtracts the results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmlsl_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c)` | `UMLSL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vmlsl_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c)` | `UMLSL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlsl_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c)` | `UMLSL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmlsl_lane_u16(uint32x4_t a, uint16x4_t b, uint16x4_t v, __builtin_constant_p(lane))` | `UMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlsl_lane_u32(uint64x2_t a, uint32x2_t b, uint32x2_t v, __builtin_constant_p(lane))` | `UMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmlsl_laneq_u16(uint32x4_t a, uint16x4_t b, uint16x8_t v, __builtin_constant_p(lane))` | `UMLSL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlsl_laneq_u32(uint64x2_t a, uint32x2_t b, uint32x4_t v, __builtin_constant_p(lane))` | `UMLSL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlsl_n_u16(uint32x4_t a, uint16x4_t b, uint16_t c)` | `UMLSL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmlsl_n_u32(uint64x2_t a, uint32x2_t b, uint32_t c)` | `UMLSL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |

---

## UMLSL2

**Description:** Unsigned Multiply-Subtract Long (vector). This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, and subtracts the results from the vector elements of the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) operand3 = V[d];
bits(2*datasize) result;
integer element1;
integer element2;
bits(2*esize) product;
bits(2*esize) accum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    product = (element1 * element2)<2*esize-1:0>;
    if sub_op then
        accum = Elem[operand3, e, 2*esize] - product;
    else
        accum = Elem[operand3, e, 2*esize] + product;
    Elem[result, e, 2*esize] = accum;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmlsl_high_u8(uint16x8_t a, uint8x16_t b, uint8x16_t c)` | `UMLSL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vmlsl_high_u16(uint32x4_t a, uint16x8_t b, uint16x8_t c)` | `UMLSL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlsl_high_u32(uint64x2_t a, uint32x4_t b, uint32x4_t c)` | `UMLSL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlsl_high_lane_u16(uint32x4_t a, uint16x8_t b, uint16x4_t v, __builtin_constant_p(lane))` | `UMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlsl_high_lane_u32(uint64x2_t a, uint32x4_t b, uint32x2_t v, __builtin_constant_p(lane))` | `UMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlsl_high_laneq_u16(uint32x4_t a, uint16x8_t b, uint16x8_t v, __builtin_constant_p(lane))` | `UMLSL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlsl_high_laneq_u32(uint64x2_t a, uint32x4_t b, uint32x4_t v, __builtin_constant_p(lane))` | `UMLSL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmlsl_high_n_u16(uint32x4_t a, uint16x8_t b, uint16_t c)` | `UMLSL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmlsl_high_n_u32(uint64x2_t a, uint32x4_t b, uint32_t c)` | `UMLSL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |

---

## UMMLA

**Description:** Unsigned 8-bit integer matrix multiply-accumulate. This instruction multiplies the 2x8 matrix of unsigned 8-bit integer values in the first source vector by the 8x2 matrix of unsigned 8-bit integer values in the second source vector. The resulting 2x2 32-bit integer matrix product is destructively added to the 32-bit integer matrix accumulator in the destination vector. This is equivalent to performing an 8-way dot product per destination element.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand1 = V[n];
bits(128) operand2 = V[m];
bits(128) addend   = V[d];

V[d] = MatMulAdd(addend, operand1, operand2, op1_unsigned, op2_unsigned);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x4_t vmmlaq_u32(uint32x4_t r, uint8x16_t a, uint8x16_t b)` | `UMMLA Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |

---

## UMOV

**Description:** Unsigned Move vector element to general-purpose register. This instruction reads the unsigned integer from the source SIMD&FP register, zero-extends it to form a 32-bit or 64-bit value, and writes the result to the destination general-purpose register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(idxdsize) operand = V[n];

X[d] = ZeroExtend(Elem[operand, index, esize], datasize);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8_t vget_lane_u8(uint8x8_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint16_t vget_lane_u16(uint16x4_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint32_t vget_lane_u32(uint32x2_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.S[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint64_t vget_lane_u64(uint64x1_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly64_t vget_lane_p64(poly64x1_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | A32/A64 |
| `int64_t vget_lane_s64(int64x1_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly8_t vget_lane_p8(poly8x8_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly16_t vget_lane_p16(poly16x4_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint8_t vgetq_lane_u8(uint8x16_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint16_t vgetq_lane_u16(uint16x8_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint32_t vgetq_lane_u32(uint32x4_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.S[lane]` | `Rd -> result` | v7/A32/A64 |
| `uint64_t vgetq_lane_u64(uint64x2_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly64_t vgetq_lane_p64(poly64x2_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | A32/A64 |
| `int64_t vgetq_lane_s64(int64x2_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.D[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly8_t vgetq_lane_p8(poly8x16_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.B[lane]` | `Rd -> result` | v7/A32/A64 |
| `poly16_t vgetq_lane_p16(poly16x8_t v, __builtin_constant_p(lane))` | `UMOV Rd,Vn.H[lane]` | `Rd -> result` | v7/A32/A64 |

---

## UMULL

**Description:** Unsigned Multiply long (vector). This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, places the result in a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, 2*esize] = (element1 * element2)<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmull_u8(uint8x8_t a, uint8x8_t b)` | `UMULL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vmull_u16(uint16x4_t a, uint16x4_t b)` | `UMULL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmull_u32(uint32x2_t a, uint32x2_t b)` | `UMULL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmull_n_u16(uint16x4_t a, uint16_t b)` | `UMULL Vd.4S,Vn.4H,Vm.H[0]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmull_n_u32(uint32x2_t a, uint32_t b)` | `UMULL Vd.2D,Vn.2S,Vm.S[0]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmull_lane_u16(uint16x4_t a, uint16x4_t v, __builtin_constant_p(lane))` | `UMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmull_lane_u32(uint32x2_t a, uint32x2_t v, __builtin_constant_p(lane))` | `UMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | v7/A32/A64 |
| `uint32x4_t vmull_laneq_u16(uint16x4_t a, uint16x8_t v, __builtin_constant_p(lane))` | `UMULL Vd.4S,Vn.4H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmull_laneq_u32(uint32x2_t a, uint32x4_t v, __builtin_constant_p(lane))` | `UMULL Vd.2D,Vn.2S,Vm.S[lane]` | `Vd.2D -> result` | A64 |

---

## UMULL2

**Description:** Unsigned Multiply long (vector). This instruction multiplies corresponding vector elements in the lower or upper half of the two source SIMD&FP registers, places the result in a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the elements that are multiplied. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, 2*esize] = (element1 * element2)<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vmull_high_u8(uint8x16_t a, uint8x16_t b)` | `UMULL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vmull_high_u16(uint16x8_t a, uint16x8_t b)` | `UMULL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmull_high_u32(uint32x4_t a, uint32x4_t b)` | `UMULL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmull_high_n_u16(uint16x8_t a, uint16_t b)` | `UMULL2 Vd.4S,Vn.8H,Vm.H[0]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmull_high_n_u32(uint32x4_t a, uint32_t b)` | `UMULL2 Vd.2D,Vn.4S,Vm.S[0]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmull_high_lane_u16(uint16x8_t a, uint16x4_t v, __builtin_constant_p(lane))` | `UMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmull_high_lane_u32(uint32x4_t a, uint32x2_t v, __builtin_constant_p(lane))` | `UMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |
| `uint32x4_t vmull_high_laneq_u16(uint16x8_t a, uint16x8_t v, __builtin_constant_p(lane))` | `UMULL2 Vd.4S,Vn.8H,Vm.H[lane]` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmull_high_laneq_u32(uint32x4_t a, uint32x4_t v, __builtin_constant_p(lane))` | `UMULL2 Vd.2D,Vn.4S,Vm.S[lane]` | `Vd.2D -> result` | A64 |

---

## UQADD

**Description:** Unsigned saturating Add. This instruction adds the values of corresponding elements of the two source SIMD&FP registers, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer sum;
boolean sat;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    sum = element1 + element2;
    (Elem[result, e, esize], sat) = SatQ(sum, esize, unsigned);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqadd_u8(uint8x8_t a, uint8x8_t b)` | `UQADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqaddq_u8(uint8x16_t a, uint8x16_t b)` | `UQADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqadd_u16(uint16x4_t a, uint16x4_t b)` | `UQADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqaddq_u16(uint16x8_t a, uint16x8_t b)` | `UQADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqadd_u32(uint32x2_t a, uint32x2_t b)` | `UQADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqaddq_u32(uint32x4_t a, uint32x4_t b)` | `UQADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqadd_u64(uint64x1_t a, uint64x1_t b)` | `UQADD Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqaddq_u64(uint64x2_t a, uint64x2_t b)` | `UQADD Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqaddb_u8(uint8_t a, uint8_t b)` | `UQADD Bd,Bn,Bm` | `Bd -> result` | A64 |
| `uint16_t vqaddh_u16(uint16_t a, uint16_t b)` | `UQADD Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint32_t vqadds_u32(uint32_t a, uint32_t b)` | `UQADD Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vqaddd_u64(uint64_t a, uint64_t b)` | `UQADD Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## UQRSHL

**Description:** Unsigned saturating Rounding Shift Left (register). This instruction takes each vector element of the first source SIMD&FP register, shifts the vector element by a value from the least significant byte of the corresponding vector element of the second source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqrshl_u8(uint8x8_t a, int8x8_t b)` | `UQRSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqrshlq_u8(uint8x16_t a, int8x16_t b)` | `UQRSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqrshl_u16(uint16x4_t a, int16x4_t b)` | `UQRSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqrshlq_u16(uint16x8_t a, int16x8_t b)` | `UQRSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqrshl_u32(uint32x2_t a, int32x2_t b)` | `UQRSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqrshlq_u32(uint32x4_t a, int32x4_t b)` | `UQRSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqrshl_u64(uint64x1_t a, int64x1_t b)` | `UQRSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqrshlq_u64(uint64x2_t a, int64x2_t b)` | `UQRSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqrshlb_u8(uint8_t a, int8_t b)` | `UQRSHL Bd,Bn,Bm` | `Bd -> result` | A64 |
| `uint16_t vqrshlh_u16(uint16_t a, int16_t b)` | `UQRSHL Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint32_t vqrshls_u32(uint32_t a, int32_t b)` | `UQRSHL Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vqrshld_u64(uint64_t a, int64_t b)` | `UQRSHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## UQRSHRN

**Description:** Unsigned saturating Rounded Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are rounded. For truncated results, see UQSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqrshrn_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `UQRSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqrshrn_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `UQRSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqrshrn_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `UQRSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqrshrnh_n_u16(uint16_t a, __builtin_constant_p(n))` | `UQRSHRN Bd,Hn,#n` | `Bd -> result` | A64 |
| `uint16_t vqrshrns_n_u32(uint32_t a, __builtin_constant_p(n))` | `UQRSHRN Hd,Sn,#n` | `Hd -> result` | A64 |
| `uint32_t vqrshrnd_n_u64(uint64_t a, __builtin_constant_p(n))` | `UQRSHRN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## UQRSHRN2

**Description:** Unsigned saturating Rounded Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are rounded. For truncated results, see UQSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqrshrn_high_n_u16(uint8x8_t r, uint16x8_t a, __builtin_constant_p(n))` | `UQRSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqrshrn_high_n_u32(uint16x4_t r, uint32x4_t a, __builtin_constant_p(n))` | `UQRSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqrshrn_high_n_u64(uint32x2_t r, uint64x2_t a, __builtin_constant_p(n))` | `UQRSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## UQSHL

**Description:** Unsigned saturating Shift Left (register). This instruction takes each element in the vector of the first source SIMD&FP register, shifts the element by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqshl_u8(uint8x8_t a, int8x8_t b)` | `UQSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqshlq_u8(uint8x16_t a, int8x16_t b)` | `UQSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqshl_u16(uint16x4_t a, int16x4_t b)` | `UQSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqshlq_u16(uint16x8_t a, int16x8_t b)` | `UQSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqshl_u32(uint32x2_t a, int32x2_t b)` | `UQSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqshlq_u32(uint32x4_t a, int32x4_t b)` | `UQSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqshl_u64(uint64x1_t a, int64x1_t b)` | `UQSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqshlq_u64(uint64x2_t a, int64x2_t b)` | `UQSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqshlb_u8(uint8_t a, int8_t b)` | `UQSHL Bd,Bn,Bm` | `Bd -> result` | A64 |
| `uint16_t vqshlh_u16(uint16_t a, int16_t b)` | `UQSHL Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint32_t vqshls_u32(uint32_t a, int32_t b)` | `UQSHL Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vqshld_u64(uint64_t a, int64_t b)` | `UQSHL Dd,Dn,Dm` | `Dd -> result` | A64 |
| `uint8x8_t vqshl_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `UQSHL Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqshlq_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `UQSHL Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqshl_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `UQSHL Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqshlq_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `UQSHL Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqshl_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `UQSHL Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqshlq_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `UQSHL Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqshl_n_u64(uint64x1_t a, __builtin_constant_p(n))` | `UQSHL Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqshlq_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `UQSHL Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqshlb_n_u8(uint8_t a, __builtin_constant_p(n))` | `UQSHL Bd,Bn,#n` | `Bd -> result` | A64 |
| `uint16_t vqshlh_n_u16(uint16_t a, __builtin_constant_p(n))` | `UQSHL Hd,Hn,#n` | `Hd -> result` | A64 |
| `uint32_t vqshls_n_u32(uint32_t a, __builtin_constant_p(n))` | `UQSHL Sd,Sn,#n` | `Sd -> result` | A64 |
| `uint64_t vqshld_n_u64(uint64_t a, __builtin_constant_p(n))` | `UQSHL Dd,Dn,#n` | `Dd -> result` | A64 |

---

## UQSHRN

**Description:** Unsigned saturating Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are truncated. For rounded results, see UQRSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqshrn_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `UQSHRN Vd.8B,Vn.8H,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqshrn_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `UQSHRN Vd.4H,Vn.4S,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqshrn_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `UQSHRN Vd.2S,Vn.2D,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqshrnh_n_u16(uint16_t a, __builtin_constant_p(n))` | `UQSHRN Bd,Hn,#n` | `Bd -> result` | A64 |
| `uint16_t vqshrns_n_u32(uint32_t a, __builtin_constant_p(n))` | `UQSHRN Hd,Sn,#n` | `Hd -> result` | A64 |
| `uint32_t vqshrnd_n_u64(uint64_t a, __builtin_constant_p(n))` | `UQSHRN Sd,Dn,#n` | `Sd -> result` | A64 |

---

## UQSHRN2

**Description:** Unsigned saturating Shift Right Narrow (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, saturates each shifted result to a value that is half the original width, puts the final result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are truncated. For rounded results, see UQRSHRN.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize*2) operand = V[n];
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;
boolean sat;

for e = 0 to elements-1
    element = (Int(Elem[operand, e, 2*esize], unsigned) + round_const) >> shift;
    (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqshrn_high_n_u16(uint8x8_t r, uint16x8_t a, __builtin_constant_p(n))` | `UQSHRN2 Vd.16B,Vn.8H,#n` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqshrn_high_n_u32(uint16x4_t r, uint32x4_t a, __builtin_constant_p(n))` | `UQSHRN2 Vd.8H,Vn.4S,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqshrn_high_n_u64(uint32x2_t r, uint64x2_t a, __builtin_constant_p(n))` | `UQSHRN2 Vd.4S,Vn.2D,#n` | `Vd.4S -> result` | A64 |

---

## UQSUB

**Description:** Unsigned saturating Subtract. This instruction subtracts the element values of the second source SIMD&FP register from the corresponding element values of the first source SIMD&FP register, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;
integer diff;
boolean sat;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    diff = element1 - element2;
    (Elem[result, e, esize], sat) = SatQ(diff, esize, unsigned);
    if sat then FPSR.QC = '1';

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqsub_u8(uint8x8_t a, uint8x8_t b)` | `UQSUB Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vqsubq_u8(uint8x16_t a, uint8x16_t b)` | `UQSUB Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vqsub_u16(uint16x4_t a, uint16x4_t b)` | `UQSUB Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vqsubq_u16(uint16x8_t a, uint16x8_t b)` | `UQSUB Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vqsub_u32(uint32x2_t a, uint32x2_t b)` | `UQSUB Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vqsubq_u32(uint32x4_t a, uint32x4_t b)` | `UQSUB Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vqsub_u64(uint64x1_t a, uint64x1_t b)` | `UQSUB Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vqsubq_u64(uint64x2_t a, uint64x2_t b)` | `UQSUB Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint8_t vqsubb_u8(uint8_t a, uint8_t b)` | `UQSUB Bd,Bn,Bm` | `Bd -> result` | A64 |
| `uint16_t vqsubh_u16(uint16_t a, uint16_t b)` | `UQSUB Hd,Hn,Hm` | `Hd -> result` | A64 |
| `uint32_t vqsubs_u32(uint32_t a, uint32_t b)` | `UQSUB Sd,Sn,Sm` | `Sd -> result` | A64 |
| `uint64_t vqsubd_u64(uint64_t a, uint64_t b)` | `UQSUB Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## UQXTN

**Description:** Unsigned saturating extract Narrow. This instruction reads each vector element from the source SIMD&FP register, saturates each value to half the original width, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = SatQ(Int(element, unsigned), esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vqmovn_u16(uint16x8_t a)` | `UQXTN Vd.8B,Vn.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vqmovn_u32(uint32x4_t a)` | `UQXTN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vqmovn_u64(uint64x2_t a)` | `UQXTN Vd.2S,Vn.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8_t vqmovnh_u16(uint16_t a)` | `UQXTN Bd,Hn` | `Bd -> result` | A64 |
| `uint16_t vqmovns_u32(uint32_t a)` | `UQXTN Hd,Sn` | `Hd -> result` | A64 |
| `uint32_t vqmovnd_u64(uint64_t a)` | `UQXTN Sd,Dn` | `Sd -> result` | A64 |

---

## UQXTN2

**Description:** Unsigned saturating extract Narrow. This instruction reads each vector element from the source SIMD&FP register, saturates each value to half the original width, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;
boolean sat;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    (Elem[result, e, esize], sat) = SatQ(Int(element, unsigned), esize, unsigned);
    if sat then FPSR.QC = '1';

Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x16_t vqmovn_high_u16(uint8x8_t r, uint16x8_t a)` | `UQXTN2 Vd.16B,Vn.8H` | `Vd.16B -> result` | A64 |
| `uint16x8_t vqmovn_high_u32(uint16x4_t r, uint32x4_t a)` | `UQXTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | A64 |
| `uint32x4_t vqmovn_high_u64(uint32x2_t r, uint64x2_t a)` | `UQXTN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | A64 |

---

## URECPE

**Description:** Unsigned Reciprocal Estimate. This instruction reads each vector element from the source SIMD&FP register, calculates an approximate inverse for the unsigned integer value, places the result into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(32) element;

for e = 0 to elements-1
    element = Elem[operand, e, 32];
    Elem[result, e, 32] = UnsignedRecipEstimate(element);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vrecpe_u32(uint32x2_t a)` | `URECPE Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrecpeq_u32(uint32x4_t a)` | `URECPE Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## URHADD

**Description:** Unsigned Rounding Halving Add. This instruction adds corresponding unsigned integer values from the two source SIMD&FP registers, shifts each result right one bit, places the results into a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;
integer element1;
integer element2;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    Elem[result, e, esize] = (element1 + element2 + 1)<esize:1>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vrhadd_u8(uint8x8_t a, uint8x8_t b)` | `URHADD Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrhaddq_u8(uint8x16_t a, uint8x16_t b)` | `URHADD Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrhadd_u16(uint16x4_t a, uint16x4_t b)` | `URHADD Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrhaddq_u16(uint16x8_t a, uint16x8_t b)` | `URHADD Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vrhadd_u32(uint32x2_t a, uint32x2_t b)` | `URHADD Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrhaddq_u32(uint32x4_t a, uint32x4_t b)` | `URHADD Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## URSHL

**Description:** Unsigned Rounding Shift Left (register). This instruction takes each element in the vector of the first source SIMD&FP register, shifts the vector element by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vrshl_u8(uint8x8_t a, int8x8_t b)` | `URSHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrshlq_u8(uint8x16_t a, int8x16_t b)` | `URSHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrshl_u16(uint16x4_t a, int16x4_t b)` | `URSHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrshlq_u16(uint16x8_t a, int16x8_t b)` | `URSHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vrshl_u32(uint32x2_t a, int32x2_t b)` | `URSHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrshlq_u32(uint32x4_t a, int32x4_t b)` | `URSHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vrshl_u64(uint64x1_t a, int64x1_t b)` | `URSHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vrshlq_u64(uint64x2_t a, int64x2_t b)` | `URSHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vrshld_u64(uint64_t a, int64_t b)` | `URSHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## URSHR

**Description:** Unsigned Rounding Shift Right (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, writes the final result to a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are rounded. For truncated results, see USHR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vrshr_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `URSHR Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrshrq_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `URSHR Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrshr_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `URSHR Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrshrq_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `URSHR Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vrshr_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `URSHR Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrshrq_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `URSHR Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vrshr_n_u64(uint64x1_t a, __builtin_constant_p(n))` | `URSHR Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vrshrq_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `URSHR Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vrshrd_n_u64(uint64_t a, __builtin_constant_p(n))` | `URSHR Dd,Dn,#n` | `Dd -> result` | A64 |

---

## URSQRTE

**Description:** Unsigned Reciprocal Square Root Estimate. This instruction reads each vector element from the source SIMD&FP register, calculates an approximate inverse square root for each value, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;
bits(32) element;

for e = 0 to elements-1
    element = Elem[operand, e, 32];
    Elem[result, e, 32] = UnsignedRSqrtEstimate(element);

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint32x2_t vrsqrte_u32(uint32x2_t a)` | `URSQRTE Vd.2S,Vn.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrsqrteq_u32(uint32x4_t a)` | `URSQRTE Vd.4S,Vn.4S` | `Vd.4S -> result` | v7/A32/A64 |

---

## URSRA

**Description:** Unsigned Rounding Shift Right and Accumulate (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, and accumulates the final results with the vector elements of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are rounded. For truncated results, see USRA.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vrsra_n_u8(uint8x8_t a, uint8x8_t b, __builtin_constant_p(n))` | `URSRA Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vrsraq_n_u8(uint8x16_t a, uint8x16_t b, __builtin_constant_p(n))` | `URSRA Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vrsra_n_u16(uint16x4_t a, uint16x4_t b, __builtin_constant_p(n))` | `URSRA Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vrsraq_n_u16(uint16x8_t a, uint16x8_t b, __builtin_constant_p(n))` | `URSRA Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vrsra_n_u32(uint32x2_t a, uint32x2_t b, __builtin_constant_p(n))` | `URSRA Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vrsraq_n_u32(uint32x4_t a, uint32x4_t b, __builtin_constant_p(n))` | `URSRA Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vrsra_n_u64(uint64x1_t a, uint64x1_t b, __builtin_constant_p(n))` | `URSRA Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vrsraq_n_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p(n))` | `URSRA Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vrsrad_n_u64(uint64_t a, uint64_t b, __builtin_constant_p(n))` | `URSRA Dd,Dn,#n` | `Dd -> result` | A64 |

---

## USDOT

**Description:** Dot Product vector form with unsigned and signed integers. This instruction performs the dot product of the four unsigned 8-bit integer values in each 32-bit element of the first source register with the four signed 8-bit integer values in the corresponding 32-bit element of the second source register, accumulating the result into the corresponding 32-bit element of the destination register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) operand3 = V[d];
bits(datasize) result;

for e = 0 to elements-1
    bits(32) res = Elem[operand3, e, 32];
    for b = 0 to 3
        integer element1 = UInt(Elem[operand1, 4 * e + b, 8]);
        integer element2 = SInt(Elem[operand2, 4 * e + b, 8]);
        res = res + element1 * element2;
    Elem[result, e, 32] = res;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x2_t vusdot_s32(int32x2_t r, uint8x8_t a, int8x8_t b)` | `USDOT Vd.2S,Vn.8B,Vm.8B` | `Vd.2S -> result` | A32/A64 |
| `int32x2_t vusdot_lane_s32(int32x2_t r, uint8x8_t a, int8x8_t b, __builtin_constant_p(lane))` | `USDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x2_t vusdot_laneq_s32(int32x2_t r, uint8x8_t a, int8x16_t b, __builtin_constant_p(lane))` | `USDOT Vd.2S,Vn.8B,Vm.4B[lane]` | `Vd.2S -> result` | A32/A64 |
| `int32x4_t vusdotq_s32(int32x4_t r, uint8x16_t a, int8x16_t b)` | `USDOT Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |
| `int32x4_t vusdotq_lane_s32(int32x4_t r, uint8x16_t a, int8x8_t b, __builtin_constant_p(lane))` | `USDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |
| `int32x4_t vusdotq_laneq_s32(int32x4_t r, uint8x16_t a, int8x16_t b, __builtin_constant_p(lane))` | `USDOT Vd.4S,Vn.16B,Vm.4B[lane]` | `Vd.4S -> result` | A32/A64 |

---

## USHL

**Description:** Unsigned Shift Left (register). This instruction takes each element in the vector of the first source SIMD&FP register, shifts each element by a value from the least significant byte of the corresponding element of the second source SIMD&FP register, places the results in a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer round_const = 0;
integer shift;
integer element;
boolean sat;

for e = 0 to elements-1
    shift = SInt(Elem[operand2, e, esize]<7:0>);
    if rounding then
        round_const = 1 << (-shift - 1); // 0 for left shift, 2^(n-1) for right shift 
    element = (Int(Elem[operand1, e, esize], unsigned) + round_const) << shift;
    if saturating then
        (Elem[result, e, esize], sat) = SatQ(element, esize, unsigned);
        if sat then FPSR.QC = '1';
    else
        Elem[result, e, esize] = element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vshl_u8(uint8x8_t a, int8x8_t b)` | `USHL Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vshlq_u8(uint8x16_t a, int8x16_t b)` | `USHL Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vshl_u16(uint16x4_t a, int16x4_t b)` | `USHL Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vshlq_u16(uint16x8_t a, int16x8_t b)` | `USHL Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vshl_u32(uint32x2_t a, int32x2_t b)` | `USHL Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vshlq_u32(uint32x4_t a, int32x4_t b)` | `USHL Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vshl_u64(uint64x1_t a, int64x1_t b)` | `USHL Dd,Dn,Dm` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vshlq_u64(uint64x2_t a, int64x2_t b)` | `USHL Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vshld_u64(uint64_t a, int64_t b)` | `USHL Dd,Dn,Dm` | `Dd -> result` | A64 |

---

## USHLL

**Description:** Unsigned Shift Left Long (immediate). This instruction reads each vector element in the lower or upper half of the source SIMD&FP register, shifts the unsigned integer value left by the specified number of bits, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vshll_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `USHLL Vd.8H,Vn.8B,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vshll_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `USHLL Vd.4S,Vn.4H,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vshll_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `USHLL Vd.2D,Vn.2S,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint16x8_t vmovl_u8(uint8x8_t a)` | `USHLL Vd.8H,Vn.8B,#0` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vmovl_u16(uint16x4_t a)` | `USHLL Vd.4S,Vn.4H,#0` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vmovl_u32(uint32x2_t a)` | `USHLL Vd.2D,Vn.2S,#0` | `Vd.2D -> result` | v7/A32/A64 |

---

## USHLL2

**Description:** Unsigned Shift Left Long (immediate). This instruction reads each vector element in the lower or upper half of the source SIMD&FP register, shifts the unsigned integer value left by the specified number of bits, places the result into a vector, and writes the vector to the destination SIMD&FP register. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = Vpart[n, part];
bits(datasize*2) result;
integer element;

for e = 0 to elements-1
    element = Int(Elem[operand, e, esize], unsigned) << shift;
    Elem[result, e, 2*esize] = element<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vshll_high_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `USHLL2 Vd.8H,Vn.16B,#n` | `Vd.8H -> result` | A64 |
| `uint32x4_t vshll_high_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `USHLL2 Vd.4S,Vn.8H,#n` | `Vd.4S -> result` | A64 |
| `uint64x2_t vshll_high_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `USHLL2 Vd.2D,Vn.4S,#n` | `Vd.2D -> result` | A64 |
| `uint16x8_t vmovl_high_u8(uint8x16_t a)` | `USHLL2 Vd.8H,Vn.16B,#0` | `Vd.8H -> result` | A64 |
| `uint32x4_t vmovl_high_u16(uint16x8_t a)` | `USHLL2 Vd.4S,Vn.8H,#0` | `Vd.4S -> result` | A64 |
| `uint64x2_t vmovl_high_u32(uint32x4_t a)` | `USHLL2 Vd.2D,Vn.4S,#0` | `Vd.2D -> result` | A64 |

---

## USHR

**Description:** Unsigned Shift Right (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, writes the final result to a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are truncated. For rounded results, see URSHR.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vshr_n_u8(uint8x8_t a, __builtin_constant_p(n))` | `USHR Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vshrq_n_u8(uint8x16_t a, __builtin_constant_p(n))` | `USHR Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vshr_n_u16(uint16x4_t a, __builtin_constant_p(n))` | `USHR Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vshrq_n_u16(uint16x8_t a, __builtin_constant_p(n))` | `USHR Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vshr_n_u32(uint32x2_t a, __builtin_constant_p(n))` | `USHR Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vshrq_n_u32(uint32x4_t a, __builtin_constant_p(n))` | `USHR Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vshr_n_u64(uint64x1_t a, __builtin_constant_p(n))` | `USHR Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vshrq_n_u64(uint64x2_t a, __builtin_constant_p(n))` | `USHR Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vshrd_n_u64(uint64_t a, __builtin_constant_p(n))` | `USHR Dd,Dn,#n` | `Dd -> result` | A64 |

---

## USMMLA

**Description:** Unsigned and signed 8-bit integer matrix multiply-accumulate. This instruction multiplies the 2x8 matrix of unsigned 8-bit integer values in the first source vector by the 8x2 matrix of signed 8-bit integer values in the second source vector. The resulting 2x2 32-bit integer matrix product is destructively added to the 32-bit integer matrix accumulator in the destination vector. This is equivalent to performing an 8-way dot product per destination element.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(128) operand1 = V[n];
bits(128) operand2 = V[m];
bits(128) addend   = V[d];

V[d] = MatMulAdd(addend, operand1, operand2, op1_unsigned, op2_unsigned);
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int32x4_t vusmmlaq_s32(int32x4_t r, uint8x16_t a, int8x16_t b)` | `USMMLA Vd.4S,Vn.16B,Vm.16B` | `Vd.4S -> result` | A32/A64 |

---

## USQADD

**Description:** Unsigned saturating Accumulate of Signed value. This instruction adds the signed integer values of the vector elements in the source SIMD&FP register to corresponding unsigned integer values of the vector elements in the destination SIMD&FP register, and accumulates the resulting unsigned integer values with the vector elements of the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand = V[n];
bits(datasize) result;

bits(datasize) operand2 = V[d];
integer op1;
integer op2;
boolean sat;

for e = 0 to elements-1
    op1 = Int(Elem[operand, e, esize], !unsigned);
    op2 = Int(Elem[operand2, e, esize], unsigned);
    (Elem[result, e, esize], sat) = SatQ(op1 + op2, esize, unsigned);
    if sat then FPSR.QC = '1';
V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vsqadd_u8(uint8x8_t a, int8x8_t b)` | `USQADD Vd.8B,Vn.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vsqaddq_u8(uint8x16_t a, int8x16_t b)` | `USQADD Vd.16B,Vn.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vsqadd_u16(uint16x4_t a, int16x4_t b)` | `USQADD Vd.4H,Vn.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vsqaddq_u16(uint16x8_t a, int16x8_t b)` | `USQADD Vd.8H,Vn.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vsqadd_u32(uint32x2_t a, int32x2_t b)` | `USQADD Vd.2S,Vn.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vsqaddq_u32(uint32x4_t a, int32x4_t b)` | `USQADD Vd.4S,Vn.4S` | `Vd.4S -> result` | A64 |
| `uint64x1_t vsqadd_u64(uint64x1_t a, int64x1_t b)` | `USQADD Dd,Dn` | `Dd -> result` | A64 |
| `uint64x2_t vsqaddq_u64(uint64x2_t a, int64x2_t b)` | `USQADD Vd.2D,Vn.2D` | `Vd.2D -> result` | A64 |
| `uint8_t vsqaddb_u8(uint8_t a, int8_t b)` | `USQADD Bd,Bn` | `Bd -> result` | A64 |
| `uint16_t vsqaddh_u16(uint16_t a, int16_t b)` | `USQADD Hd,Hn` | `Hd -> result` | A64 |
| `uint32_t vsqadds_u32(uint32_t a, int32_t b)` | `USQADD Sd,Sn` | `Sd -> result` | A64 |
| `uint64_t vsqaddd_u64(uint64_t a, int64_t b)` | `USQADD Dd,Dn` | `Dd -> result` | A64 |

---

## USRA

**Description:** Unsigned Shift Right and Accumulate (immediate). This instruction reads each vector element in the source SIMD&FP register, right shifts each result by an immediate value, and accumulates the final results with the vector elements of the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The results are truncated. For rounded results, see URSRA.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint8x8_t vsra_n_u8(uint8x8_t a, uint8x8_t b, __builtin_constant_p(n))` | `USRA Vd.8B,Vn.8B,#n` | `Vd.8B -> result` | v7/A32/A64 |
| `uint8x16_t vsraq_n_u8(uint8x16_t a, uint8x16_t b, __builtin_constant_p(n))` | `USRA Vd.16B,Vn.16B,#n` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x4_t vsra_n_u16(uint16x4_t a, uint16x4_t b, __builtin_constant_p(n))` | `USRA Vd.4H,Vn.4H,#n` | `Vd.4H -> result` | v7/A32/A64 |
| `uint16x8_t vsraq_n_u16(uint16x8_t a, uint16x8_t b, __builtin_constant_p(n))` | `USRA Vd.8H,Vn.8H,#n` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x2_t vsra_n_u32(uint32x2_t a, uint32x2_t b, __builtin_constant_p(n))` | `USRA Vd.2S,Vn.2S,#n` | `Vd.2S -> result` | v7/A32/A64 |
| `uint32x4_t vsraq_n_u32(uint32x4_t a, uint32x4_t b, __builtin_constant_p(n))` | `USRA Vd.4S,Vn.4S,#n` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x1_t vsra_n_u64(uint64x1_t a, uint64x1_t b, __builtin_constant_p(n))` | `USRA Dd,Dn,#n` | `Dd -> result` | v7/A32/A64 |
| `uint64x2_t vsraq_n_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p(n))` | `USRA Vd.2D,Vn.2D,#n` | `Vd.2D -> result` | v7/A32/A64 |
| `uint64_t vsrad_n_u64(uint64_t a, uint64_t b, __builtin_constant_p(n))` | `USRA Dd,Dn,#n` | `Dd -> result` | A64 |

---

## USUBL

**Description:** Unsigned Subtract Long. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vsubl_u8(uint8x8_t a, uint8x8_t b)` | `USUBL Vd.8H,Vn.8B,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vsubl_u16(uint16x4_t a, uint16x4_t b)` | `USUBL Vd.4S,Vn.4H,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vsubl_u32(uint32x2_t a, uint32x2_t b)` | `USUBL Vd.2D,Vn.2S,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## USUBL2

**Description:** Unsigned Subtract Long. This instruction subtracts each vector element in the lower or upper half of the second source SIMD&FP register from the corresponding vector element of the first source SIMD&FP register, places the result into a vector, and writes the vector to the destination SIMD&FP register. All the values in this instruction are unsigned integer values. The destination vector elements are twice as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize)   operand1 = Vpart[n, part];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vsubl_high_u8(uint8x16_t a, uint8x16_t b)` | `USUBL2 Vd.8H,Vn.16B,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vsubl_high_u16(uint16x8_t a, uint16x8_t b)` | `USUBL2 Vd.4S,Vn.8H,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vsubl_high_u32(uint32x4_t a, uint32x4_t b)` | `USUBL2 Vd.2D,Vn.4S,Vm.4S` | `Vd.2D -> result` | A64 |

---

## USUBW

**Description:** Unsigned Subtract Wide. This instruction subtracts each vector element of the second source SIMD&FP register from the corresponding vector element in the lower or upper half of the first source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vsubw_u8(uint16x8_t a, uint8x8_t b)` | `USUBW Vd.8H,Vn.8H,Vm.8B` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vsubw_u16(uint32x4_t a, uint16x4_t b)` | `USUBW Vd.4S,Vn.4S,Vm.4H` | `Vd.4S -> result` | v7/A32/A64 |
| `uint64x2_t vsubw_u32(uint64x2_t a, uint32x2_t b)` | `USUBW Vd.2D,Vn.2D,Vm.2S` | `Vd.2D -> result` | v7/A32/A64 |

---

## USUBW2

**Description:** Unsigned Subtract Wide. This instruction subtracts each vector element of the second source SIMD&FP register from the corresponding vector element in the lower or upper half of the first source SIMD&FP register, places the result in a vector, and writes the vector to the SIMD&FP destination register. All the values in this instruction are signed integer values.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand1 = V[n];
bits(datasize)   operand2 = Vpart[m, part];
bits(2*datasize) result;
integer element1;
integer element2;
integer sum;

for e = 0 to elements-1
    element1 = Int(Elem[operand1, e, 2*esize], unsigned);
    element2 = Int(Elem[operand2, e, esize], unsigned);
    if sub_op then
        sum = element1 - element2;
    else
        sum = element1 + element2;
    Elem[result, e, 2*esize] = sum<2*esize-1:0>;

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint16x8_t vsubw_high_u8(uint16x8_t a, uint8x16_t b)` | `USUBW2 Vd.8H,Vn.8H,Vm.16B` | `Vd.8H -> result` | A64 |
| `uint32x4_t vsubw_high_u16(uint32x4_t a, uint16x8_t b)` | `USUBW2 Vd.4S,Vn.4S,Vm.8H` | `Vd.4S -> result` | A64 |
| `uint64x2_t vsubw_high_u32(uint64x2_t a, uint32x4_t b)` | `USUBW2 Vd.2D,Vn.2D,Vm.4S` | `Vd.2D -> result` | A64 |

---

## UZP1

**Description:** Unzip vectors (primary). This instruction reads corresponding even-numbered vector elements from the two source SIMD&FP registers, starting at zero, places the result from the first source register into consecutive elements in the lower half of a vector, and the result from the second source register into consecutive elements in the upper half of a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operandl = V[n];
bits(datasize) operandh = V[m];
bits(datasize) result;

bits(datasize*2) zipped = operandh:operandl;
for e = 0 to elements-1
    Elem[result, e, esize] = Elem[zipped, 2*e+part, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vuzp1_s8(int8x8_t a, int8x8_t b)` | `UZP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vuzp1q_s8(int8x16_t a, int8x16_t b)` | `UZP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vuzp1_s16(int16x4_t a, int16x4_t b)` | `UZP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vuzp1q_s16(int16x8_t a, int16x8_t b)` | `UZP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vuzp1_s32(int32x2_t a, int32x2_t b)` | `UZP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vuzp1q_s32(int32x4_t a, int32x4_t b)` | `UZP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vuzp1q_s64(int64x2_t a, int64x2_t b)` | `UZP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vuzp1_u8(uint8x8_t a, uint8x8_t b)` | `UZP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vuzp1q_u8(uint8x16_t a, uint8x16_t b)` | `UZP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vuzp1_u16(uint16x4_t a, uint16x4_t b)` | `UZP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vuzp1q_u16(uint16x8_t a, uint16x8_t b)` | `UZP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vuzp1_u32(uint32x2_t a, uint32x2_t b)` | `UZP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vuzp1q_u32(uint32x4_t a, uint32x4_t b)` | `UZP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vuzp1q_u64(uint64x2_t a, uint64x2_t b)` | `UZP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vuzp1q_p64(poly64x2_t a, poly64x2_t b)` | `UZP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vuzp1_f32(float32x2_t a, float32x2_t b)` | `UZP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vuzp1q_f32(float32x4_t a, float32x4_t b)` | `UZP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vuzp1q_f64(float64x2_t a, float64x2_t b)` | `UZP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vuzp1_p8(poly8x8_t a, poly8x8_t b)` | `UZP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vuzp1q_p8(poly8x16_t a, poly8x16_t b)` | `UZP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vuzp1_p16(poly16x4_t a, poly16x4_t b)` | `UZP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vuzp1q_p16(poly16x8_t a, poly16x8_t b)` | `UZP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vuzp1_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `UZP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vuzp1q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `UZP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8x2_t vuzp_s8(int8x8_t a, int8x8_t b)` | `UZP1 Vd1.8B,Vn.8B,Vm.8B;UZP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `int16x4x2_t vuzp_s16(int16x4_t a, int16x4_t b)` | `UZP1 Vd1.4H,Vn.4H,Vm.4H;UZP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `int32x2x2_t vuzp_s32(int32x2_t a, int32x2_t b)` | `UZP1 Vd1.2S,Vn.2S,Vm.2S;UZP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `float32x2x2_t vuzp_f32(float32x2_t a, float32x2_t b)` | `UZP1 Vd1.2S,Vn.2S,Vm.2S;UZP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `uint8x8x2_t vuzp_u8(uint8x8_t a, uint8x8_t b)` | `UZP1 Vd1.8B,Vn.8B,Vm.8B;UZP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `uint16x4x2_t vuzp_u16(uint16x4_t a, uint16x4_t b)` | `UZP1 Vd1.4H,Vn.4H,Vm.4H;UZP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `uint32x2x2_t vuzp_u32(uint32x2_t a, uint32x2_t b)` | `UZP1 Vd1.2S,Vn.2S,Vm.2S;UZP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `poly8x8x2_t vuzp_p8(poly8x8_t a, poly8x8_t b)` | `UZP1 Vd1.8B,Vn.8B,Vm.8B;UZP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `poly16x4x2_t vuzp_p16(poly16x4_t a, poly16x4_t b)` | `UZP1 Vd1.4H,Vn.4H,Vm.4H;UZP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `mfloat8x8x2_t vuzp_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `UZP1 Vd1.8B,Vn.8B,Vm.8B;UZP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | A64 |
| `int8x16x2_t vuzpq_s8(int8x16_t a, int8x16_t b)` | `UZP1 Vd1.16B,Vn.16B,Vm.16B;UZP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `int16x8x2_t vuzpq_s16(int16x8_t a, int16x8_t b)` | `UZP1 Vd1.8H,Vn.8H,Vm.8H;UZP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `int32x4x2_t vuzpq_s32(int32x4_t a, int32x4_t b)` | `UZP1 Vd1.4S,Vn.4S,Vm.4S;UZP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `float32x4x2_t vuzpq_f32(float32x4_t a, float32x4_t b)` | `UZP1 Vd1.4S,Vn.4S,Vm.4S;UZP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `uint8x16x2_t vuzpq_u8(uint8x16_t a, uint8x16_t b)` | `UZP1 Vd1.16B,Vn.16B,Vm.16B;UZP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `uint16x8x2_t vuzpq_u16(uint16x8_t a, uint16x8_t b)` | `UZP1 Vd1.8H,Vn.8H,Vm.8H;UZP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `uint32x4x2_t vuzpq_u32(uint32x4_t a, uint32x4_t b)` | `UZP1 Vd1.4S,Vn.4S,Vm.4S;UZP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `poly8x16x2_t vuzpq_p8(poly8x16_t a, poly8x16_t b)` | `UZP1 Vd1.16B,Vn.16B,Vm.16B;UZP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `poly16x8x2_t vuzpq_p16(poly16x8_t a, poly16x8_t b)` | `UZP1 Vd1.8H,Vn.8H,Vm.8H;UZP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `mfloat8x16x2_t vuzpq_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `UZP1 Vd1.16B,Vn.16B,Vm.16B;UZP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | A64 |
| `float16x4x2_t vuzp_f16(float16x4_t a, float16x4_t b)` | `UZP1 Vd1.4H,Vn.4H,Vm.4H;UZP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `float16x8x2_t vuzpq_f16(float16x8_t a, float16x8_t b)` | `UZP1 Vd1.8H,Vn.8H,Vm.8H;UZP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `float16x4_t vuzp1_f16(float16x4_t a, float16x4_t b)` | `UZP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vuzp1q_f16(float16x8_t a, float16x8_t b)` | `UZP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## UZP2

**Description:** Unzip vectors (secondary). This instruction reads corresponding odd-numbered vector elements from the two source SIMD&FP registers, places the result from the first source register into consecutive elements in the lower half of a vector, and the result from the second source register into consecutive elements in the upper half of a vector, and writes the vector to the destination SIMD&FP register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operandl = V[n];
bits(datasize) operandh = V[m];
bits(datasize) result;

bits(datasize*2) zipped = operandh:operandl;
for e = 0 to elements-1
    Elem[result, e, esize] = Elem[zipped, 2*e+part, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vuzp2_s8(int8x8_t a, int8x8_t b)` | `UZP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vuzp2q_s8(int8x16_t a, int8x16_t b)` | `UZP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vuzp2_s16(int16x4_t a, int16x4_t b)` | `UZP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vuzp2q_s16(int16x8_t a, int16x8_t b)` | `UZP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vuzp2_s32(int32x2_t a, int32x2_t b)` | `UZP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vuzp2q_s32(int32x4_t a, int32x4_t b)` | `UZP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vuzp2q_s64(int64x2_t a, int64x2_t b)` | `UZP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vuzp2_u8(uint8x8_t a, uint8x8_t b)` | `UZP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vuzp2q_u8(uint8x16_t a, uint8x16_t b)` | `UZP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vuzp2_u16(uint16x4_t a, uint16x4_t b)` | `UZP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vuzp2q_u16(uint16x8_t a, uint16x8_t b)` | `UZP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vuzp2_u32(uint32x2_t a, uint32x2_t b)` | `UZP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vuzp2q_u32(uint32x4_t a, uint32x4_t b)` | `UZP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vuzp2q_u64(uint64x2_t a, uint64x2_t b)` | `UZP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vuzp2q_p64(poly64x2_t a, poly64x2_t b)` | `UZP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vuzp2_f32(float32x2_t a, float32x2_t b)` | `UZP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vuzp2q_f32(float32x4_t a, float32x4_t b)` | `UZP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vuzp2q_f64(float64x2_t a, float64x2_t b)` | `UZP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vuzp2_p8(poly8x8_t a, poly8x8_t b)` | `UZP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vuzp2q_p8(poly8x16_t a, poly8x16_t b)` | `UZP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vuzp2_p16(poly16x4_t a, poly16x4_t b)` | `UZP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vuzp2q_p16(poly16x8_t a, poly16x8_t b)` | `UZP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vuzp2_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `UZP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vuzp2q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `UZP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `float16x4_t vuzp2_f16(float16x4_t a, float16x4_t b)` | `UZP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vuzp2q_f16(float16x8_t a, float16x8_t b)` | `UZP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## XAR

**Description:** Exclusive OR and Rotate performs a bitwise exclusive OR of the 128-bit vectors in the two source SIMD&FP registers, rotates each 64-bit element of the resulting 128-bit vector right by the value specified by a 6-bit immediate value, and writes the result to the destination SIMD&FP register.

**Operation:**
```
AArch64.CheckFPAdvSIMDEnabled();

bits(128) Vm = V[m];
bits(128) Vn = V[n];
bits(128) tmp;
tmp = Vn EOR Vm; 
V[d] = ROR(tmp<127:64>, UInt(imm6)):ROR(tmp<63:0>, UInt(imm6));
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `uint64x2_t vxarq_u64(uint64x2_t a, uint64x2_t b, __builtin_constant_p (imm6))` | `XAR Vd.2D, Vn.2D, Vm.2D, imm6` | `Vd.2D -> result` | A64 |

---

## XTN

**Description:** Extract Narrow. This instruction reads each vector element from the source SIMD&FP register, narrows each value to half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    Elem[result, e, esize] = element<esize-1:0>;
Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vmovn_s16(int16x8_t a)` | `XTN Vd.8B,Vn.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `int16x4_t vmovn_s32(int32x4_t a)` | `XTN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `int32x2_t vmovn_s64(int64x2_t a)` | `XTN Vd.2S,Vn.2D` | `Vd.2S -> result` | v7/A32/A64 |
| `uint8x8_t vmovn_u16(uint16x8_t a)` | `XTN Vd.8B,Vn.8H` | `Vd.8B -> result` | v7/A32/A64 |
| `uint16x4_t vmovn_u32(uint32x4_t a)` | `XTN Vd.4H,Vn.4S` | `Vd.4H -> result` | v7/A32/A64 |
| `uint32x2_t vmovn_u64(uint64x2_t a)` | `XTN Vd.2S,Vn.2D` | `Vd.2S -> result` | v7/A32/A64 |

---

## XTN2

**Description:** Extract Narrow. This instruction reads each vector element from the source SIMD&FP register, narrows each value to half the original width, places the result into a vector, and writes the vector to the lower or upper half of the destination SIMD&FP register. The destination vector elements are half as long as the source vector elements.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(2*datasize) operand = V[n];
bits(datasize) result;
bits(2*esize) element;

for e = 0 to elements-1
    element = Elem[operand, e, 2*esize];
    Elem[result, e, esize] = element<esize-1:0>;
Vpart[d, part] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x16_t vmovn_high_s16(int8x8_t r, int16x8_t a)` | `XTN2 Vd.16B,Vn.8H` | `Vd.16B -> result` | v7/A32/A64 |
| `int16x8_t vmovn_high_s32(int16x4_t r, int32x4_t a)` | `XTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | v7/A32/A64 |
| `int32x4_t vmovn_high_s64(int32x2_t r, int64x2_t a)` | `XTN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | v7/A32/A64 |
| `uint8x16_t vmovn_high_u16(uint8x8_t r, uint16x8_t a)` | `XTN2 Vd.16B,Vn.8H` | `Vd.16B -> result` | v7/A32/A64 |
| `uint16x8_t vmovn_high_u32(uint16x4_t r, uint32x4_t a)` | `XTN2 Vd.8H,Vn.4S` | `Vd.8H -> result` | v7/A32/A64 |
| `uint32x4_t vmovn_high_u64(uint32x2_t r, uint64x2_t a)` | `XTN2 Vd.4S,Vn.2D` | `Vd.4S -> result` | v7/A32/A64 |

---

## ZIP1

**Description:** Zip vectors (primary). This instruction reads adjacent vector elements from the lower half of two source SIMD&FP registers as pairs, interleaves the pairs and places them into a vector, and writes the vector to the destination SIMD&FP register. The first pair from the first source register is placed into the two lowest vector elements, with subsequent pairs taken alternately from each source register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer base = part * pairs;

for p = 0 to pairs-1
    Elem[result, 2*p+0, esize] = Elem[operand1, base+p, esize];
    Elem[result, 2*p+1, esize] = Elem[operand2, base+p, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vzip1_s8(int8x8_t a, int8x8_t b)` | `ZIP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vzip1q_s8(int8x16_t a, int8x16_t b)` | `ZIP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vzip1_s16(int16x4_t a, int16x4_t b)` | `ZIP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vzip1q_s16(int16x8_t a, int16x8_t b)` | `ZIP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vzip1_s32(int32x2_t a, int32x2_t b)` | `ZIP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vzip1q_s32(int32x4_t a, int32x4_t b)` | `ZIP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vzip1q_s64(int64x2_t a, int64x2_t b)` | `ZIP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vzip1_u8(uint8x8_t a, uint8x8_t b)` | `ZIP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vzip1q_u8(uint8x16_t a, uint8x16_t b)` | `ZIP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vzip1_u16(uint16x4_t a, uint16x4_t b)` | `ZIP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vzip1q_u16(uint16x8_t a, uint16x8_t b)` | `ZIP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vzip1_u32(uint32x2_t a, uint32x2_t b)` | `ZIP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vzip1q_u32(uint32x4_t a, uint32x4_t b)` | `ZIP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vzip1q_u64(uint64x2_t a, uint64x2_t b)` | `ZIP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vzip1q_p64(poly64x2_t a, poly64x2_t b)` | `ZIP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vzip1_f32(float32x2_t a, float32x2_t b)` | `ZIP1 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vzip1q_f32(float32x4_t a, float32x4_t b)` | `ZIP1 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vzip1q_f64(float64x2_t a, float64x2_t b)` | `ZIP1 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vzip1_p8(poly8x8_t a, poly8x8_t b)` | `ZIP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vzip1q_p8(poly8x16_t a, poly8x16_t b)` | `ZIP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vzip1_p16(poly16x4_t a, poly16x4_t b)` | `ZIP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vzip1q_p16(poly16x8_t a, poly16x8_t b)` | `ZIP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vzip1_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `ZIP1 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vzip1q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `ZIP1 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int8x8x2_t vzip_s8(int8x8_t a, int8x8_t b)` | `ZIP1 Vd1.8B,Vn.8B,Vm.8B;ZIP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `int16x4x2_t vzip_s16(int16x4_t a, int16x4_t b)` | `ZIP1 Vd1.4H,Vn.4H,Vm.4H;ZIP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `uint8x8x2_t vzip_u8(uint8x8_t a, uint8x8_t b)` | `ZIP1 Vd1.8B,Vn.8B,Vm.8B;ZIP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `uint16x4x2_t vzip_u16(uint16x4_t a, uint16x4_t b)` | `ZIP1 Vd1.4H,Vn.4H,Vm.4H;ZIP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `poly8x8x2_t vzip_p8(poly8x8_t a, poly8x8_t b)` | `ZIP1 Vd1.8B,Vn.8B,Vm.8B;ZIP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | v7/A32/A64 |
| `poly16x4x2_t vzip_p16(poly16x4_t a, poly16x4_t b)` | `ZIP1 Vd1.4H,Vn.4H,Vm.4H;ZIP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `mfloat8x8x2_t vzip_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `ZIP1 Vd1.8B,Vn.8B,Vm.8B;ZIP2 Vd2.8B,Vn.8B,Vm.8B` | `Vd1.8B -> result.val[0];Vd2.8B -> result.val[1]` | A64 |
| `int32x2x2_t vzip_s32(int32x2_t a, int32x2_t b)` | `ZIP1 Vd1.2S,Vn.2S,Vm.2S;ZIP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `float32x2x2_t vzip_f32(float32x2_t a, float32x2_t b)` | `ZIP1 Vd1.2S,Vn.2S,Vm.2S;ZIP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `uint32x2x2_t vzip_u32(uint32x2_t a, uint32x2_t b)` | `ZIP1 Vd1.2S,Vn.2S,Vm.2S;ZIP2 Vd2.2S,Vn.2S,Vm.2S` | `Vd1.2S -> result.val[0];Vd2.2S -> result.val[1]` | v7/A32/A64 |
| `int8x16x2_t vzipq_s8(int8x16_t a, int8x16_t b)` | `ZIP1 Vd1.16B,Vn.16B,Vm.16B;ZIP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `int16x8x2_t vzipq_s16(int16x8_t a, int16x8_t b)` | `ZIP1 Vd1.8H,Vn.8H,Vm.8H;ZIP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `int32x4x2_t vzipq_s32(int32x4_t a, int32x4_t b)` | `ZIP1 Vd1.4S,Vn.4S,Vm.4S;ZIP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `float32x4x2_t vzipq_f32(float32x4_t a, float32x4_t b)` | `ZIP1 Vd1.4S,Vn.4S,Vm.4S;ZIP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `uint8x16x2_t vzipq_u8(uint8x16_t a, uint8x16_t b)` | `ZIP1 Vd1.16B,Vn.16B,Vm.16B;ZIP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `uint16x8x2_t vzipq_u16(uint16x8_t a, uint16x8_t b)` | `ZIP1 Vd1.8H,Vn.8H,Vm.8H;ZIP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `uint32x4x2_t vzipq_u32(uint32x4_t a, uint32x4_t b)` | `ZIP1 Vd1.4S,Vn.4S,Vm.4S;ZIP2 Vd2.4S,Vn.4S,Vm.4S` | `Vd1.4S -> result.val[0];Vd2.4S -> result.val[1]` | v7/A32/A64 |
| `poly8x16x2_t vzipq_p8(poly8x16_t a, poly8x16_t b)` | `ZIP1 Vd1.16B,Vn.16B,Vm.16B;ZIP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | v7/A32/A64 |
| `poly16x8x2_t vzipq_p16(poly16x8_t a, poly16x8_t b)` | `ZIP1 Vd1.8H,Vn.8H,Vm.8H;ZIP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `mfloat8x16x2_t vzipq_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `ZIP1 Vd1.16B,Vn.16B,Vm.16B;ZIP2 Vd2.16B,Vn.16B,Vm.16B` | `Vd1.16B -> result.val[0];Vd2.16B -> result.val[1]` | A64 |
| `float16x4x2_t vzip_f16(float16x4_t a, float16x4_t b)` | `ZIP1 Vd1.4H,Vn.4H,Vm.4H;ZIP2 Vd2.4H,Vn.4H,Vm.4H` | `Vd1.4H -> result.val[0];Vd2.4H -> result.val[1]` | v7/A32/A64 |
| `float16x8x2_t vzipq_f16(float16x8_t a, float16x8_t b)` | `ZIP1 Vd1.8H,Vn.8H,Vm.8H;ZIP2 Vd2.8H,Vn.8H,Vm.8H` | `Vd1.8H -> result.val[0];Vd2.8H -> result.val[1]` | v7/A32/A64 |
| `float16x4_t vzip1_f16(float16x4_t a, float16x4_t b)` | `ZIP1 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vzip1q_f16(float16x8_t a, float16x8_t b)` | `ZIP1 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## ZIP2

**Description:** Zip vectors (secondary). This instruction reads adjacent vector elements from the upper half of two source SIMD&FP registers as pairs, interleaves the pairs and places them into a vector, and writes the vector to the destination SIMD&FP register. The first pair from the first source register is placed into the two lowest vector elements, with subsequent pairs taken alternately from each source register.

**Operation:**
```
CheckFPAdvSIMDEnabled64();
bits(datasize) operand1 = V[n];
bits(datasize) operand2 = V[m];
bits(datasize) result;

integer base = part * pairs;

for p = 0 to pairs-1
    Elem[result, 2*p+0, esize] = Elem[operand1, base+p, esize];
    Elem[result, 2*p+1, esize] = Elem[operand2, base+p, esize];

V[d] = result;
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `int8x8_t vzip2_s8(int8x8_t a, int8x8_t b)` | `ZIP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `int8x16_t vzip2q_s8(int8x16_t a, int8x16_t b)` | `ZIP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `int16x4_t vzip2_s16(int16x4_t a, int16x4_t b)` | `ZIP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `int16x8_t vzip2q_s16(int16x8_t a, int16x8_t b)` | `ZIP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `int32x2_t vzip2_s32(int32x2_t a, int32x2_t b)` | `ZIP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `int32x4_t vzip2q_s32(int32x4_t a, int32x4_t b)` | `ZIP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `int64x2_t vzip2q_s64(int64x2_t a, int64x2_t b)` | `ZIP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `uint8x8_t vzip2_u8(uint8x8_t a, uint8x8_t b)` | `ZIP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `uint8x16_t vzip2q_u8(uint8x16_t a, uint8x16_t b)` | `ZIP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `uint16x4_t vzip2_u16(uint16x4_t a, uint16x4_t b)` | `ZIP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `uint16x8_t vzip2q_u16(uint16x8_t a, uint16x8_t b)` | `ZIP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `uint32x2_t vzip2_u32(uint32x2_t a, uint32x2_t b)` | `ZIP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `uint32x4_t vzip2q_u32(uint32x4_t a, uint32x4_t b)` | `ZIP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `uint64x2_t vzip2q_u64(uint64x2_t a, uint64x2_t b)` | `ZIP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly64x2_t vzip2q_p64(poly64x2_t a, poly64x2_t b)` | `ZIP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `float32x2_t vzip2_f32(float32x2_t a, float32x2_t b)` | `ZIP2 Vd.2S,Vn.2S,Vm.2S` | `Vd.2S -> result` | A64 |
| `float32x4_t vzip2q_f32(float32x4_t a, float32x4_t b)` | `ZIP2 Vd.4S,Vn.4S,Vm.4S` | `Vd.4S -> result` | A64 |
| `float64x2_t vzip2q_f64(float64x2_t a, float64x2_t b)` | `ZIP2 Vd.2D,Vn.2D,Vm.2D` | `Vd.2D -> result` | A64 |
| `poly8x8_t vzip2_p8(poly8x8_t a, poly8x8_t b)` | `ZIP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `poly8x16_t vzip2q_p8(poly8x16_t a, poly8x16_t b)` | `ZIP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `poly16x4_t vzip2_p16(poly16x4_t a, poly16x4_t b)` | `ZIP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `poly16x8_t vzip2q_p16(poly16x8_t a, poly16x8_t b)` | `ZIP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |
| `mfloat8x8_t vzip2_mf8(mfloat8x8_t a, mfloat8x8_t b)` | `ZIP2 Vd.8B,Vn.8B,Vm.8B` | `Vd.8B -> result` | A64 |
| `mfloat8x16_t vzip2q_mf8(mfloat8x16_t a, mfloat8x16_t b)` | `ZIP2 Vd.16B,Vn.16B,Vm.16B` | `Vd.16B -> result` | A64 |
| `float16x4_t vzip2_f16(float16x4_t a, float16x4_t b)` | `ZIP2 Vd.4H,Vn.4H,Vm.4H` | `Vd.4H -> result` | A64 |
| `float16x8_t vzip2q_f16(float16x8_t a, float16x8_t b)` | `ZIP2 Vd.8H,Vn.8H,Vm.8H` | `Vd.8H -> result` | A64 |

---

## result

**Description:** Floating-point multiply-add to accumulator

**Operation:**
```
No operation information.
```

| Intrinsic | Instruction | Result | Arch |
|-----------|------------|--------|------|
| `float32x2_t vmla_f32(float32x2_t a, float32x2_t b, float32x2_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlaq_f32(float32x4_t a, float32x4_t b, float32x4_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float64x1_t vmla_f64(float64x1_t a, float64x1_t b, float64x1_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | A64 |
| `float64x2_t vmlaq_f64(float64x2_t a, float64x2_t b, float64x2_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | A64 |
| `float32x2_t vmls_f32(float32x2_t a, float32x2_t b, float32x2_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlsq_f32(float32x4_t a, float32x4_t b, float32x4_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float64x1_t vmls_f64(float64x1_t a, float64x1_t b, float64x1_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | A64 |
| `float64x2_t vmlsq_f64(float64x2_t a, float64x2_t b, float64x2_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | A64 |
| `float32x2_t vmla_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __builtin_constant_p(lane))` | `result = vadd(a, vmul(b, v[lane]))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlaq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __builtin_constant_p(lane))` | `result = vadd(a, vmul(b, v[lane]))` | `N/A` | v7/A32/A64 |
| `float32x2_t vmla_laneq_f32(float32x2_t a, float32x2_t b, float32x4_t v, __builtin_constant_p(lane))` | `result = vadd(a, vmul(b, v[lane]))` | `N/A` | A64 |
| `float32x4_t vmlaq_laneq_f32(float32x4_t a, float32x4_t b, float32x4_t v, __builtin_constant_p(lane))` | `result = vadd(a, vmul(b, v[lane]))` | `N/A` | A64 |
| `float32x2_t vmls_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __builtin_constant_p(lane))` | `result = vsub(a, vmul(b, v[lane]))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlsq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __builtin_constant_p(lane))` | `result = vsub(a, vmul(b, v[lane]))` | `N/A` | v7/A32/A64 |
| `float32x2_t vmls_laneq_f32(float32x2_t a, float32x2_t b, float32x4_t v, __builtin_constant_p(lane))` | `result = vsub(a, vmul(b, v[lane]))` | `N/A` | A64 |
| `float32x4_t vmlsq_laneq_f32(float32x4_t a, float32x4_t b, float32x4_t v, __builtin_constant_p(lane))` | `result = vsub(a, vmul(b, v[lane]))` | `N/A` | A64 |
| `float32x2_t vmla_n_f32(float32x2_t a, float32x2_t b, float32_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlaq_n_f32(float32x4_t a, float32x4_t b, float32_t c)` | `result = vadd(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float32x2_t vmls_n_f32(float32x2_t a, float32x2_t b, float32_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | v7/A32/A64 |
| `float32x4_t vmlsq_n_f32(float32x4_t a, float32x4_t b, float32_t c)` | `result = vsub(a, vmul(b, c))` | `N/A` | v7/A32/A64 |

---

