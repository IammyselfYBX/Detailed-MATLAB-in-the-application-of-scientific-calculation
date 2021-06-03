x=0:0.1:1;
y=[-0.447 1.978 3.28 6.16 7.07 7.34 7.66 9.56 9.48 9.30 11.2];
xi=linspace(0,1);
for k=1:8
    p=polyfit(x,y,k);  % ����ʽ���
    yp=polyval(p,xi);  % ��ڵ㴦�����ֵ
    plot(x,y,'ro',xi,yp,'k')  % ����ͼ��
    for i=1:length(p)
        digits(5)  % ���þ���
        h1=text(0.08*i-0.03,i-2,['p(',num2str(i),')=',char(vpa(p(i)))]);  % ��ӱ�ע
        h2=text(0.95,i-2,['{\itx}^',num2str(length(p)-i)]);  % ��ӱ�ע
        set([h1,h2],'fontname','times','fontsize',12)  % ���ñ�ע���������ֺ�
        title([num2str(k),'�ζ���ʽ'],'fontname','����','fontsize',16)  % ��ӱ���
    end
    pause(1)  % ��ͣ1��
end


