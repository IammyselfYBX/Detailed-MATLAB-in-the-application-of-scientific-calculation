syms x y 
factor(x^3-y^3)		%�ԣ�x^3-y^3��������ʽ�ֽ�
n=1:9					%��x^(n+1)���ж���ʽ�ֽ�
x=x(ones(size(n)))
p=x.^n+1
[p;factor(p)].'
