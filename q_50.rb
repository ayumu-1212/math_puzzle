require "pry"
H = 5
W = 6

# routesはbit演算子で行・列と表す(ex. 0b010100110)
def route_search(routes, position, depth)
  [[1,0], [0,1], [-1,0], [0,-1]].each do |vector|
    next_position = [position[0] + vector[0], position[1] + vector[1]]
    if @positions[next_position[0]][next_position[1]] == 0
      next
    elsif @positions[next_position[0]][next_position[1]] == 2
      @max = [@max, depth].max
      p routes if depth == 27
    else
      if vector[0] == 0
        if !(routes[0][next_position[0] - 1] == 2)
          routes[0][next_position[0] - 1] += 1
          route_search(routes, next_position, depth + 1)
          routes[0][next_position[0] - 1] -= 1
        end
      else
        if !(routes[1][next_position[1] - 1] == 2)
          routes[1][next_position[1] - 1] += 1
          route_search(routes, next_position, depth + 1)
          routes[1][next_position[1] - 1] -= 1
        end
      end
    end
  end
end

@positions = Array.new(H + 3){Array.new(W + 3){1}}
@positions.each_with_index do |ar, i|
  if i == 0 || i == H+2
    ar.map!{|v| 0}
  else
    ar[0] = 0
    ar[-1] = 0
    ar[-2] = 2 if i == H+1
  end
end
@max = 0
route_search([Array.new(H+1){0}, Array.new(W+1){0}],[1,1], 0)
puts @max
