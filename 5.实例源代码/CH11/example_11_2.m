f=-[2;3;-5];  % Ŀ�꺯������ϵ������
A=[-2,5,-1];b=-10;  % ����ʽԼ������
Aeq=[1,1,1];beq=7;  % ��ʽԼ������
% �������ù��̲���
ff=optimset;ff.LargeScale='off';  % ��ʹ�ô��ģ�������
ff.TolX=1e-15;ff.TolFun=1e-20;ff.TolCon=1e-20;  % ����x���ͺ���ֵ������ֹ����
% ���Թ滮���
[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,zeros(3,1),[],[],ff);
% ��ʾ������
disp('���Թ滮����Ľ�xΪ��'),disp(x)
disp(['Ŀ�꺯�������ֵΪ��f=',num2str(-fval)])
