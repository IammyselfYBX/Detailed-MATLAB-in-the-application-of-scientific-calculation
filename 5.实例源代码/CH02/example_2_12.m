t=0:0.1:2*pi;
y=t+i*t.*sin(t);
r=abs(y);theta=angle(y);  %�󼫰뾶�ͼ���
% [theta,r] = cart2pol(t,t.*sin(t));
subplot 121,plot(y),title('ֱ������ͼ')
subplot 122,polar(theta,r),title('������ͼ')
