syms n a0 b0
M=[1,1/2,0;0,1/2,1;0,0,0];  % ϵ������
[P,D]=eig(sym(M));  % P,D����MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % ����
x_n=simple(M_n*[a0;b0;1-a0-b0])  % ����
x_nlimit=M_nlimit*[a0;b0;1-a0-b0]  % �������״̬
%
syms n a0 b0 c0
M=[1,1/4,0;0,1/2,0;0,1/4,1];  % ϵ������
[P,D]=eig(sym(M));  % P,D����MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % ����
x_n=simple(M_n*[a0;b0;c0])  % ����
x_nlimit=M_nlimit*[a0;b0;c0]  % ����״̬
%
syms n a0 b0 c0 d0 e0 f0
M=[1 1/4 0 0 0 0;0 1/4 0 1 1/4 0;0 0 0 0 1/4 0;
   0 1/4 0 0 0 0;0 1/4 1 0 1/4 0;0 0 0 0 1/4 1];  % ϵ������
[P,D]=eig(sym(M));  % P,D����MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % ����
x_n=simple(M_n*[a0;b0;c0;d0;e0;f0])  % ����
x_nlimit=M_nlimit*[a0;b0;c0;d0;e0;f0]  % ������״̬
