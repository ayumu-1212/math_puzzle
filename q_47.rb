require "pry"

N = 2

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
      count.push(cnt)
    end
  else
  end
end

(2**(N**2)-1).times do |bit|
  search(bit, N, N, true)
end

puts @memo
