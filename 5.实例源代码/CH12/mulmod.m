function r=mulmod(L,alpha,beta,n)
% ��ͬ�෨���������
% ���������
%       ---L��ģ���ݲ���
%       ---alpha�������Ĳ���
%       ---beta����������ӵĲ���
%       ---n����Ҫ������������ĸ���
% ���������
%       ---r�����������������
r=zeros(n,1);
x=zeros(n,1);
M=power(2,L);
a=8*alpha+5;
x(1)=4*beta+1;
r(1)=x(1)/M;
for i=2:n
    y=a*x(i-1);
    x(i)=mod(y,M);  % ��ͬ�෨
    r(i)=x(i)/M;
end
