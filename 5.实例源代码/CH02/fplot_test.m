subplot 221
f=@(x)[tan(x),sin(x),cos(x)];
fplot(f,2*pi*[-1 1 -1 1])  % ���ƶ������
% fplot('[tan(x),sin(x),cos(x)]',2*pi*[-1 1 -1 1])
subplot 222
y=@(x)sin(6*x)./(6*x);  % �û��Զ��庯��
fplot(y,[-2,2],2e-2,50,'g')
subplot 223
fplot(@humps,[0,2],2e-1,100,'k*')  % humps������MATLAB�Դ��ĺ���
subplot 224
f = @(x,n)abs(exp(-j*x*(0:n-1))*ones(n,1));  % ���и��Ӳ����ĺ���
fplot(@(x)f(x,10),[0 2*pi])
% fplot(f,[0 2*pi],[],[],[],10)
