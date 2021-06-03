function x=svd_equations(A,b)
% 奇异值分解求解线性(病态)方程组
% 输入参数：
%       ---A：方程组的系数矩阵
%       ---b：方程组的右端向量
% 输出参数：
%       ---x：线性方程组的解
ep=1e-10;n=length(A);
[U,S,V]=svd(A);
s=diag(S);
x=zeros(n,1);
for i=1:n
    if abs(s(i))>=ep
        x=x+(U(:,i)'*b)/s(i)*V(:,i);
    end
end
