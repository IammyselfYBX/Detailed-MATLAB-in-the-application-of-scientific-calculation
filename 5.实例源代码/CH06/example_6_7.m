hours=1:12;  % ʱ������
temps=[5 8 9 15 25 29 31 30 22 25 27 24];  % �¶�ֵ
h=1:0.1:12;
method={'comlete','not-a-knot','periodic','second'};  % ��ֵ�߽�����
type=char('��������',' ��Ť��',' ������','  ��Ȼ');
for k=1:4
    subplot(2,2,k)  % ͼ�ηָ�
    pp=csape(hours,temps,char(method(k)));  % ����������ֵ
    t=ppval(pp,h);  % ���h�����¶�ֵ
    plot(hours,temps,'ko',h,t,'k')  % ����ͼ��
    text(4,10,[type(k,:),'�߽�����'])  % ��ӱ�ע
    xlim([1,12]);  % ����x�����귶Χ
end
