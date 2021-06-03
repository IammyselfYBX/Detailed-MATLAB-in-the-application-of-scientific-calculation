function I=Gauss_Lobatto(fun,a,b,m,n,varargin)
% Gauss_Lobatto公式求解数值积分
% 输入参数：
%      ---fun：被积函数
%      ---a,b：积分区间的端点
%      ---m：每段Gauss点数
%      ---n：等分区间数
%      ---p1,p2,...：fun的附加参数
% 输出参数：
%      ---I：求得的积分值
if nargin<5|isempty(n);
    n=10;
end
switch m
    case 0
        t=[-1,1];A=[1,1];
    case 1
        t=[-1,0,1];A=[1/3,4/3,1/3];
    case 2
        t=[-1,-1/sqrt(5),1/sqrt(5),1];
        A=[1/6,5/6,5/6,1/6];
    case 3
        t=[-1,-0.654654,0,0.654654,1];
        A=[1/10,49/90,32/45,49/90,1/10];
    case 4
        t=[-1,-0.765055,-0.285232,0.285232,0.765055,1];
        A=[0.066667,0.378475,0.554858,0.554858,0.378475,0.066667];
    otherwise
        error('本程序最多仅提供m=4！')
end
h=(b-a)/n;I=0;
for k=1:n
    F=feval(fun,h/2*t+a+(k-1/2)*h,varargin{:});
    I=I+A*F';
end
I=h/2*I;
