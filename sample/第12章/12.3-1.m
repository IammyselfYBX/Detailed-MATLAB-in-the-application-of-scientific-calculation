%%%%%%%%%%%%%%% 以下代码主要用于编写字符串的打印功能 %%%%%%%%%%%%%%%%%%%%%%
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
