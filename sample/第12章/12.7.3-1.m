%%%%%%%%% ���´�����Ҫ����ʵ��MATLABģ����Excelģ��֮��������� %%%%%%%%%%%
% ��յ�ǰ�ڴ��е����б���
clear
% ���ƺ���ͼ�� peaks(20)
h=surf(peaks(20));
% �õ������Z��������
z=get(h,'zdata');
% ΪMATLAB��Excel֮���DDE�Ի�����ͨ��chann
chann=ddeinit('excel','sheet3');
% ��Excel�հױ���е�ָ������r1c1��r20c20��������Ϊrange2
range2='r1c1:r20c20';
% ��Z�������ݵ����ݸ��Ƶ�Excel��ָ���հ�������
rc=ddepoke(chann,range2,z);
% ����ͨ��chann��MATLAB��Excel֮�佨��һ��������
rc=ddeadv(chann,range2,'set(h,"zdata",z);','z');
% ��ӡ��رհ�ť��
hc=uimenu(gcf,'Label','�ر�')��
% ��ӡ��ر������Ӱ�ť��
hc1=uimenu(hc,'Label',----
'��������','Callback','ddeunadv(chann,range2);');
% ��ӡ��رնԻ�����ť
hc2=uimenu(hc,'Label','�رնԻ�','Callback','ddeterm(chann)');
% ��ӡ��ر�ͼ�δ��ڡ���ť
hc3=uimenu(hc,'Label','�ر�ͼ��','Callback','close');