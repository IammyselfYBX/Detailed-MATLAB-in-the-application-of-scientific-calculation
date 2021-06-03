function example_11_7
x0=[1,1,1];sigma=10^5;
lb=[1 0 0];ub=[3,inf,inf];  % 变量上下界
f=@(x,sigma)x(2)*sqrt(16+x(1)^2)+x(3)*sqrt(1+x(1)^2);
options=optimset('Algorithm','interior-point');  % 设置优化算法为interior-point
[x,fval]=fmincon(f,x0,[],[],[],[],lb,ub,...
    @NonLinear_constr,options,sigma)  % 非线性约束优化
% 非线性约束
function [C,Ceq]=NonLinear_constr(x,sigma)
y=x(1);x1=x(2);x2=x(3);
C(1)=20*sqrt(16+y^2)-sigma*y*x1;  % 非线性不等式约束
C(2)=80*sqrt(1+y^2)-sigma*y*x2;
Ceq=[];  % 将非线性等式约束设置为空
