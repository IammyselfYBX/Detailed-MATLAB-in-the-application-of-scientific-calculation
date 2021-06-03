function stop = bandemoutfcn(x,optimvalues,state,userdata,varargin) 
% Output function that plots the iterates
stop = false; 
if strcmp(state,'iter')  % 也可以用state=='iter'
  xpbanplt(x);  % 调用下面的xpbanplt函数求解
end
% 以下为xpbanplt()函数的程序代码
function out = xpbanplt(currPos,prevPos)
%XPBANPLT Plots one step of solution path. Used by BANDEM.
%   Copyright 1984-2004 The MathWorks, Inc. 
%   $Revision: 1.1.4.1 $  $Date: 2004/03/22 23:54:53 $
if nargin==1,
    x1=currPos(1);
    y1=currPos(2);
    z1=100*(y1-x1.^2).^2+(1-x1).^2;
    plot3(x1,y1,z1,'w.', ...  % 原函数中的w为r
        'EraseMode','none', ...
        'MarkerSize',25);
    drawnow; % Draws current graph now
    pause(0.1)  % 原函数中没有该语句
    out = [];
elseif nargin==2,
    x1=prevPos(1);
    x2=currPos(1);
    y1=prevPos(2);
    y2=currPos(2);
    z1=100*(y1-x1.^2).^2+(1-x1).^2;
    z2=100*(y2-x2.^2).^2+(1-x2).^2;
    plot3([x1 x2],[y1 y2],[z1 z2],'b-', ...
        'EraseMode','none', ...
        'LineWidth',2); 
    plot3([x1 x2],[y1 y2],[z1 z2],'w.', ...  % 原函数中的w为r
        'EraseMode','none', ...
        'MarkerSize',25);
    drawnow; % Draws current graph now 
    pause(0.1)  % 原函数中没有该语句
    out = [];
end
