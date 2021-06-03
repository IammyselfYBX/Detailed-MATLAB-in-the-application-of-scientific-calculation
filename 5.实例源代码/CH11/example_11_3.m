x=-3:0.1:3;
[xx,yy]=meshgrid(x);
zz =@(x,y)3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ... 
   - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ... 
   - 1/3*exp(-(x+1).^2 - y.^2);  % 定义函数表达式
subplot 121  % 图形分割
z1=zz(xx,yy);z1(z1<0)=0;  % 将zz的小于0的部分置零
mesh(xx,yy,z1)  % 绘制网格曲面图
text(0,0,7,'\fontname{times}{\itz}={\itf}({\itx,y})',...
    'fontsize',20,'color','r')  % 添加标注
title('\fontname{times}{\it\bfpeaks}\fontname{隶书}曲面的上半部分',...
    'fontsize',16,'color','b')  % 添加标题
axis([-3 3 -3 3 0 10])  % 设置坐标轴的范围
subplot 122  % 图形分割
z2=-zz(xx,yy);z2(z2<0)=0;  % 将zz的大于0的部分置零
mesh(xx,yy,z2)  % 绘制网格曲面图
text(-2,0,7,'\fontname{times}{\itz}=-{\itf}({\itx,y})',...
    'fontsize',20,'color','r')  % 添加标注
title('\fontname{times}{\it\bfpeaks}\fontname{隶书}曲面的下半部分',...
    'fontsize',16,'color','b')  % 添加标题
axis([-3 3 -3 3 0 7])  % 设置坐标轴的范围
colormap([0,0,0])  % 控制着色方式为黑色
set(gcf,'Color','w')  % 设置图形界面为白色
figure('Color','w')
contour(xx,yy,zz(xx,yy),[-8:10]); % 绘制等高线
hold on
z =@(x)-abs(3*(1-x(1)).^2.*exp(-(x(1).^2) - (x(2)+1).^2) ... 
    - 10*(x(1)/5 - x(1).^3 - x(2).^5).*exp(-x(1).^2-x(2).^2) ... 
    - 1/3*exp(-(x(1)+1).^2 - x(2).^2));  % 定义目标函数
[xt,yt]=ginput(6);  % 用鼠标取6个点的坐标
for k=1:length(xt)
    [x,fval]=fminsearch(z,[xt(k),yt(k)]);  % 求解优化问题
    X(k)=x(1);Y(k)=x(2);F(k)=fval;
    if zz(X(k),Y(k))>zz(X(k)+1e-4,Y(k)+1e-4)
        pb(k)=1;  % 标识极大值
    else
        pb(k)=-1;  % 标识极小值
    end
end
X1=X(pb==1);Y1=Y(pb==1);F1=-F(pb==1);
X2=X(pb==-1);Y2=Y(pb==-1);F2=F(pb==-1);
plot(X1,Y1,'k^','MarkerFaceColor','k'); % 绘出极大值点
plot(X2,Y2,'kv','MarkerFaceColor','k'); % 绘出极小值点
text([-2.6,-2.43],[2.6,2.2],{'▲：\fontname{隶书}极大值点',...
    '：\fontname{隶书}极小值点'})
text(-2.43,2.2,'▲','rotation',180)
for k=1:length(X1)
    text(X1(k),Y1(k)-0.3,['\fontname{隶书}最优值','\fontname{times}：',...
        num2str(F1(k))],'HorizontalAlignment','center')  % 添加标注
end
for k=1:length(X2)
    text(X2(k),Y2(k)-0.3,['\fontname{隶书}最优值','\fontname{times}：',...
        num2str(F2(k))],'HorizontalAlignment','center')  % 添加标注
end
figure('Color','w')
meshc(xx,yy,zz(xx,yy))
hold on
plot3(X1,Y1,-10*ones(size(X1)),'k^',...
    'MarkerFaceColor','k')  % 绘出极小值点
plot3(X2,Y2,-10*ones(size(X2)),'kv',...
    'MarkerFaceColor','k');  % 绘出极小值点
xlim([-3 3]);ylim([-3 3]);
view(-45,30)
hidden off