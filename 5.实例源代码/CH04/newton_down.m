function [x,iter,X]=newton_down(fun,x0,eps,maxiter)
% Newton下山法求解非线性方程的根
% 输入参数：
%      ---fun：迭代函数
%      ---x0：初始迭代点
%      ---eps：精度要求，默认值为1e-6
%      ---maxiter：最大迭代次数，默认值为1e4
% 输出参数：
%      ---x：非线性方程的近似根
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<2,error('输入参数至少需要2个！'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
k=1;tol=1;
while abs(tol)>eps
    lambda=1;
    [fx0,dfx0]=feval(fun,x0);
    x1=x0-lambda*fx0/dfx0;
    [fx1,dfx1]=feval(fun,x1);
    while abs(fx1)>=abs(fx0) 
        lambda=lambda/2;  % 更新lambda
        x1=x0-lambda*fx0/dfx0;  % 牛顿下山迭代
        [fx1,dfx1]=feval(fun,x1);
        x0=x1;
    end
    tol=fx1/dfx1;
    k=k+1;
    x0=x1;
    X(k)=x1;
End
if k==maxiter
    error('迭代次数超限，迭代失败！')
end
x=x1;iter=k;X=X';
