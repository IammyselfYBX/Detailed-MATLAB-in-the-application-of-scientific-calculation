syms x y 
factor(x^3-y^3)		%对（x^3-y^3）进行因式分解
n=1:9					%对x^(n+1)进行多项式分解
x=x(ones(size(n)))
p=x.^n+1
[p;factor(p)].'
