W = 6
H = 6

def meet(boy_x, boy_y, girl_x, girl_y, count)
  total_count = 0
  if boy_x <= W && boy_y <= H && girl_x >= 0 && girl_y >= 0
    return 1 if boy_x == W && boy_y == H && count >= 2
    count += 1 if boy_x == girl_x
    count += 1 if boy_y == girl_y
    total_count += meet(boy_x + 1, boy_y, girl_x - 1, girl_y, count)
    total_count += meet(boy_x + 1, boy_y, girl_x, girl_y - 1, count)
    total_count += meet(boy_x, boy_y + 1, girl_x - 1, girl_y, count)
    total_count += meet(boy_x, boy_y + 1, girl_x, girl_y - 1, count)
  end
  return total_count
end

puts meet(0,0,W,H, 0)
