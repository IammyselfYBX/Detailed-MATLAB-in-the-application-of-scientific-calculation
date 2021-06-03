function [x,y]=Implicit_RK4(odefun,xspan,y0,h,varargin)
% �Ľ���ʽRunge-Kutta��ʽ��ⳣ΢�ַ���
% ���������
%      ---odefun��΢�ַ��̵ĺ�������
%      ---xspan���������[x0,xn]
%      ---y0����ʼ����
%      ---h����������
%      ---p1,p2,����odefun�����ĸ��Ӳ���
% ���������
%      ---x�����صĽڵ㣬��x=xspan(1):h:xspan(2)
%      ---y��΢�ַ��̵���ֵ��
x=xspan(1):h:xspan(2);
y(1)=y0;
for k=1:length(x)-1
    z0=feval(odefun,x(k),y(k),varargin{:});
    z1=feval(odefun,x(k)+h,y(k)+h*z0,varargin{:});
    z2=inf;
    while abs(z2-(y(k)+h/2*(z0+z1)))>1e-4
        K1=feval(odefun,x(k)+(3-sqrt(3))/6*h,y(k)+...
            1/4*z0*h+(3-2*sqrt(3))/12*z1*h,varargin{:});
        K2=feval(odefun,x(k)+(3+sqrt(3))/6*h,y(k)+...
            1/4*z1*h+(3+2*sqrt(3))/12*z0*h,varargin{:});
        z2=y(k)+h/2*(K1+K2);
        z0=K1;z1=K2;
    end
    y(k+1)=z2;
end
x=x';y=y';
