function [H,f]=quad_coef(fun)
% ����ʽϵ�����
% ���������
%       ---fun������ʽ���ַ�����ʽ��ʾ
% ���������
%       ---H��������ϵ������
%       ---f��һ����ϵ������
fun=sym(fun);  % ���ַ������ʽת��Ϊ������
V=findsym(fun);  % Ѱ��fun�ķ��ű���
S=findstr(V,',');  % Ѱ��V�еġ�,����λ��
N=length(S);
S=[0,S,length(V)+1];
% ������ϵ������
for i=1:N+1
    for j=1:N+1
        d1f=sym(diff(fun,V(S(i)+1:S(i+1)-1)));
        d2f=diff(d1f,V(S(j)+1:S(j+1)-1));
        H(i,j)=double(d2f);  % ��������ת��Ϊ������
    end
end
X=sym(['[',V,']']);
F=fun-1/2*X*H*X.';  % ����ű��ʽ��һ�����
% һ����ϵ������
for i=1:N+1
    df=diff(F,V(S(i)+1:S(i+1)-1));
    f(i)=double(df);
end
