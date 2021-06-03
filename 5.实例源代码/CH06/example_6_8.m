t=[0 20 40 56 68 80 84 96 104 110];  % ʱ������
v=[0 20 20 38 80 80 100 100 125 125];  % �ٶ�ֵ
ti = linspace(0,110);  % ����ʱ������
method={'nearest','linear','spline','pchip','cubic','v5cubic'};  % ��ֵ����
for k=1:6
    subplot(3,2,k)  % ͼ�ηָ�
    vi=interp1(t,v,ti,char(method(k)));  % ��ֵ
    plot(t,v,'ko',ti,vi,'k')  % ����ͼ��
    axis tight  % ����������
    title(['\fontname{times new roman}\fontsize{12}\it',char(method(k))])  % ��ӱ���
end
