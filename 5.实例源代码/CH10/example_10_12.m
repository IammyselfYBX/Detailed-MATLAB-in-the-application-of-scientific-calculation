syms n a0 b0
M=[1,1/2,0;0,1/2,1;0,0,0];  % 系数矩阵
[P,D]=eig(sym(M));  % P,D满足MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % 求极限
x_n=simple(M_n*[a0;b0;1-a0-b0])  % 化简
x_nlimit=M_nlimit*[a0;b0;1-a0-b0]  % 求解最终状态
%
syms n a0 b0 c0
M=[1,1/4,0;0,1/2,0;0,1/4,1];  % 系数矩阵
[P,D]=eig(sym(M));  % P,D满足MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % 求极限
x_n=simple(M_n*[a0;b0;c0])  % 化简
x_nlimit=M_nlimit*[a0;b0;c0]  % 最终状态
%
syms n a0 b0 c0 d0 e0 f0
M=[1 1/4 0 0 0 0;0 1/4 0 1 1/4 0;0 0 0 0 1/4 0;
   0 1/4 0 0 0 0;0 1/4 1 0 1/4 0;0 0 0 0 1/4 1];  % 系数矩阵
[P,D]=eig(sym(M));  % P,D满足MP=PD
M_n=P*D^n*P^(-1);  % M_n=P*D*P^(-1)*P*D*P^(-1)*...*P*D*P^(-1)=P*D^n*P^(-1)
M_nlimit=limit(M_n,n,inf);  % 求极限
x_n=simple(M_n*[a0;b0;c0;d0;e0;f0])  % 化简
x_nlimit=M_nlimit*[a0;b0;c0;d0;e0;f0]  % 求最终状态
