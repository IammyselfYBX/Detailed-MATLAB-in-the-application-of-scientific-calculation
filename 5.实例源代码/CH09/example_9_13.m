function example_9_13
sol = dde23(@ddefun,[1, 0.2],ones(3,1),[0,5]);  % ����dde23��������ӳ�΢�ַ�����
plot(sol.x,sol.y)  % ���������ͼ��
xlabel('ʱ�䣺t');  % ���x���ע
ylabel('΢�ַ�����Ľ⣺y');  % ���y���ע
grid on  % ���������
h=legend('{\ity}_1','{\ity}_2','{\ity}_3',2);  % ���ͼ��
set(h,'fontname','times','fontsize',12)  % ����ͼ��������ֺ�
% ΢�ַ��̺�������
function dydt = ddefun(t,y,Z)
% Z(i,j)��ʾ״̬����y_j�ӳ���lags(i)
ylag1 = Z(:,1);  % ��һ�б�ʾ�ӳ���lags(1)=1������״̬����
ylag2 = Z(:,2);  % �ڶ��б�ʾ�ӳ���lags(2)=0.2������״̬����
% y1�ӳ���1���ʱ�ʾΪZ(1,1)����ylag1(1)
% y2�ӳ���0.2���ʱ�ʾΪZ(2,2)����ylag2(2)
dydt = [ ylag1(1)
         ylag1(1) + ylag2(2)
         y(2)               ];  % ΢�ַ�������
