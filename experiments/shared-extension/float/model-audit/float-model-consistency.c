/*@ logic float arbitrary(float x,float y); */
/*@ ensures \result == 1; assigns \nothing; */
int impossible(float x) { return 0; }
/*@ ensures \is_NaN(x) ==> \result == 1; assigns \nothing; */
int impossible_nan(float x) { return 0; }
/*@ ensures (\is_NaN(x) || \sign(x)==\Positive) ==> \result == 1; assigns \nothing; */
int impossible_sign(float x) { return 0; }
/*@ ensures \eq_float(\result,arbitrary(x,y)) ||
    (\is_NaN(\result) && \is_NaN(arbitrary(x,y))); assigns \nothing; */
float arbitrary_sub(float x,float y) { return x-y; }
