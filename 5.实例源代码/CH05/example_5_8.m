format short e  % �趨������ʾ��ʽ
n=5:5:20;
for k=1:length(n)
    cond_A(k)=cond(hilb(n(k)));  % ����ȡ�����������δ��������cond_A��
    rcond_A(k)=rcond(hilb(n(k)));  % ����ȡ��ָ�����������δ��������rcond_A��
end
cond_A,rcond_A
format short
