load west0479  % 读取MATLAB中的自带稀疏矩阵west0479
d = eig(full(west0479));  % 将稀疏矩阵转化为一般矩阵求解其所有特征值
dlm = eigs(west0479,8);  % 求解稀疏矩阵的前8个特征值
[dum,ind] = sort(abs(d));  % 将特征值排序
plot(dlm,'k+')  % 绘制特征值图形
hold on  % 图形保持
plot(d(ind(end-7:end)),'ks','MarkerSize',4)  % 绘制由eig函数求得的前8个特征值图形
hold off  % 图形取消
legend('eigs函数求解结果','eig函数求解结果')  % 添加图例
