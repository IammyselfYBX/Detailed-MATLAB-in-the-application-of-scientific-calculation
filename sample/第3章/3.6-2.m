A=[ 1 0 3 0;0 25 0 30;3 0 9 0;0 30 0 661]
R=chol(A)				%ֱ������chol����������������
Rinf=cholinc(sparse(A),'inf')
Rinf=full(Rinf)