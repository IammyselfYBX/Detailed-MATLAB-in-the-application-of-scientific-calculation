syms t u v w x 
ifourier(w*exp(-3*w)*sym('Heaviside(3)'))
ifourier(w*exp(-3*w)*sym('Heaviside(w)'))
ifourier(1/(1+w^2),u)
ifourier(v/(1+w^2),v,u)
ifourier(sym('fourier(f(x),x,w)',w,x))
