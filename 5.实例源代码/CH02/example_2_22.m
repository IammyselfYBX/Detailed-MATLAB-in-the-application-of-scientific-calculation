syms x t;
I1=int((x+sin(x))/(1+cos(x)))  % 求不定积分I1
I2=int(sqrt(t)*exp(-t),t,0,inf)  % 求奇异积分I2
f3=[cos(x),x^2;2^x,log(2+x)];
I3=int(f3,x)  % 求矩阵函数积分I3
