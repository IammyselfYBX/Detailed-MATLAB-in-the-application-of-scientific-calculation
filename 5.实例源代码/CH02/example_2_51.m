subplot(131)
X1=pascal(4);  % ����4����˹������
plot(X1,'->','MarkerSize',5)  % ����ͼ�β����ñ�Ƿ��ŵĴ�С
% �ȼ���plot(1:length(X1'),X1,'->','MarkerSize',5)
subplot(132)
X2=linspace(-2,2,21); % ������ɢ����
plot(X2,cos(2*X2),'k-*',2*X2,sin(X2),'rs--'); % ��ͼ���趨���͡���ɫ�Լ���Ƿ��ŵ���Ϣ
subplot(133)
X3=-pi:pi/10:pi;
Y3=tan(sin(X3))-sin(tan(X3));
plot(X3,Y3,'--rs','LineWidth',2,...  % �����߿�
                'MarkerEdgeColor','k',...  % ���ñ�Ƿ��ű�Ե����ɫ
                'MarkerFaceColor','g',...  % ���ñ�Ƿ����ڲ��������ɫ
                'MarkerSize',3)  % ���ñ�Ƿ��ŵĴ�С
