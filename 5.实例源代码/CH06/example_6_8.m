t=[0 20 40 56 68 80 84 96 104 110];  % 时间向量
v=[0 20 20 38 80 80 100 100 125 125];  % 速度值
ti = linspace(0,110);  % 加密时间向量
method={'nearest','linear','spline','pchip','cubic','v5cubic'};  % 插值方法
for k=1:6
    subplot(3,2,k)  % 图形分割
    vi=interp1(t,v,ti,char(method(k)));  % 插值
    plot(t,v,'ko',ti,vi,'k')  % 绘制图形
    axis tight  % 控制坐标轴
    title(['\fontname{times new roman}\fontsize{12}\it',char(method(k))])  % 添加标题
end
