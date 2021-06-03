l=1;   % �ڳ�
g=9.8;   % �������ٶ�
f=@(t,x,g,l)[x(2);-g/l*sin(x(1))];   % ����΢�ַ�����
[t,x]=ode45(@(t,x)f(t,x,g,l),[0,10],[pi/4,0]);   % ΢�ַ��������
%�������ȼ��ڣ�[t,x]=ode45(f,[0,10],[pi/4,0],[],g,l);
set(gcf,'DoubleBuffer','on'); % ����ͼ�δ��ڵ���ȾЧ��
axis([-l,l,-l*1.5,0.5],'square');hold on;
h=plot([0,0],[l*cos(x(1)-pi/2),l*sin(x(1)-pi/2)],'ro-',...
    'LineWidth',2,'Markersize',6);
box on  % ʹ�������ܷ�
% ���²�����������
for k=2:size(x,1)
    C1=l*cos(x(k,1)-pi/2);C2=l*sin(x(k,1)-pi/2);  % ����ڵĶ˵�����
    set(h,'Xdata',[0,C1],'Ydata',[0,C2]);  % ���°ڵ�λ������
    title(['������ʾ��{\it\bft} = ',num2str(t(k))],'fontname',...
        'times new roman','fontsize',14)  % ��ӱ�������ʾʱ��
    pause(0.1);  % ��ͣ0.1��
end
figure('Position',[100 100 560 180],'Color','w')  % ����һ��ͼ�δ��ڲ�����λ�ú���ɫ
subplot(131);plot(t,x(:,1));s(1)=title('\itt-\theta');  % ���ưڵĽ�λ����ʱ��ı仯
subplot(132);plot(t,x(:,2));s(2)=title('\itt-\omega');  % ���ưڵĽ��ٶ���ʱ��ı仯
subplot(133);plot(x(:,1),x(:,2));s(3)=title('\it\theta-\omega'); % ���ưڵĽ��ٶ����λ�Ƶı仯
set(s,'fontname','times new roman','fontsize',16)  % ���ñ����������ֺ�
