m1=1;  % �ϰ�����
m2=1;  % �°�����
l1=1;  % �ϰڳ���
l2=1;  % �°ڳ���
g=9.8;  % �������ٶ�
f=@(t,x,m1,m2,l1,l2,g)[x(3);
    x(4);
    inv([(m1+m2)*l1,m2*l2*cos(x(1)-x(2));m1*l1*cos(x(1)-x(2)),m1*l2])...
    *[m2*l2*x(4)^2*sin(x(2)-x(1))-(m1+m2)*g*sin(x(1));...
    m2*l1*x(3)^2*sin(x(1)-x(2))-m2*g*sin(x(2))]];   % ����΢�ַ�����
set(gcf,'DoubleBuffer','on');   % ����ͼ�δ��ڵ���ȾЧ��
[t,x]=ode45(@(t,x)f(t,x,m1,m2,l1,l2,g),[0,10],[pi/4,pi/4,0,0])
% �������ȼ��ڣ�[t,x]=ode45(f,[0,10],[pi/4,pi/4,0,0],[],m1,m2,l1,l2,g);
axis([-(l1+l2),(l1+l2),-(l1+l2)*1.5,1],'square'); hold on;  % ��������������
h1=plot([0,l1*exp(i*(x(1,1)-pi/2))],'ro-','LineWidth',2,'Markersize',6); 
h2=plot([l1*exp(i*(x(1,1)-pi/2)),l1*exp(i*(x(1,1)-pi/2))+l2*exp(i*(x(1,2)-pi/2))],...
    'bo-','LineWidth',2,'Markersize',6);
box on
for k=2:size(x,1)
    C1=[0,l1*exp(i*(x(k,1)-pi/2))];   % �����ϰڵ����˵�����
    C2=[l1*exp(i*(x(k,1)-pi/2)),l1*exp(i*(x(k,1)-pi/2))+l2*exp(i*(x(k,2)-pi/2))]; 
    set(h1,'xdata',real(C1),'ydata',imag(C1));   % �����ϰڵ�λ������
    set(h2,'xdata',real(C2),'ydata',imag(C2));   % �����°ڵ�λ������
    title(['˫����ʾ��{\it\bft} = ',num2str(t(k))],'fontname',...
        'times new roman','fontsize',14)  % ��ӱ�������ʾʱ��
    pause(0.1);
end
figure;
subplot(231);plot(t,x(:,1));s(1)=title('{\itt-\theta}_1');  % �ϰڵĽ�λ����ʱ��ı仯
subplot(232);plot(t,x(:,2));s(2)=title('{\itt-\theta}_2');  % �°ڵĽ�λ����ʱ��ı仯
subplot(233);plot(t,x(:,3));s(3)=title('{\itt-\omega}_1');  % �ϰڽ��ٶ���ʱ��ı仯
subplot(234);plot(t,x(:,4));s(4)=title('{\itt-\omega}_2');  % �°ڽ��ٶ���ʱ��ı仯
subplot(235);plot(x(:,1),x(:,3));s(5)=title('{\it\theta}_1-{\it\omega}_1');  % �ϰڵ���ͼ
subplot(236);plot(x(:,2),x(:,4));s(6)=title('{\it\theta}_2-{\it\omega}_2');  % �°ڵ���ͼ
set(s,'fontname','times new roman','fontsize',16)  % ���ñ�ע��������ֺ�
