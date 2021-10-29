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
          next_bit = bit ^ mask
          if !@memo.has_key?(next_bit)
            next_bits.push(next_bit)
            @memo[next_bit] = [depth, @memo[bit][1]]
          elsif@memo[next_bit][0] == depth
            @memo[next_bit][1] += @memo[bit][1]
          end
        end
        if w > 0 && (bit >> i - 1) & 1 == 0
          mask = ((1 << 1) + 1) << i - 1
          next_bit = bit ^ mask
          if !@memo.has_key?(next_bit)
            next_bits.push(next_bit)
            @memo[next_bit] = [depth, @memo[bit][1]]
          elsif@memo[next_bit][0] == depth
            @memo[next_bit][1] += @memo[bit][1]
          end
        end
        if h > 0 && (bit >> i - W) & 1 == 0
          next_bits.push(bit ^ mask)
          next_bit = bit ^ mask
          if !@memo.has_key?(next_bit)
            next_bits.push(next_bit)
            @memo[next_bit] = [depth, @memo[bit][1]]
          elsif@memo[next_bit][0] == depth
            @memo[next_bit][1] += @memo[bit][1]
          end
        end
        if 0 < W-1 && (bit >> i + 1) & 1 == 0
          mask = ((1 << 1) + 1) << i
          next_bit = bit ^ mask
          if !@memo.has_key?(next_bit)
            next_bits.push(next_bit)
            @memo[next_bit] = [depth, @memo[bit][1]]
          elsif@memo[next_bit][0] == depth
            @memo[next_bit][1] += @memo[bit][1]
          end
        end
      end
      instant_bit >>= 1
    end
  end
  if next_bits.empty?
    puts "回数： #{depth}回"
    total_pattern = 0
    bits.each do |bit|
      total_pattern += @memo[bit][1]
    end
    puts "移動パターン： #{total_pattern}通り"
  else
    yatyou(next_bits, depth + 1)
  end
end

@memo = {}
goal_bits.each do |bit|
  #           深さ, 回数
  @memo[bit] = [0, 1]
end
result = Benchmark.realtime do
  yatyou(goal_bits, 1)
end
puts "処理時間：#{result}s"
