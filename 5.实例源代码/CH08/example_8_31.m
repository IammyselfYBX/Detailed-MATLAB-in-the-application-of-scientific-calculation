[X,Y] = meshgrid(-2:0.25:2,-1:0.2:1);
Z = X.* exp(-X.^2 - Y.^2);
[U,V,W] = surfnorm(X,Y,Z);  % 计算法矢量
quiver3(X,Y,Z,U,V,W,0.5,'r');  % 绘制箭头图形
hold on
surf(X,Y,Z)
axis([-2 3 -2 2 -1 1])
% 下面绘制的法矢量图和上面的图形效果是差不多的
figure
surfnorm(X,Y,Z)  % 绘制法矢量图
