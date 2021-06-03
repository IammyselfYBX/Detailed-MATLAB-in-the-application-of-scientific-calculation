format short e
n=5*2.^(0:4);
for k=1:length(n)
    e=ones(n(k),1);H_k=hilb(n(k));  % 构造病态矩阵
    x=svd_equations(H_k,H_k*e);  % 利用奇异值分解法求解病态方程组
    err(k)=norm(x-e);  % 求误差范数
end
err
format short
