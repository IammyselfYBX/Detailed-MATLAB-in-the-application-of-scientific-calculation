miu0=1.785e-3;
a=0.03368;
b=0.000221;
t=0:20:40??80 
miu=miu0./(1+a*t+b*t.^2)
