A=vander(1:.5:3);  % ��������1:.5:3���췶������
p={1,2,inf,'fro'};  % ����Ԫ������洢����������
% ����norm()�������
for k=1:length(p)
    A_norm(k)=norm(A,p{k});  % ����ȡ�ľ��������δ洢������A_norm��
end
% ���ݶ������
A_norm1(1)=max(sum(abs(A)));  % ���ݾ��� ��1-����������������
A_norm1(2)=sqrt(max(abs(eig(A'*A))));  % ���ݾ��� ��2-����������������
A_norm1(3)=max(sum(abs(A')));  % ���ݾ��� �� -����������������
A_norm1(4)=sqrt(sum(diag(A'*A)));  % ���ݾ��� ��Frobenius-����������������
% ��ʾ���
A_norm,A_norm1
