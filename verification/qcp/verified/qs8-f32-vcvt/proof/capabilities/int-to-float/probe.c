float cast_short(short x)
/*@ Require emp Ensure __return == Z_to_fp32(x) && emp */
{ return (float)x; }
float cast_int(int x)
/*@ Require -32768 <= x && x <= 32767 && emp Ensure __return == Z_to_fp32(x) && emp */
{ return (float)x; }
float cast_implicit(short x)
/*@ Require emp Ensure __return == Z_to_fp32(x) && emp */
{ return x; }
