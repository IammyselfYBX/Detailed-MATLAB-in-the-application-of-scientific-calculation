function example_11_7
x0=[1,1,1];sigma=10^5;
lb=[1 0 0];ub=[3,inf,inf];  % �������½�
f=@(x,sigma)x(2)*sqrt(16+x(1)^2)+x(3)*sqrt(1+x(1)^2);
options=optimset('Algorithm','interior-point');  % �����Ż��㷨Ϊinterior-point
[x,fval]=fmincon(f,x0,[],[],[],[],lb,ub,...
    @NonLinear_constr,options,sigma)  % ������Լ���Ż�
% ������Լ��
function [C,Ceq]=NonLinear_constr(x,sigma)
y=x(1);x1=x(2);x2=x(3);
C(1)=20*sqrt(16+y^2)-sigma*y*x1;  % �����Բ���ʽԼ��
C(2)=80*sqrt(1+y^2)-sigma*y*x2;
Ceq=[];  % �������Ե�ʽԼ������Ϊ��
