A=[eye(2) -1/4*ones(2);
   -1/4*ones(2) eye(2)];  % 构造系数矩阵
b=1/2*ones(4,1);  % 右端向量
[x,iter,exitflag]=seidel_iter(A,b)  % 利用Gauss-Seidel迭代法求解线性方程组
