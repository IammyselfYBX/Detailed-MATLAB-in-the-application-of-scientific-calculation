syms a x
s=solve('x^3+a*x+1')  %����solve������ⷽ�̵Ľ⣬���̵Ľ�Ƚϸ���
simple(s)			%����simple���������Ľ�����л��򣬵�Ч��������
result=subexpr(s)	%����subexpr���������Ľ�����л���Ч������
