clear all;clc;
x=0:5:30;
theta=[0.50 1.40 0.75 0.90 1.30 1.48 1.50];
F=[0 9 13 14 10.5 12 5];
xi=0:30;
Fi=spline(x,F,xi);
thetai=spline(x,theta,xi);
subplot(211)
plot(bsxfun(@plus,[0.1,0.12],(0:52)'*0.015),[0.17,0.2],'k')
hold on
plot([0.1 0.9],[0.2 0.2],'k')
rectangle('Position',[0.2,0.2,0.1,0.2])
rectangle('Position',[0.7,0.2,0.1,0.2])
plot([0.3 0.8;0.4 0.9],0.3*ones(2),'k')
annotation('arrow',[0.3625 0.4304],...
    [0.6871 0.7762],'HeadLength',6,'HeadWidth',6);
annotation('arrow',[0.7504 0.8161],...
    [0.687 0.773],'HeadLength',6,'HeadWidth',6);
t=linspace(0,atan(2));
plot([0.02*cos(t)+0.3;0.02*cos(t)+0.8],0.04*sin(t)+0.3,'k')
text([0.33,0.83],[0.37,0.37],{'{\it\theta} ({\itx})','{\it\theta} ({\itx})'},...
    'fontname','times','fontsize',12)
text([0.33,0.83],[0.65,0.65],{'{\itF}({\itx})','{\itF}({\itx})'},...
    'fontname','times','fontsize',12)
text([0.25,0.75],[0.1,0.1],{'{\itx}_0','\itx_n'},'fontname','times',...
    'fontsize',12,'HorizontalAlignment','center')
axis([0 1 0 1],'off')
subplot(223)
plot(x,F,'k.','MarkerSize',18)
hold on
plot(xi,Fi,'k:')
xlabel('{\itx}/m','fontname','times','fontsize',12)
ylabel('{\itF}({\itx})/N','fontname','times','fontsize',12)
box off
axis([0 30 0 20])
subplot(224)
plot(x,theta,'k.','MarkerSize',18)
hold on
plot(xi,thetai,'k:')
xlabel('{\itx}/m','fontname','times','fontsize',12)
ylabel('{\it\theta}({\itx})/rad','fontname','times','fontsize',12)
box off
axis([0 30 0 2])
set(gcf,'Color','w')