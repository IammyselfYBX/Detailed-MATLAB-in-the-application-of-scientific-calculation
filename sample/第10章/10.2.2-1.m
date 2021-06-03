% 使用dblquad函数对函数表达式进行积分，其中参数'y*sin(x)+x*cos(y)'为积分函数表达式，参数pi,2*pi,0,pi分别构成了一个闭合的平面积分区域
q=dblquad('y*sin(x)+x*cos(y)',pi,2*pi,0,pi)
% 使用dblquad函数对函数表达式进行积分，其中参数'y*sin(x)+x*cos(y)'为积分函数表达式，参数pi,2*pi,0,pi分别构成了一个闭合的平面积分区域。参数1e-10设定了积分的相对误差范围
q=dblquad(inline('y*sin(x)+x*cos(y)'),pi,2*pi,0,pi,1e-10)


