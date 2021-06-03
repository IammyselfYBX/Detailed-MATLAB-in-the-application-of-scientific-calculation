syms a b k T z;
f=1-exp(-a*k*T)*(cos(b*k*T)+a/b*sin(b*k*T));
F=ztrans(f);  %求取Z变换
A=1-exp(-a*T)*cos(b*T)-a/b*exp(-a*T)*sin(b*T);
B=exp(-2*a*T)+a/b*exp(-a*T)*sin(b*T)-exp(-a*T)*cos(b*T);
R=(z*(A*z+B))/((z-1)*(z^2-2*exp(-a*T)*cos(b*T)*z+exp(-2*a*T)));  % 求右端的最简表达式
e=simple(F-R)  % 作差
