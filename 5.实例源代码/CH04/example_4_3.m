x=-2:0.01:2;
f=@(x)x.^3-1;
g=@(x)(x+1).^(1/3);x0=3.5;
[x1,iter1]=fixpt(g,x0);            %简单迭代法，选取迭代函数为g
[x2,iter2]=steffensonfixpt(f,x0);  %斯蒂芬森加速法，选取迭代函数为f
[x3,iter3]=steffensonfixpt(g,x0);  %斯蒂芬森加速法，选取迭代函数为g
plot(x,f(x)-x,[-2,2],[0,0],'k:',x1,f(x1)-x1,'k*')  % 绘制图形
text(-1,4,['函数零点{\itx}^*=',num2str(x1)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
h(1)=text(-1,-3,'所需的迭代次数：');
h(2)=text(-1,-4,['简单迭代法，选取迭代函数g：',num2str(iter1)]);
h(3)=text(-1,-5,['斯蒂芬森加速法，选取迭代函数f：',num2str(iter2)]);
h(4)=text(-1,-6,['斯蒂芬森加速法，选取迭代函数g：',num2str(iter3)]);
title('\fontname{隶书}\fontsize{16}两种迭代法的速率比较');  % 添加标题
set(h,'fontname','隶书','fontsize',14)  % 设置标注字体字号
