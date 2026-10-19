/*@ \wp::strategy Inventory: \prover("z3",10); \wp::proof Inventory: positive,negative; */
/*@ assigns \nothing; ensures positive: \result==x; */
int identity(int x) {return x;}
/*@ assigns \nothing; ensures negative: \result!=x; */
int wrong(int x) {return x;}
