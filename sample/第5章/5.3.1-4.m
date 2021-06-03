%%%%%%%%%%  本代码主要用于利用hidden函数区别网格线条 %%%%%%%%%%
[x,y,z]=sphere(12);					% 建立原始图形,半径为12的球形
subplot(1,2,1)							% 构建子图1
mesh(x,y,z),title('Opaque')			% 绘制网格图，并添加标题‘opaque’
hidden on								% 设置子图１的网格间不透明
axis off								% 隐藏坐标轴
%构建子图2，并添加标题‘Transparent’
subplot(1,2,2),title('Transparent')	
mesh(x,y,z)							% 绘制网格图
hidden off								%设置子图２的网格间透明
axis off								% 隐藏坐标轴
%%% 得到如图5-36所示的图形
