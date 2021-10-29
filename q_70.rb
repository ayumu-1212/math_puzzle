require "benchmark"
H = 6
W = 4

goal_bits = [0,0,0,0]

goal_bits[2] = (1 << (H * W / 2)) - 1
goal_bits[0] = goal_bits[2] << (H*W/2)

H.times do |i|
  goal_bits[1] <<= W
  goal_bits[1] += (1 << (W/2)) - 1
  goal_bits[3] <<= W
  goal_bits[3] += ((1 << (W/2)) - 1) << (W/2)
end

@vector = [W, -1, -W, 1]


def yatyou(bits, depth)
  next_bits = []
  bits.each do |bit|
    instant_bit = bit
    (H*W).times do |i|
      h = i / W
      w = i % W
      if instant_bit & 1 == 1
        if h < H-1 && (bit >> i + W) & 1 == 0
          mask = ((1 << W) + 1) << i
          next_bits.push(bit ^ mask)
        end
        if w > 0 && (bit >> i - 1) & 1 == 0
          mask = ((1 << 1) + 1) << i - 1
          next_bits.push(bit ^ mask)
        end
        if h > 0 && (bit >> i - W) & 1 == 0
          mask = ((1 << W) + 1) << i - W
          next_bits.push(bit ^ mask)
        end
        if 0 < W-1 && (bit >> i + 1) & 1 == 0
          mask = ((1 << 1) + 1) << i
          next_bits.push(bit ^ mask)
        end
      end
      instant_bit >>= 1
    end
  end
  next_bits = next_bits.uniq - @memo
  if next_bits.empty?
    puts "回数： #{depth}回"
    puts "移動パターン： #{bits.size}通り"
  else
    @memo += next_bits
    yatyou(next_bits, depth + 1)
  end
end

@memo = []
result = Benchmark.realtime do
  yatyou(goal_bits, 1)
end
puts "処理時間：#{result}s"
