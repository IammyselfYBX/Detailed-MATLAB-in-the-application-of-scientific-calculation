syms A t w;syms tao positive;
%------------����Fourier�任֤��--------------%
yt=sym('Heaviside(t+tao/2)-Heaviside(t-tao/2)');
Yw=fourier(A*yt,t,w)
%-----------����Fourier��任֤��-------------%
Fw =2*A/w*sin(1/2*tao*w);
Yt=ifourier(Fw,w,t)
