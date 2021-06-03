syms t S K VA VB aA aB;
s=dsolve('Dy+S*K*(1/VA+1/VB)*y=S*K*(aA/VB+aB/VA)','y(0)=aB');  % ΢�ַ������
fun=char(s);  % �����ű��ʽת��Ϊ�ַ���
fun(findstr(fun,' '))=[];  %���ַ����Ŀո�ȥ��
fun=strrep(fun,'VA*aA+VB*aB','x(1)');  % ִ���滻����
fun=strrep(fun,'VA*aA-VA*aB','x(2)');  % ִ���滻����
fun=strrep(fun,'K','x(3)');  % ִ���滻����
fun=inline(fun,'x','t','VA','VB','S');  % ���ַ���ת��Ϊ��������
fun=vectorize(fun);  % �ˡ�����ָ������ת��Ϊ��Ӧ�ĵ�������˴���ʡ��
format long
td = linspace(100,1000,10);
Cd =1e-5*[4.54,4.99,5.35,5.65,5.90,6.10,6.26,6.39,6.50,6.59];
x0 =0.05*ones(1,3);
VA=1000;VB=1000;S=10;
x=nlinfit(td,Cd,@(x,t)fun(x,t,VA,VB,S),x0)  % �ع�ģ�����
% nlintool(td,Cd,@(x,t)fun(x,t,VA,VB,S),x0,[],'ʱ�䣺t','Ũ�ȣ�C_B')
plot(td,Cd,'r*')  % �������ݵ�
hold on  % ͼ�α���
tp=linspace(min(td),max(td),200);
yp=fun(x,tp,VA,VB,S);
plot(tp,yp)
xlabel('ʱ�䣺t');ylabel('Ũ�ȣ�C_B');  % ���x���y���ע
a=[VA,VB;-VA,VA]\x(1:2)'  % �������Է�������aA,aB
