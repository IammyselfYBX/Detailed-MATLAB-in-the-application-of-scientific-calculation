%%%%%%%%%% 本代码主要用于绘制半径为2+cos(t)的三维立体图形 %%%%%%%%%%%%%%%%
t=0:pi/10:2*pi;			% 设置等间距步长，间距为0.1 , 范围为［0， ］
[x,y,z]=cylinder(2+cos(t));	% 绘制半径为2+cos(t)的圆柱图
surf(x,y,z)					% 对立体图形表面着色
%%% 得到如图5-46所示的图形
