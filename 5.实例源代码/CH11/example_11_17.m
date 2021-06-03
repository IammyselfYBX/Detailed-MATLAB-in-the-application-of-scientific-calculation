P=[32.7 42.6 44.5 25.7 36.6 38.6 37.6 63.0];
V=[480 480 576 672 576 672 384 384];
T=[283 313 375 283 313 375 283 375];
pvt=@(x,R,T,V,P)P-R*T./(V-x(2))+x(1)./(sqrt(T).*V.*(V+x(2)));
x0=[8000,40];R=82.06;
format long e  % 设置数据显示格式
options=optimset('MaxFunEvals',600);  % 设置允许的最大函数值
[x,resnorm]=lsqnonlin(pvt,x0,[],[],options,R,T,V,P)  % 求解非线性最小二乘问题
%
P=[32.7 42.6 44.5 25.7 36.6 38.6 37.6 63.0]';
VT=[480 480 576 672 576 672 384 384;
    283 313 375 283 313 375 283 375]';
pvt=@(x,VT,R)R*VT(:,2)./(VT(:,1)-x(2))-...
    x(1)./(sqrt(VT(:,2)).*VT(:,1).*(VT(:,1)+x(2)));
x0=[8000,40];R=82.06;
format long e
x=nlinfit(VT,P,@(x,VT)pvt(x,VT,R),x0)  % 利用nlinfit拟合求解
resnorm=sum((P-pvt(x,VT,R)).^2)
