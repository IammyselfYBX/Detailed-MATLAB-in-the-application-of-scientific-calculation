%%%%%%%%%%%%% 以下代码主要实现mat文件中数据的写入操作 %%%%%%%%%%%%%%%%%%%%%
/* necessary hear file */
#include "mat.h"
#include "math.h"
/* MEX function file entrance */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	% 定义三个mxArray结构体变量
mxArray *string, *scalar, *array;

% 定义数据的虚部数值
double img[]={0,1,2,3,4,5,6,7,8};
% 定义数据的实部数值
double real[]={8,7,6,5,4,3,2,1,0};

    double *pr,*pi,*filename;
MATFile *file;

% 定义空间的长度数值为0
int buflen=0;

    /* judge the input/output */
if(nrhs!=1) 
	% 如果输入参数的个数不为1，则提示出错信息
        mexErrMsgTxt("An input is necessary to be the file name!");
    
if(mxGetClassID(prhs[0])!=mxCHAR_CLASS)
	% 如果输入的参数不是字符类型，则提示出错信息
        mexErrMsgTex("Input must be characters, stand for file name!");
    
    /* Creat data */
	% 定义一个名为string的字符串，内容为“MATLAB is wonderful!”   
 	string=mxCreatString("MATLAB is wonderful!");
	
	% 定义一个名为scalar的双精度数值2003
scalar=mxCreatDoubleScalar(2003);

% 定义一个名为array的复数数组，数组的行数为3，列数也为3
array=mxCreatDoubleMatrix(3,3,mxCOMPLEX);

    pr=mxGetPr(array);
    pi=mxGetPi(array);
    memcpy(pr,real, 9*sizeof(double));
memcpy(pr,img,9*sizeof(double));

    /* Get the filename （读取文件名）*/
    buflen=mxGetNumberOfElements(prhs[0])+1;
    filename=mxMalloc(buflen);
mxGetString(prhs[0],filename,buflen);

    /* Creat new MAT file （以可读可写的方式打开一个名为filename的文件）*/
file=matOpen(filename,"w");

% 如果打开文件失败，则系统提示相应的出错提示信息
    if(file==NULL)
        mexErrMSGTxt("Can't creat appointed file!");

         /* Write data to MAT file（将先前定义的三个数据分别写入MAT文件） */
        matPutVariable(file, "String",string);
        matPutVariable(file, "Scalar",scalar);
        matPutVariable(file, "Array",array);

        /* Close MAT file（关闭文件） */
        matClose(file);
		% 输出提示信息：“写数据操作成功”
        mexPrintf("successfully creat MAT file:%s\n",filename);

        /* release the memory （释放3个数据所占用的空间）*/
        mxDestroyArray(string);
        mxDestroyArray(scalar);
        mxDestroyArray(array);
        mxFree(filename);
}
