function [x,fx,iter,X]=monte_carlo(fun,a,b,n,eps)
% monte_carlo���������Է��̵ĸ�
% ���������
%      ---fun����������̵ĺ�������
%      ---a,b����ʼ��������Ҷ˵�
%      ---n��monte_carlo��ģ��Ĵ���
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
% ���������
%      ---x�������Է��̵Ľ��Ƹ�
%      ---fx����x���ĺ���ֵ
%      ---iter����������
%      ---X��fxmin����
if nargin<5,eps=1e-6;end
if nargin<4,n=1000;end
k=1;
fxmin(k)=1000;
d0=1e-4;
while fxmin(k)>eps
    k=k+1;
    x=unifrnd(a,b,n,1);
    y=feval(fun,x);
    fxmin(k)=fxmin(k-1);
    for i=1:n
        if abs(y(i))<=fxmin(k)
            fxmin(k)=abs(y(i));
            xnum=i;
        end
    end
    if fxmin(k)==fxmin(k-1)
        k=k-1;
        continue;
    end
    root=x(xnum);
    d=d0/k;
    a=root-d;b=root+d;
end
x=root;fx=fun(root);iter=k;X=fxmin';
