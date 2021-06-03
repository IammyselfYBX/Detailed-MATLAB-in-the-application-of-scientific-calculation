function [I,T]=Romberg(fun,a,b,eps,varargin)
% Romberg公式求解数值积分
% 输入参数：
%      ---fun：被积函数
%      ---a,b：积分区间的端点
%      ---eps：精度要求，默认值为1e-6
%      ---p1,p2,...：fun的附加参数
% 输出参数：
%      ---I：求得的积分值
%      ---T：Romberg积分过程产生的下三角阵
if nargin<4|isempty(eps);
    eps=1e-6;
end
N=1;h=b-a;
T(1,1)=h/2*sum(feval(fun,[a,b],varargin{:}));
tol=1;
while tol>eps
    h=h/2;N=2*N;k=log2(N);
    x=a+(2*(1:N/2)-1)*h;
    fx = feval(fun,x,varargin{:}); % 计算函数值
    T(k+1,1)=1/2*T(k,1)+h*sum(fx);
    for j=1:k
        T(k+1,j+1)=(4^j*T(k+1,j)-T(k,j))/(4^j-1);
    end
    tol=abs(T(k+1,k+1)-T(k,k));
end
I=T(k+1,k+1);
