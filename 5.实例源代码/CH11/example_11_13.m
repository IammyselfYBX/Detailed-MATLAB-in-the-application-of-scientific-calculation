A=[1,1;1.25,0.75;0,1];b=[200;200;150];
goal=[-950,-50];
weight=abs(goal);
x0=[50,50];
lb=[0 0];ub=[inf,inf];
options=optimset('GoalsExactAchieve',2);  % 设置独立变量数
f=@(x)[-4*x(1)-5*x(2),-x(1)];  % 定义函数表达式
[x,fval]=fgoalattain(f,x0,goal,weight,A,b,[],[],lb,ub,[],options)  % 求解目标规划问题
