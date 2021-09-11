member_num = 30

cnt = 0
((member_num + 1)/2 + 1).times do |n|
  if n == 0
    cnt += 1
  else
    girls_num = n
    boys_num = member_num - n
    boll_num = boys_num - girls_num + 1
    cnt += [*1..(boll_num + girls_num)].inject(:*) / ([*1..boll_num].inject(:*) * [*1..girls_num].inject(:*))
  end
end
puts cnt
