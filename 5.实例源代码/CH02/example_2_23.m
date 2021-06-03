% 绘制积分区域
fplot('[x^2,2-x^2]',[-2 2 -0.5 2.5])  % 绘制曲线图
text([-1.4,-1.4],[2,0.05],{'\leftarrowy=x^2','\leftarrowy=2-x^2'})  % 添加标注
A=double(solve('x^2-(2-x^2)'))  % 将符号型结果转换成浮点型
hold on
xn=linspace(A(1),A(2),100);
fill([xn,fliplr(xn)],[xn.^2,fliplr(2-xn.^2)],'b')  % 填充积分区域
% 积分求解
syms x y;
I=int(int(x^2,y,x^2,2-x^2),x,min(A),max(A))  % 嵌套调用求解重积分
