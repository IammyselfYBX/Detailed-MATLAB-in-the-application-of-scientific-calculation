function [p_opt,fval]=dynprog(x,DecisFun,SubObjfun,TransFun,Objfun)
% ����ʼ�˺��ն˵Ķ�̬�滮,��ָ�꺯����Сֵ������(�����)�㷨�ݹ�������
% ���������
%       ---x��״̬������һ�д���һ���׶�״̬
%       ---DecisFun(k,x)���ɽ׶�k��״̬����x�����Ӧ��������߱���
%       ---SubObjfun(k,x,u)���׶�ָ�꺯��
%       ---TransFun(k,x,u)��״̬ת�ƺ���,x�ǽ׶�k��ĳ״̬������u����Ӧ�ľ��߱���
%       ---Objfun(v,f)����k�׶�ֱ�����׶�ָ�꺯������Objfun(v,f)=v+fʱ��ʡ��
% ���������
%       ---p_opt��[�����;���Ų�����;���Ź�����;ָ�꺯��ֵ��]
%       ---fval����Ԫ�طֱ��ʾp_opt�����Ų������Ӧʼ��״̬x�����ź���ֵ
% By X.D. Ding June 2000
k=length(x(1,:));f_opt=nan*ones(size(x));d_opt=f_opt;
t_vubm=inf*ones(size(x));x_isnan=~isnan(x);t_vub=inf;
% �����ն����ֵ
tmp1=find(x_isnan(:,k));tmp2=length(tmp1);
for i=1:tmp2
   u=feval(DecisFun,k,x(i,k));tmp3=length(u);
   for j=1:tmp3
         tmp=feval(SubObjfun,k,x(tmp1(i),k),u(j));
         if tmp<=t_vub, 
            f_opt(i,k)=tmp;d_opt(i,k)=u(j);t_vub=tmp; 
end;end;end
% ���Ƽ�����׶εĵݹ���ó���
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
% ��¼���ž��ߡ����Ź��ߺ���Ӧָ�꺯��ֵ
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
