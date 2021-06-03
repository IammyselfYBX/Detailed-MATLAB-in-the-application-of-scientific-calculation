hours=1:12;  % 时间向量
temps=[5 8 9 15 25 29 31 30 22 25 27 24];  % 温度值
h=1:0.1:12;
method={'comlete','not-a-knot','periodic','second'};  % 插值边界条件
type=char('拉格朗日',' 非扭结',' 周期性','  自然');
for k=1:4
    subplot(2,2,k)  % 图形分割
    pp=csape(hours,temps,char(method(k)));  % 三次样条插值
    t=ppval(pp,h);  % 求解h处的温度值
    plot(hours,temps,'ko',h,t,'k')  % 绘制图形
    text(4,10,[type(k,:),'边界条件'])  % 添加标注
    xlim([1,12]);  % 设置x轴坐标范围
end
