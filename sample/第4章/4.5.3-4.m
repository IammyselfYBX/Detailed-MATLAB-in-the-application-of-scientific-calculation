syms s t w x y 
ilaplace(1/(s-1))
ilaplace(1/(t^2+1))
ilaplace(t^(-sym(5/2)),x)
ilaplace(y/(y^2+w^2),y,x)
ilaplace(sym('laplace(F(x),x,s)'),s,x)
