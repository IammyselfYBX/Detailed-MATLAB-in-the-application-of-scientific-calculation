A=[1 2 3;4 5 6;7 8 0];  % 线性方程组的系数矩阵
b=ones(3,1);  % 线性方程组的右端向量
[U,x]=Gauss(A,b)  % 利用顺序Gauss消去法求解线性方程组
