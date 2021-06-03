function [U,x]=Gauss(A,b)
% 顺序Gauss消去法求解线性方程组
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
% 输出参数：
%      ---U：消元后的上三角方程组的增广矩阵
%      ---x：线性方程组的解
n=length(b);
% 消元过程
for k=1:n-1
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n)=b(k+1:n)-m*b(k);
    A(k+1:n,k)=zeros(n-k,1);
end
U=[A,b];
% 回代过程
x=zeros(n,1);
x(n)=b(n)/A(n,n);  % 求x_n
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);  % 求x_k，k=n-1,n-2,…,1
end
