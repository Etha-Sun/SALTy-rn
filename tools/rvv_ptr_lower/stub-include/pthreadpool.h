#ifndef RVV_PTR_LOWER_STUB_PTHREADPOOL_H
#define RVV_PTR_LOWER_STUB_PTHREADPOOL_H
/* Stub for rvv_ptr_lower: the pthreadpool submodule is not checked out in every working
 * copy, and the kernels only name the pthreadpool_t type. It is a last-resort include
 * path (used only when the real header is absent): for parsing, and for compiling the
 * differential-test harnesses (validate*.py), where original and rewritten kernel see the
 * same stub. No kernel calls into pthreadpool. */
typedef struct pthreadpool* pthreadpool_t;
#endif
