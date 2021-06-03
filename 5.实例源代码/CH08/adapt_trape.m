function I=adapt_trape(fun,a,b,eps,varargin)
% 自适应梯形公式求解数值积分
% 输入参数：
%      ---fun：被积函数
%      ---a,b：积分区间的端点
%      ---eps：精度要求，默认值为1e-6
%      ---p1,p2,...：fun的附加参数
% 输出参数：
%      ---I：求得的积分值
if nargin<4|isempty(eps);
    eps=1e-6;
end
N=1;h=b-a;
T=h/2*sum(feval(fun,[a,b],varargin{:}));
tol=1;
while tol>eps
    h=h/2;I=T/2;
    x=a+(2*(1:N)-1)*h;
    fx = feval(fun,x,varargin{:}); % 计算函数值
    I=I+h*sum(fx);
    tol=abs(I-T);
    N=N*2; T=I;
end
