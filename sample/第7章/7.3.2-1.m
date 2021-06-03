function tic 
% tic start a stopwatch timer
% tic any stuff toc
% printf the time required
% see also tic clock 

globle tictoc 			% ����һ��ȫ�ֱ���tictoc
tictoc = clock;		% ��tictoc��ֵΪ��ǰ��ϵͳʱ��

function 1=toc		% ��д��Ϊ1=toc�ĺ�����ʽ��M�ļ�
% toc read the stopwatch timer
% toc prints the elapsed time since tic was used.
% t=toc; saves elapsed time in t, does not print 
% see also: tic etime

global TICTOC
if nargout < 1		% ͳ����������ĸ���������ʱ��
	elapsed_time = etime(clock, TICTOC)
else 
	t=etime(clock, TICTOC);
end
