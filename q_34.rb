require "pry"
H = 9
W = 9
field_count = H*W
count = 0
H.times do |y|
  W.times do |x|
    hisha_vector = [y,W-1-x, H-1-y, x]
    kaku_vector = [[W-1-x,y].min,[W-1-x,H-1-y].min,[x,H-1-y].min,[x,y].min]
    count += hisha_vector.sum * (field_count - 1) + kaku_vector.sum * (field_count - 1)
    4.times do |i|
      count -= [*0..hisha_vector[i]].sum + [*0..kaku_vector[i]].sum
      count -= ((H-1)+(W-1))*kaku_vector[i]
    end
  end
end

puts count
