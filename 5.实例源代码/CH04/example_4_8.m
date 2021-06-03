x=0:0.01:2;
f=@(x)1./((x-.3).^2 +.01)+1./((x-.9).^2 +.04)-6;  % 定义函数表达式
[xx,iter,X]=parabola(f,0.2,1,2)  % 抛物线法求根
plot(x,f(x),[0,2],[0,0],'k:',xx,f(xx),'k*')  % 绘制图形
text(1,40,['humps函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}抛物线法求根')  % 添加标题
