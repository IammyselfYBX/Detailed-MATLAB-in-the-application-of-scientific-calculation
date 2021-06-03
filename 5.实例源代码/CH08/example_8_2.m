x=0:5:30;
theta=[0.50 1.40 0.75 0.90 1.30 1.48 1.50];
F=[0 9 13 14 10.5 12 5];
F_theta=F.*cos(theta);
xi=0:30;  % 将数据区间进行间距1m的采样以进行插值操作
thetai=spline(x,theta,xi);  % 对theta进行三次样条插值
Fi=spline(x,F,xi);  % 对F进行三次样条插值
F_thetai=Fi.*cos(thetai);
I_R=trape_quad(xi,F_thetai)  % 计算插值后的数值积分
n=[1 2 3 6];  % 区间等分数向量
for k=1:length(n)
    I(k)=trape_quad(x(1:n(k):end),F_theta(1:n(k):end));  % 求解各种情况下的积分值
end
I=fliplr(I)  % 将向量I反转
err=abs(I-I_R)/I_R  % 计算相对误差
%
[x,Y]=sort([x 2.5 12.5]);  % 插入点后排序
F_theta=[F_theta 1.7007 10.0940];
F_theta=F_theta(Y);  % 排序后的F_theta向量
I=trapz(x,F_theta)  % 调用函数trapz求解

