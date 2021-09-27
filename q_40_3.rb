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

@depth_max = 0
@depth_memo = {}
@width_max = 0
@width_memo = {}

depth_result = Benchmark.realtime do
[*2..N].permutation(N-1) do |premu|
  depth_search([1] + premu, 0)
end
end

width_result = Benchmark.realtime do
width_search([*2..N].permutation(N-1).to_a, 0, true)
end

puts @depth_max
puts "処理概要 #{depth_result}s"

puts @width_max
puts "処理概要 #{width_result}s"
