% ����һ����Ϊwarning1�ĺ�����ʽ��M�ļ�
function z=warning1(x, y)

��nargin������ͳ������Ĳ����ĸ���
if nargin==2			% ����Ϊ2������
	z=x*y;				% ���������ĳ˻�
elseif nargin==1		% ����Ϊ1������
	{		% ����������Ϣ
		warning(��you should input 2 arguments��)
}
else 					% ��������ĸ�����Ϊ1��Ҳ��Ϊ2
error(��Wrong number of input arguments��)
end
