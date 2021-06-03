A=eye(6)				%构造6阶单位矩阵
s=svd(A)
tol=max(size(A))*eps(max(s))
r=sum(s>tol)
rank(A)					%利用rank函数求解矩阵的秩