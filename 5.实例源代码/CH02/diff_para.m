function result=diff_para(y,x,t,n)
% ����������
% ���������
%       ---y,x����������
%       ---t�����������Ա���
%       ---n���󵼽���
% ���������
%       ---result����õĵ�����
if n==1
    result=diff(y,t)/diff(x,t);
else
    result=diff(diff_para(y,x,t,n-1),t)/diff(x,t);
end
