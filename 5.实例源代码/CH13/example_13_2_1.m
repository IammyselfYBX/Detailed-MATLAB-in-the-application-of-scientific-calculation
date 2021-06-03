% 解析算法
y=simple(dsolve('Dy=1/2*((50/(50-x))^(1/5)-((50-x)/50)^(1/5))','y(0)=0','x'));  % 解微分方程
h=ezplot(y,[0 50]);  % 绘制曲线y
set(get(gca,'Children'),'LineWidth',2)  % 设置线宽
yk=subs(y,'x',50);  % 求导弹击中敌舰时的纵坐标（不考虑敌舰的反映时间）
t=yk/90;  % 求理论上导弹击中敌舰所需的时间
xdata=get(h,'XData');  % 获取曲线的x坐标点
ydata=get(h,'YData');  % 获取曲线的y坐标点
h1=line(xdata(1),ydata(1),'Marker','.','Color','r');  % 绘制第一个点的图形
% 制作动画
for k=2:length(xdata)
    set(h1,'XData',xdata(k),'YData',ydata(k))  % 更新坐标
    pause(0.01)  % 暂停0.01s
end
if t>0.1
    set(get(gca,'title'),'string',['导弹在时间',num2str(0.1),'内不能击中敌舰'])
else
    set(get(gca,'title'),'string',['导弹在时间',num2str(t),'时击中敌舰'])
end
