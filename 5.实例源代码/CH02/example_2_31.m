syms t s;syms t0 positive;
%---------利用Laplace变换证明---------%
ft=heaviside(t-t0)*sym('f(t-t0)');
F=laplace(ft,t,s)
%---------利用Laplace逆变换证明-------%
Fs=exp(-s*t0)*laplace(sym('f(t)'));
y=ilaplace(Fs,s,t)
