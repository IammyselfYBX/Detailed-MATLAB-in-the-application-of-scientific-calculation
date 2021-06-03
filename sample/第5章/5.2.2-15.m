%%%%%%%%% 本代码主要用于利用comet函数绘制二维彗星图形 %%%%%%%%%%%%
t=0:0.01:2*pi;					%设置等间距步长，范围为 ，间距为0.01
x=cos(2*t).*(cos(t).^2);		%函数表达式x
y=sin(2*t).*(sin(t).^2);		%函数表达式y
comet(x,y)						%绘制x-y的二维彗星图
%%%  得到如图5-28所示的图形。
