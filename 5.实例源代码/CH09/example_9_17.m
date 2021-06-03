function example_9_17
x=0:0.05:1;t=0:0.05:2;
m=0;
sol=pdepe(m,@pdefun,@pdeic,@pdebc,x,t);  % ����pdepe�������ƫ΢�ַ���
subplot(211)  % ͼ�ηָ�
surf(x,t,sol(:,:,1))  % ���������ͼ��
h1=title('{\itu}_1({\itx,t})');  % ��ӱ���
subplot(212)  % ͼ�ηָ�
surf(x,t,sol(:,:,2))  % ���������ͼ��
h2=title('{\itu}_2({\itx,t})');  % ��ӱ���
set([h1,h2],'fontname','times','fontsize',12)  % ���ñ����������ֺ�
set(gcf,'Color','w')  % ����ͼ�δ��ڵ���ɫΪ��ɫ
%
%------------Ŀ��pde����------------% 
function [c,f,s]=pdefun (x,t,u,du)
c=[1;1];f=[0.024*du(1);0.17*du(2)];
temp=u(1)-u(2);
s=[-1;1].*(exp(5.73*temp)-exp(-11.46*temp));
%---------------�߽�������������--------------%
function [pa,qa,pb,qb]=pdebc(xa,ua,xb,ub,t)
% a��ʾ��߽磬b��ʾ�ұ߽�
pa=[0;ua(2)];qa=[1;0];pb=[ub(1)-1;0];qb=[0;1];
%----------��ֵ������������----------% 
% �˴���������������u0=@(x)[1;0]�����M�ļ�
function u0=pdeic(x)
u0=[1;0];
