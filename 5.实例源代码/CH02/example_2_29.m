syms i n;
L1=limit(maple('product',(2*i/(2*i-1))^2,'i=1..n')/(2*n+1),n,inf)  % ����maple�ں˺������
L2=simple(exp(limit(2*symsum(log(2*i)-log(2*i-1),'i=1..n')-log(2*n+1),n,inf)))  % ������
L2=simple(exp(limit(2*symsum(log(2*i)-log(2*i-1),i,1,n)-log(2*n+1),n,inf)))  % ������
