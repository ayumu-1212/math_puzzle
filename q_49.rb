N = 8

def reverse_cards(bits, depth)
  next_bits = []
  bits.each do |bit|
    @change_bits.each do |change_bit|
      next_bit = bit ^ change_bit
      return depth if next_bit == @goal_bit || next_bit == (@goal_bit >> 1)
      next_bits.push(next_bit)
    end
  end
  next_bits.uniq
  next_bits -= @memo
  @memo += next_bits
  return reverse_cards(next_bits, depth + 1)
end

@memo = []

@goal_bit = ("10"*N).to_i(2)

start_bit = ("1"*N).to_i(2)

@change_bits = []
(N*2 - 2).times do |n|
  @change_bits.push(7 << n)
end
@change_bits.push((3 << (N*2 - 2)) + 1)
@change_bits.push((1 << (N*2 - 1)) + 3)

puts reverse_cards([start_bit], 1)
