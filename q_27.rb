require "pry"
H = 3
W = 5

def drive(prev_routes)
  this_coordinate = prev_routes[-1][0..1]
  this_vector = prev_routes[-1][2]
  next_vectors = [this_vector, (this_vector + 1) % 4]
  cnt = 0
  next_vectors.each do |vector|
    next_coordinate = [this_coordinate[0] + @vectors[vector][0], this_coordinate[1] + @vectors[vector][1]]
    next_route = next_coordinate + [vector]
    anti_route = next_coordinate + [(vector + 2) % 4]
    if next_coordinate == @goal_coordinate
      cnt += 1
      p prev_routes + [next_route]
    elsif prev_routes.include?(next_route) || prev_routes.include?(anti_route) || next_coordinate.include?(-1) || next_coordinate[0] - @max[0] > 0 || next_coordinate[1] - @max[1] > 0
      cnt += 0
    else
      cnt += drive(prev_routes + [next_route])
    end
  end
  return cnt
end
@vectors = {0 => [1, 0], 1 => [0, 1], 2 => [-1, 0], 3 => [0, -1]}
@goal_coordinate = [0, W]
@max = [H, W]
routes = [[H, 1, 1]]
puts drive(routes)

