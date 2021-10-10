require "pry"
N = 8

def reverse_cards(bit, depth)
  return if !@min_result.nil? && depth > @min_result
  @change_bits.each do |change_bit|
    next_bit = bit ^ change_bit
    if next_bit == @goal_bit || next_bit == (@goal_bit >> 1)
      @min_result = depth
    elsif !@memo.has_key?(next_bit) || @memo[next_bit] > depth
      @memo[next_bit] = depth
      reverse_cards(next_bit, depth + 1)
    end
  end
  return
end

@memo = {}

@min_result = nil

@goal_bit = ("10"*N).to_i(2)

start_bit = ("1"*N).to_i(2)

@change_bits = []
(N*2 - 2).times do |n|
  @change_bits.push(7 << n)
end
@change_bits.push((3 << (N*2 - 2)) + 1)
@change_bits.push((1 << (N*2 - 1)) + 3)

reverse_cards(start_bit, 1)
puts @min_result
