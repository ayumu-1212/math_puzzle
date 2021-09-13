@targets = (1..9).map{|n| [n]}.to_a + [[1,2],[2,3],[3,6],[6,9],[9,8],[8,7],[7,4],[4,1]]
@memo = {}
def strikeOut(remain_targets)
  return @memo[remain_targets] if @memo.has_key?(remain_targets)
  return 1 if remain_targets.empty?
  count = 0
  @targets.each do |target|
    if (target - remain_targets).empty?
      count += strikeOut(remain_targets - target)
    end
  end
  @memo[remain_targets] = count
  return count
end

puts strikeOut([*1..9])
