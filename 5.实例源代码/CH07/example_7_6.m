x=0:0.1:1;
y=[-0.447 1.978 3.28 6.16 7.07 7.34 7.66 9.56 9.48 9.30 11.2];
xi=linspace(0,1);
for k=1:8
    p=polyfit(x,y,k);  % 多项式拟合
    yp=polyval(p,xi);  % 求节点处的拟合值
    plot(x,y,'ro',xi,yp,'k')  % 绘制图形
    for i=1:length(p)
        digits(5)  % 设置精度
        h1=text(0.08*i-0.03,i-2,['p(',num2str(i),')=',char(vpa(p(i)))]);  % 添加标注
        h2=text(0.95,i-2,['{\itx}^',num2str(length(p)-i)]);  % 添加标注
        set([h1,h2],'fontname','times','fontsize',12)  % 设置标注的字形与字号
        title([num2str(k),'次多项式'],'fontname','隶书','fontsize',16)  % 添加标题
    end
    pause(1)  % 暂停1秒
end


