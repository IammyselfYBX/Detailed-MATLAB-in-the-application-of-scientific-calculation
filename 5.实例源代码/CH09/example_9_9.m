odefun=@(t,x)[0.04*(1-x(1))-(1-x(2))*x(1)+0.0001*(1-x(2))^2;
    -1e4*x(1)+3000*(1-x(2))^2];  % �������΢�ַ�����
x0=[0;1];  % ��ֵ
tspan=[0 100];  % �������
% ʹ��ode45��������
tic;[t1,y1]=ode45(odefun,tspan,x0);T1=toc;
% ʹ��ode15s��������
tic,[t2,y2]=ode15s(odefun,tspan,x0);T2=toc;
subplot(221);plot(t1,y1)  % ����ode45���������
xlabel('(a)ode45���������')  % ���x���ע
subplot(222);plot(t2,y2)  % ����ode15s�������ƽ��
xlabel('(b)ode15s���������')  % ���x���ע
subplot(223);plot(t1(1:end-1),diff(t1))  % ����ode45�����������еĲ���
xlabel('(c)ode45���������̵Ĳ���')  % ���x���ע
subplot(224);plot(t2(1:end-1),diff(t2))  % ����ode15s�����������еĲ���
xlabel('(d)ode15s���������̵Ĳ���')  % ���x���ע
% ���²�������
T=[T1,T2];N=[length(t1),length(t2)];
fun={'ode45����','ode15s����'};
type={'����ʱ��','�������'};
figure
axes('Position',[0.125 0.33 0.775 0.3])  % �����������λ��
plot((0:3)'*[1,1],[0,3],[0,3],(0:3)'*[1,1],'Color','k')  % ���Ʊ��
title('\fontname{����}\fontsize{14}���Է��������')  % ��ӱ���
axis off  % ȡ��������
for k=1:2
    h1(k)=text(0.5,1.5-(k-1),['\bf',char(fun(k))]);  % ��ע��⺯������
    h2(k)=text(1.5,1.5-(k-1),[num2str(T(k)),'s']);  % ��ע���ʱ��
    h3(k)=text(2.5,1.5-(k-1),[num2str(N(k)),'s']);  % ��ע������
    h4(k)=text(1.5+(k-1),2.5,['\bf',char(type(k))]);  % ��ע����ʱ��ͼ������
end
set([h1,h2,h3,h4],'HorizontalAlignment','center')  % ���ñ�עΪ������ʾ
set(gcf,'Color','w')  % ���ô�����ɫΪ��ɫ
