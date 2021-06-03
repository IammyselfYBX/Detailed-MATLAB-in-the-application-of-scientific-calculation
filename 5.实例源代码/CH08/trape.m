function I=trape(fun,a,b,n,varargin)
% 复化梯形公式求解数值积分
% 输入参数：
%      ---fun：被积函数
%      ---a,b：积分区间的端点
%      ---n：区间等间距分割区间的数目
%      ---：p1,p2,…：函数fun的附加参数
% 输出参数：
%      ---I：求得的积分值
if nargin<4|isempty(n)
    n=1e4;
end
h=(b-a)/n;  % 步长
x=a+h*(0:n);  % 节点
fx=feval(fun,x,varargin{:});  % 求取x处的函数值
I=h*[(fx(1)+fx(end))+2*sum(fx(2:end-1))]/2;  % 公式8-9
