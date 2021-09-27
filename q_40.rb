require "pry"
require "benchmark"

N = 9

def depth_search(pattern, depth)
  stop = true
  (1..N-1).each do |n|
    if pattern[n] == n+1
      next_pattern = pattern[0..n].reverse
      next_pattern += pattern[(n+1)..-1] if n != N-1
      if !@depth_memo.has_key?(next_pattern) || @depth_memo[next_pattern] > depth
        stop = false
        @depth_memo[next_pattern] = depth
        depth_search(next_pattern, depth + 1)
      end
    end
  end
  @depth_max = [@depth_max, depth].max if stop
end
@depth_max = 0
@depth_memo = {}
result = Benchmark.realtime do
[*2..N].permutation(N-1) do |premu|
  depth_search([1] + premu, 0)
end
end

puts @depth_max
puts "処理概要 #{result}s"
