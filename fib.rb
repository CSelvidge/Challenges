def recursive_fib(n)
  return 0 if n == 0
  return 1 if n == 1

  recursive_fib(n-1) + recursive_fib(n-2)
end

def iterative_fib(n)

  return 0 if n == 0

  fib_minus_2 = 0
  fib_minus_1 = 0 
  fib = 1

  (n-1).times do
    
    fib_minus_2 = fib_minus_1
    fib_minus_1 = fib
    fib = fib_minus_2 + fib_minus_1
    
  end
  return fib


end
require 'benchmark'
num = 35

Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end