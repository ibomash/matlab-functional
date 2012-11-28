function res = zzip(varargin)
% ZZIP  Given N lists, return 1 list of corresponding N-tuples.
% 
% res = zzip(list1, list2, ...)
%   This returns a cell array of cells, so for example:
%   zzip({1, 2, 3}, {4, 5, 6}) -> {{1, 4}, {2, 5}, {3, 6}}
% 
% If input lists are of uneven length, this function returns a list as long as
% the shortest of the input arguments.

  tlen = min(map(@length, varargin));
  for i = 1:tlen
    res{i} = mapc(@(x) x{i}, varargin);
  end
