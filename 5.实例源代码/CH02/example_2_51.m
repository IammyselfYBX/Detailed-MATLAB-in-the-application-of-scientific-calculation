subplot(131)
X1=pascal(4);  % 生成4阶帕斯卡矩阵
plot(X1,'->','MarkerSize',5)  % 绘制图形并设置标记符号的大小
% 等价于plot(1:length(X1'),X1,'->','MarkerSize',5)
subplot(132)
X2=linspace(-2,2,21); % 数据离散采样
plot(X2,cos(2*X2),'k-*',2*X2,sin(X2),'rs--'); % 绘图并设定线型、颜色以及标记符号等信息
subplot(133)
X3=-pi:pi/10:pi;
Y3=tan(sin(X3))-sin(tan(X3));
plot(X3,Y3,'--rs','LineWidth',2,...  % 设置线宽
                'MarkerEdgeColor','k',...  % 设置标记符号边缘的颜色
                'MarkerFaceColor','g',...  % 设置标记符号内部区域的颜色
                'MarkerSize',3)  % 设置标记符号的大小
