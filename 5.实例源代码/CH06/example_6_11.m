rand('state',0);
x = rand(100,1)*4-2;  % ������x����
y = rand(100,1)*4-2;  % ������y����
z = @(x,y)x.*exp(-x.^2-y.^2);  % ���庯��
ti = -2:.2:2;
[XI,YI] = meshgrid(ti,ti);  % ������������
ZI = griddata(x,y,z(x,y),XI,YI);  % ������ֵ
h(1)=subplot(2,1,1);  % ͼ�ηָ�
mesh(XI,YI,ZI);title('ɢ�����ݵ��ֵ����')  % ����ͼ�β���ӱ���
h(2)=subplot(2,1,2);  % ͼ�ηָ�
mesh(XI,YI,ZI-z(XI,YI));title('ɢ�����ݵ��ֵ�������')  % ����������沢��ӱ���
axis(h,'tight')
