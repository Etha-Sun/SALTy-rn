"""Finite ground fragment only, not a model of the complete WP theories."""
import json
# Addresses are (base,offset), in float elements. Pointer casts need not
# preserve this affine geometry under the fragment's mere inverse axioms.
null=(0,0); p=(1,0); shifted=(1,4); unrelated=(2,0)
enc={null:0,(1,0):100,(1,1):120,(1,2):140,(1,3):160,(1,4):200,unrelated:116}
dec={v:k for k,v in enc.items()}; malloc={0:0,1:5,2:1}
roundtrip=all(dec[enc[a]]==a for a in enc)
valid=lambda a: a[0]>0 and 0<=a[1]<malloc[a[0]]
checks={'null_code_zero':enc[null]==0,'all_encoded_roundtrips':roundtrip,
 'uint64_codes':all(0<=v<2**64 for v in enc.values()),
 'valid_five_element_buffer':all(valid((1,i)) for i in range(5)),
 'typed_shift_geometry':shifted==(p[0],p[1]+4),
 'byte_stride_no_wrap':enc[p]+16<2**64,
 'inverse_add_equals_typed_shift':dec[enc[p]+16]==shifted}
assert all(v for k,v in checks.items() if k!='inverse_add_equals_typed_shift')
assert not checks['inverse_add_equals_typed_shift']
print(json.dumps({'scope':'Finite ground fragment: validity, address range, null and inverse at listed addresses; NOT all WP axioms or a real-machine counterexample.','encoding':[{ 'address':a,'integer':v} for a,v in enc.items()],'checks':checks},indent=2))
