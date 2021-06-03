function I=simp_quad(x,y)
% 复化辛普森公式求解数值积分(已知离散数据点)
% 输入参数：
%      ---x：被积函数自变量的等距节点
%      ---y：被积函数在节点处的函数值
% 输出参数：
%      ---I：求得的积分值
m=length(x);n=length(y);
if m~=n
    error('x和y的长度必须相等！')
end
if rem(n-1,2)~=0
    % 如果n-1不能被2整除，则调用复化梯形公式求解
    warning('此种情形不适合用Simpson公式，调用梯形公式求解');
    I=trape_quad(x,y);  % 调用复化梯形公式求解
    return;
end
N=(n-1)/2; h=(x(n)-x(1))/N;
a=[1,reshape([4*ones(1,N-1);2*ones(1,N-1)],1,[]),4,1];  % 公式8-11向量乘积的系数向量
I=h/6*a*y';  % 公式8-11的向量乘积形式
