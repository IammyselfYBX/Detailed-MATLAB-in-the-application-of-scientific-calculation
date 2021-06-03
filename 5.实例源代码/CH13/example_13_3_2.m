function example_13_3_2
f=@(delta)delta*delta';
deltaini=[0,0,0,0,0,0];
vlb=-pi/6*ones(1,6);vub=pi/6*ones(1,6);
options = optimset('Algorithm','active-set');
[d1,fval]=fmincon(f,deltaini,[],[],[],[],vlb,vub,@airfunco,options);
for i=1:9
    deltaini=[(rand(1,6)-0.5)*0.1];  % 随机产生0附近的6个随机数
	   % 以上述随机数为初值求解非线性规划问题
    [dt,feval]=fmincon(f,deltaini,[],[],[],[],vlb,vub,@airfunco,options);  
    if feval<fval  % 判断
        fval=feval;  % 若以随机数为初值求得的结果小于原来的结果则取而代之
        d1=dt;
    end
end
disp('调整角度');
d1=d1*180/pi
disp('目标函数值');
fval=fval*(180/pi)^2
function [c,ceq]=airfunco(delta)
%约束条件函数 airfunco.m
x0=[150 85 150 145 130 0];y0=[140,85,155,50,150,0];
alpha0=[243 236 220.5 159 230 52]*pi/180; v=800;
co=cos(alpha0+delta);si=sin(alpha0+delta);
% 以下部分求解dij
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
c=64-[d(2,1),d(3,1:2),d(4,1:3),d(5,1:4),d(6,1:5)];  % 不等式约束条件
ceq=[];  % 等式约束条件置空
