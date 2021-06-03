function f=feixianxing(x)
a=x(1);
b=x(2);
c=x(3);
f(1)=a^2+b+sin(c);
f(2)=a*b+c;
f(3)=cos(a)+b^2+2*c;
end
% 构建初始向量
x0=[1 1 1]
% 使用fslove函数来求解非线性方程组，参数feixianxing表示需要求解的非线性方程组，参数x0表示非线性方程组的初始值。
f=fslove('feixianxing',x0)
