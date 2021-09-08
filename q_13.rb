this_this_num = [ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9]
num_str   = ["R","E","A","D","W","I","T","L","K","S"]

def verbal(this_num)
  read = this_num[0] * 1000 + this_num[1] * 100 + this_num[2] * 10 + this_num[3]
  write = this_num[4] * 10000 + this_num[0] * 1000 + this_num[5] * 100 + this_num[6] * 10 + this_num[1]
  talk = this_num[6] * 1000 + this_num[2] * 100 + this_num[7] * 10 + this_num[8]
  skill = this_num[9] * 10000 + this_num[8] * 1000 + this_num[5] * 100 + this_num[7] * 10 + this_num[7]
  return read + write + talk == skill
end

cnt = 0
this_this_num.permutation(10).to_a.each do |this_num|
  next if this_num[0] == 0 || this_num[4] == 0 || this_num[6] == 0 || this_num[9] == 0 || (this_num[9] - this_num[4]) > 2
  cnt += 1 if verbal(this_num)
end
p cnt


