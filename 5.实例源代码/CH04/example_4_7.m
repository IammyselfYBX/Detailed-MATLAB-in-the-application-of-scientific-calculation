function example_4_7
x0=2;
x=0.5:0.1:3;
[x1,iter1,X1]=newton_reroot(@fun,x0);  % 重根情形的求解
[x2,iter2,X2]=newton(@fun,x0);  % 牛顿法求根
plot(x,fun(x),'k',[0.5 3],[0 0],'k:',x1,fun(x1),'k*')  % 绘制图形
h(1)=text(1.5,2,['方程的根{\fontname{times}\itx}^*=',num2str(x1)]);  % 添加标注
h(2)=text(0.8,-2,['牛顿修正法迭代次数：',num2str(iter1)]);  % 添加标注
h(3)=text(0.8,-3,[blanks(4),'牛顿法迭代次数：',num2str(iter2)]);  % 添加标注
h(4)=title('牛顿法与牛顿修正法比较')  % 添加标题
set(h,'fontname','隶书','fontsize',12)  % 设置字号与字体
% 函数描述文件
function [y,dy,d2y]=fun(x)
y=x.^4-(231*x.^3)/25 + (17901*x.^2)/625 -...
    (579501*x)/15625 + 6762366/390625;  % 计算函数值
yy=sym('x^4-(231*x^3)/25 + (17901*x^2)/625 -(579501*x)/15625 + 6762366/390625');
dy=diff(yy);dy=subs(dy,x);  % 一阶导数
d2y=diff(yy,2);d2y=subs(d2y,x);  % 二阶导数
