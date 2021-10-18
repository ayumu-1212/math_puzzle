require "pry"
M = 5
N = 4

def reverse_bit(bit)
  out_put = 0
  (M*N).times do |i|
    out_put = (out_put << 1) + bit % 2
    bit /= 2
  end
  return out_put
end

def generate_patterns(depth)
  @memo[depth-1].each do |bit|
    cnt = 0
    instant_bit = bit
    while instant_bit != 0
      if instant_bit & 1 == 1
        m, n = cnt % M, cnt / M
        mm1bit = 1 << (n * M + (m - 1))
        nm1bit = 1 << ((n-1) * M + m)
        mp1bit = 1 << (n * M + (m + 1))
        np1bit = 1 << ((n+1) * M + m)
        if m > 0 && bit & mm1bit == 0
          next_bit = bit | mm1bit
          next_bit_reverse = reverse_bit(next_bit)
          @memo[depth].push(next_bit) if (@memo[depth] & [next_bit, next_bit_reverse]).size == 0
        end
        if n > 0 && bit & nm1bit == 0
          next_bit = bit | nm1bit
          next_bit_reverse = reverse_bit(next_bit)
          @memo[depth].push(next_bit) if (@memo[depth] & [next_bit, next_bit_reverse]).size == 0
        end
        if m < M-1 && bit & mp1bit == 0
          next_bit = bit | mp1bit
          next_bit_reverse = reverse_bit(next_bit)
          @memo[depth].push(next_bit) if (@memo[depth] & [next_bit, next_bit_reverse]).size == 0
        end
        if n < N-1 && bit & np1bit == 0
          next_bit = bit | np1bit
          next_bit_reverse = reverse_bit(next_bit)
          @memo[depth].push(next_bit) if (@memo[depth] & [next_bit, next_bit_reverse]).size == 0
        end
      end
      cnt += 1
      instant_bit >>= 1
    end
  end
  generate_patterns(depth + 1) if depth < M * N / 2
end

@memo = {}
# @memo初期設定
(M*N/2).times do |depth|
  @memo[depth + 1] = []
end
# 初期開始パターン作成
M.times do |m|
  @memo[1].push(1<<m)
end
(N-1).times do |n|
  @memo[1].push(1<<(M*(n+1)))
end

generate_patterns(2)

count = 0
mask = ("1"*(M*N)).to_i(2)
@memo[M * N / 2].each do |pattern|
  back_pattern = mask ^ pattern
  back_pattern_reverse = reverse_bit(back_pattern)
  count += 1 if (@memo[M * N / 2] & [back_pattern, back_pattern_reverse]).size > 0
end
puts count
