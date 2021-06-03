function [U,x]=Gauss_column(A,b)
% 列主元Gauss消去法求解线性方程组
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
% 输出参数：
%      ---U：消元后的上三角方程组的增广矩阵
%      ---x：线性方程组的解
n=length(b);
for k=1:(n-1)
    % 选主元
    [Y,I]=max(abs(A(k:n,k)));
    I=I+k-1;
    if I>k
        t=A(k,:); A(k,:)=A(I,:); A(I,:)=t;
        t=b(k); b(k)=b(I); b(I)=t;
    end
    % 消元
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n)=b(k+1:n)-m*b(k);
    A(k+1:n,k)=zeros(n-k,1);
end
U=[A,b];
% 回代
x=zeros(n,1);
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
