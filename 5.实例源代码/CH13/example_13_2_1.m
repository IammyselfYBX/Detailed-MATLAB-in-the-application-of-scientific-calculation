% �����㷨
y=simple(dsolve('Dy=1/2*((50/(50-x))^(1/5)-((50-x)/50)^(1/5))','y(0)=0','x'));  % ��΢�ַ���
h=ezplot(y,[0 50]);  % ��������y
set(get(gca,'Children'),'LineWidth',2)  % �����߿�
yk=subs(y,'x',50);  % �󵼵����ен�ʱ�������꣨�����ǵн��ķ�ӳʱ�䣩
t=yk/90;  % �������ϵ������ен������ʱ��
xdata=get(h,'XData');  % ��ȡ���ߵ�x�����
ydata=get(h,'YData');  % ��ȡ���ߵ�y�����
h1=line(xdata(1),ydata(1),'Marker','.','Color','r');  % ���Ƶ�һ�����ͼ��
% ��������
for k=2:length(xdata)
    set(h1,'XData',xdata(k),'YData',ydata(k))  % ��������
    pause(0.01)  % ��ͣ0.01s
end
if t>0.1
    set(get(gca,'title'),'string',['������ʱ��',num2str(0.1),'�ڲ��ܻ��ен�'])
else
    set(get(gca,'title'),'string',['������ʱ��',num2str(t),'ʱ���ен�'])
end
