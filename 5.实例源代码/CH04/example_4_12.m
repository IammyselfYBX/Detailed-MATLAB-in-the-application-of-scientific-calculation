fun=@(x)[2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))];  % 利用匿名函数定义方程组
x0 = [-5; -5];  % 迭代初值
options=optimset('Display','iter');  % 设置优化参数显示每一步的迭代结果
% options=optimset;options.Display='iter';
[x,fval] = fsolve(fun,x0,options)  % fsolve函数求方程组的根
