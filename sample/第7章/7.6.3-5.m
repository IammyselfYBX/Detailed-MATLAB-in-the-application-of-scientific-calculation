x=rand(2048,1);	% ����һ�������
t=clock;			% ��ʼ��ʱ
fft(x);				% ������������������
etime(clock,t)		% ͳ�ƴ�clock��t֮���ʱ����
