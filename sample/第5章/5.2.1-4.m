%%%%%%%%%% 本代码主要用于利用plot函数对函数图形的线型属性进行设置 %%%%%%%%%%
x=-2*pi:pi/10:2*pi;		% 设置等间距步长，间隔为0.01 ,范围是[0，2 ]
y=tan(sin(x))-sin(tan(x));		% 函数表达式，自变量x与变量y的关系
% 对函数图形的线型的属性进行如下设置: 
% ‘--rs’：采用虚线，数据点型为方形，边界色为红色，
% ‘linewidth’,2: 设置线宽为2个点
% ‘MarkerEdgeColor’,’r’: 设置数据点型和边界为红色
%  ‘MarkerFaceColor’,’g’: 设置数据点型的填充色为绿色
%  ‘MarkerSize’,10: 设置数据点的宽度为10个点
plot(x,y,'--rs','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','g','MarkerSize',10)
%%% 得到如图5-6所示的图形
