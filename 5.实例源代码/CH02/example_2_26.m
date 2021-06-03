syms x; f=x;n=7;
[A,B,F]=fseriessym(f,x,n);  % fourier�����������
f1=vectorize(f);  % �����ű��ʽת��Ϊ�ַ���
[L,A,B]=fseriesquadl(f1,n);  % fourier������ֵ���
F1=A(1)/2+A(2:n+1)*cos((1:n)*pi/L*x)'+B*sin((1:n)*pi/L*x)';
x=-pi:pi/50:pi;
subplot 121,plot(x,subs(f),x,subs(F)),title('���ŷ�fourier����')  % ���Ʒ��Ž��ͼ��
subplot 122,plot(x,[subs(f);subs(F1)]),title('��ֵ��fourier����')  % ������ֵ���ͼ��
