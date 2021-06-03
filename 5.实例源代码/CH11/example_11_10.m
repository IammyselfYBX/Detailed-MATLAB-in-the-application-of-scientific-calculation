function example_11_10
fun=@(x)sum((x-0.5).^2);
x0 = [0.5; 0.2; 0.3];
[x,fval]=fseminf(fun,x0,2,@myseminfcon)
function [c,ceq,K1,K2,s] = myseminfcon(X,s)
% ��ʼ���������
if isnan(s(1,1)),
   s = [0.2 0; 0.2 0];
end
% ����������
w1 = 1:s(1,1):100;
w2 = 1:s(2,1):100;
% ���������Լ��
K1 = sin(w1*X(1)).*cos(w1*X(2)) - 1/1000*(w1-50).^2 -...
       sin(w1*X(3))-X(3)-1;
K2 = sin(w2*X(2)).*cos(w2*X(1)) - 1/1000*(w2-50).^2 -...
       sin(w2*X(3))-X(3)-1;
% ���÷�����Լ��Ϊ��
c = []; ceq=[];
% ���ư�����Լ��ͼ��
plot(w1,K1,'-',w2,K2,':'),title('Semi-infinite constraints')
drawnow
