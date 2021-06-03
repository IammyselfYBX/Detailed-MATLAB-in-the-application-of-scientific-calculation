function example_4_4
x=0:0.01:2;
[xx,iter,X]=newton(@f,1,1e-8)  % Newton法求根
plot(x,f(x),[0,2],[0,0],'k:',xx,f(xx),'k*')  % 绘制图形
text(1,40,['humps函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
title('\fontname{隶书}\fontsize{16}牛顿法求根')  % 添加标题
% 函数描述文件，主要功能是求解函数表达式的值及其导数值
function [y,dy] = f(x);
y = 1./((x-.3).^2 +.01)+1./((x-.9).^2 +.04)-6;  % 计算函数值
ff = sym('1/((x-.3)^2 +.01)+1/((x-.9)^2 +.04)-6');  % 定义符号函数
dy = diff(ff);  % 求1阶导数
dy = subs(dy,x);  % 替换
