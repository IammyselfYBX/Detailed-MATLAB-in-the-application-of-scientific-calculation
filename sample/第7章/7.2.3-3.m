% �ú���������ʾif-else-end�����÷���
% �����ֻ�����������ѡ��������if-else-endѡ������ʹ�á�
function ifthree(x)
if x>100
    fprintf('%f is a great positive number\n',x)
elseif x>=10
    fprintf('%f is a big positive number\n',x)
elseif x>10
fprintf('%f is a small positive number\n',x)
elseif x==0
	fprintf(��%f is zero\n��, x)
else 
    fprintf('%f is a minus number\n',x)
end
