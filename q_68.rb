P = 6

# 座席表
## 0: いつでも座れる, -1: 他になかったら座れる, -2: 壁, 1~: 座ってる
first_zaseki = [-2] + Array.new(P,0) + [-2] + Array.new(P, 0) + [-2]
p first_zaseki

def sit_down(zaseki, depth)
  if zaseki.include?(0)
    zaseki.each_with_index do |seat, i|
      if seat == 0
        next_zaseki = zaseki.clone
        next_zaseki[i] = depth
        next_zaseki[i+1] = -1 if next_zaseki[i+1] == 0
        next_zaseki[i-1] = -1 if next_zaseki[i-1] == 0
        sit_down(next_zaseki, depth + 1)
      end
    end
  elsif zaseki.include?(-1)
    zaseki.each_with_index do |seat, i|
      if seat == -1
        zaseki[i] = depth
        sit_down(zaseki, depth + 1)
        zaseki[i] = -1
      end
    end
  else
    @count += 1
  end
end

@count = 0

sit_down(first_zaseki, 1)

puts @count
