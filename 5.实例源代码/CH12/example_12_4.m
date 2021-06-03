N=100;p=0.5;
k=0:N;
pdf=binopdf(k,N,p);  % 生成服从参数N和p的二项式分布概率密度值
cdf=binocdf(k,N,p);  % 生成服从参数N和p的二项式分布的累积分布函数值
[AX,H1,H2]=plotyy(k,pdf,k,cdf,'plot');  % 绘制双y轴图形
set(H1,'Color','b','Marker','.','MarkerSize',14)  % 设置句柄为H1的曲线的颜色和标记符号
% set(get(AX(1),'Children'),'Color','b','Marker','.','MarkerSize',14)
set(H2,'Color','g','Marker','+','MarkerSize',4)
% set(get(AX(2),'Children'),'Color','g','Marker','+','MarkerSize',4)
set(get(AX(1),'Ylabel'),'String','\fontname{隶书}\fontsize{14}概率密度曲线') 
set(get(AX(2),'Ylabel'),'String','\fontname{隶书}\fontsize{14}分布函数曲线')
set(AX(1),'YLim',[0,0.15])
set(AX(2),'YColor',[1,0,0])
grid on
legend([H1,H2],{'$$P(X = k) = C_n^k{p^k}{(1 - p)^{n - k}}$$',...
    '$$P(X\le k)=\sum\limits_{i=0}^k{C_n^i{p^i}{{(1-p)}^{n-i}}}$$'},...
    'interpreter','latex','fontsize',10,2)
