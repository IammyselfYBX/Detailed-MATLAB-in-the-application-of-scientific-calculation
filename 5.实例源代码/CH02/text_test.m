plot(magic(3))
axis square
text(1.05,8.6,'3阶魔方阵:','fontname','隶书','fontsize',16)
text(1.7,8,num2str(magic(3)),'fontname','times','fontsize',16)
text(1.4,3.2,'这是一个3阶魔方阵平面图','fontname',...
    '隶书','fontsize',16,'rotation',45)
gtext({'\leftarrow魔方阵第一列';'\leftarrow魔方阵第二列';...
    '\leftarrow魔方阵第三列'})
gtext({'3阶','魔方阵','平面图'},'fontname','隶书','fontsize',16)
