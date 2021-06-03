function D=QR_basic(A,eps)
% QR�������ʵ�����ȫ������ֵ
% ���������
%       ---A�������n��ʵ����
%       ---eps����������
% ���������
%       ---D�����ص�����ֵ��ɵ�����
if nargin<2|isempty(eps)==1
    eps=1e-5;
end
[m,n]=size(A);
if m~=n
    error('A����Ϊ����')
end
A=Hessenberg(A);
err=1;
while err>1e-5 
    [q1,r1]=qr_decom(A); 
    A1=r1*q1; 
    [q2,r2]=qr_decom(A1); 
    A2=r2*q2; 
    err=norm(diag(A1-A2));
    A=A2;
end 
D=diag(A2);
% qr�ֽ�
function [Q,R]=qr_decom(A)
n=length(A);
Q=eye(n);
for k=1:n-1
    H_k=eye(n);
    H_k1=househ(A(k:n,k));
    H_k(k:n,k:n)=H_k1;
    A=H_k*A;
    Q=Q*H_k;
end
R=A;
