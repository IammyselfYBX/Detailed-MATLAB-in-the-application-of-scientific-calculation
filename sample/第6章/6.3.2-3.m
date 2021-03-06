%%%%   在这个例题中，显示了如何创建注释矩形，并给图形中的两个子图高亮显示。自本例题中还是用核心对象的属性position和tightInsert来决定注释矩形的位置和大小。%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第一步 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%   创建子图阵列
x=-2*pi:pi/12:2*pi;			% 设置ｘ轴的等间距步长
y=x.^2;							% 描述图形的函数表达式
% 绘制４个字图中的第1个，第一个参数２表示子图的行数，第二个参数２表示子图的列数，最后一个参数1:2表示当前绘制的是第1个子图,并且第一子图的大小为1个子图的2倍
subplot(2,2,1:2)
% 绘制函数表达式所描绘的函数图形
plot(x,y)

% 绘制４个字图中的第3个，第一个参数２表示子图的行数，第二个参数２表示子图的列数，最后一个参数3表示当前绘制的是第3个子图
h1=subplot(2 2 3);
y=x.^4;				% 描述图形的函数表达式
% 绘制函数表达式所描绘的函数图形
plot(x,y)

% 绘制４个字图中的第4个，第一个参数２表示子图的行数，第二个参数２表示子图的列数，最后一个参数3表示当前绘制的是第4个子图
h2=subplot(2 2 4);
y=x.^5;				% 描述图形的函数表达式
% 绘制函数表达式所描绘的函数图形
plot(x,y)
%%%  得到如图6-59所示的图形
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第二步 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%   定义注释矩形的位置和大小
t1=get(h1,'TightInset');
p2=get(h2,'Position');
t2=get(h2,'TightInset');
x1=p1(1)-t1(1);
y1=p1(2)-t2(2);
x2=p2(1)-t2(1);
y2=p2(2)-t2(2);
w=x2-x1+t1(1)+p2(3)+t2(3);
h=p2(4)+t2(2)+t2(4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第三步 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%   创建注释矩形来环绕整个子图
% 参数'rectangle'表示对图形的形状进行设置；参数[x1,y1,w,h]表示矩形所覆盖的范围
annotation('rectangle',[x1,y1,w,h],'FaceAlpha',.2,'FaceColor','red','EdgeColor','red');
%%% 得到如图6-60所示的图形

