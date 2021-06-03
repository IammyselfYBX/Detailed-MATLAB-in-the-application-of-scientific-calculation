x=[0.1:0.1:0.9]';
y=[1.8 1.7 1.6 1.5 1.4 1.2 1 0.85 0.67]';
z=[5 5.2 5.8 6.3 5.7 5.9 6 7 7]';
M=[x y ones(size(x))];  % 构造矩阵M
X=lsqlin(M,z);  % 求解二元线性拟合问题
[xx,yy]=meshgrid(x,y);
z1=X(1)*xx+X(2)*yy+X(3);
mesh(xx,yy,z1)  % 绘制网格曲面图
hold on  % 图形保持
plot3(x,y,z,'ko')  % 绘制数据点
alpha(0.6)  % 设置透视程度
