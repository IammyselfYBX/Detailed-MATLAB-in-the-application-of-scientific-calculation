syms t s;syms t0 positive;
%---------����Laplace�任֤��---------%
ft=heaviside(t-t0)*sym('f(t-t0)');
F=laplace(ft,t,s)
%---------����Laplace��任֤��-------%
Fs=exp(-s*t0)*laplace(sym('f(t)'));
y=ilaplace(Fs,s,t)
