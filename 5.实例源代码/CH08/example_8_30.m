%----------���ݶȵĽ�����---------%
syms x y;
z = x * exp(-x^2 - y^2);
zx=diff(z,x);
zy=diff(z,y);
%----------��ͼ�ȽϽ��������ֵ��---------%
[x,y] = meshgrid(-2:.2:2);
zx=subs(zx);zy=subs(zy);  %�ݶȵĽ�����
z = x.* exp(-x.^2 - y.^2);
[px,py] = gradient(z,.3,.3);
px=px*0.3/0.2;py=py*0.3/0.2;  %����ʵ�ʵ��ݶ�ֵ
contour(z),hold on,quiver(zx,zy),hold off
figure
contour(z),hold on, quiver(px,py), hold off
figure
surf(x,y,abs(px-zx))  %����dz/dx���������
