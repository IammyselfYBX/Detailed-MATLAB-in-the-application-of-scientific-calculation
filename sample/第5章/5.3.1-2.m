%%%%%%%%%%%% 本代码主要用于绘制复杂的三维图形 %%%%%%%%%%%%
% 通过meshgrid命令绘制网格，间距为0.1,范围为[-2,2],
[x,y]=meshgrid(-2:0.1:2,-2:0.1:2);		
z=x.*exp(-x.^2-y.^2);						% x-y-z函数表达式
plot3(x,y,z)								% 绘制三维图形
%%% 得到如图5-34所示的图形
