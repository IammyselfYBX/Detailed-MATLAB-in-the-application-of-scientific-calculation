a=sym('a')			%将表达式中的所有变量依次转换成符号变量
b=sym('b')
c=sym('c')
x=sym('x')
f=a*x^2+b*x+c		%将转换好的符号变量组合成符号表达式
f=sym('a*x^2+b*x+c')		%直接生成符号表达式