syms A t w;syms tao positive;
%------------利用Fourier变换证明--------------%
yt=sym('Heaviside(t+tao/2)-Heaviside(t-tao/2)');
Yw=fourier(A*yt,t,w)
%-----------利用Fourier逆变换证明-------------%
Fw =2*A/w*sin(1/2*tao*w);
Yt=ifourier(Fw,w,t)
