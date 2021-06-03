function I=cotes_quad(x,y)
% 复化cotes公式求解数值积分(已知离散数据点)
% 输入参数：
%      ---x：被积函数自变量的等距节点
%      ---y：被积函数在节点处的函数值
% 输出参数：
%      ---I：求得的积分值
m=length(x);n=length(y);
if m~=n
    error('x和y的长度必须相等！')
end
if rem(n-1,4)~=0 
    % 如果n-1不能被4整除，则调用复化梯形公式
    warning('此种情形不适用于Cotes公式，调用复化梯形公式求解');
    I=trape_quad(x,y);
    return;
end
N=(n-1)/4; h=(x(n)-x(1))/N;
a=[7,reshape([32*ones(1,N-1);12*ones(1,N-1);...
    32*ones(1,N-1);14*ones(1,N-1)],1,n-5),32,12,32,7];
I=h/90*a*y';
