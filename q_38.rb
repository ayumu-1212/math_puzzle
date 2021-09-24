require "pry"
@num_rights = [
  0b1111110,
  0b0110000,
  0b1101101,
  0b1111001,
  0b0110011,
  0b1011011,
  0b1011111,
  0b1110000,
  0b1111111,
  0b1111011
]

def segment(nums_order, count, prev_number = nil)
  if nums_order.size == 0
    @min = [@min, count].min
    return
  end
  nums_order.each do |n|
    if prev_number == nil
      segment(nums_order - [n], count, n)
    else
      cnt = (@num_rights[prev_number] ^ @num_rights[n]).to_s(2).count("1")
      segment(nums_order - [n], count + cnt, n)
    end
  end
end

@min = 10000
segment([*0..9], 0)
puts @min
