int isnan32(float x)
/*@ Require emp Ensure emp */
{ if (x != x) return 1; return 0; }
