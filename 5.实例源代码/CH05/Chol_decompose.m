function [L,x]=Chol_decompose(A,b)
% Cholesky分解求解线性方程组
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
% 输出参数：
%      ---L：分解后的下三角矩阵
%      ---x：线性方程组的解
n=length(b);L=eye(n,n);
% Cholesky分解
for k=1:n
    L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1)');
    L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1)')/L(k,k);
end
% 解下三角方程组Ly=b
y=zeros(n,1); y(1)=b(1)/L(1,1);
for k=2:n
    y(k)=(b(k)-L(k,1:k-1)*y(1:k-1))/L(k,k);
end
% 解上三角方程组L'x=y
x=zeros(n,1);x(n)=y(n)/L(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-L(k+1:n,k)'*x(k+1:n))/L(k,k);
end
