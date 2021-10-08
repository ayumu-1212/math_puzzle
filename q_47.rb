require "pry"

# bitに当てはめて探索
def right_search(bit, width, height, is_finish)
  count = []
  next_height = height
  prev_bit = bit
  next_bit = 0
  height.times do |h|
    cnt = 0
    width.times do |w|
      cnt += bit % 2
      bit = bit >> 1
    end
    if cnt == width || cnt == 0
      width -= 1
    else
      next_bit << 3
      next_bit += remain_bit
    end
    count.push(cnt)
  end
  count.each_with_index do |c, i|
    if c == width
    end
  end
end

# bitに当てはめて探索
def bottom_search(bit, width, height, is_finish)
  count = []
  height.times do |h|
    cnt = 0
    width.times do |w|
      cnt += bit % 2
      bit = bit / 2
    end
    if cnt == width
      width -= 1
    end
    count.push(cnt)
  end
  count.each_with_index do |c, i|
    if c == width
    end
  end
end
(2**(N**2)-1).times do |bit|
  search(bit, N, N, true)
end

