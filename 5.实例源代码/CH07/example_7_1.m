wfun='x.^0';  % Ȩ����
phifun=char('1','x','x.^2','x.^3');  % ������
fun='exp(x)';  % ���ƽ�����
a=-1;b=1;  % ����˵�
[A,B,p]=square_approximation(wfun,phifun,fun,a,b)  % ����������ƽ���ƽ�����ʽϵ��
p2=poly2str(fliplr(p),'x')  % ���ݶ���ʽϵ���������ʽ
