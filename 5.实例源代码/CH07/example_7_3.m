t=1:16;  % 时间
y=[4.00 6.40 8.00 8.80 9.22 9.50 9.70 9.86 10.00...
    10.20 10.32 10.42 10.50 10.55 10.58 10.60]*1e-3;  % 浓度
plot(t,y,'*')  % 绘制散点图
% 1/y=a+b/t
wfun=ones(1,2);  % 权系数
phifun=@(x)[ones(size(x));1./x];  % 拟合基函数
[A1,b1,p1]=Least_square(wfun,phifun,t,1./y)  % 最小二乘拟合求解
F1=t./(fliplr(p1)*phifun(1./t));  % 拟合值
D1=y-F1;  % 误差
% 绝对值最大的误差
D1_max=max(abs(D1))  % D1_max=norm(D1,inf)
% 均方误差
D1_ME=norm(D1)
% y=a*exp(b/t)==>lny=lna+b/t
[A2,b2,p2]=Least_square(wfun,phifun,t,log(y))  % 最小二乘拟合求解
F2=exp(p2*phifun(t));  % 拟合值
D2=y-F2;  % 误差
% 绝对值最大的误差
D2_max=max(abs(D2))  % D2_max=norm(D2,inf)
% 均方误差
D2_ME=norm(D2)


