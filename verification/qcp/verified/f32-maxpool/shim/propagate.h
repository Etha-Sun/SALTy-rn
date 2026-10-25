#ifndef MP_PROPAGATE_H
#define MP_PROPAGATE_H
vfloat32m8_t mp_propagate_nan(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t numeric,size_t vl);
vfloat32m8_t mp_max_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t mp_min_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t mp_max_vf(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t mp_min_vf(vfloat32m8_t a,float b,size_t vl);
#endif
