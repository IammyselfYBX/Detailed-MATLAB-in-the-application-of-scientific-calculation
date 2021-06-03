function example_4_9
x0 = [-5; -5];
[x,iter,X]=newtong(@f,x0)  % 牛顿法求根
ezplot('2*x-y-exp(-x)')  % 绘制第一个方程的曲线图
hold on  % 图形保持
h=ezplot('-x+2*y-exp(-y)');  % 绘制图形
set(h,'Color','k','LineWidth',2)  % 设置图形的线宽
plot(x(1),x(2),'k*','MarkerSize',12)  % 绘制零点
text(1,-1,strjust(char('方程的根{\fontname{times}\itx}^*：',num2str(x)),'center'),'fontsize',12)
text(-5,4,'$$\left\{\begin{array}{l}2{x_1}-{x_2}={e^{-{x_1}}}\\-{x_1}+2{x_2}={e^{-{x_2}}}\\\end{array}\right.$$','interpreter','latex','fontsize',14)  % 添加标注
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数文件描述，返回函数值和jacobi矩阵
function [y,J]=f(x)
y=[2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))];  % 计算函数值
% 求Jacobi矩阵
syms xx yy;  % 声明符号变量
J=jacobian([2*xx-yy-exp(-xx);-xx+2*yy-exp(-yy)],[xx yy]);  % 求符号jacobi矩阵
J=subs(J,xx,x(1));  % 替换
J=subs(J,yy,x(2));  % 替换
