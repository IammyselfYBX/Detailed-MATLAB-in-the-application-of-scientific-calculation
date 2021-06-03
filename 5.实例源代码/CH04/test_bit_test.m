x=0:0.01:2;
fun=inline('1./((x-.3).^2 +.01)+1./((x-.9).^2 +.04)-6','x');  % 利用内联函数定义函数表达式
[xx,fx,iter,X]=test_bit(fun,0,2,1e-8);  % 试位法非线性方程的根
plot(x,humps(x),[0,2],[0,0],'k:',xx,fx,'k*')  % 绘制图形
text(1,40,['humps函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}试位法求根')  % 添加标题
