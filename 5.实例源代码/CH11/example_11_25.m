function example_11_25
n=500;
x1=[n;nan*ones(n,1)];x3=[0;nan*ones(n,1)];
x2=0:n;
x=[x1,x2',x2',x2',x3];
[p,f]=dynprog(x,@DecisFun1,@SubObjfun1,@TransFun1,@Objfun1)
%----�ڽ׶�k��״̬����x��ֵ�������Ӧ�ľ��߱������е�ȡֵ----%
function u=DecisFun1(k,x)
u=0:x;
%-------�׶�k��ָ�꺯��-------%
function v=SubObjfun1(k,x,u)
t=[0.5;0.1;0.2;0.05];
if k==5
    v=0;
else
    v=u*t(k);
end
%--------״̬ת�Ʒ���-------%
function y=TransFun1(k,x,u)
y=x-u;
%------��k�׶�ֱ�����׶�ָ�꺯��------%
function y=Objfun1(v,f)
y=max(v,f);
