fun = @(x,y)abs(x.^2 + y.^2 - 0.25);  % 定义被积函数
c = @(x)-sqrt(1 - x.^2);  % 内部积分下限函数
d = @(x)sqrt(1 - x.^2);  % 内部积分上限函数
I=quad2d(fun,-1,1,c,d,'AbsTol',1e-8,...
    'FailurePlot',true,'Singular',false)  % 一般区域二重积分求解
