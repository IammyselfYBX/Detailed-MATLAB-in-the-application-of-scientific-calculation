v=simple(dsolve('Dv=g-c_d/m*v^2','v(0)=0','t'))  % ΢�ַ��̽�����
f=eval(['@(t,g,m,c_d)',char(v)])  % �����ű��ʽд����������
g=9.81;m=68.1;c_d=0.25;
v_3=subs(v,{'t','g','m','c_d'},{3,g,m,c_d})  % ��3����½��ٶ�
x=simpson(@(t)f(t,g,m,c_d),0,3)  % ���3�����½��ĸ߶�
% x=simpson(f,0,3,[],g,m,c_d)
