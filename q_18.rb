
n = 1
square_nums = []
while n += 1
  square_nums.push((n-1)**2)
  cake_parts = [*1..n]
  cake_pattern = cake_parts.permutation(cake_parts.size).to_a
  is_ok = true
  cake_pattern.size.times do |i|
    is_ok = false if !square_nums.include?(cake_pattern[i] + cake_pattern[i - 1])
  end
  break if is_ok
  puts n
end
puts "~~~"
puts n
