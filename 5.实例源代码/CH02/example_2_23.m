% ���ƻ�������
fplot('[x^2,2-x^2]',[-2 2 -0.5 2.5])  % ��������ͼ
text([-1.4,-1.4],[2,0.05],{'\leftarrowy=x^2','\leftarrowy=2-x^2'})  % ��ӱ�ע
A=double(solve('x^2-(2-x^2)'))  % �������ͽ��ת���ɸ�����
hold on
xn=linspace(A(1),A(2),100);
fill([xn,fliplr(xn)],[xn.^2,fliplr(2-xn.^2)],'b')  % ����������
% �������
syms x y;
I=int(int(x^2,y,x^2,2-x^2),x,min(A),max(A))  % Ƕ�׵�������ػ���
