function res = ifthen(varargin)
% IFTHEN    Functional form of if-then-else statement
% 
% res = ifthen(predicate, if_true, if_false)
%   Returns if_true if predicate evaluates to something "true"; otherwise,
%   returns if_false.
% 
% res = ifthen(pred1, if_true1, pred2, if_true2, ..., if_otherwise)
%   Returns if_trueN for the first N such that predN is true.  If none of the
%   predicates are true, returns if_otherwise.
  
  i = 1;
  while i <= length(varargin)
    % If we've reached the last value, return
    if i == length(varargin)
      res = varargin{i};
      return
    end
    
    % Test the predicate
    if varargin{i}
      res = varargin{i+1};
      return
    end
    
    % Increment and continue
    i = i + 2;
  end
  
  error('ifthen: No predicates matched, no otherwise clause');
