fibonacci = [1,1,2,3,5,8,13,21,34,55,89,144]

@ans_ar = []
while @ans_ar.size < 5
  this_num = fibonacci[-2] + fibonacci[-1]
  @ans_ar.push(this_num) if this_num % this_num.digits.sum == 0
  fibonacci.push(this_num)
end

print @ans_ar
