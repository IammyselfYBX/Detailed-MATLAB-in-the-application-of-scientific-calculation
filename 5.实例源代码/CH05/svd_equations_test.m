format short e
n=5*2.^(0:4);
for k=1:length(n)
    e=ones(n(k),1);H_k=hilb(n(k));  % ���첡̬����
    x=svd_equations(H_k,H_k*e);  % ��������ֵ�ֽⷨ��ⲡ̬������
    err(k)=norm(x-e);  % ������
end
err
format short
