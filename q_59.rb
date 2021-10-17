require "pry"
N = 8

def handkerchief(order, orgre, prev_position, total_distance)
  if @memo.has_key?(order) && @memo[order] < total_distance
    return
  else
    @memo[order] = total_distance
  end
  return if total_distance >= @min
  if orgre == 0
    n_index = order.index(N)
    is_reverse_order = true
    (N-1).times do |n|
      is_reverse_order = false if order[(n_index + n) % N] - order[(n_index + n + 1) % N] != 1
    end
    if is_reverse_order
      p order
      @min = total_distance
      return
    end
  end
  1.upto(N-1) do |n|
    next_position = (prev_position + n) % N
    next_orgre = order[next_position]
    order[next_position] = orgre
    handkerchief(order, next_orgre, next_position, total_distance + n + N)
    order[next_position] = next_orgre
  end
end

@memo = {}
@min = N*N*2
@memo[[0]+[*2..N]] = N
handkerchief([0] + [*2..N], 1, 0, N)
puts @min

