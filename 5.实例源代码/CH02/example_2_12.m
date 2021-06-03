t=0:0.1:2*pi;
y=t+i*t.*sin(t);
r=abs(y);theta=angle(y);  %求极半径和极角
% [theta,r] = cart2pol(t,t.*sin(t));
subplot 121,plot(y),title('直角坐标图')
subplot 122,polar(theta,r),title('极坐标图')
