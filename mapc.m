function o = mapc(fn, data)
% MAPC  Apply a function to each element of an array.
% 
% o = mapc(fn, data)
%   The array can be a regular array or a cell array. If it's a cell array,
%   CELLFUN is called; otherwise, ARRAYFUN is called. The expected output is
%   a cell array (that is, 'UniformOutput', false is added to each call).

  if isa(data, 'cell'), o = cellfun(fn, data, 'UniformOutput', false);
  else o = arrayfun(fn, data, 'UniformOutput', false);
  end