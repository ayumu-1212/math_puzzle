require "pry"
N = 7
MIN = 10

def build_bridge(patterns,depth)
  return patterns.size if depth >= MIN
  next_patterns = []
  patterns.each do |pattern|
    (N-1).times do |i|
      next_pattern = pattern.clone
      next_pattern[i], next_pattern[i + 1] = next_pattern[i + 1], next_pattern[i]
      next_patterns.push(next_pattern)
    end
  end
  next_patterns = next_patterns.uniq - @memo
  @memo += next_patterns
  return build_bridge(next_patterns, depth+1)
end

@memo = []

first_pattern = [*1..N]
puts build_bridge([first_pattern], 0)
