N=100;p=0.5;
k=0:N;
pdf=binopdf(k,N,p);  % ���ɷ��Ӳ���N��p�Ķ���ʽ�ֲ������ܶ�ֵ
cdf=binocdf(k,N,p);  % ���ɷ��Ӳ���N��p�Ķ���ʽ�ֲ����ۻ��ֲ�����ֵ
[AX,H1,H2]=plotyy(k,pdf,k,cdf,'plot');  % ����˫y��ͼ��
set(H1,'Color','b','Marker','.','MarkerSize',14)  % ���þ��ΪH1�����ߵ���ɫ�ͱ�Ƿ���
% set(get(AX(1),'Children'),'Color','b','Marker','.','MarkerSize',14)
set(H2,'Color','g','Marker','+','MarkerSize',4)
% set(get(AX(2),'Children'),'Color','g','Marker','+','MarkerSize',4)
set(get(AX(1),'Ylabel'),'String','\fontname{����}\fontsize{14}�����ܶ�����') 
set(get(AX(2),'Ylabel'),'String','\fontname{����}\fontsize{14}�ֲ���������')
set(AX(1),'YLim',[0,0.15])
set(AX(2),'YColor',[1,0,0])
grid on
legend([H1,H2],{'$$P(X = k) = C_n^k{p^k}{(1 - p)^{n - k}}$$',...
    '$$P(X\le k)=\sum\limits_{i=0}^k{C_n^i{p^i}{{(1-p)}^{n-i}}}$$'},...
    'interpreter','latex','fontsize',10,2)
