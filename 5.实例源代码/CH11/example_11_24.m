function example_11_24
x=[1;2;3;4];
x=repmat(x,1,3);
[p,f]=dynprog(x,@DecisFun,@SubObjfun,@TransFun)
% �ڽ׶�k��״̬����x��ֵ�������Ӧ�ľ��߱������е�ȡֵ
function d=DecisFun(k,x)
if k==3
    d=x;
else
    d=0:x;
end
% �׶�k��ָ�꺯��
function v=SubObjfun(k,x,d)
w=[15 13 11;28 29 30;40 43 45;51 55 58];
w=-w;  % ���������ת��Ϊ��С������
v=([1 2 3 4]==d)*w(:,k);
% ״̬ת�Ʒ���
function y=TransFun(k,x,d)
y=x-d;
