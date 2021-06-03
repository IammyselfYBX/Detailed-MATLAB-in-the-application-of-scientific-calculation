x=-0.5:0.01:1;
fun=@(x)sin(x)-x.^2+0.5;  % 定义函数表达式
[xx,iter,X]=fixpt(fun,1.5,1e-8);  % 不动点迭代求根
plot(x,sin(x)-x.^2-x+0.5,[-0.5,1],[0,0],'k:',...
    xx,fun(xx)-xx,'k*')  % 绘制图形
text(0,-0.2,['函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}简单迭代法求根')  % 添加标题
