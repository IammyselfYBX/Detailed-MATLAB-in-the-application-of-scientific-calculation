%%%%%%%%% 本代码主要用于通过鼠标的方式来移动函数曲线的图例标注 %%%%%%%%%%%%%%%
x=-pi:pi/20:pi;
% 绘制余弦函数cos和正弦函数sin的图形。其中参数’-ro’表示用红色实线来绘制余弦函数，数据点型采用圆圈图；而参数’-.b’表示采用蓝色点划线来绘制正弦函数图形
plot(x,cos(x),'-ro',x,sin(x),'-.b')
% 通过legend函数为余弦函数cos和正弦函数sin添加标注 ，内容分别为'cos','sin'
h=legend('cos','sin',2)
%%% 得到如图5-56所示的图形
