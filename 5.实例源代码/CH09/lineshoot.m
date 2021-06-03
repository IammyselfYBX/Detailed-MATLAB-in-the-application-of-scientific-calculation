function [t,y] = lineshoot(f1,f2,tspan,x0f,varargin)
% ���Դ�з�������
% ���������
%       ---f1��ԭ΢�ַ��̵ĺ�������
%       ---f2�����΢�ַ��̵ĺ�������
%       ---tspan���������
%       ---x0f�������ı�ֵ����
%       ---p1,p2,...������f1��f2�ĸ��Ӳ���
% ���������
%       ---t��������ɢ����
%       ---y��������������ɢ����
[t,y1] = ode45(f2,tspan,[1;0],varargin);  % ���㺯��y_1(t)
[t,y2] = ode45(f2,tspan,[0;1],varargin);  % ���㺯��y_2(t)
[t,yp] = ode45(f1,tspan,[0;0],varargin);  % ���㺯��y_p(t)
m = [x0f(2)-x0f(1)*y1(end,1)-yp(end,1)]/y2(end,1);  % �����m
[t,y] = ode45(f1,tspan,[x0f(1);m],varargin);  % ���ԭ΢�ַ��̵Ľ�
