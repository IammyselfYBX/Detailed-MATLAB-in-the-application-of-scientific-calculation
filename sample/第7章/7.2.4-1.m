% �ú���������ʾswitch-end�����÷���
% �����ֻ�����������ѡ�������£��û�����ѡ��if-else-end������ʵ�ֲ�ͬ��֧��ѡ��
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
