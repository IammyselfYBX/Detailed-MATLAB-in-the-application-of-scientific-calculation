fun='3*sin(2*x.^2)'
f=inline(fun)  % ͨ��inline()�������ַ������ʽfunת��Ϊ��������
g=inline('sin(x.^2+y.^2)','x','y')  % ������������
h1=inline('P1*sin(P2*x.^P3)','x','P1','P2','P3')
h2=inline('P1*sin(P2*x.^P3)',3)
Z1=f(3:6)
syms z
Z2=g(1,z)
Z3=h1(1,2,3)

