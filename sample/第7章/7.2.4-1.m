% 该函数用于演示switch-end语句的用法，
% 有三种或者三种以上选择的情况下，用户可以选择if-else-end语句的来实现不同分支的选择
function lower1(method)
switch method
    	case {'linear','bilinear'}
        	disp('Method is linear')
    	case 'cubic'
        	disp('Method is cubic')
    	case 'nearest'
        	disp('Method is nearest')
    	otherwise 
        	disp('Unknown method.')
end
