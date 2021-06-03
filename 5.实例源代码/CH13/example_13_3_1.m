function example_13_3_1
f=@(delta)delta*delta';  % Ŀ�꺯��
deltaini=[0,0,0,0,0,0];  % ��ֵ
vlb=-pi/6*ones(1,6);vub=pi/6*ones(1,6);  % �������½�
options = optimset('Algorithm','active-set');  % �����Ż�����
[d1,fval]=fmincon(f,deltaini,[],[],[],[],vlb,vub,@airfunco,options);  % �������Թ滮����
disp('�����Ƕ�');
d1=d1*180/pi  % ������ת��Ϊ�Ƕ�
disp('Ŀ�꺯��ֵ');
fval=fval*(180/pi)^2
function [c,ceq]=airfunco(delta)
%Լ���������� airfunco.m
x0=[150 85 150 145 130 0];y0=[140,85,155,50,150,0];
alpha0=[243 236 220.5 159 230 52]*pi/180; v=800;
co=cos(alpha0+delta);si=sin(alpha0+delta);
% ���²������dij
for  i=2:6
   for j=1:i-1
       t(i,j)=(x0(i)-x0(j))*(co(i)-co(j));
       t(i,j)=t(i,j)+(y0(i)-y0(j))*(si(i)-si(j));
       t(i,j)=-t(i,j)/v; 
       t(i,j)=t(i,j)/((co(i)-co(j))^2+(si(i)-si(j))^2);
       if t(i,j)<0, 
           d(i,j)=1000;
       else
           d(i,j)=(x0(i)-x0(j)+v*t(i,j)*(co(i)-co(j)))^2;
           d(i,j)=(y0(i)-y0(j)+v*t(i,j)*(si(i)-si(j)))^2+d(i,j);
       end
   end
end
c=64-[d(2,1),d(3,1:2),d(4,1:3),d(5,1:4),d(6,1:5)];  % ����ʽԼ������
ceq=[];  % ��ʽԼ�������ÿ�
