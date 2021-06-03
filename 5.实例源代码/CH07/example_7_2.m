x=0:0.5:3;  % x轴数据
y=[0 0.4794 0.8415 0.9815 0.9126 0.5985 0.1645];  % y轴数据
wfun=ones(1,6);  % 权系数
phifun=@(x)[ones(size(x));x;x.^2;cos(x);exp(x);sin(x)];  % 拟合基函数
[A,b,p]=Least_square(wfun,phifun,x,y)  % 最小二乘拟合求解
syms x
digits(4)  % 设定精度
Phifun=[1;x;x.^2;cos(x);exp(x);sin(x)];
y=vpa(p*Phifun)  % 最小二乘拟合解函数

