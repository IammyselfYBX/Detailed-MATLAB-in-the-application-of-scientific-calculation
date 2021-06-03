rand('state',0);
x = rand(100,1)*4-2;  % 随机点的x坐标
y = rand(100,1)*4-2;  % 随机点的y坐标
z = @(x,y)x.*exp(-x.^2-y.^2);  % 定义函数
ti = -2:.2:2;
[XI,YI] = meshgrid(ti,ti);  % 生成网格数据
ZI = griddata(x,y,z(x,y),XI,YI);  % 随机点插值
h(1)=subplot(2,1,1);  % 图形分割
mesh(XI,YI,ZI);title('散乱数据点插值曲面')  % 绘制图形并添加标题
h(2)=subplot(2,1,2);  % 图形分割
mesh(XI,YI,ZI-z(XI,YI));title('散乱数据点插值误差曲面')  % 绘制误差曲面并添加标题
axis(h,'tight')
