function [L,A,B] = fseriesquadl(f,n,a,b);
% fourier������ֵ���
% ��������������������ͬfseriessym()����
if nargin==2
    a=-pi;b=pi; 
end
L=(b-a)/2;
A(1) = quadl(inline(f),-L,L)/L; % ����A_0
for k=1:n;
    fcos = inline(['(',f,')','.*cos(',num2str(k*pi/L),'*x)']); 
    fsin = inline(['(',f,')','.*sin(',num2str(k*pi/L),'*x)']); 
    A(k+1) = quadl(fcos,-L,L)/L; % ���û��ֺ���quadl����ϵ��A(2:n+1)
    B(k) = quadl(fsin,-L,L)/L; % ���û��ֺ���quadl����ϵ��B(1:n)
end
