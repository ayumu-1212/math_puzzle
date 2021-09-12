ar = [[1]]
n = 1
o_times = 0
while o_times < 2013
  n += 1
  this_ar = []
  this_ar.push(1)
  this_ar += ar[n-2].each_cons(2).map{|x, y| (x+y) % 2}
  this_ar.push(1)
  ar.push(this_ar)
  o_times += this_ar.count(0)
end
ar.each do |arr|
  p arr
end
puts n
