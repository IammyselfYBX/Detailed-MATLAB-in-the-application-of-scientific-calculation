%%%%%%%%%%%%%%%%%% ��������Ҫ���ڶԺ���ͼ�������ע�� %%%%%%%%%%%%%
x=0:0.1*pi:2*pi;				% �ȼ�ಽ��
y=sin(x);						% ͼ�κ������ʽ
plot(x,y)						% ���ƺ���ͼ��
% ���x�����꣬����Ϊ'x(0-2\pi)'�����СΪ'fontweight'������
xlabel('x(0-2\pi)','fontweight','bold');
% ���x�����꣬����Ϊ'y=sin(x)'�����СΪ'fontweight'������	
ylabel('y=sin(x)','fontweight','bold');	
%%%����3*pi/4����ӱ�ע������Ϊsin(3*pi/4) = 0.707
text(3*pi/4,sin(3*pi/4),'\leftarrowsin(t)= 0.707','fontsize',16)
%%%����pi����ӱ�ע������Ϊsin(pi) = 0
text(pi,sin(pi),'\leftarrowsin(t)= 0','fontsize',16)
%%%���ڣ�*pi/4��ӱ�ע������Ϊsin(5*pi/4) -0.707
text(5*pi/4,sin(5*pi/4),'\leftarrowsin(t)= -0.707','fontsize',16)
%%% �õ���ͼ5-54��ʾ��ͼ��
