function [x,iter,X]=newton_reroot(fun,x0,eps,maxiter)
% Newton修正法(重根情形)求解非线性方程的根
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
k=0;err=1;
while abs(err)>eps
    k=k+1;
    [fx0,dfx0,d2fx0]=feval(fun,x0);
    x1=x0-fx0*dfx0/(dfx0^2-fx0*d2fx0);  % 重根情形迭代公式
    err=x1-x0;  % 相邻两次迭代值的差值
    x0=x1;  % 更新x0
    X(k)=x1;
end
if k==maxiter
    error('迭代次数超限，迭代失败！')
end
x=x1;iter=k;X=X';
