%%%%%%%%%%%%　本代码主要用于为函数曲线添加网格线　%%%%%%%%%%%%%%%%%%
x=0:0.025:2*pi;
y=sin(x);
plot(x,y)
grid on					%给当前坐标轴添加网格线
%%%　得到如图5-59所示的图形
