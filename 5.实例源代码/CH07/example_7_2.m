x=0:0.5:3;  % x������
y=[0 0.4794 0.8415 0.9815 0.9126 0.5985 0.1645];  % y������
wfun=ones(1,6);  % Ȩϵ��
phifun=@(x)[ones(size(x));x;x.^2;cos(x);exp(x);sin(x)];  % ��ϻ�����
[A,b,p]=Least_square(wfun,phifun,x,y)  % ��С����������
syms x
digits(4)  % �趨����
Phifun=[1;x;x.^2;cos(x);exp(x);sin(x)];
y=vpa(p*Phifun)  % ��С������Ͻ⺯��

