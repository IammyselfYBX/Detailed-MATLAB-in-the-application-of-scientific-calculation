%%%%%%%%%%%%%%%%%% ��������Ҫ���ڻ���compassͼ�� %%%%%%%%%%%%%%%%%%
%%% ����ԭʼ����
wdir=[45 90 90 45 360 335 360 270 335 270 335 335];
knots=[6 6 8 6 3 9 6 8 9 10 14 12];
rdir=wdir*pi/180;
[x,y]=pol2cart(rdir,knots);		%������������ϵ���ʽ
compass(x,y)						%	���Ƶĵȸ���
hold on								%��	ͼ�α���
desc={'wind Direction and Strength at',
         'Logan Airport for',
         'Nov.3 at 1800 through',
         'Nov.4 at 0600'};			%   ����������
text(-28,15,desc)					%��	��ӱ���
%%% �õ���ͼ5-26��ʾ��ͼ��
