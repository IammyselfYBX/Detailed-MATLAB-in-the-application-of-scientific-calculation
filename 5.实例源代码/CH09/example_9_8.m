f=@(t,y)[1.2*y(1)-0.6*y(1)*y(2);
    -0.8*y(2)+0.3*y(1)*y(2)];  % ����΢�ַ�������ʽ
[t,y]=ode45(f,[0,20],[2,1]);  % ����ode45()�������΢�ַ�����
subplot 121  % ͼ�ηָ�
h=plot(t,y);  % ������ֵ��ͼ��
set(h(2),'LineStyle','-','Marker','o','MarkerSize',4,...
    'MarkerEdgeColor','k','MarkerFaceColor','w')  % �������͡��߿�ͱ�Ƿ���
subplot 122  % ͼ�ηָ�
plot(y(:,1),y(:,2))  % ������ͼ
%
options=odeset('RelTol',1e-4);  % �����Ż�����'RelTol'Ϊ1e-4
[t,y]=ode45(f,[0,20],[2,1],options);  % ���΢�ַ�����
subplot 121  % ͼ�ηָ�
h=plot(t,y);  % ������ֵ��ͼ��
set(h(2),'LineStyle','-','Marker','o','MarkerSize',4,...
    'MarkerEdgeColor','k','MarkerFaceColor','w')  % �������͡��߿�ͱ�Ƿ���
subplot 122  % ͼ�ηָ�
plot(y(:,1),y(:,2))  % ������ͼ
