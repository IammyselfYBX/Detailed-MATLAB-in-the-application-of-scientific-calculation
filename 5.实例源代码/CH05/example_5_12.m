A=[eye(2) -1/4*ones(2);
   -1/4*ones(2) eye(2)];  % ����ϵ������
b=1/2*ones(4,1);  % �Ҷ�����
w=1:0.1:2;  % �ɳ�����
for k=1:length(w)
    [x,iter,exitflag]=SOR_iter(A,b,w(k));  % ���ݲ�ͬ�ɳ�����������Է�����
    N(k)=iter;  % ������������������N
end
N
w_opt=w(N==min(N))  % Ѱ�ҵ������ķ�ʽ
