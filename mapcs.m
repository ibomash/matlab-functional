function o = mapcs(fn_unsafe, data, default)
% MAPCS  Apply a function to each element of an array.
% 
% o = mapcs(fn, data)
%   The array can be a regular array or a cell array. If it's a cell array,
%   CELLFUN is called; otherwise, ARRAYFUN is called. The expected output is
%   a cell array (that is, 'UniformOutput', false is added to each call).
% 
%   This function is "safe" in that if FN raises an exception, that exception
%   is caught, and the corresponding output for the call will be treated as nan.
% 
% o = mapcs(fn, data, default)
%    If DEFAULT is specified, it is used instead of nan for failed calls.

  if ~exist('default', 'var'), default = nan; end
  fn = @(x) safe(fn_unsafe, x, default);
  if isa(data, 'cell'), o = cellfun(fn, data, 'UniformOutput', false);
  else o = arrayfun(fn, data, 'UniformOutput', false);
  end

function res = safe(fn_unsafe, x, default)
  try
    res = fn_unsafe(x);
  catch
    res = default;
  end