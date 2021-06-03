A=vander(1:.5:3);  % 根据向量1:.5:3构造范德蒙阵
p={1,2,inf,'fro'};  % 利用元胞数组存储范数的种类
% 调用norm()函数求解
for k=1:length(p)
    A_norm(k)=norm(A,p{k});  % 将求取的矩阵范数依次存储于向量A_norm中
end
% 根据定义求解
A_norm1(1)=max(sum(abs(A)));  % 根据矩阵 的1-范数定义求解矩阵范数
A_norm1(2)=sqrt(max(abs(eig(A'*A))));  % 根据矩阵 的2-范数定义求解矩阵范数
A_norm1(3)=max(sum(abs(A')));  % 根据矩阵 的 -范数定义求解矩阵范数
A_norm1(4)=sqrt(sum(diag(A'*A)));  % 根据矩阵 的Frobenius-范数定义求解矩阵范数
% 显示结果
A_norm,A_norm1
