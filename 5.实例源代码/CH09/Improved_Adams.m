function [x,y]=Improved_Adams(odefun,xspan,y0,h,varargin)
% �Ľ�AdamsԤ��-У����ʽ��ⳣ΢�ַ���
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
    if k<4
        K1=feval(odefun,x(k),y(k),varargin{:});
        K2=feval(odefun,x(k)+h/2,y(k)+h/2*K1,varargin{:});
        K3=feval(odefun,x(k)+h/2,y(k)+h/2*K2,varargin{:});
        K4=feval(odefun,x(k)+h,y(k)+h*K3,varargin{:});
        y(k+1)=y(k)+h/6*(K1+2*K2+2*K3+K4);
    else
        A1=feval(odefun,x(k),y(k),varargin{:});
        A2=feval(odefun,x(k-1),y(k-1),varargin{:});
        A3=feval(odefun,x(k-2),y(k-2),varargin{:});
        A4=feval(odefun,x(k-3),y(k-3),varargin{:});
        z0=y(k)+h/24*(55*A1-59*A2+37*A3-9*A4);
        A=feval(odefun,x(k+1),z0,varargin{:});
        y(k+1)=y(k)+h/24*(9*A+19*A1-5*A2+A3);
    end
end
x=x';y=y';
