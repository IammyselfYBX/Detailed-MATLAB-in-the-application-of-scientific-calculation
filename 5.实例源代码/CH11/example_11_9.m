fun = '(x1-1)^2+(x2-2)^2+(x3-3)^2+(x4-4)^2';
[H,f]=quad_coef(fun);  % ��������͵�ϵ��
A=[1,1,1,1;3,3,2,1];b=[5;10];
Aeq=[];beq=[];
lb=zeros(4,1);
options=optimset('LargeScale','off');  % �����Ż����������ô����㷨
[x,fval]=quadprog(H,f,A,b,Aeq,beq,lb,[],[],options);  % ���ι滮�������
X=sym('[x1,x2,x3,x4]');
fval=double(fval+simple(sym(fun)-1/2*X*H*X.'-f*X.'));  % �������ս��
disp(char('���ι滮��������Ž⣺',num2str(x)))  % ��ʾ���Ž�
disp(['���ι滮���������ֵ��',num2str(fval)])  % ��ʾ����ֵ
