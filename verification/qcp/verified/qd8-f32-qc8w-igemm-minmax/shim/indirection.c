#include "indirection.h"
const char* qd8_select_input(const char*entry,const char*zero,const char*zero_data,qd8_size_t a_offset)
/*@ Require select_domain(entry,zero,a_offset) && emp
 Ensure __return == selected_address(entry,zero,zero_data,a_offset) && emp */
{
 const char*a0=entry;
 if(a0!=zero) {a0=(const char*)((qd8_uintptr_t)a0+a_offset);}
 else {a0=zero_data;}
 return a0;
}
void qd8_read_indirect(const char**out,const char**table,qd8_size_t n,qd8_size_t index,
 const char*zero,const char*zero_data,qd8_size_t a_offset)
/*@ With (entries:list Z)
 Require 0 <= index && index < n && select_domain(zget(index,entries),zero,a_offset) &&
 (PtrArray::full(table,n,entries) * undef_data_at(out,char*))
 Ensure PtrArray::full(table,n,entries) *
 data_at(out,char*,selected_address(zget(index,entries),zero,zero_data,a_offset)) */
{
 const char*entry=table[index];
 *out=qd8_select_input(entry,zero,zero_data,a_offset);
}
char qd8_read_selected_byte(const char**table,qd8_size_t n,qd8_size_t index,
 const char*zero,const char*zero_data,qd8_size_t a_offset,
 qd8_size_t readable_bytes,qd8_size_t depth)
/*@ With (entries:list Z) (xs:list Z)
 Require 0 <= index && index < n && 0 <= depth && depth < readable_bytes &&
 select_domain(zget(index,entries),zero,a_offset) &&
 (PtrArray::full(table,n,entries) *
 CharArray::full(selected_address(zget(index,entries),zero,zero_data,a_offset),readable_bytes,xs))
 Ensure __return == zget(depth,xs) &&
 (PtrArray::full(table,n,entries) *
 CharArray::full(selected_address(zget(index,entries),zero,zero_data,a_offset),readable_bytes,xs)) */
{
 const char*entry=table[index];
 const char*input=qd8_select_input(entry,zero,zero_data,a_offset);
 return input[depth];
}
