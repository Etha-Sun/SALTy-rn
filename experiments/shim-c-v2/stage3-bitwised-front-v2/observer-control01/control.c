/*@ assigns \nothing; ensures \result == x; */
unsigned positive(unsigned x) { return x; }
/*@ assigns \nothing; ensures \result == 1; */
unsigned deliberately_false(void) { return 0; }
