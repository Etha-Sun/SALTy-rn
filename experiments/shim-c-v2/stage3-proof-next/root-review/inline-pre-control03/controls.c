/*@ requires \valid_read(w+(0..1)); */
void with_contract(int *w) {
 /*@ ghost int *W0=w; */
 w=w+1;
 /*@ assert contract_origin: W0==\at(w,Pre); */
}
void without_contract(int *w) {
 /*@ ghost PtrEntry: ; */
 /*@ ghost int *W0=w; */
 w=w+1;
 /*@ assert naked_origin: W0==\at(w,Pre); */
 /*@ assert label_origin: W0==\at(w,PtrEntry); */
}
/*@ requires \valid_read(w+(0..1)); */
void caller(int *w) {
 with_contract(w); without_contract(w);
 /*@ assert negative_false: \false; */
}
