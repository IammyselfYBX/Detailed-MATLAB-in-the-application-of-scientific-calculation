function I=quad_inf(fun,a,b,tol,eps)
% 无穷区间的积分
% 输入参数：
%       ---fun：被积函数
%       ---a,b：积分区间的端点，要求a<b
%       ---tol：精度要求，用于正常积分，缺省值为1e-6
%       ---eps：精度要求，迭代终止准则，缺省值为1e-5
% 输出参数：
%       ---I：求得的积分值
if nargin<5|isempty(eps);eps=1e-5;end;
if nargin<4|isempty(tol);tol=1e-6;end;
N=2;I=0;T=1;
if isinf(a)&isinf(b)
    I=quad_inf(fun,-inf,0)+quad_inf(fun,0,inf);  % 递归调用
elseif isinf(b)
    while T>eps
        b=a+N;
        T=quadl(fun,a,b,tol);
        I=I+T;
        a=b; N=2*N;
    end
elseif isinf(a)
    while T>eps
        a=b-N;
        T=quadl(fun,a,b,tol);
        I=I+T;
        b=a; N=2*N;
    end
else
    I=quadl(fun,a,b,tol);
end
