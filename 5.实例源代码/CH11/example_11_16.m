% ����lsqnonlin�������
f=@(x,k)2+2.*(1:k)-exp((1:k)*x(1))-exp((1:k)*x(2));  % Ŀ�꺯������
x0 = [0.3,0.4];                      % ��ʼֵ
lb=zeros(2,1);ub=ones(2,1);  % ���������½�
[x1,resnorm,residual] = lsqnonlin(@(x)f(x,10),x0,lb,ub)    % lsqnonlin�������
% ����fmincon�������
G=@(x,k)f(x,k)*f(x,k)';  % Ŀ�꺯������
options=optimset('LargeScale','off','Algorithm','active-set');  % �����Ż�����
[x2,fval]=fmincon(@(x)G(x,10),x0,[],[],[],[],lb,ub,[],options)  % fmincon�������
