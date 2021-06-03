A=[eye(2) -1/4*ones(2);
   -1/4*ones(2) eye(2)];  % 构造系数矩阵
b=1/2*ones(4,1);  % 右端向量
w=1:0.1:2;  % 松弛因子
for k=1:length(w)
    [x,iter,exitflag]=SOR_iter(A,b,w(k));  % 根据不同松弛因子求解线性方程组
    N(k)=iter;  % 将迭代次数存入向量N
end
N
w_opt=w(N==min(N))  % 寻找迭代最快的方式
