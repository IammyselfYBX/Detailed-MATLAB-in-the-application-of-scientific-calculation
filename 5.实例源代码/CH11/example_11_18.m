clear all;clc;
% ����LP
f=-[40,90];
A=[9,7;7,20];b=[56;70];
lb=[0;0];
[x0,f0]=linprog(f,A,b,[],[],lb)
% ����LP1
lb=[0;0];
ub=[4;inf];
[x1,f1]=linprog(f,A,b,[],[],lb,ub)
% ����LP2
lb=[5;0];
[x2,f2]=linprog(f,A,b,[],[],lb)
% ����LP3
lb=[0;0];
ub=[4;2];
[x3,f3]=linprog(f,A,b,[],[],lb,ub)
% ����LP4
lb=[0;3];
ub=[4;inf];
[x4,f4]=linprog(f,A,b,[],[],lb,ub)
% ����LP5
lb=[5;0];
ub=[inf;1];
[x4,f4]=linprog(f,A,b,[],[],lb,ub)
% ����LP6
lb=[5;2];
[x2,f2]=linprog(f,A,b,[],[],lb)