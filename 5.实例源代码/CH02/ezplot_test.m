ezplot('y^2*sin(2*y) + x^2*cos(2*x) -1',[-2,2]);  % ���Ƶ�һ����������
h=get(gca,'Children');  % ��ȡ�����Ϣ
set(h,'Color','r','LineStyle',':');  % �ı�������ɫ������
hold on;
ezplot('x^3 + y^3 - 6*cos(2*x*y) + 1',[-2,2]);  % ���Ƶ�һ����������
str=get(get(gca,'Title'),'String');  % ��ȡ��ǰtitle�е��ַ���
title(['x^2cos(2x)+y^2sin(2y)-1=0, ',str]);  % �����ַ���
axis equal;  % ���õ�λ����һ��
