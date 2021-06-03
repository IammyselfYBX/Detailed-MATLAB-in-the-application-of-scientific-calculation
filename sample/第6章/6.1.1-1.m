%%% 本代码主要用于colormap函数对图形的色彩进行控制 %%%%%%%
[x,y,z]=peaks;				% 构建图形函数peaks与参数x,y,z的关系表达式
mesh(x,y,z)				% 利用mesh函数绘制x,y,z的三维图形
colormap(autumn(128))		% 利用colormap函数对图形进行着色处理
% 其中autumn表示采用红黄色图，
% 而参数128则表示对该色图的颜色种类进行制定，为128种色彩
%%% 得到如图6-1所示的图形
