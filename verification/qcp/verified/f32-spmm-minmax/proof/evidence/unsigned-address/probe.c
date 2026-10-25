/*@ Import Coq Require Import SpmmSpec.Address */
/*@ Extern Coq (word64:Z -> Z) */
typedef unsigned long long size_t;
size_t decrement(size_t stride,size_t count)
/*@ Require emp Ensure __return == word64(stride * count - 16) && emp */
{return stride * count - 16;}
size_t restore(size_t base,size_t stride,size_t count)
/*@ Require emp Ensure __return == word64(base + 16) && emp */
{
 size_t decrement = stride * count - 16;
 size_t after = base + stride * count;
 return after - decrement;
}
