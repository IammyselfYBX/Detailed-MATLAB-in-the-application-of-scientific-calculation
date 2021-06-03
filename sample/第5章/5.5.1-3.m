%%%%%%%%%%%%%%%%%% 本代码主要用于对函数图形中添加注释 %%%%%%%%%%%%%
x=0:0.1*pi:2*pi;				% 等间距步长
y=sin(x);						% 图形函数表达式
plot(x,y)						% 绘制函数图形
% 添加x轴坐标，内容为'x(0-2\pi)'字体大小为'fontweight'，黑体
xlabel('x(0-2\pi)','fontweight','bold');
% 添加x轴坐标，内容为'y=sin(x)'字体大小为'fontweight'，黑体	
ylabel('y=sin(x)','fontweight','bold');	
%%%　在3*pi/4处添加标注，内容为sin(3*pi/4) = 0.707
text(3*pi/4,sin(3*pi/4),'\leftarrowsin(t)= 0.707','fontsize',16)
%%%　在pi处添加标注，内容为sin(pi) = 0
text(pi,sin(pi),'\leftarrowsin(t)= 0','fontsize',16)
%%%　在５*pi/4添加标注，内容为sin(5*pi/4) -0.707
text(5*pi/4,sin(5*pi/4),'\leftarrowsin(t)= -0.707','fontsize',16)
%%% 得到如图5-54所示的图形
