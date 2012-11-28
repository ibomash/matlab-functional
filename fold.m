function r = fold(fn, array)
% FOLD    Perform a "reduce" operation, to combine a set of results.
% 
% R = fold(fn, cell_array)
% R = fold(fn, array)
% 
% arg0, or the first element of the array argument, is the initial value of the
% accumulator. Then:
%   acc0 = array(1);
%   acc1 = fn(acc0, array(2));
%   acc2 = fn(acc1, array(3));
% ...and so on.  Returns accN.

  if isa(array, 'cell')
    r = array{1};
    for ii = 2:length(array)
      r = fn(r, array{ii});
    end
  else
    r = array(1);
    for ii = 2:length(array)
      r = fn(r, array(ii));
    end
  end    
end
