function example_11_20
x0= [1;1];  % 初值，必须是列向量
xstatus= [1;1];
lb=-100*[1;1];ub=-lb;
A=[];b=[];
Aeq=[];beq=[];
settings=[];
%优化选项，必须给出TolX和MaxSQPIter两个参数
options= optimset('display','off','MaxSQPIter',1000,'TolX',1e-6);
% 调用bnb20函数求解
[errmsg,f,x,t,c,fail]= bnb20('objfun',x0,xstatus,lb,ub,A,b,...
    Aeq,beq,'nonlcon',settings,options)
% 调用优化工具箱验证
[x1,fval,exitflag,output] = fmincon('objfun',x0,A,b,Aeq,beq,...
    lb,ub,'nonlcon',options)
%========目标函数=========%
function f=objfun(x)
f=100.*(x(2)-x(1).^2).^2+(4.5543-x(1)).^2;
%========非线性约束=========%
function [c,ceq] = nonlcon(x)
c = -8.63*x(1)+x(2)^3;  % 非线性不等式条件约束
ceq=[];  % 非线性等式约束
