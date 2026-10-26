#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-argmaxpool/shim/neon_kernel_frontend.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-argmaxpool/shim/borrowed_bindings.h"
void test_neon(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment) XNN_OOB_READS
/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require app_arguments(D,output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment) && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)
Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_output(F,P,D,O,I)) * ap_index(WI,app_neon_index(F,P,D,O,I)) */
{
  /*@ Assert pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && output_pixels==app_pixels(D) && pooling_elements==app_rows(D) && channels==app_channels(D) && input==app_input(D) && input_offset==app_offset(D) && input_pixel_stride==app_pixel_stride(D) && output==app_output_base(D) && index==app_index_base(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<output_pixels && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I) */
  assert(output_pixels != 0);
  assert(pooling_elements != 0);
  assert(channels != 0);

  const uint32x4_t v1 = vdupq_n_u32(1);

  do {
    // Accumulators start out null, after each pass the accumulator is set to
    // the output.
    const float* ab = NULL;
    const uint32_t* ib = NULL;
    const float** id = input;

    uint32x4_t vidx0 = vdupq_n_u32(0);
    uint32x4_t vidx8;

    assert(!ab);
    assert(!ib);

    size_t k = pooling_elements;
    /*@ Inv Assert pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && id==app_table_cursor(input,pooling_elements,app_group_cursor(D,k)) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
    for (; k > 0; k = k > 9 ? k - 9 : 0) {
      /*@ Assert pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),0) && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
      const float* i0 = ap_read_table(id);
      id += 1;
      const float* i1 = i0;
      if (1 < k) {
        /*@ Assert 1<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),1) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i1 = ap_read_table(id);
        id += 1;
      }
      const float* i2 = i0;
      if (2 < k) {
        /*@ Assert 2<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),2) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i2 = ap_read_table(id);
        id += 1;
      }
      const float* i3 = i0;
      if (3 < k) {
        /*@ Assert 3<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),3) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i3 = ap_read_table(id);
        id += 1;
      }
      const float* i4 = i0;
      if (4 < k) {
        /*@ Assert 4<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),4) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i4 = ap_read_table(id);
        id += 1;
      }
      const float* i5 = i0;
      if (5 < k) {
        /*@ Assert 5<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),5) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),4) && i5==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i5 = ap_read_table(id);
        id += 1;
      }
      const float* i6 = i0;
      if (6 < k) {
        /*@ Assert 6<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),6) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),4) && i5==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),5) && i6==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i6 = ap_read_table(id);
        id += 1;
      }
      const float* i7 = i0;
      if (7 < k) {
        /*@ Assert 7<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),7) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),4) && i5==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),5) && i6==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),6) && i7==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i7 = ap_read_table(id);
        id += 1;
      }
      const float* i8 = i0;
      if (8 < k) {
        /*@ Assert 8<k && pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),8) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),4) && i5==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),5) && i6==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),6) && i7==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),7) && i8==i0 && id!=0 && ap_ptr_present(P,id) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
        i8 = ap_read_table(id);
        id += 1;
      }
      /*@ Assert pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && ab==app_previous_cursor(app_group_cursor(D,k),output,0) && ib==app_previous_cursor(app_group_cursor(D,k),index,0) && 0<k && id==app_read_cursor(input,pooling_elements,app_group_cursor(D,k),9) && i0==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),0) && i1==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),1) && i2==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),2) && i3==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),3) && i4==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),4) && i5==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),5) && i6==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),6) && i7==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),7) && i8==app_row_pointer(P,input,pooling_elements,app_group_cursor(D,k),8) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8)) */
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
      i3 = (const float*) ((uintptr_t) i3 + input_offset);
      i4 = (const float*) ((uintptr_t) i4 + input_offset);
      i5 = (const float*) ((uintptr_t) i5 + input_offset);
      i6 = (const float*) ((uintptr_t) i6 + input_offset);
      i7 = (const float*) ((uintptr_t) i7 + input_offset);
      i8 = (const float*) ((uintptr_t) i8 + input_offset);

      float* o = output;
      uint32_t* i = index;
      size_t c = channels;
      /*@ Inv Assert (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && (channels-c)==0 && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8))) || (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && 0<(channels-c) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx8.s0),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s1),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s2),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s3),unsigned int,ap_u32(9*app_group_cursor(D,k)+8))) */
      for (; c >= 4; c -= 4) {
        /*@ Assert (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && 4<=c && ap_write_window(W,o,4) && ap_write_window(WI,i,4) && ap_window(F,i0,4) && ap_window(F,i1,4) && ap_window(F,i2,4) && ap_window(F,i3,4) && ap_window(F,i4,4) && ap_window(F,i5,4) && ap_window(F,i6,4) && ap_window(F,i7,4) && ap_window(F,i8,4) && (channels-c)==0 && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8))) || (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && 4<=c && ap_write_window(W,o,4) && ap_write_window(WI,i,4) && ap_window(F,i0,4) && ap_window(F,i1,4) && ap_window(F,i2,4) && ap_window(F,i3,4) && ap_window(F,i4,4) && ap_window(F,i5,4) && ap_window(F,i6,4) && ap_window(F,i7,4) && ap_window(F,i8,4) && 0<(channels-c) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx8.s0),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s1),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s2),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s3),unsigned int,ap_u32(9*app_group_cursor(D,k)+8))) */
        const float32x4_t vi0 = vld1q_f32(i0) /*@ where (readonly_map) F=F */;
        i0 += 4;
        const float32x4_t vi1 = vld1q_f32(i1) /*@ where (readonly_map) F=F */;
        i1 += 4;
        const float32x4_t vi2 = vld1q_f32(i2) /*@ where (readonly_map) F=F */;
        i2 += 4;
        const float32x4_t vi3 = vld1q_f32(i3) /*@ where (readonly_map) F=F */;
        i3 += 4;
        const float32x4_t vi4 = vld1q_f32(i4) /*@ where (readonly_map) F=F */;
        i4 += 4;
        const float32x4_t vi5 = vld1q_f32(i5) /*@ where (readonly_map) F=F */;
        i5 += 4;
        const float32x4_t vi6 = vld1q_f32(i6) /*@ where (readonly_map) F=F */;
        i6 += 4;
        const float32x4_t vi7 = vld1q_f32(i7) /*@ where (readonly_map) F=F */;
        i7 += 4;
        const float32x4_t vi8 = vld1q_f32(i8) /*@ where (readonly_map) F=F */;
        i8 += 4;

        float32x4_t vmax;
        uint32x4_t vidx;
        if (ab) {
          vmax = vld1q_f32(ab) /*@ where (output_map) W=W,O=app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I) */; ab += 4;
          vidx = vld1q_u32(ib) /*@ where (output_map) W=WI,O=app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I) */; ib += 4;

          const uint32x4_t vm0 = vcgtq_f32(vi0, vmax) /*@ where a=0,b=0 */;
          vmax = vbslq_f32(vm0, vi0, vmax);
          vidx = vbslq_u32(vm0, vidx0, vidx) /*@ where m=0,a=0,b=0 */;
        } else {
          vmax = vi0;
          vidx = vidx0;
        }

        const uint32x4_t vm1 = vcgtq_f32(vi1, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx1 = vaddq_u32(vidx0, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm1, vi1, vmax);
        vidx = vbslq_u32(vm1, vidx1, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm2 = vcgtq_f32(vi2, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx2 = vaddq_u32(vidx1, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm2, vi2, vmax);
        vidx = vbslq_u32(vm2, vidx2, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm3 = vcgtq_f32(vi3, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx3 = vaddq_u32(vidx2, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm3, vi3, vmax);
        vidx = vbslq_u32(vm3, vidx3, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm4 = vcgtq_f32(vi4, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx4 = vaddq_u32(vidx3, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm4, vi4, vmax);
        vidx = vbslq_u32(vm4, vidx4, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm5 = vcgtq_f32(vi5, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx5 = vaddq_u32(vidx4, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm5, vi5, vmax);
        vidx = vbslq_u32(vm5, vidx5, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm6 = vcgtq_f32(vi6, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx6 = vaddq_u32(vidx5, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm6, vi6, vmax);
        vidx = vbslq_u32(vm6, vidx6, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm7 = vcgtq_f32(vi7, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx7 = vaddq_u32(vidx6, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm7, vi7, vmax);
        vidx = vbslq_u32(vm7, vidx7, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm8 = vcgtq_f32(vi8, vmax) /*@ where a=0,b=0 */;
        vidx8 = vaddq_u32(vidx7, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm8, vi8, vmax);
        vidx = vbslq_u32(vm8, vidx8, vidx) /*@ where m=0,a=0,b=0 */;

        vst1q_f32(o, vmax);
        o += 4;
        vst1q_u32(i, vidx);
        i += 4;
      }
      if (c != 0) {
        /*@ Assert (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && 0<c && c<4 && ap_write_window(W,o,c) && ap_write_window(WI,i,c) && ap_window(F,i0,4) && ap_window(F,i1,4) && ap_window(F,i2,4) && ap_window(F,i3,4) && ap_window(F,i4,4) && ap_window(F,i5,4) && ap_window(F,i6,4) && ap_window(F,i7,4) && ap_window(F,i8,4) && (channels-c)==0 && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * UndefStructPreduint32x4_t(&(vidx8))) || (pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && output!=0 && index!=0 && 0<=k && k<=pooling_elements && k==app_remaining(pooling_elements,app_group_cursor(D,k)) && 0<k && 0<=c && c<=channels && (channels-c)%4==0 && id==app_table_cursor(input,pooling_elements,(app_group_cursor(D,k)+1)) && o==app_output_cursor(output,(channels-c)) && i==app_output_cursor(index,(channels-c)) && ab==app_previous_cursor(app_group_cursor(D,k),output,(channels-c)) && ib==app_previous_cursor(app_group_cursor(D,k),index,(channels-c)) && i0==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),0,(channels-c)) && i1==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),1,(channels-c)) && i2==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),2,(channels-c)) && i3==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),3,(channels-c)) && i4==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),4,(channels-c)) && i5==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),5,(channels-c)) && i6==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),6,(channels-c)) && i7==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),7,(channels-c)) && i8==app_row_cursor(P,input,input_offset,pooling_elements,app_group_cursor(D,k),8,(channels-c)) && 0<c && c<4 && ap_write_window(W,o,c) && ap_write_window(WI,i,c) && ap_window(F,i0,4) && ap_window(F,i1,4) && ap_window(F,i2,4) && ap_window(F,i3,4) && ap_window(F,i4,4) && ap_window(F,i5,4) && ap_window(F,i6,4) && ap_window(F,i7,4) && ap_window(F,i8,4) && 0<(channels-c) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) * store(&(vidx0.s0),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s1),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s2),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx0.s3),unsigned int,app_index_base_at(app_group_cursor(D,k))) * store(&(vidx8.s0),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s1),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s2),unsigned int,ap_u32(9*app_group_cursor(D,k)+8)) * store(&(vidx8.s3),unsigned int,ap_u32(9*app_group_cursor(D,k)+8))) */
        const float32x4_t vi0 = vld1q_f32(i0) /*@ where (readonly_map) F=F */;
        const float32x4_t vi1 = vld1q_f32(i1) /*@ where (readonly_map) F=F */;
        const float32x4_t vi2 = vld1q_f32(i2) /*@ where (readonly_map) F=F */;
        const float32x4_t vi3 = vld1q_f32(i3) /*@ where (readonly_map) F=F */;
        const float32x4_t vi4 = vld1q_f32(i4) /*@ where (readonly_map) F=F */;
        const float32x4_t vi5 = vld1q_f32(i5) /*@ where (readonly_map) F=F */;
        const float32x4_t vi6 = vld1q_f32(i6) /*@ where (readonly_map) F=F */;
        const float32x4_t vi7 = vld1q_f32(i7) /*@ where (readonly_map) F=F */;
        const float32x4_t vi8 = vld1q_f32(i8) /*@ where (readonly_map) F=F */;

        float32x4_t vmax;
        uint32x4_t vidx;
        if (ab) {
          const float previous0 = ap_read_previous_float(ab) /*@ where W=W,O=app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_float_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+0) */;
          const uint32_t previous_index0 = ap_read_previous_uint(ib) /*@ where W=WI,O=app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_index_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+0) */;
          vmax = vsetq_lane_f32(previous0, vi0, 0) /*@ where a=0 */;
          vidx = vsetq_lane_u32(previous_index0, vidx0, 0) /*@ where a=0 */;
          if (c >= 2) {
            const float previous1 = ap_read_previous_float(ab + 1) /*@ where W=W,O=app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_float_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+1) */;
            const uint32_t previous_index1 = ap_read_previous_uint(ib + 1) /*@ where W=WI,O=app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_index_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+1) */;
            vmax = vsetq_lane_f32(previous1, vmax, 1) /*@ where a=0 */;
            vidx = vsetq_lane_u32(previous_index1, vidx, 1) /*@ where a=0 */;
          }
          if (c >= 3) {
            const float previous2 = ap_read_previous_float(ab + 2) /*@ where W=W,O=app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_float_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+2) */;
            const uint32_t previous_index2 = ap_read_previous_uint(ib + 2) /*@ where W=WI,O=app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c),O,I),v=app_previous_index_value(F,P,D,(app_pixels(D)-output_pixels),app_group_cursor(D,k),(channels-c)+2) */;
            vmax = vsetq_lane_f32(previous2, vmax, 2) /*@ where a=0 */;
            vidx = vsetq_lane_u32(previous_index2, vidx, 2) /*@ where a=0 */;
          }

          const uint32x4_t vm0 = vcgtq_f32(vi0, vmax) /*@ where a=0,b=0 */;
          vmax = vbslq_f32(vm0, vi0, vmax);
          vidx = vbslq_u32(vm0, vidx0, vidx) /*@ where m=0,a=0,b=0 */;
        } else {
          vmax = vi0;
          vidx = vidx0;
        }

        const uint32x4_t vm1 = vcgtq_f32(vi1, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx1 = vaddq_u32(vidx0, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm1, vi1, vmax);
        vidx = vbslq_u32(vm1, vidx1, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm2 = vcgtq_f32(vi2, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx2 = vaddq_u32(vidx1, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm2, vi2, vmax);
        vidx = vbslq_u32(vm2, vidx2, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm3 = vcgtq_f32(vi3, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx3 = vaddq_u32(vidx2, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm3, vi3, vmax);
        vidx = vbslq_u32(vm3, vidx3, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm4 = vcgtq_f32(vi4, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx4 = vaddq_u32(vidx3, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm4, vi4, vmax);
        vidx = vbslq_u32(vm4, vidx4, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm5 = vcgtq_f32(vi5, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx5 = vaddq_u32(vidx4, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm5, vi5, vmax);
        vidx = vbslq_u32(vm5, vidx5, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm6 = vcgtq_f32(vi6, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx6 = vaddq_u32(vidx5, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm6, vi6, vmax);
        vidx = vbslq_u32(vm6, vidx6, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm7 = vcgtq_f32(vi7, vmax) /*@ where a=0,b=0 */;
        const uint32x4_t vidx7 = vaddq_u32(vidx6, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm7, vi7, vmax);
        vidx = vbslq_u32(vm7, vidx7, vidx) /*@ where m=0,a=0,b=0 */;

        const uint32x4_t vm8 = vcgtq_f32(vi8, vmax) /*@ where a=0,b=0 */;
        vidx8 = vaddq_u32(vidx7, v1) /*@ where a=0,b=0 */;
        vmax = vbslq_f32(vm8, vi8, vmax);
        vidx = vbslq_u32(vm8, vidx8, vidx) /*@ where m=0,a=0,b=0 */;

        float32x2_t vmax_lo = vget_low_f32(vmax) /*@ where a=0 */;
        uint32x2_t vidx_lo = vget_low_u32(vidx) /*@ where a=0 */;
        if (c & 2) {
          vst1_f32(o, vmax_lo); o += 2;
          vst1_u32(i, vidx_lo); i += 2;
          vmax_lo = vget_high_f32(vmax) /*@ where a=0 */;
          vidx_lo = vget_high_u32(vidx) /*@ where a=0 */;
        }
        if (c & 1) {
          vst1_lane_f32(o, vmax_lo, 0); o += 1;
          vst1_lane_u32(i, vidx_lo, 0); i += 1;
        }
      }
      vidx0 = vaddq_u32(vidx8, v1) /*@ where a=0,b=0 */;
      ab = output;
      ib = index;
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    index = (uint32_t*) ((uintptr_t) index + index_increment);
    output_pixels -= 1;
  } /*@ Inv Assert pooling_elements==app_rows(D) && channels==app_channels(D) && input_pixel_stride==app_pixel_stride(D) && input_increment==app_input_increment(D) && output_increment==app_output_increment(D) && index_increment==app_index_increment(D) && 0<channels && 0<pooling_elements && 0<app_pixels(D) && app_valid(F,P,W,WI,D) && sizeof(float)==4 && sizeof(float*)==8 && 0<=output_pixels && output_pixels<=app_pixels(D) && input==app_table(D,(app_pixels(D)-output_pixels)) && input_offset==app_offset_at(D,(app_pixels(D)-output_pixels)) && output==app_output_at(D,(app_pixels(D)-output_pixels)) && index==app_index_at(D,(app_pixels(D)-output_pixels)) && ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_partial_output(F,P,D,(app_pixels(D)-output_pixels),0,0,O,I)) * ap_index(WI,app_neon_partial_index(F,P,D,(app_pixels(D)-output_pixels),0,0,O,I)) * store(&(v1.s0),unsigned int,1) * store(&(v1.s1),unsigned int,1) * store(&(v1.s2),unsigned int,1) * store(&(v1.s3),unsigned int,1) */ while (output_pixels != 0);
}
