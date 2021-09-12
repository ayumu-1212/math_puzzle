friends_num = 7

prime_nums = [2]
n = 3
while prime_nums.size < friends_num
  prime_nums.push(n) if ![*2..(n-1)].map{|num| n % num}.include?(0)
  n += 1
end

ar = []
(friends_num/2 + 1).times do |i|
  ar.push(prime_nums[(i + 1) * (-1)])
  ar.push(prime_nums[i])
end
ar.uniq!

answers = []
if ar[0] ** ar[1] >= ar[-1]**2
  answers.push(ar[1]**2)
  answers += ar[1..-1].each_cons(2).map{|x, y| x * y}
  answers.push(ar[-1]**2)
else
  answers += ar[0..-1].each_cons(2).map{|x, y| x * y}
  answers.push(ar[-1]**2)
end
p answers
p answers.max
