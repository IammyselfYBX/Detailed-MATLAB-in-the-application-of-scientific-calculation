x=sym('x')
f=x-cos(x)
f1=subs(f,'pi',x)
digits(25)
vpa(f1)		%保留指定的精度
