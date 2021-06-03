x=-2:0.2:2;y=x;
[X,Y]=meshgrid(x);  % 生成网格数据
Z=X.*exp(-X.^2-Y.^2);  % 得到高度值
subplot 131
surf(X,Y,Z)  % 绘制三维网格图
subplot 132 
surfc(X,Y,Z)  % 绘制具有基本等高线的三维网格图
subplot 133
surfl(X,Y,Z)  % 绘制带有基准平面的三维网格图
