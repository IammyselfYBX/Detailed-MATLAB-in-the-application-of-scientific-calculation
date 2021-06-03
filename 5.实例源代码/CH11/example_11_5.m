function example_11_5
options = optimset('OutputFcn', @myoutput);  % �����Ż�����'OutputFcn'
[x fval] = fminbnd(@humps,0,1,options)  % �������Ż����
plot(x,fval,'kv','markersize',8,'MarkerFaceColor','k')  % �������Ž�
text(x-0.4,fval-7,['��Сֵ�㣺(',num2str(x),',',num2str(fval),')'])  % ��ӱ�ע
function stop = myoutput(x,optimvalues,state);  % �Ż���������������������ڵ����½��ܵ�fzero������
history = [];
stop = false;
if state == 'iter'
    history=[history;x];
end
fplot(@humps,[0,2])
hold on
plot(history,humps(history),'r.',...
    'MarkerSize',14)  % ���Ƶ�����
pause(1)  % ��ͣ1��
