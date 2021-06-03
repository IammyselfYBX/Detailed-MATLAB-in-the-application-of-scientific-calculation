A=[1 1 -3 -1;3 -1 -3 4;1 5 -9 -8];  % 系数向量
b=[1 4 0]';  % 右端向量
syms k1 k2;
U=rref(sym([A b]));  % 化增广矩阵为阶梯阵
x=[U(1:rank(A),length(A)-rank(A)+1:end)*[-k1;-k2;1];k1;k2]  % 求通解
e=A*x-b  % 求误差
