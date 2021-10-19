require "pry"
M = 3
N = 2

UP, RIGHT, DOWN, LEFT = 0b1000, 0b0100, 0b0010, 0b0001
BASIC_VECTOR = [UP, RIGHT, DOWN, LEFT]
INDEX_VECTOR = [M+2, -1, -M-2, +2]
def one_stroke(mn, placement)
  m, n = mn % M, mn / M
  placement_index = (n+1)*(M+2) + m+1
  if placement[placement_index] != 0
    if mn < M*N
      one_stroke(mn+1, placement)
    else
      p placement
      @count += 1
    end
  else
    empty_vector = 0
    empty_count = 0
    this_bit = 0
    confirm_count = 0
    4.times do |i|
      if placement[placement_index + INDEX_VECTOR[i]] == 0
        empty_vector += BASIC_VECTOR[i]
        empty_count += 1
      elsif placement[placement_index + INDEX_VECTOR[i]] & BASIC_VECTOR[(i+2)%4] == BASIC_VECTOR[(i+2)%4]
        this_bit += BASIC_VECTOR[i]
        confirm_count += 1
      end
    end
    case confirm_count
    when 0 then
      if empty_count == 2
        placement[placement_index] = empty_vector
        one_stroke(mn+1, placement)
      end
    when 1 then
      4.times do |i|
        if empty_vector & BASIC_VECTOR[i] == BASIC_VECTOR[i]
          placement[placement_index] = this_bit + BASIC_VECTOR[i]
          one_stroke(mn+1, placement)
        end
      end
    when 2 then
      placement[placement_index] = this_bit
      one_stroke(mn+1, placement)
    else
    end
  end
end

# 配列の環境設定
basic_array = Array.new((M+2)*(N+2), 0)
(M+2).times do |m|
  basic_array[m] += RIGHT + LEFT
  basic_array[m + (N+1)*(M+2)] += RIGHT + LEFT
end
(N+2).times do |n|
  basic_array[n * (M+2)] += UP + DOWN
  basic_array[n * (M+2) + M+1] += UP + DOWN
end

# 初期位置決める
@count = 0
[*0..M*N-1].combination(2) do |placement_indexes|
  next if placement_indexes[0] >= M*N/2
  search_array = basic_array.clone
  m, n = placement_indexes[0] % M, placement_indexes[0] / M
  m2, n2 = placement_indexes[1] % M, placement_indexes[1] / M
  placement_index = (n+1)*(M+2) + m+1
  placement_index2 = (n2+1)*(M+2) + m2+1
  4.times do |i|
    if search_array[placement_index + INDEX_VECTOR[i]] == 0
      search_array[placement_index] = BASIC_VECTOR[i]
      4.times do |i2|
        if search_array[placement_index2 + INDEX_VECTOR[i2]] == 0
          search_array[placement_index2] = BASIC_VECTOR[i2]
          one_stroke(0, search_array)
          search_array[placement_index2] = 0
        end
      end
      search_array[placement_index] = 0
    end
  end
end

puts @count
