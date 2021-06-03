%%%%%%%%%%%%%%% 以下代码主要在MEX文件中实现字符串的输出 %%%%%%%%%%%%%%%%%%%
/* Header File （函数的头文件）*/
#include “mex.h”
/* Entrance function of MEX function （MEX文件的函数入口）*/
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	/* Content of function, transfer other function 
（函数体的内容，在此处用于跳转到另一个函数）
*/
	mexPrintf(“Hello, world!”);
}
