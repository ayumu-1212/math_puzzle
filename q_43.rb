require "pry"
N = 5

def card_shuffle(patterns, goal_patterns, depth)
  next_patterns = []
  patterns.each do |pattern|
    N.times do |n|
      next_pattern = pattern[(n+1)..(n+N)] + pattern[0..(n)] + pattern[(n + N + 1)..-1]
      next_patterns.push(next_pattern)
    end
  end
  next_patterns = next_patterns.uniq - @memo_patterns
  return depth * 2 - 1 if (next_patterns & goal_patterns).size > 0
  @memo_patterns += next_patterns

  next_goal_patterns = []
  goal_patterns.each do |pattern|
    N.times do |n|
      next_goal_pattern = pattern[N..(N+n)] + pattern[0..N-1] + pattern[(N+n+1)..-1]
      next_goal_patterns.push(next_goal_pattern)
    end
  end
  next_goal_patterns = next_goal_patterns.uniq - @goal_patterns
  return depth * 2 if (next_patterns & next_goal_patterns).size > 0
  @goal_patterns += next_goal_patterns

  return card_shuffle(next_patterns, next_goal_patterns, depth + 1)
end

@memo_patterns = []
@goal_patterns = []

first_pattern = [*1..(N*2)]
goal_pattern = first_pattern.reverse

@memo_patterns.push(first_pattern)
@goal_patterns.push(goal_pattern)
puts card_shuffle([first_pattern],[goal_pattern], 1)
