%%%%%%%%%%  ��������Ҫ��������hidden���������������� %%%%%%%%%%
[x,y,z]=sphere(12);					% ����ԭʼͼ��,�뾶Ϊ12������
subplot(1,2,1)							% ������ͼ1
mesh(x,y,z),title('Opaque')			% ��������ͼ������ӱ��⡮opaque��
hidden on								% ������ͼ��������䲻͸��
axis off								% ����������
%������ͼ2������ӱ��⡮Transparent��
subplot(1,2,2),title('Transparent')	
mesh(x,y,z)							% ��������ͼ
hidden off								%������ͼ���������͸��
axis off								% ����������
%%% �õ���ͼ5-36��ʾ��ͼ��
