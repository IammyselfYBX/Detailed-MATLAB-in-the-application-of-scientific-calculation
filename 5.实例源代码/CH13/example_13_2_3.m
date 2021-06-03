function example_13_2_3
a=90;b=450;
i=1;
for d=54:-1:36
    for theta=0:0.1:pi
        [t,y]=ode45(@(t,y)fun(t,y,a,b,d,theta),[0,0.1],[0 0]);
        if max(y(:,1)-(d+a*t*cos(theta)))>0  % �����ܻ��ен�Ӧ���������
            range(i,:)=[d,theta];  % ������������d��theta���ھ���range
            i=i+1;
            break
        end
    end
end
plot(range(:,1),range(:,2))  % ����ͼ��
hold on 
plot(50,pi/2,'ko','MarkerFaceColor','k','MarkerSize',8)
text(50,pi/2-0.2,'$$(50,\frac{\pi }{2})$$','interpreter',...
    'latex','fontsize',12,'HorizontalAlignment','center')
xlabel('\itd','fontname','times','fontsize',12)
ylabel('\it\theta','fontname','times','fontsize',12)
set(gcf,'Color','w')  % ����ͼ�δ�����ɫΪ��ɫ
%----------------------΢�ַ��̺�������--------------------%
function dy=fun(t,y,a,b,d,theta)
dydx=(a*t*sin(theta)-y(2))./(abs(d+a*t*cos(theta)-y(1)));
dy(1)=b/(1+dydx^2)^0.5;
dy(2)=b/(1+dydx^(-2))^0.5;
dy=dy(:);
