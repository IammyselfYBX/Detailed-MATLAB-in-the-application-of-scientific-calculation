function example_11_20
x0= [1;1];  % ��ֵ��������������
xstatus= [1;1];
lb=-100*[1;1];ub=-lb;
A=[];b=[];
Aeq=[];beq=[];
settings=[];
%�Ż�ѡ��������TolX��MaxSQPIter��������
options= optimset('display','off','MaxSQPIter',1000,'TolX',1e-6);
% ����bnb20�������
[errmsg,f,x,t,c,fail]= bnb20('objfun',x0,xstatus,lb,ub,A,b,...
    Aeq,beq,'nonlcon',settings,options)
% �����Ż���������֤
[x1,fval,exitflag,output] = fmincon('objfun',x0,A,b,Aeq,beq,...
    lb,ub,'nonlcon',options)
%========Ŀ�꺯��=========%
function f=objfun(x)
f=100.*(x(2)-x(1).^2).^2+(4.5543-x(1)).^2;
%========������Լ��=========%
function [c,ceq] = nonlcon(x)
c = -8.63*x(1)+x(2)^3;  % �����Բ���ʽ����Լ��
ceq=[];  % �����Ե�ʽԼ��
