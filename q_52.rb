require "pry"
N = 4

def hourglass(first_position)
  instant_position = first_position.clone
  memo = []
  while !memo.include?(instant_position + first_position)
    binding.pry if first_position == [1,2,4,3]
    memo.push(instant_position + first_position)
    instant_position = instant_position.map{|v| v > 0 ? v-1 : v}
    return true if instant_position.all?{|v| v == 0}
    first_position[0].times do |i|
      instant_position[i] = first_position[i] - instant_position[i]
    end
    instant_position = instant_position.drop(1) + instant_position.take(1)
    first_position = first_position.drop(1) + first_position.take(1)
  end
  return false
end

count = 0
[*1..N].permutation(N) do |position|
  if hourglass(position)
    count += 1
    p position
  end
end
puts count
