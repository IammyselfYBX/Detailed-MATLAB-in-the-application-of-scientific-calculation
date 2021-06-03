x=0:5:30;
theta=[0.50 1.40 0.75 0.90 1.30 1.48 1.50];
F=[0 9 13 14 10.5 12 5];
F_theta=F.*cos(theta);
xi=0:30;  % ������������м��1m�Ĳ����Խ��в�ֵ����
thetai=spline(x,theta,xi);  % ��theta��������������ֵ
Fi=spline(x,F,xi);  % ��F��������������ֵ
F_thetai=Fi.*cos(thetai);
I_R=trape_quad(xi,F_thetai)  % �����ֵ�����ֵ����
n=[1 2 3 6];  % ����ȷ�������
for k=1:length(n)
    I(k)=trape_quad(x(1:n(k):end),F_theta(1:n(k):end));  % ����������µĻ���ֵ
end
I=fliplr(I)  % ������I��ת
err=abs(I-I_R)/I_R  % ����������
%
[x,Y]=sort([x 2.5 12.5]);  % ����������
F_theta=[F_theta 1.7007 10.0940];
F_theta=F_theta(Y);  % ������F_theta����
I=trapz(x,F_theta)  % ���ú���trapz���

