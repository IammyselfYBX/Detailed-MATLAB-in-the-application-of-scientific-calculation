function [p0,pr]=envelope_match(N,r,M)
% 信与信封配对问题的monte_carlo模拟求解
% 输入参数：
%       ---N：信封个数
%       ---r：配对正确的信封数
%       ---M：模拟次数
% 输出参数：
%       ---p0：没有配对情况的可能性
%       ---pr：有r个信封配对的情况的可能性
if nargin<3|isempty(M);M=10000;end
if nargin<2|isempty(r),r=0;end
if nargin<1|isempty(N),N=10;end
if r>N
    error('r is less than N');
end
R0=0;  % 记录没有配对的情况
Rr=0;  % 记录有r个配对的情形
Ns=1:N;  % 生成N个信封的一个排列
rand('state',2009)
for k=1:M
    rs=randperm(N);  % 随机产生N个信封的一个排列
    S=sum(rs==Ns);  % 统计随机产生的排列与原排列中对应元素相等的个数
    R0=R0+(S==0);  % 没有配对的情况进行累加
    Rr=Rr+(S==r);  % 有r个信封配对的情况进行累加
end
p0=R0/M;  % 没有配对的可能性
pr=Rr/M;  % 有r个配对的可能性
