function f=feixianxing(x)
a=x(1);
b=x(2);
c=x(3);
f(1)=a^2+b+sin(c);
f(2)=a*b+c;
f(3)=cos(a)+b^2+2*c;
end
% ������ʼ����
x0=[1 1 1]
% ʹ��fslove�������������Է����飬����feixianxing��ʾ��Ҫ���ķ����Է����飬����x0��ʾ�����Է�����ĳ�ʼֵ��
f=fslove('feixianxing',x0)
