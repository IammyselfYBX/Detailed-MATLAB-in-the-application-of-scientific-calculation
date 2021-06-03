syms x;
y=exp(x^0.8)*sin(5*x);
%求1~4阶导数的解析解
y1=diff(y,x);y2=diff(y,x,2);y3=diff(y,x,3);y4=diff(y,x,4);
h=0.05;x=0:h:10;
Y=subs(y);y11=subs(y1);y22=subs(y2);y33=subs(y3);y44=subs(y4);
y=[y11;y22;y33;y44];
%求1~4阶导数的数值解，并和解析解比较
for k=1:4
    [dy,dx]=diff_ctr(Y,h,k);
    subplot(2,2,k)
    plot(x,y(k,:),dx,dy,':')
end
