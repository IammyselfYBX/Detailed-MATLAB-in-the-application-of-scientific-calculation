%%%%%%%%%%%%%%% ���´�����Ҫ���ڱ�д�ַ����Ĵ�ӡ���� %%%%%%%%%%%%%%%%%%%%%%
C entrance function
subroutine mexFunction(nlhs,plhs,nrhs,prhs)
C -----------------------------------------
C parameters defination 
integer plhs(*),prhs(*)
integer nlhs,nrhs
C code
call mexPrintf("Hello Matlab world!")
C end of the file
return
end
