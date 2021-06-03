f=@(t,y)4*exp(0.8*t)-0.5*y;
[t,y]=Explicit_Euler(f,[0,4],2,1);  % 利用Euler法求数值解
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');  % 求微分方程解析解
ezplot(y1,[0,4])  % 绘制解析解图形
hold on  % 图形保持
plot(t,y,'k.-','MarkerSize',20)  % 绘制数值解图形并设置线型、颜色和标记符号
text([1.5,2],[20,8],{'解析解','Euler法求解结果'},...
    'fontname','隶书','fontsize',16)  % 添加标注
