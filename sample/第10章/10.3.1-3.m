%%%%%%%%%%%%%%%%% 下述代码主要用于用迭代法求解线性方程组 %%%%%%%%%%%%%%%%
% 构建方程组的系数矩阵
A=[10 3 1;2 -10 3;1 3 10]
% 构建方程组的常数项矩阵
b=[14 -5 14]'
%构建迭代法所需要的初始向量
x0=[0 0 0]'
% 利用javobi迭代法进行方程组的求解
y=jacobi(A,b,x0)
