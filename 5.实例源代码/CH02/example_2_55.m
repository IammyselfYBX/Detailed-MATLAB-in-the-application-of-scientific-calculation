figure;  % 生成新的图形窗口
rand('state',0)  % 设置随机数状态
[X,Y] = meshgrid(-2:.2:2, -2:.2:2);  % 生成坐标网格矩阵
Z = X .* exp(-X.^2 - Y.^2);  % 计算二元函数z(x,y)的离散数值
subplot(131);
mesh(X,Y,Z);  % 绘制网状图
subplot(132);
mesh(X,Y,Z,rand(size(Z)));  % 绘制随机彩色网状图
subplot(133);
m=mesh(X,Y,Z,2*ones(size(Z)),'EdgeColor','k');  % 绘制单色网状图
