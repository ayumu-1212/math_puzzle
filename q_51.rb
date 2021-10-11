MAX = 100
MIN = 1

def perfect_shuffle(n, order, depth)
  next_order = [order[0..n-1], order[n..-1]].transpose.inject(:+)
  if next_order == [*1..2*n]
    if 2*(n-1) == depth
      return 1
    elsif 2*(n-1) % depth == 0
      return 2
    else
      return 0
    end
  end
  return 0 if 2*(n-1) <= depth
  return perfect_shuffle(n, next_order, depth + 1)
end

@patern1 = 0
@patern2 = 0
MIN.upto(MAX) do |n|
  case perfect_shuffle(n, [*1..2*n], 1)
  when 1 then
    @patern1 += 1
  when 2 then
    @patern2 += 1
  else
  end
end
puts "patern1: #{@patern1}通り"
puts "patern2: #{@patern2}通り"
