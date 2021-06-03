f=@(x)exp(x)-x-5;  % 定义函数表达式
x=1:0.01:4;
[xx,iter,X]=steffenson(f,1.8,1e-8)  % Steffenson法求根
plot(x,f(x),[1,4],[0,0],'k:',xx,f(xx),'k*')  % 绘制图形
text(2,30,['函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}Steffenson法求根')  % 添加标题
