function [y,D]=newton_interp(xdata,ydata,x)
% Newton插值
% 输入参数：
%       ---xdata：给定的节点横坐标
%       ---ydata：给定的节点纵坐标
%       ---x：需要进行插值的节点横坐标
% 输出参数：
%       ---y：Newton插值函数在x处的函数值
%       ---D：差商表
n=length(xdata);m=length(ydata);
if n~=m
    error('插值数据长度不等！');
end
D=zeros(n);D(:,1)=ydata';H=1;
for j=1:n-1
    for k=1:n-j
        if abs(xdata(j+k)-xdata(k))<eps
            error('输入的n+1个节点不是互异的。');
        end
        D(k,j+1)=(D(k+1,j)-D(k,j))/(xdata(j+k)-xdata(k));
    end
    H=H.*(x-xdata(j));
    L(j,:)=H;
end
L=[ones(size(x));L];
y=L.*repmat(D(1,:)',1,length(x));
% 在高版本中上述语句等同于y=bsxfun(@times,D(1,:)',L);
y=sum(y);
