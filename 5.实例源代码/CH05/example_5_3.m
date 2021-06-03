a=ones(3,1);b=-2*ones(4,1);c=a;d=[1;0;0;0];  % 主对角线、次对角线和右端向量
[U,x]=Catch_up(a,b,c,d)  % 利用追赶法求解三对角方程组
A=diag(diag(diag(a)),1)+diag(diag(diag(a)),-1)+diag(b);  % 构造线性方程组的系数矩阵
[U1,x1]=Gauss(A,d)  % 利用Gauss消去法进行检验
