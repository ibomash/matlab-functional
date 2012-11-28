function y = bindin(x, varargin)
% BINDIN   Bind one expression in another
% 
% y = bindin(x, F1, F2, ...)
%   Each of F1, F2, etc. should be a function of one argument. The result will
%   be:
% 
%     F3(F2(F1(x)))
% 
%   In other words, each value / function output becomes the input to the next
%   function.

  y = x;
  for i = 1:length(varargin)
    fn = varargin{i};
    y = fn(y);
  end