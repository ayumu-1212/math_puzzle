require "pry"
require "benchmark"

N = 9

def width_search(patterns, depth, is_first)
  next_patterns = []
  patterns.each do |pattern|
    pattern = [1] + pattern if is_first
    (1..N-1).each do |n|
      if pattern[n] == n+1
        next_pattern = pattern[0..n].reverse
        next_pattern += pattern[(n+1)..-1] if n != N-1
        if !@width_memo.has_key?(next_pattern) || @width_memo[next_pattern] > depth
          stop = false
          @width_memo[next_pattern] = depth
          next_patterns.push(next_pattern)
        end
      end
    end
  end
  if next_patterns.empty?
    @width_max = depth
    p patterns
  else
    width_search(next_patterns, depth + 1, false)
  end
end
@width_max = 0
@width_memo = {}
result = Benchmark.realtime do
width_search([*2..N].permutation(N-1).to_a, 0, true)
end

puts @width_max
puts "処理概要 #{result}s"
