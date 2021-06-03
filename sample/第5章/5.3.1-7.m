%%%%%%%%%% 本代码主要用于利用meshz函数绘制三维曲面图形 %%%%%%%%%%%%
[x,y]=meshgrid([-4:0.5:4]);		% 绘制曲面网格，间距为0.5,范围为［-4,4］
z=sqrt(x.^2+y.^2);				% 三维图形表达式
meshz(z)							% 绘制网格图
%%% 得到如图5-39所示的图形
