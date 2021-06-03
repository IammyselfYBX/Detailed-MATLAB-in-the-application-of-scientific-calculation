function [D,V]=eig_Jocabi(A,eps)
% ����Jocabi�����Գƾ����ȫ������ֵ����������
% ���������
%      ---A�������ľ���
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
% ���������
%      ---D��n�׶ԽǾ�����Խ�ԪΪ����A��n������ֵ
%      ---V��������������
if nargin<2;eps=1e-6;end
[m,n]=size(A);
if m~=n
    error('����A����Ϊ����')
end
if A~=A'
    error('����AӦ��Ϊ�Գƾ���')
end
V=eye(m);
[M1,I]=max(abs(A-diag(diag(A))));
[M2,j]=max(M1); i=I(j);
while 1
    d=(A(j,j)-A(i,i))/(2*A(i,j));
    if abs(d)<1e-10
        t=1;
    else
        t=sign(d)/(abs(d)+sqrt(1+d^2));
    end
    c=1/sqrt(t^2+1); s=c*t;
    R=[c s; -s c];
    A([i j],:)=R'*A([i j],:);
    A(:,[i j])=A(:,[i j])*R;
    V(:,[i j])=V(:,[i j])*R;
    [M1,I]=max(abs(A-diag(diag(A))));
    [M2,j]=max(M1); i=I(j);
    if abs(sum(sum(A-diag(diag(A)))))<=eps
        break;
    end
end
D=diag(diag(A));
