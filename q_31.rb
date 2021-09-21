require "pry"
N = 3

def generate_patterns(times, prev_patterns)
  return prev_patterns if times == 0
  next_patterns = []
  prev_patterns.each do |pattern|
    pattern[-1].upto(N) do |i|
      if times == N
        next_patterns.push([i])
      else
        next_patterns.push(pattern + [i])
      end
    end
  end
  return generate_patterns(times - 1, next_patterns)
end
@patterns = generate_patterns(N, [[0]])
prezero_patterns = Marshal.load(Marshal.dump(@patterns))
preplus_patterns = Marshal.load(Marshal.dump(@patterns))
prezero_patterns = prezero_patterns.select {|pattern| pattern[0] == 0}
preplus_patterns = preplus_patterns - prezero_patterns
p prezero_patterns
p preplus_patterns

count = 0
prezero_patterns.each do |prezero_pattern|
  count_patterns = preplus_patterns.select {|preplus_pattern| [preplus_pattern[-1], prezero_pattern[-1]].count(N) == 1}
  puts "~~~~~~~~~~~~~~~~~~~~~~~~"
  p prezero_pattern
  puts ""
  count_patterns.each do |count_pattern|
    pass = true
    (1..N-1).each do |i|
      if count_pattern[i] == prezero_pattern[i] || (((count_pattern[i] - prezero_pattern[i-1])*(prezero_pattern[i] - count_pattern[i-1]) > 0 || (count_pattern[i] - prezero_pattern[i])*(count_pattern[i-1] - prezero_pattern[i-1]) < 0) && count_pattern[i] != count_pattern[i-1] && prezero_pattern[i] != prezero_pattern[i-1])
        pass = false
        break
      end
    end
    if pass
      count += 1
      p count_pattern
    end
  end
end
puts count*2
