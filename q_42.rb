require "pry"
N = 1234

def calc(n, subtotal, prev_num, depth)
  if (!@memo.has_key?(subtotal + prev_num) || @memo[subtotal + prev_num] > depth) && depth <= N*2
    @memo[subtotal + prev_num] = depth
    if subtotal + prev_num != N
      binding.pry if subtotal == 0 && depth == 10
      # 和
      calc(n, subtotal + prev_num, n, depth + 1)
      # 差
      calc(n, subtotal + prev_num, -1 * n, depth + 1)
      # 積
      calc(n, subtotal, prev_num * n, depth + 1)
      # 商
      calc(n, subtotal, prev_num / n, depth + 1) if prev_num / n != 0
    end
  end
end

(1..9).each do |n|
  @memo = {}
  #calc(n, 0, -1 * n, 1)
  #calc(n, 0, n, 1)
  puts "n: #{n}, times: #{@memo[N]}"
end
calc(2, 0, 2, 1)
puts @memo[N]
