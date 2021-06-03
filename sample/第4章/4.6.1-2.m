solve('p*sin(x)=r')		%求解符号方程 p*sin(x)=r的解
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
[x,y]=solve('x^2+x*y+y=3','x^2-4*x+3=0')
s=solve('x^2*y^2-2*x-1=0','x^2-y^2-1=0')
[u,v]=solve('a*u^2+v^2=0','u-v=1')
s=solve('a*u^2+v^2','u-v=1','a,u')
[x,y]=solve('sin(x+y)-exp(x)*y=0','x^2-y=2')


