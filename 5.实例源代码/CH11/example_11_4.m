figure('Color','w')  % 设置图形界面为白色
x=-2:0.2:2;y=-1:0.2:3;
[xx,yy]=meshgrid(x,y);
zz=100*(yy-xx.^2).^2+(1-xx).^2;
surf(xx,yy,zz)
view(10,55)  % 设置视角
colormap(hsv)  % 设置控制着色方式
hold on  % 保持图形
[c,h]=contour3(x,y,zz+50,[100 500],'k');  % 绘制三维等高线图
grid on  % 添加网格线
text(-1.5,2,2500,'$$f(x,y) = 100{(y - {x^2})^2} + {(1 - x)^2}$$',...
    'interpreter','latex','fontsize',12)  % 添加标注
plot3(-1.9,2,267.62,'ko','markersize',12,'linewidth',1,'erasemode','none')
text(-1.9,2.3,267.62,'\fontname{隶书}\fontsize{16}开始','color',[0,0,0])
plot3(1,1,0,'ko','markersize',12,'linewidth',1,'erasemode','none')
text(1,1.3,100,'\fontname{隶书}\fontsize{16}结束','color',[0,0,0])
set(gcf,'Color','w')
x0=[-1.9,2];
f='100*(x(2)-x(1)^2)^2+(1-x(1))^2';  % 利用字符串定义函数表达式
OPTIONS=optimset('OutputFcn',@bandemoutfcn);  % 设置优化控制参数'OutputFcn'
[x,fval,exitflag,output]=fminsearch(f,x0,OPTIONS)

