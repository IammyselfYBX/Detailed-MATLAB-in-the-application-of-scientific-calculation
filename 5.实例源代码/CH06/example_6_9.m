figure('Position',[100 100 560 630])  % 设置图形窗口的位置
[X,Y] = meshgrid(-3:.5:3);  % 产生坐标数据矩阵
Z = peaks(X,Y);  % 计算MATLAB自带峰值函数的值
[XI,YI] = meshgrid(-3:0.2:3);  % 加密网格数据
method=char('nearest','linear','spline','cubic');  % 插值方法
s(1)=subplot(321),mesh(X,Y,Z),title('原网格图')  % 绘制原图并添加标题
s(2)=subplot(322),mesh(XI,YI,peaks(XI,YI)),title('加密网格图')  % 绘制加密后的图形
for k=3:6
    s(k)=subplot(3,2,k)  % 图形分割
    ZI = interp2(X,Y,Z,XI,YI,method(k-2,:));  % 二维插值
    mesh(XI,YI,ZI),title([method(k-2,:),'型插值曲面'])
    e{k-2}=ZI-peaks(XI,YI);  % 误差
end
axis(s,[-3 3 -3 3 -10 10])  % 设置坐标轴范围
% 绘制插值误差曲面图
figure
for k=1:4
    h(k)=subplot(2,2,k)  % 图形分割
    mesh(XI,YI,e{k})  % 绘制误差曲面
    title([method(k,:),'型插值误差曲面'])  % 添加标题
    xlim([-3,3]);ylim([-3,3]);  % 设置坐标轴范围
end
