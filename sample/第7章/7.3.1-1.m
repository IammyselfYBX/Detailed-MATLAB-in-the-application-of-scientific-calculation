function d=nargintest(a, b, c)		% ���ļ���Ϊnargintest
% ����nargin����ͳ�������������
if nargin <= 1
% �����������С�ڣ����򱨴�Not enough input arguments.��
error(��Not enough input arguments.��)
elseif nargin == 2
% ��������������ڣ��������������
	d=a+b;
	elseif nargin =3
% ��������������ڣ�����ǰ��������Ӳ���ȥ�ڣ�����
		d=a+b-c;
end
