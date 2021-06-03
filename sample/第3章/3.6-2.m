A=[ 1 0 3 0;0 25 0 30;3 0 9 0;0 30 0 661]
R=chol(A)				%直接利用chol函数求解非正定矩阵
Rinf=cholinc(sparse(A),'inf')
Rinf=full(Rinf)