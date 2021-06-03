% 利用lsqnonlin函数求解
f=@(x,k)2+2.*(1:k)-exp((1:k)*x(1))-exp((1:k)*x(2));  % 目标函数描述
x0 = [0.3,0.4];                      % 初始值
lb=zeros(2,1);ub=ones(2,1);  % 变量的上下界
[x1,resnorm,residual] = lsqnonlin(@(x)f(x,10),x0,lb,ub)    % lsqnonlin函数求解
% 利用fmincon函数求解
G=@(x,k)f(x,k)*f(x,k)';  % 目标函数描述
options=optimset('LargeScale','off','Algorithm','active-set');  % 设置优化参数
[x2,fval]=fmincon(@(x)G(x,10),x0,[],[],[],[],lb,ub,[],options)  % fmincon函数求解
