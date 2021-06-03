syms z;
f=sin(z+pi/3)*exp(-2*z)/(z^3*(z-1));
F1=limit(diff(f*z^3,z,2)/prod(1:2),z,0)  % 求z=0处的留数
% 求z=1处的留数
F2=limit(f*(z-1),z,1)  % 格式1
F21=limit(diff(f*(z-1)^3,z,2)/prod(1:2),z,1)  % 格式2
