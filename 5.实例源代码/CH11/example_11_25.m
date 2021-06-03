function example_11_25
n=500;
x1=[n;nan*ones(n,1)];x3=[0;nan*ones(n,1)];
x2=0:n;
x=[x1,x2',x2',x2',x3];
[p,f]=dynprog(x,@DecisFun1,@SubObjfun1,@TransFun1,@Objfun1)
%----在阶段k由状态变量x的值求出其相应的决策变量所有的取值----%
function u=DecisFun1(k,x)
u=0:x;
%-------阶段k的指标函数-------%
function v=SubObjfun1(k,x,u)
t=[0.5;0.1;0.2;0.05];
if k==5
    v=0;
else
    v=u*t(k);
end
%--------状态转移方程-------%
function y=TransFun1(k,x,u)
y=x-u;
%------第k阶段直至最后阶段指标函数------%
function y=Objfun1(v,f)
y=max(v,f);
