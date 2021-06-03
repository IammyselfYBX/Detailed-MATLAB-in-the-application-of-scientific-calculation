x=0:0.01:2;
[xx,iter,X]=secant(@humps,1.5,1,1e-8)  % 割线法求根
plot(x,humps(x),[0,2],[0,0],'k:',xx,humps(xx),'k*')  % 绘制图形
text(1,40,['humps函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}割线法求根')  % 添加标题
