function I=double_integral(fun,a,b,lowfun,upfun,m,n,varargin)
% 一般形式的二重积分数值求解
% 输入参数：
%       ---fun：被积函数(是二维函数)
%       ---a,b,lowfun,upfun：积分区域，lowfun,upfun是x的函数
%       ---m：[a,b]区间的等分数
%       ---n：[lowfun,upfun]区间等分数
%       ---p1,p2,...：fun、lowfun、upfun的附加参数
% 输出参数：
%       ---I：积分值
if nargin<7|isempty(n),n=100;end
if nargin<6|isempty(m),m=100;end
hx=(b-a)/m;
x=a+(0:m)*hx;
for i=1:m+1
    ylow= feval(lowfun,x(i));
    yup=feval(dfun,x(i));
    hy=(yup - ylow)/n;
    y(i,:)=ylow+(0:n)*hy;
    f(i,:)=feval(fun,x(i),y(i,:));
    G(i)=trapz(y(i,:),f(i,:));
end
I=trapz(x,G);
