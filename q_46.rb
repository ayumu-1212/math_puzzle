require "pry"
N = 7

def search(patterns, depth)
  next_patterns = []
  patterns.each do |pattern|
    [*0..N-1].combination(2) do |s, t|
      next_pattern = pattern.clone
      next_pattern[s], next_pattern[t] = next_pattern[t], next_pattern[s]
      if !@memo.has_key?(next_pattern)
        next_patterns.push(next_pattern)
        @memo[next_pattern] = depth
        @count += depth
      end
    end
  end
  search(next_patterns, depth + 1) if next_patterns.size > 0
end
@count = 0
@memo = {}
@memo[[*1..N]] = 0
search([[*1..N]], 1)
puts @count
