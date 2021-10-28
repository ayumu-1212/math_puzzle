W = 4
H = 3



def shuffle_seats(seats, girls, boys, depth)
  return if girls > W * H / 2 || boys > W * H / 2
  if depth > W * (H + 1)
    @count += 1
    return
  end
  h = depth / W
  w = depth % W
  center_sexual = (seats >> (W-1)) & 1
  is_heterosexual = false

  # 次の位置の一つ上の上下左右に異性がいるかどうか
  # 上
  if h >= 2
    is_heterosexual = true if center_sexual != (seats >> (2 * W - 1)) & 1
  end
  # 左
  if w > 0
    is_heterosexual = true if center_sexual != (seats >> W) & 1
  end
  # 右
  if w < W
    is_heterosexual = true if center_sexual != (seats >> (W - 2)) & 1
  end

  # 異性がいるなら同性をいれてもいいよ
  if h < H
    shuffle_seats((seats << 1) | 1, girls, boys + 1, depth + 1) if center_sexual == 0 || is_heterosexual
    shuffle_seats((seats << 1) | 0, girls + 1, boys, depth + 1) if center_sexual == 1 || is_heterosexual
  elsif is_heterosexual
    shuffle_seats(seats, girls, boys, depth + 1)
  end
end

@count = 0

["0","1"].repeated_permutation(W) do |first_row_seats|
  girls = first_row_seats.count("0")
  boys = W - girls
  seats = first_row_seats.inject(:+).to_i(2)
  shuffle_seats(seats, girls, boys, W)
end

puts @count
