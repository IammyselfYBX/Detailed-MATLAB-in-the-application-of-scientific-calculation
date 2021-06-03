function y=hermite_interp(xdata,ydata,ydot,x)
% hermite插值
% 输入参数：
%       ---xdata：给定的节点横坐标
%       ---ydata：给定的节点纵坐标
%       ---ydot：给定插值节点处的导数值，其缺省值用均差代替
%       ---x：需要进行插值的节点横坐标
% 输出参数：
%       ---y：Lagrange插值函数在x处的函数值
if isempty(ydot)==1
    ydot=gradient(ydata,xdata);
end
n=length(xdata);m=length(ydata);h=length(ydot);y=zeros(size(x));
if n~=m|n~=h|m~=h
    error('插值数据长度不等！')
end
ii=1:n;y=zeros(size(x));
for i=ii
    ij=find(ii~=i);V=1;
    for j=1:length(ij)
        if abs(xdata(i)-xdata(ij(j)))<eps
            error('输入的n+1个节点不是互异的。');
        end
        V=V.*(x-xdata(ij(j))).^2/(xdata(i)-xdata(ij(j)))^2;
    end
    y=y+V.*((1-2*(x-xdata(i))*sum(1./(xdata(i)-xdata(ij))))*...
        ydata(i)+(x-xdata(i))*ydot(i));
end
