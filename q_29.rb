N = 20

def series(first, second)
  return first + second
end

def parallel(first, second)
  return (first * second)/(first + second)
end

value = parallel(1.0, 1.0)

(1..N-1).each do |n|
  if n % 2 == 0
    value = parallel(value, 1.0)
  else
    value = series(value, 1.0)
  end
end
puts value
