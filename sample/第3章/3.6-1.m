A=eye(6)				%����6�׵�λ����
s=svd(A)
tol=max(size(A))*eps(max(s))
r=sum(s>tol)
rank(A)					%����rank�������������