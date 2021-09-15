N = 20

def series(first, second)
  return first + second
end

def parallel(first, second)
  return (first * second)/(first + second)
end

golden_ratio = 1.6180339887
approximation = 0
[0,1].repeated_permutation(N-1) do |ar|
  value = 1.0
  ar.each do |n|
    if n == 0
      value = parallel(value, 1.0)
    else
      value = series(value, 1.0)
    end
  end
  approximation = value if (value - golden_ratio).abs <= (approximation - golden_ratio).abs
end
puts approximation
