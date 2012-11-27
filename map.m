function o = map(fn, data)
% MAP  Apply a function to each element of an array.
% 
% o = map(fn, data)
%   The array can be a regular array or a cell array. If it's a cell array,
%   CELLFUN is called; otherwise, ARRAYFUN is called. The expected output is
%   an array.

  if isa(data, 'cell'), o = cellfun(fn, data);
  else o = arrayfun(fn, data);
  end