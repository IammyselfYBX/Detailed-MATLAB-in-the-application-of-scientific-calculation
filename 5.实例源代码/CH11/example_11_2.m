f=-[2;3;-5];  % 目标函数变量系数向量
A=[-2,5,-1];b=-10;  % 不等式约束条件
Aeq=[1,1,1];beq=7;  % 等式约束条件
% 以下设置过程参数
ff=optimset;ff.LargeScale='off';  % 不使用大规模问题求解
ff.TolX=1e-15;ff.TolFun=1e-20;ff.TolCon=1e-20;  % 设置x处和函数值处的终止容限
% 线性规划求解
[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,zeros(3,1),[],[],ff);
% 显示计算结果
disp('线性规划问题的解x为：'),disp(x)
disp(['目标函数的最大值为：f=',num2str(-fval)])
