---
layout: post
title: "Recursion and Memoization"
date: 2014-04-14 10:48
comments: true
categories: [ Education, Ruby ]
---
>To iterate is human, to recurse divine.
>&nbsp;<br/>
>~ L. Peter Deutsch

Recursion is available in many high-level languages, including Ruby. Recursive solutions can be wonderful in their elegance. At the same time, recursion can lead to performance pitfalls.

Consider a method called `fibo(n)` that calculates the _nth_ number of the [Fibonacci](http://en.wikipedia.org/wiki/Fibonacci_number) sequence.

```ruby
# Calculate the nth Fibonacci number, f(n).
def fibo (n)
  if n <= 1
    return n
  else
    value = fibo(n-1) + fibo(n-2)
    return value
  end
end

# Display the Fibonacci sequence.
(1..40).each do |number|
  puts "fibo(#{number}) = #{fibo(number)}"
end
```

The example runs, but performance slows down as _n_ gets larger. Why? Because this method re-calculates all preceeding Fibonacci numbers every time it calculates `fibo(n)`. When we calculate Fibonacci numbers manually, we know better. But this method, as defined above, only does what we tell it to do.

Is it possible for the `fibo(n)` method to remember the results of earlier calculations so that it can avoid repeated work? Yes, through [memoization](http://en.wikipedia.org/wiki/Memoization).

###Memoization



###Sample Code
Sample code related to this article can be found on [GitHub](https://github.com/RayHightower/fibonacci).

