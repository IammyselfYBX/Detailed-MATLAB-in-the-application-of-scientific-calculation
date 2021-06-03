% if-elseif-end语句求解
price=input('请输入商品价格：');
if price<200
    rate=0;
elseif price<500
    rate=3/100;
elseif price<1000
    rate=5/100;
elseif price<2500
    rate=8/100;
elseif price<5000
    rate=10/100;
else
    rate=14/100;
end
sale_price=price*(1-rate)  % 计算实际销售价格
% switch-case语句求解
price=input('请输入商品价格：');
switch fix(price)
   case num2cell(0:199)  % 价格小于200
      rate=0;
   case num2cell(200:499)  % 价格大于等于200但小于500
      rate=3/100;
   case num2cell(500:999)  % 价格大于等于500但小于1000
      rate=5/100;
   case num2cell(1000:2499)  % 价格大于等于1000但小于2500
      rate=8/100;
   case num2cell(2500:4999)  % 价格大于等于2500但小于5000
      rate=10/100;
   otherwise  % 价格大于等于5000
      rate=14/100;
end
sale_price=price*(1-rate)  % 输出商品实际销售价格

