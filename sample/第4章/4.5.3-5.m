syms n
delta=sym('charfcn[0](n)')
d0=subs(delta,n,0)		%���庯����0���ȡֵ
d15=subs(delta,n,15)		%���庯����15���ȡֵ
disp('[d0,d15]')			%��������ʾ
disp([d0,d15])
syms z
fn=2*delta+6*(1-(1/2)^n)
fz=ztrans(fn,n,z)
disp('fz=');
pretty(fz)				%�Խ���������ʽ���е���
fz_n=iztrans(fz,z,n)

