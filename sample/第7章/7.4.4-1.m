function ch=zihanshu(x,y)		% ��������Ϊzihanshu

% �ֱ����zihanshu1��zihanshu2��������յĽ��
ch=zihanshu1(x,y)*zihanshu2(x,y)	

% ����������������ľ���ֵ�ĺ�
function ch=zihanshu1(x,y)
ch=abs(x)+abs(y);

% ����������������Ĵ�����
function ch=zihanshu2(x,y)
ch=x+y;
