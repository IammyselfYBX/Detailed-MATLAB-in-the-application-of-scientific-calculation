function example_11_24
x=[1;2;3;4];
x=repmat(x,1,3);
[p,f]=dynprog(x,@DecisFun,@SubObjfun,@TransFun)
% 在阶段k由状态变量x的值求出其相应的决策变量所有的取值
function d=DecisFun(k,x)
if k==3
    d=x;
else
    d=0:x;
end
% 阶段k的指标函数
function v=SubObjfun(k,x,d)
w=[15 13 11;28 29 30;40 43 45;51 55 58];
w=-w;  % 将最大化问题转化为极小化问题
v=([1 2 3 4]==d)*w(:,k);
% 状态转移方程
function y=TransFun(k,x,d)
y=x-d;
