syms x y z t u
f=1/(1+x^2)			%定义基本函数
g=sin(y)
h=x^t
p=exp(-y/u)
compose(f,g)			%将g为自变量代入f函数
compose(f,g,t)			%将t为自变量
compose(h,g,x,z)		%x为h的自变量
compose(h,g,t,z)		%t为h的自变量
compose(h,p,x,y,z)	%x为h的自变量，y为p的自变量
compose(h,p,t,u,z)	%t为h的自变量，u为p的自变量