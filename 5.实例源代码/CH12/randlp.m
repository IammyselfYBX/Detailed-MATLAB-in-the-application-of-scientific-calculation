function sol=randlp(f,f1,a,b,n)
% monte_carlo���������Թ滮
% ���������
%      ---f��Ŀ�꺯��
%      ---f1������ʽԼ������
%      ---a,b��������½���Ͻ�
%      ---n�������ĸ���
% ���������
%      ---sol�������Թ滮�Ľ�
rand('state',2009)  % �趨�����״̬
r1 = unifrnd(a,b,n,1);  % ����[a,b]�ϵ�n*1�����ȷֲ������������
r2 = unifrnd(a,b,n,1);  % ����[a,b]�ϵ�n*1�����ȷֲ������������
sol=[r1(1) r2(1)];
z0 = inf;
for i=1:n
    x1=r1(i);
    x2=r2(i);
    lpc=f1([x1 x2]);
    if lpc==1
        z=f([x1 x2]);
        if z<z0
            z0=z;
            sol=[x1 x2];
        end
    end
end
