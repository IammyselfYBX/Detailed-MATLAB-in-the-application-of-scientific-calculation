a=1/3;b=1/8;
tic,a1=a+b,toc  % ��ֵ�㷨
tic,a2=sym(a+b),toc  % �����㷨
digits(2),tic,a3=vpa(a+b),toc  % �ɿؾ����㷨
d=digits
