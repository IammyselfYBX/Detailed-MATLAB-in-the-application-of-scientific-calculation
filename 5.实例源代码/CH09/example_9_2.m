f=@(t,y)4*exp(0.8*t)-0.5*y;  % 定义微分方程表达式
[t,y]=Improved_Euler(f,[0,4],2,1);  % 改进Euler方法求解微分方程
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');  % 求微分方程的解析解
ezplot(y1,[0,4])  % 绘制微分方程解析解的图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解的图形
text([2,1],[10,45],{'解析解','梯形公式求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注
ylim([0,90])  % 设置y轴的坐标范围
