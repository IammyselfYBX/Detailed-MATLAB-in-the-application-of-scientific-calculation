figure('Position',[100 100 560 630])  % ����ͼ�δ��ڵ�λ��
[X,Y] = meshgrid(-3:.5:3);  % �����������ݾ���
Z = peaks(X,Y);  % ����MATLAB�Դ���ֵ������ֵ
[XI,YI] = meshgrid(-3:0.2:3);  % ������������
method=char('nearest','linear','spline','cubic');  % ��ֵ����
s(1)=subplot(321),mesh(X,Y,Z),title('ԭ����ͼ')  % ����ԭͼ����ӱ���
s(2)=subplot(322),mesh(XI,YI,peaks(XI,YI)),title('��������ͼ')  % ���Ƽ��ܺ��ͼ��
for k=3:6
    s(k)=subplot(3,2,k)  % ͼ�ηָ�
    ZI = interp2(X,Y,Z,XI,YI,method(k-2,:));  % ��ά��ֵ
    mesh(XI,YI,ZI),title([method(k-2,:),'�Ͳ�ֵ����'])
    e{k-2}=ZI-peaks(XI,YI);  % ���
end
axis(s,[-3 3 -3 3 -10 10])  % ���������᷶Χ
% ���Ʋ�ֵ�������ͼ
figure
for k=1:4
    h(k)=subplot(2,2,k)  % ͼ�ηָ�
    mesh(XI,YI,e{k})  % �����������
    title([method(k,:),'�Ͳ�ֵ�������'])  % ��ӱ���
    xlim([-3,3]);ylim([-3,3]);  % ���������᷶Χ
end
