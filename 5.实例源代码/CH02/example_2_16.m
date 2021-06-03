syms x y m n;  %声明符号变量
L1=limit(m/(1-x^m)-n/(1-x^n),x,1)
f2=(x^3+x^2+x+1)^(1/3)-sqrt(x^2+x+1)*log(exp(x)+x)/x;
L2=limit(f2,x,inf)
L3=limit((3^x+9^x)^(1/x),1/y)  %将x替换为1/y
f4=sqrt(1/x+sqrt(1/x+sqrt(1/x)))-sqrt(1/x-sqrt(1/x+sqrt(1/x)));
L4=limit(f4,x,0,'right')
