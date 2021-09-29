require "pry"

abcs = []
10.step(100,2) do |a|
  1.step(a/2 - 1, 2) do |c|
    b = a - c
    abcs.push([a,b,c]) if c.gcd(b) == 1
  end
end
count = 0
abcs.each do |abc|
  @memo = [[abc[0],0,0]]
  patterns = [[abc[0],0,0]]
  is_finish = false
  while patterns.size > 0
    next_patterns = []
    patterns.each do |pattern|
      [*0..2].permutation(2).each do |s,e|
        if pattern[s] != 0 && pattern[e] != abc[e] && !is_finish
          next_pattern = pattern.clone
          if pattern[s] <= abc[e] - pattern[e]
            next_pattern[e] += pattern[s]
            next_pattern[s] = 0
          else
            next_pattern[s] -= abc[e] - pattern[e]
            next_pattern[e] = abc[e]
          end
          next_patterns.push(next_pattern)
          is_finish = true if next_pattern[0] == abc[0]/2
        end
      end
    end
    if is_finish
      count += 1
      break
    else
      patterns = next_patterns.uniq - @memo
      @memo += patterns
    end
  end
end
puts count
