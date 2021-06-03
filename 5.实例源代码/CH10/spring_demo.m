clear all;clc
N=12;
yt=0.08*ones(1,N);
Kt=mod(1:N-4,2)-0.5;
yt=yt+[0,0,0.02*Kt,0,0];
plot([0,1],[0,0],'k',[0,0],[0,0.4],'k')    
hold on
axis([-0.1,1.2,-0.1,1],'equal')
plot(bsxfun(@plus,[-0.02,0],(0:49)'*0.02),[-0.01,0],'k')
plot([-0.02,0],bsxfun(@plus,[-0.01,0],(0:19)'*0.02),'k')
for k=1:4
    L=(k-1)*0.22;
    xt=linspace(0,0.1,N)+L;
    plot(xt,yt,'k')    
    rectangle('Position',[0.1+L,0.03,0.12,0.1])
    theta=linspace(0,2*pi,500);
    plot(0.125+L+0.015*cos(theta),0.015*(1+sin(theta)),'k')
    plot(0.195+L+0.015*cos(theta),0.015*(1+sin(theta)),'k')
    plot([0.16,0.16,0.27,0.24,0.27,0.24]+L,...
        [0.13,0.23,0.23,0.24,0.23,0.22],'k')
    fill([0.24,0.26,0.24,0.27,0.24]+L,[0.24,0.23,0.22,0.23,0.24],'k')
    text(0.05+L,0.13,['\fontname{times}\fontsize{12}{\itk}_',int2str(k)],...
        'HorizontalAlignment','center')
    text(0.16+L,0.08,['\fontname{times}\fontsize{12}{\itm}_',int2str(k)],...
        'HorizontalAlignment','center')
    text(0.27+L,0.275,['\fontname{times}\fontsize{12}{\itx}_',int2str(k),'({\itt})'],...
        'HorizontalAlignment','center')    
end
axis off
set(gcf,'Color','w')