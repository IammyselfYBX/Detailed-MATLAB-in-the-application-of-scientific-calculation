A=[eye(2) -1/4*ones(2);
   -1/4*ones(2) eye(2)];  % ����ϵ������
b=1/2*ones(4,1);  % �Ҷ�����
[x,iter,exitflag]=seidel_iter(A,b)  % ����Gauss-Seidel������������Է�����
