%%%%%%%%%%   下述代码主要采用trapz函数对函数表达式进行积分 %%%%%%%%%%%%%
% 构建向量x的数据
x=[1 2 3 4 5 6 7 8 9 10]
% 利用trapz函数对向量x进行积分
z1=trapz(x)
% 构建向量y的数据
y=[0 1 2; 3 4 5; 6 7 8]
% 利用trapz函数对向量y进行积分
trapz(y,1)
trapz(y,2)% 构建向量x的数据
x=[1 2 3 ]
% 利用trapz函数对向量y进行积分
trapz(x,y)
