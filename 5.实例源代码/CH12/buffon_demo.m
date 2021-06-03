clear all;clc;
h(1)=axes('Position',[0.05,0.3,0.4,0.4]);
plot([0.05,0.9],[0.2,0.2],[0.05,0.9],[0.7,0.7],'Color','k')
hold on
a=0.25;b=0.6;c=0.15;d=0.6;
plot([a,b],[c,d],[(a+b)/2,(a+b)/2],[0.2,(c+d)/2],'Color','k')
plot((a+b)/2,(c+d)/2,'k.','MarkerSize',14)
x=linspace(0,atan((d-c)/(b-a)));
plot((b-a)*(0.2-c)/(d-c)+a+0.05*cos(x),0.2+0.05*sin(x),'k')
annotation('doublearrow',[0.12 0.12],...
    [0.58 0.38],'Head2Length',6,'Head2Width',6,...
    'Head1Length',6,...
    'Head1Width',6);
text([0.12,0.35,(a+b)/2-0.08,(a+b)/2+0.01],...
    [0.45,0.25,(c+d)/2+0.05,((c+d)/2+0.2)/2],...
    {'\ita','\it\theta','\itM','\itx'},'fontname','times','fontsize',12)
text(0.45,0.1,'({\ita})','fontname','times','fontsize',12)
ylim([0 1])
h(2)=axes('Position',[0.55,0.3,0.4,0.4]);
annotation('arrow',[0.58 0.9],...
    [0.379 0.379],'HeadLength',6,'HeadWidth',6);
annotation('arrow',[0.608 0.608],...
    [0.35 0.65],'HeadLength',6,'HeadWidth',6);
a=1.5;l=0.8;
theta=linspace(0,pi/4);
x=l/2*sin(4*theta);
plot(theta,x,'k')
hold on 
plot([0,pi/4,pi/4],[a/2,a/2,0],'k')
text([-0.1,0.35,-0.1,pi/4,1],[1,0.2,-0.1,-0.1,-0.1],...
    {'\itx','\itG','\itO','\it\pi','\it\theta'},'fontname','times','fontsize',12)
text(-0.1,a/2,'$$\frac{a}{2}$$','interpreter','latex','fontsize',12)
text(0.1,0.57,'$$x>\frac{l}{2}\sin\theta$$','interpreter','latex','fontsize',12)
text(0.45,-0.15,'({\itb})','fontname','times','fontsize',12)
axis([-0.2,1.2,-0.3,1.2])
axis(h,'off')
set(gcf,'Color','w')