function res = zzip_longest(varargin)
% ZZIP_LONGEST  Given N lists, return 1 list of corresponding N-tuples.
% 
% res = zzip_longest(list1, list2, ...)
%   This returns a cell array of cells, so for example:
%   zzip_longest({1, 2, 3}, {4, 5, 6}) -> {{1, 4}, {2, 5}, {3, 6}}
% 
% If input lists are of uneven length, this function returns a list as long as
% the longest of the input arguments; any shorter input arguments are padded
% with nan.

  tlen = max(map(@length, varargin));
  for i = 1:tlen
    res{i} = mapc(@(x) get_n(x, i), varargin);
  end
  
function en = get_n(v, n)
  if length(v) < n, en = nan;
  else, en = v{n};
  end