require "pry"
H = 3
W = 4

@patterns = [[0,0,0,0],[1,0,1,0],[1,1,1,1],[0,1,0,1]]

def one_stroke(address, arrangement, odd_count)
  return 0 if odd_count > 2
  if address >= (W+1) * (H+1)
    return 1
  end
  h = address / (W+1)
  w = address % (W+1)
  one_stroke_count = 0
  vertex_count = 0
  square_count = 0
  # 左上
  if h > 0 && w > 0
    arrangement_index = (h-1)*W + (w-1)
    square_count += 1
    vertex_count ^= @patterns[arrangement[arrangement_index]][0]
  end
  # 右上
  if h > 0 && w < W
    arrangement_index = (h-1)*W + w
    square_count += 1
    vertex_count ^= @patterns[arrangement[arrangement_index]][1]
  end
  # 左下
  if h < H && w > 0
    arrangement_index = h*W + (w-1)
    square_count += 1
    vertex_count ^= @patterns[arrangement[arrangement_index]][3]
  end
  # 右下
  if h < H && w < W
    square_count += 1
    if square_count == 2
      vertex_count ^= 1
    end
    4.times do |i|
      one_stroke_count += one_stroke(address + 1, arrangement + [i], odd_count + (vertex_count ^ @patterns[i][2])
)
    end
  else
    if square_count == 2
      vertex_count ^= 1
    end
    one_stroke_count += one_stroke(address + 1, arrangement, odd_count + vertex_count)
  end
  return one_stroke_count
end

puts one_stroke(0, [], 0)
