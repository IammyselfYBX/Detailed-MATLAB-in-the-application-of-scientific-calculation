syms n
delta=sym('charfcn[0](n)')
d0=subs(delta,n,0)		%脉冲函数在0点的取值
d15=subs(delta,n,15)		%脉冲函数在15点的取值
disp('[d0,d15]')			%输出结果显示
disp([d0,d15])
syms z
fn=2*delta+6*(1-(1/2)^n)
fz=ztrans(fn,n,z)
disp('fz=');
pretty(fz)				%对结果的输出格式进行调整
fz_n=iztrans(fz,z,n)

