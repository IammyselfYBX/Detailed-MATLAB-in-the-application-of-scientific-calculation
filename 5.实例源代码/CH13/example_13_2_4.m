a=90;b=450;d=30;theta=0.3*pi;T=0.1;
dd=0.5;    % �趨�������ен��ľ�������
dt=0.002;      % �趨ʱ�䲽��
t=0;
err=inf;k=1;
x(1)=0;y(1)=0;
xx(1)=d;yy(1)=0;
while err>dd
    D=sqrt((d+a*t*cos(theta)-x(k))^2+(a*t*sin(theta)-y(k))^2);
    x(k+1)=x(k)+b*dt*(d+a*t*cos(theta)-x(k))/D;  % �����ĺ�����
    y(k+1)=y(k)+b*dt*(a*t*sin(theta)-y(k))/D;  % ������������
    xx(k+1)=d+a*(t+dt)*cos(theta);  % �н��ĺ�����
    yy(k+1)=a*(t+dt)*sin(theta);  % �н���������
    err=sqrt((x(k+1)-xx(k+1))^2+(y(k+1)-yy(k+1))^2);
    t=t+dt;k=k+1;
    plot(x,y,'r.',xx,yy,'o')  % ����ͼ��
    axis([0 40 0 7])
    if t>T  % �ж�t��T�Ĵ�С��ϵ
        flag=1;break;  % ��t>T������ѭ��
    end
    pause(0.5);
end
hold on
plot(x(end),y(end),'rh','MarkerSize',18)
legend('�����˶��켣','�н��˶��켣',2)
if flag==1
    text(27,5.5,'���ܻ���!!!','fontname','����','fontsize',14)
    title(['������ʱ��',num2str(T),'h�ڲ��ܻ��ен�'])
else
    text(27,5.5,'����!!!','fontname','����','fontsize',14)
    title(['������ʱ��',num2str(t),'h���ен�'])
end
