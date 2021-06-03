function [H,y]=househ(x)
% 对于向量x，构造Householder变换矩阵H，使得Hx=(*,0,0,...,0)'
% 输入参数：
%      ---x：给定的向量
% 输出参数：
%      ---H：构造的Householder变换矩阵
%      ---y：Householder变换后的向量
x=x(:);
n=length(x);
M=max(abs(x));
x=x/M;
s=sign(x(1));
if s==0
    s==1;
end
sigma=s*norm(x);
x(1)=x(1)+sigma;
rho=sigma*x(1);
u=x;
H=eye(n)-1/rho*u*u';
y=zeros(n,1);
y(1)=-M*sigma;
