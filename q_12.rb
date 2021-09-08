min_num_i = 0
min_num_f = 0
num = 1
is_min_i, is_min_f = false, false
min_counter = 10
list = [0,1,2,3,4,5,6,7,8,9]
while !(is_min_i && is_min_f)
  num += 1
  this_num = num**(1/2.0)
  this_num_i = this_num.floor
  this_num_f = this_num - this_num_i
  this_ar_i = (this_num * (10**(min_counter))).floor.digits
  this_ar_f = (this_num_f * (10**(min_counter))).floor.digits
  is_min_i = true && min_num_i = num if !is_min_i && (list-this_ar_i.last(10)).empty?
  is_min_f = true && min_num_f = num if !is_min_f && (list-this_ar_f.last(10)).empty?
end
puts min_num_i
puts min_num_f
