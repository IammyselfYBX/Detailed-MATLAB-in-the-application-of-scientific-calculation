function [p0,pr]=envelope_match(N,r,M)
% �����ŷ���������monte_carloģ�����
% ���������
%       ---N���ŷ����
%       ---r�������ȷ���ŷ���
%       ---M��ģ�����
% ���������
%       ---p0��û���������Ŀ�����
%       ---pr����r���ŷ���Ե�����Ŀ�����
if nargin<3|isempty(M);M=10000;end
if nargin<2|isempty(r),r=0;end
if nargin<1|isempty(N),N=10;end
if r>N
    error('r is less than N');
end
R0=0;  % ��¼û����Ե����
Rr=0;  % ��¼��r����Ե�����
Ns=1:N;  % ����N���ŷ��һ������
rand('state',2009)
for k=1:M
    rs=randperm(N);  % �������N���ŷ��һ������
    S=sum(rs==Ns);  % ͳ�����������������ԭ�����ж�ӦԪ����ȵĸ���
    R0=R0+(S==0);  % û����Ե���������ۼ�
    Rr=Rr+(S==r);  % ��r���ŷ���Ե���������ۼ�
end
p0=R0/M;  % û����ԵĿ�����
pr=Rr/M;  % ��r����ԵĿ�����
