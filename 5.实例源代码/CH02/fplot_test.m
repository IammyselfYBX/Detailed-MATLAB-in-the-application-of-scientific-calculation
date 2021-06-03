subplot 221
f=@(x)[tan(x),sin(x),cos(x)];
fplot(f,2*pi*[-1 1 -1 1])  % 绘制多根曲线
% fplot('[tan(x),sin(x),cos(x)]',2*pi*[-1 1 -1 1])
subplot 222
y=@(x)sin(6*x)./(6*x);  % 用户自定义函数
fplot(y,[-2,2],2e-2,50,'g')
subplot 223
fplot(@humps,[0,2],2e-1,100,'k*')  % humps函数是MATLAB自带的函数
subplot 224
f = @(x,n)abs(exp(-j*x*(0:n-1))*ones(n,1));  % 带有附加参数的函数
fplot(@(x)f(x,10),[0 2*pi])
% fplot(f,[0 2*pi],[],[],[],10)
