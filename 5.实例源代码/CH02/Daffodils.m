function x=Daffodils(m,n)
% ��������������������ˮ�ɻ���
% ���������
%       ---m,n(m<n)���������������������
% ���������
%       ---x�����ص�ˮ�ɻ���
if nargin<1|(isempty(m)&isempty(n))
    m=100;n=999;
end
x=[];
fprintf('����[%d,%d]�ڵ�ˮ�ɻ���Ϊ��\n',m,n)
for i=m:n
    ii=num2str(i);  % ��xת��Ϊ�ַ���
    ii=ii-'0';
    ii=double(ii);
    ii=sum(ii.^length(ii));
    D=ii-i;
    if D==0
        x=[x,i];
    end
end
