require "pry"

# bitに当てはめて探索
def search(bit, width, height, is_right)
  if is_right
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
  else
  end
end

(2**(N**2)-1).times do |bit|
  search(bit, N, N, true)
end

