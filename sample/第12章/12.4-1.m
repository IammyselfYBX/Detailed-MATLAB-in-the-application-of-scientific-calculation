%%%%%%%%%%%%% ���´�����Ҫʵ��mat�ļ������ݵ�д����� %%%%%%%%%%%%%%%%%%%%%
/* necessary hear file */
#include "mat.h"
#include "math.h"
/* MEX function file entrance */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	% ��������mxArray�ṹ�����
mxArray *string, *scalar, *array;

% �������ݵ��鲿��ֵ
double img[]={0,1,2,3,4,5,6,7,8};
% �������ݵ�ʵ����ֵ
double real[]={8,7,6,5,4,3,2,1,0};

    double *pr,*pi,*filename;
MATFile *file;

% ����ռ�ĳ�����ֵΪ0
int buflen=0;

    /* judge the input/output */
if(nrhs!=1) 
	% �����������ĸ�����Ϊ1������ʾ������Ϣ
        mexErrMsgTxt("An input is necessary to be the file name!");
    
if(mxGetClassID(prhs[0])!=mxCHAR_CLASS)
	% �������Ĳ��������ַ����ͣ�����ʾ������Ϣ
        mexErrMsgTex("Input must be characters, stand for file name!");
    
    /* Creat data */
	% ����һ����Ϊstring���ַ���������Ϊ��MATLAB is wonderful!��   
 	string=mxCreatString("MATLAB is wonderful!");
	
	% ����һ����Ϊscalar��˫������ֵ2003
scalar=mxCreatDoubleScalar(2003);

% ����һ����Ϊarray�ĸ������飬���������Ϊ3������ҲΪ3
array=mxCreatDoubleMatrix(3,3,mxCOMPLEX);

    pr=mxGetPr(array);
    pi=mxGetPi(array);
    memcpy(pr,real, 9*sizeof(double));
memcpy(pr,img,9*sizeof(double));

    /* Get the filename ����ȡ�ļ�����*/
    buflen=mxGetNumberOfElements(prhs[0])+1;
    filename=mxMalloc(buflen);
mxGetString(prhs[0],filename,buflen);

    /* Creat new MAT file ���Կɶ���д�ķ�ʽ��һ����Ϊfilename���ļ���*/
file=matOpen(filename,"w");

% ������ļ�ʧ�ܣ���ϵͳ��ʾ��Ӧ�ĳ�����ʾ��Ϣ
    if(file==NULL)
        mexErrMSGTxt("Can't creat appointed file!");

         /* Write data to MAT file������ǰ������������ݷֱ�д��MAT�ļ��� */
        matPutVariable(file, "String",string);
        matPutVariable(file, "Scalar",scalar);
        matPutVariable(file, "Array",array);

        /* Close MAT file���ر��ļ��� */
        matClose(file);
		% �����ʾ��Ϣ����д���ݲ����ɹ���
        mexPrintf("successfully creat MAT file:%s\n",filename);

        /* release the memory ���ͷ�3��������ռ�õĿռ䣩*/
        mxDestroyArray(string);
        mxDestroyArray(scalar);
        mxDestroyArray(array);
        mxFree(filename);
}
