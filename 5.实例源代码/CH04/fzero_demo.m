function fzero_demo
options = optimset('OutputFcn', @myoutput);  % ����myoutput�����������Ż�����'OutputFcn'
xx=fzero(@humps,[0,2],options);  % fzero�������
% xx=fzero(@humps,1.5,options);
plot([0,2],[0,0],'k:',xx,humps(xx),'k*')  % ����ͼ��
text(1,40,['humps�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
% ���溯������Ҫ�����ǻ����Ż���������ÿһ�����������ݵ�
function stop = myoutput(x,optimvalues,state);
history = [];  % Ԥ��һ���վ���
stop = false;
if state == 'iter'  % ��״̬state=iter��������²���
    history=[history;x];  % �����������history��
end
fplot(@humps,[0,2])  % ����humps����ͼ��
hold on  % ͼ�α���
plot(history,humps(history),'r.',...
    'MarkerSize',14)  % ����ͼ��
pause(1)  % ��ͣ1��
