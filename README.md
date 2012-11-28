# matlab-functional

Functional programming tools for MATLAB.

This is a collection of utilities to promote a more functional style in
MATLAB. It is similar in intent to
[smschm’s functional-matlab code](https://github.com/smschm/functional-matlab),
but it’s a little gentler, and it’s more focused on practical tasks than on
building blocks. It provides useful MATLAB versions of such functional stand-bys
as `map`, `fold`, `ifthen`, and `curry` (that one was *not* easy!), and a very
useful function called `bindin`, which gets around some MATLAB weirdnesses.

## Mapping

Sure, MATLAB has `arrayfun` and `cellfun`, but those are cumbersome to use. You
know you’ll only use mapping if it’s easy to do. And it should be easy to ask
for a cell array as output — you shouldn’t have to type out `'UniformOutput',
false` each time.

To make this easier, I have two simple functions, `map` and `mapc`. They’re
called just like `arrayfun` or `cellfun`; they automatically call `cellfun` if
passed a cell array, and `arrayfun` otherwise. `map` returns an array; `mapc`
returns a cell array. It’s that simple.

There are also two “safe” versions of these functions, `maps` and `mapcs`. If
your function raises an exception for any of the inputs, the corresponding
outputs are set to `nan`.

To summarize:
 - `map` takes an array or cell array, and returns an array.
 - `mapc` takes an array or cell array, and returns a cell array.
 - `maps` is like `map`, but replaces exceptions with `nan`.
 - `mapcs` is like `mapc`, but replaces exceptions with `{nan}`.

A few examples:
```matlab
 arrays = {[1:5], [4:7], [2:9]};
 squares_of_first = map(@(x) x**2, arrays{1});
 squares_of_each = mapc(@(array) map(@(x) x**2, array), arrays);
 means = map(mean, arrays);
```


## Reducing / folding

What comes after mapping? Reducing! Or “fold,” as it’s called in some
languages. Fold works by starting with an initial value, then applying a binary
operator to combine successive values. So, for instance, these are equivalent:
```matlab
 array = 1:4;
 S = sum(array);
 S = fold(@(x, y) x + y, array);
 S = (((1 + 2) + 3) + 4);
```
Of course, `fold` can take any function as its first argument. It can be called
either with an array or with a cell array as its second argument.


## Zipping

Zipping is useful when working with mapping; it lets you take corresponding sets
of arguments from several lists (where lists are cell arrays). For example:
```matlab
 zzip({1, 2, 3}, {4, 5, 6}) -> {{1, 4}, {2, 5}, {3, 6}}
```
There are two functions, which only differ by what happens when you pass in
lists of different lengths. `zzip`’s result will be as long as the shortest
input. `zzip_longest`’s result will be as long as the longest input, and any
shorter inputs are padded with `nan`.


## Functional if-then-else

This allows you to express an if-then-else statement in one line:
`socket_name = ifthen(~isempty(socket), socket.name, '')`. You can have more
than one condition, in which case the result after the first passing condition
is returned.


## Binding variables in an expression

What if you want to pick 5 random numbers between 1 and 20, without replacement?
What if you want to do it in one line? MATLAB doesn’t let you index into the
results of function calls! But `bindin` does. `bindin` takes a series of
arguments, where the first one should evaluate to a value, and the remaining
ones should be arguments of one function. The result of each argument to
`bindin` is passed as the input to the next function. So, for example:
```matlab
 random_5 = bindin(randperm(20), @(x) x(1:5)); % Can’t just do randperm(20)(1:5)!
```

