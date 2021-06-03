a=0;risk=[];X=[];Q=[];
while(1.1-a)>1
    c=[-0.05 -0.27 -0.19 -0.185 -0.185];
    Aeq=[1 1.01 1.02 1.045 1.065]; beq=[1];
    A=[0 0.025 0 0 0;0 0 0.015 0 0;0 0 0 0.055 0;0 0 0 0 0.026];
    b=[a;a;a;a];
    vlb=[0,0,0,0,0];vub=[];
    [x,fval]=linprog(c,A,b,Aeq,beq,vlb,vub);
    risk=[risk;a];
    X=[X;x'];
    Q=[Q;-fval];
    a=a+0.001;
end 
Risk=risk([4 7 9 11 21 41]);
Earn=Q([4 7 9 11 21 41]);
OPT=X([4 7 9 11 21 41],:);
plot(risk,Q,'.')
axis([0 0.1 0 0.5])
hold on
xlabel('风险度：a'),ylabel('收益：Q')
figure('Color','w')
axes('Position',[0.1 0.25 0.8 0.55])
plot(repmat([0;1],1,8),[1;1]*linspace(0,1,8),'k')
hold on
plot([1;1]*linspace(0,1,8),repmat([0;1],1,8),'k')
fill([1/7 6/7 6/7 1/7],[6/7 6/7 1 1],'w')
text([1/14 7/14 13/14],13/14*ones(1,3),{'\ita','\itx','\itQ'},...
    'fontname','times','fontsize',16,'HorizontalAlignment','center')
for k=1:6
    text(1/14,11/14-(k-1)*1/7,sprintf('%.4f',Risk(k)),'HorizontalAlignment','center')
    for j=1:5
        text(1/14+j*1/7,11/14-(k-1)*1/7,sprintf('%.4f',OPT(k,j)),'HorizontalAlignment','center')
    end
    text(13/14,11/14-(k-1)*1/7,sprintf('%.4f',Earn(k)),'HorizontalAlignment','center')
end
axis off
