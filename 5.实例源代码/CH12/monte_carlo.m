function [x,fx,iter,X]=monte_carlo(fun,a,b,n,eps)
% monte_carlo法求解非线性方程的根
% 输入参数：
%      ---fun：待求根方程的函数描述
%      ---a,b：初始区间的左、右端点
%      ---n：monte_carlo法模拟的次数
%      ---eps：精度要求，默认值为1e-6
% 输出参数：
%      ---x：非线性方程的近似根
%      ---fx：根x处的函数值
%      ---iter：迭代次数
%      ---X：fxmin序列
if nargin<5,eps=1e-6;end
if nargin<4,n=1000;end
k=1;
fxmin(k)=1000;
d0=1e-4;
while fxmin(k)>eps
    k=k+1;
    x=unifrnd(a,b,n,1);
    y=feval(fun,x);
    fxmin(k)=fxmin(k-1);
    for i=1:n
        if abs(y(i))<=fxmin(k)
            fxmin(k)=abs(y(i));
            xnum=i;
        end
    end
    if fxmin(k)==fxmin(k-1)
        k=k-1;
        continue;
    end
    root=x(xnum);
    d=d0/k;
    a=root-d;b=root+d;
end
x=root;fx=fun(root);iter=k;X=fxmin';
