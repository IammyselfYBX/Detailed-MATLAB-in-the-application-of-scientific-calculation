% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information

function val = subsref(F,s)
% Implement a special subscripted assignment
   switch s.type
   case '()'
      A = s.subs{:};
      F = init(F,A);
      val = F.current_val;
   otherwise
      error('Invalid access')
   end
end
