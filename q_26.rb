H = 10
W = 10

def board_set(height, width)
  ar = Array.new(height+2){Array.new(width+2){1}}
  ar.each do |ar|
    ar[0] = ar[-1] = 9 
  end
  ar[0] = ar[0].map{|va| 9}
  ar[-1] = ar[-1].map{|va| 9}
  return ar
end

def search(prev_routes, depth)
  finish = false
  next_routes = []
  prev_routes.each do |route|
    [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |vector|
      prev_height = route[1]
      prev_width = route[2]
      next_height = prev_height + vector[0]
      next_width = prev_width + vector[1]

      next if route[0][next_height][next_width] == 9

      next_board = Marshal.load(Marshal.dump(route[0]))
      next_board[next_height][next_width], next_board[prev_height][prev_width] = next_board[prev_height][prev_width], next_board[next_height][next_width]
      next_route = [next_board, next_height, next_width]
      if !@log.include?(next_route)
        next_routes.push(next_route)
        @log[next_route] = depth + 1
      end
      finish = true if next_route == @goal_route
    end
  end
  search(next_routes, depth + 1) unless finish
end

board = board_set(H, W)

@log = {}

goal_board = Marshal.load(Marshal.dump(board))
goal_board[1][1] = 2
@goal_route = [goal_board, H, W]

start_board = Marshal.load(Marshal.dump(board))
start_board[-2][-2] = 2

@log[[start_board, H, W - 1]] = 0
@log[[start_board, H - 1, W]] = 0

search([[start_board, H, W - 1], [start_board, H - 1, W]], 0)
puts @log[@goal_route]
