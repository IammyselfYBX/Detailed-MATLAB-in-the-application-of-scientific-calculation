load west0479  % ��ȡMATLAB�е��Դ�ϡ�����west0479
d = eig(full(west0479));  % ��ϡ�����ת��Ϊһ������������������ֵ
dlm = eigs(west0479,8);  % ���ϡ������ǰ8������ֵ
[dum,ind] = sort(abs(d));  % ������ֵ����
plot(dlm,'k+')  % ��������ֵͼ��
hold on  % ͼ�α���
plot(d(ind(end-7:end)),'ks','MarkerSize',4)  % ������eig������õ�ǰ8������ֵͼ��
hold off  % ͼ��ȡ��
legend('eigs���������','eig���������')  % ���ͼ��
