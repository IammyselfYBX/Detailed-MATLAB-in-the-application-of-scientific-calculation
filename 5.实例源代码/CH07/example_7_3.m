t=1:16;  % ʱ��
y=[4.00 6.40 8.00 8.80 9.22 9.50 9.70 9.86 10.00...
    10.20 10.32 10.42 10.50 10.55 10.58 10.60]*1e-3;  % Ũ��
plot(t,y,'*')  % ����ɢ��ͼ
% 1/y=a+b/t
wfun=ones(1,2);  % Ȩϵ��
phifun=@(x)[ones(size(x));1./x];  % ��ϻ�����
[A1,b1,p1]=Least_square(wfun,phifun,t,1./y)  % ��С����������
F1=t./(fliplr(p1)*phifun(1./t));  % ���ֵ
D1=y-F1;  % ���
% ����ֵ�������
D1_max=max(abs(D1))  % D1_max=norm(D1,inf)
% �������
D1_ME=norm(D1)
% y=a*exp(b/t)==>lny=lna+b/t
[A2,b2,p2]=Least_square(wfun,phifun,t,log(y))  % ��С����������
F2=exp(p2*phifun(t));  % ���ֵ
D2=y-F2;  % ���
% ����ֵ�������
D2_max=max(abs(D2))  % D2_max=norm(D2,inf)
% �������
D2_ME=norm(D2)


