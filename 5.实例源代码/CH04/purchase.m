function rate=purchase(A,A0,b,m)
% 贷款利率的计算
% 输入参数
%        ---A：楼房售价
%        --- A0：首付
%        ---b：月还款
%        ---m：分期付款次数
% 输出参数
%        ---rate：月利率
% example1：
%       rate=purchase(32000,0,1200,36)
% example2：
%       A=30000;A0=0;b=450;m=180;
%       rate=purchase(A,A0,b,m)
% example3：
%       rate=purchase(30000,225*12/(1+12*rate),225,300)
if nargin<1
    A=30000;A0=0;b=450;m=180;
end
fun=@(r,A,A0,b,m)b/r*(1-1/(1+r)^m)-(A-A0);  % 定义函数表达式
fplot(@(r)fun(r,A,A0,b,m),[0,1]);  % 绘制表达式的图形
hold on  % 图形保持
plot(xlim,[0,0],'k')  % 绘制x轴
[x,y]=ginput(1);  % 利用交互式操作取初始点
rate=fzero(@(r)fun(r,A,A0,b,m),x);  % 利用函数fzero求解非线性方程
plot(rate,fun(rate,A,A0,b,m),'r*','markersize',12)  % 绘制函数零点
title(['月利率：rate=',num2str(rate*100),'%'])  % 添加标题
