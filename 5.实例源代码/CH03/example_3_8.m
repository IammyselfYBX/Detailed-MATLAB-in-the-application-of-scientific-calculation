a=1/3;b=1/8;
tic,a1=a+b,toc  % 数值算法
tic,a2=sym(a+b),toc  % 符号算法
digits(2),tic,a3=vpa(a+b),toc  % 可控精度算法
d=digits
