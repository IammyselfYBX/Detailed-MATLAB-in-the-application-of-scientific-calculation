%%%%%%%%%%%%%%%%%%　本代码主要用于绘制函数图形的标注　%%%%%%%%%%%%%%%%%%
t=0:0.1*pi:2*pi;				%　等间隔步长
f=tan(t)+cos(t);				%  函数表达式
plot(t,f)						%  绘制函数图形
% 添加x轴标注，内容为t(0-2\pi),加粗，字体大小为’fontweight’
xlabel('t(0-2\pi)','fontweight','bold');
% 添加y轴标注，内容为f=tan(t)+cos(t),加粗，字体大小为’fontweight’		
ylabel('f=tan(t)+cos(t)','fontweight','bold');	
title('函数曲线')										% 添加题注
％％％　得到如图5-52所示的图形
