function [x,fx,iter,X]=test_bit(fun,a,b,eps,varargin)
% 试位法求解非线性方程的根
% 输入参数：
%      ---fun：待求根方程的函数描述
%      ---a,b：初始区间的端点
%      ---eps：精度要求，默认值为1e-6
%      ---p1,p2,...：求根函数附加参数
% 输出参数：
%      ---x：非线性方程的近似根
%      ---fx：根x处的函数值
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<3,error('输入参数至少需要3个！'),end
if nargin<4|isempty(eps),eps=1e-6;end
fa=feval(fun,a,varargin{:});fb=feval(fun,b,varargin{:});
% fa=fun(a,varargin{:});fb=fun(b,varargin{:});
k=1;
if fa*fb>0
    warning(['区间[',num2str(a),',',num2str(b),']内可能没有根']);
elseif fa==0
    x=a;fx=fa;
elseif fb==0
    x=b;fx=fb;
else
    while abs(b-a)>eps;  % 控制试位法结束条件
        x=b-(b-a)/(fb-fa)*fb;
        fx = feval(fun,x,varargin{:}); % 计算x处的函数值
        if fa*fx>0;  % 条件
            a = x;   % 端点更新
            fa = fx;  % 端点函数值更新
        elseif fb*fx>0;  % 条件
            b = x;  % 端点更新
            fb = fx;  % 端点函数值更新
        else
            break
        end
        X(k)=x;k=k+1;
    end
end
iter=k;