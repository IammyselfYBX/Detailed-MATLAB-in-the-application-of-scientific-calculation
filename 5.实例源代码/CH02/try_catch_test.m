rand('state',0)
P=randperm(36);
A = reshape(P,4,9);
try
    % ��A������ʽ
    DA=det(A)
catch
    % ������ִ���ִ���������
    A = reshape(P,6,6);  % ��Pת��Ϊ6*6�;���A
    DA=det(A)  % ��A������ʽ
    % ��ʾ��������
    disp('�������ͣ�A����һ�����󣬲���������ʽ')
end
