syms x t;
I1=int((x+sin(x))/(1+cos(x)))  % �󲻶�����I1
I2=int(sqrt(t)*exp(-t),t,0,inf)  % ���������I2
f3=[cos(x),x^2;2^x,log(2+x)];
I3=int(f3,x)  % �����������I3
