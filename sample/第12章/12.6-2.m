%%%%%%%%%%%%%%%%%%%% 以下代码主要用于实现Java对象的生成 %%%%%%%%%%%%%%
% 清空当前内存中的所有数据变量
clear all
% 使用直接创建法生成Java变量fa
fa=java.awt.Frame('Frame A');
% 使用Javaobject函数法生成Java变量fb
fb=javaObject('java.awt.Frame','Frame B');
% 查看空间变量的情况
whos
