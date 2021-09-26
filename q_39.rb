W = 4
H = 4



def search(patterns, depth)
  puts "depth: #{depth}, patterns.size: #{patterns.size}, @memo.size: #{@memo.size}"
  next_patterns = []
  patterns.each do |pattern|
    H.times do |y|
      W.times do |x|
        this_ar = pattern.map{|bit| bit ^ (1 << x)}
        this_ar[y] ^= (2**W-1) ^ (1 << x)
        if !@memo.has_key?(this_ar)
          next_patterns.push(this_ar)
          @memo[this_ar] = depth
        end
      end
    end
  end
  if next_patterns.empty?
    patterns.each do |pattern|
      pattern.each do |num|
        puts sprintf("%04b", num)
      end
    end
    return depth
  else
    return search(next_patterns, depth + 1)
  end
end

@memo = {}
first_pattern = Array.new(H){0}
@memo[first_pattern] = 0
puts search([first_pattern], 0)

