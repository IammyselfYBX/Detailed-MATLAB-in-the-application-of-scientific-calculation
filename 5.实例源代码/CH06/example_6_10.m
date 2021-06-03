x=1:4;
y=1:4;
rand('state',0);  % 设定随机数状态
z=rand(4);  % 产生4阶随机数矩阵
xi=1:0.05:4;  % 加密数据点
yi=xi;
[X,Y]=meshgrid(xi,yi);  % 生成网格数据
zi1=interp2(x,y,z,X,Y,'spline');  % 利用interp2三次样条插值
pp=csape({x,y},z);  % 利用csape()函数进行三次样条插值
zi2=ppual(pp,{xi,yi});  % 计算加密网格点处的函数值
h(1)=subplot(2,2,1);  % 图形分割
mesh(xi,yi,zi1);title('interp2函数插值')  % 绘制图形并添加标题
h(2)=subplot(2,2,2);  % 图形分割
mesh(xi,yi,zi2);title('csape函数插值')  % 绘制图形并添加标题
h(3)=subplot(2,2,[3 4]);  % h(3)=subplot(2,1,2);
mesh(xi,yi,zi1-zi2);title('两种插值的误差曲面图')
axis(h,'tight')
