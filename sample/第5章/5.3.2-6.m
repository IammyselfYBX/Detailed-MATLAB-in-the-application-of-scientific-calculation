%%%%%%%%% 本代码主要用于将柱坐标系中的sin函数转换成直角坐标系 %%%%%%%%%%%%
theta=0:pi/20:2*pi;		% 设置等间距步长，范围为[0,  ],半径为0.05 
rho=sin(theta);			% 函数表达式，ｒ与 的关系
[t,r]=meshgrid(theta,rho);		% 按照半径和角度来生成网格图
z=r.*t;
[x,y,z]=pol2cart(t,r,z);			% 将寒暑表达式从柱坐标转换成直角坐标
mesh(x,y,z)						% 绘制函数图形的x,y,z之间的关系
%%% 得到如图5-49所示的图形
