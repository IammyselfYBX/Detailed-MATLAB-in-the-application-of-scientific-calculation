A=[1,1;1.25,0.75;0,1];b=[200;200;150];
goal=[-950,-50];
weight=abs(goal);
x0=[50,50];
lb=[0 0];ub=[inf,inf];
options=optimset('GoalsExactAchieve',2);  % ���ö���������
f=@(x)[-4*x(1)-5*x(2),-x(1)];  % ���庯�����ʽ
[x,fval]=fgoalattain(f,x0,goal,weight,A,b,[],[],lb,ub,[],options)  % ���Ŀ��滮����
