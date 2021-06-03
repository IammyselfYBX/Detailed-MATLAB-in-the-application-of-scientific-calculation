function [p_opt,fval]=dynprog(x,DecisFun,SubObjfun,TransFun,Objfun)
% 自由始端和终端的动态规划,求指标函数最小值的逆序(或向后)算法递归计算程序。
% 输入参数：
%       ---x：状态变量，一列代表一个阶段状态
%       ---DecisFun(k,x)：由阶段k的状态变量x求出相应的允许决策变量
%       ---SubObjfun(k,x,u)：阶段指标函数
%       ---TransFun(k,x,u)：状态转移函数,x是阶段k的某状态变量，u是相应的决策变量
%       ---Objfun(v,f)：第k阶段直至最后阶段指标函数，当Objfun(v,f)=v+f时可省略
% 输出参数：
%       ---p_opt：[序号组;最优策略组;最优轨线组;指标函数值组]
%       ---fval：各元素分别表示p_opt各最优策略组对应始端状态x的最优函数值
% By X.D. Ding June 2000
k=length(x(1,:));f_opt=nan*ones(size(x));d_opt=f_opt;
t_vubm=inf*ones(size(x));x_isnan=~isnan(x);t_vub=inf;
% 计算终端相关值
tmp1=find(x_isnan(:,k));tmp2=length(tmp1);
for i=1:tmp2
   u=feval(DecisFun,k,x(i,k));tmp3=length(u);
   for j=1:tmp3
         tmp=feval(SubObjfun,k,x(tmp1(i),k),u(j));
         if tmp<=t_vub, 
            f_opt(i,k)=tmp;d_opt(i,k)=u(j);t_vub=tmp; 
end;end;end
% 逆推计算各阶段的递归调用程序
for ii=k-1:-1:1
   tmp10=find(x_isnan(:,ii));tmp20=length(tmp10);
   for i=1:tmp20
      u=feval(DecisFun,ii,x(i,ii));tmp30=length(u);
      for j=1:tmp30
         tmp00=feval(SubObjfun,ii,x(tmp10(i),ii),u(j));
         tmp40=feval(TransFun,ii,x(tmp10(i),ii),u(j));
         tmp50=x(:,ii+1)-tmp40;
         tmp60=find(tmp50==0);
         if ~isempty(tmp60),
             if nargin<5
                 tmp00=tmp00+f_opt(tmp60(1),ii+1);  
             else
                 tmp00=feval(Objfun,tmp00,f_opt(tmp60(1),ii+1)); 
             end
             if tmp00<=t_vubm(i,ii)
               f_opt(i,ii)=tmp00;d_opt(i,ii)=u(j);
               t_vubm(i,ii)=tmp00;
end;end;end;end;end;
fval=f_opt(tmp1,1);fval=fval(find(~isnan(fval)),1);
% 记录最优决策、最优轨线和相应指标函数值
p_opt=[];tmpx=[];tmpd=[];tmpf=[];
tmp0=find(x_isnan(:,1));tmp01=length(tmp0);
for i=1:tmp01,
  tmpd(i)=d_opt(tmp0(i),1); 
  tmpx(i)=x(tmp0(i),1);
  tmpf(i)=feval(SubObjfun,1,tmpx(i),tmpd(i));
  p_opt(k*(i-1)+1,[1,2,3,4])=[1,tmpx(i),tmpd(i),tmpf(i)];
  for ii=2:k
     tmpx(i)=feval(TransFun,ii-1,tmpx(i),tmpd(i));
     tmp1=x(:,ii)-tmpx(i);tmp2=find(tmp1==0);
     if ~isempty(tmp2)
        tmpd(i)=d_opt(tmp2(1),ii);
     end;
     tmpf(i)=feval(SubObjfun,ii,tmpx(i),tmpd(i));
     p_opt(k*(i-1)+ii,[1,2,3,4])=[ii,tmpx(i),tmpd(i),tmpf(i)];
end;end;
