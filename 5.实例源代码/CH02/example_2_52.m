% ����˫y��ͼ��
t=1:6;  % ʱ��
Income=[2456 2032 1900 2450 2890 2280];  % ��������
Profit=[12.5 11.3 10.2 14.5 14.3 15.1]/100;  %�߼�������
[AX,H1,H2]=plotyy(t,Income,t,Profit,@stem,@plot);  % ����˫y��ͼ��
% ����ͼ��
xlabel('ʱ��')  % x���ע
ylabel(AX(1),'��������')  % ��y��ı�ע
% �ȼ���ʽ��set(get(AX(1),'ylabel'),'String','��������')  
ylabel(AX(2),'�߼�������')  % ��y��ı�ע
% �ȼ���ʽ��set(get(AX(2),'ylabel'),'String','�߼�������')
xlim(AX(1),[min(t)-1,max(t)+1]);  % ����x�᷶Χ
% �ȼ���ʽ��set(AX(1),'xlim',[min(t)-1,max(t)+1])
xlim(AX(2),[min(t)-1,max(t)+1]);  % ����x�᷶Χ
% �ȼ���ʽ��set(AX(2),'xlim',[min(t)-1,max(t)+1])
set(H1,'LineStyle',':',...  % ��������
    'LineWidth',2,...  % �����߿�
    'Marker','s',...  %���ñ�Ƿ���
    'MarkerEdgeColor','k',...  % ���ñ�Ƿ��ű�Ե����ɫ
    'MarkerFaceColor','g',...  % ���ñ�Ƿ����ڲ��������ɫ
    'MarkerSize',6)  % ���ñ�Ƿ��ŵĴ�С
set(H2,'LineWidth',2,...  % �����߿�
    'Marker','o')  % ���ñ�Ƿ���
