S=[1,1,2,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8,...
    9,9,10,10,11,11,12,12,13,13,14,15];  % 起始节点向量
T=[2,3,4,5,6,5,6,7,8,9,8,9,9,10,9,10,11,...
    12,12,13,12,13,14,15,14,15,14,15,16,16];  % 终止节点向量
W=[5,3,1,3,6,8,7,6,6,8,3,5,3,3,8,...
    4,2,2,1,2,3,3,3,5,5,2,6,6,4,3];  % 边权值向量
CMatrix=sparse(S,T,W);CMatrix(16,16)=0;  % 关联矩阵的稀疏矩阵表示
NodeIDs={'N1','N2','N3','N4','N5','N6','N7','N8','N9',...
    'N10','N11','N12','N13','N14','N15','N16'};
G=biograph(CMatrix,NodeIDs,'ShowWeights','on','ShowArrows','off');
h=view(G);  % 显示无向图
[dist,path,pred]=graphshortestpath(CMatrix,1,16)
% 分别设置节点的颜色为[1 0.4 0.4]、形状为圆和路径的颜色为红
set(h.nodes(path),'Color',[1 0.4 0.4],'shape','circle')
edges=getedgesbynodeid(h,get(h.nodes(path),'ID'));
set(edges,'LineColor',[1 0 0],'LineWidth',2)