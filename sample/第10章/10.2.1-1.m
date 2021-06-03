%%%%%%%%%%%%%%% 下述代码主要用于对数值向量和矩阵进行积分 %%%%%%%%%%%%%%%%%
% 构建向量x1
x1=[1 2 3 4 5 6 7 8 9]
% 求解向量x1的积分，其中结果中的每一个元素为它之前所有元素的累加和
cumsum(x1)
% 构建矩阵x2
x2=[1 2 3;4 5 6;7 8 9]
% 求解矩阵x2的积分，其中结果中的每一维元素为它同维向量之前所有元素的累加和
cumsum(x2)
% 求解矩阵x2的积分，其中结果中的每一维元素为它同维向量之前所有元素的累加和。其中参数1用于指明从第一维开始计算
cumsum(x2,1)
% 求解矩阵x2的积分，其中结果中的每一维元素为它同维向量之前所有元素的累加和。其中参数2用于指明从第二维开始计算
cumsum(x2,2)
% 求解矩阵x2的积分，其中结果中的每一维元素为它同维向量之前所有元素的累加和。其中参数3用于指明从第三维开始计算
cumsum(x2,3)
