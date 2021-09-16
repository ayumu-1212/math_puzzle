require "pry"
N = 20
Tops = [2,3]
# 組み合わせ作り
def combi(split_num, select_nums, remain_num)
  return [select_nums.push(remain_num)[1..-1]] if split_num == 1
  results = []
  (select_nums[-1]..(remain_num/split_num)).each do |s|
    result = combi(split_num - 1, select_nums + [s], remain_num - s)
    results += result
  end
  return results
end

def synchro(n, t)
  return @synchros_memo[[n, t]] if @synchros_memo.has_key?([n, t])
  @synchros_memo[[n, t]] = [*1..n].repeated_combination(t).to_a.size
  return @synchros_memo[[n,t]]
end

def tabletop(remain_num)
  return @tabletop_memo[remain_num] if @tabletop_memo.has_key?(remain_num)
  pattern_num = 0
  Tops.each do |i|
    next_num_sum = remain_num - (i-1)
    combis = combi(i, [0], next_num_sum)
    combis.each do |combi|
      patterns = combi.map{|c| [c, combi.count(c)]}.uniq
      values = []
      patterns.each do |pattern|
        if pattern[1] == 1
          values.push(tabletop(pattern[0]))
        else
          values.push(synchro(tabletop(pattern[0]), pattern[1]))
        end
      end
      pattern_num += values.inject(:*)
    end
  end
  @tabletop_memo[remain_num] = pattern_num
end

@synchros_memo = {}

@tabletop_memo = {0 => 1}

tabletop(N-1)
p @tabletop_memo[N-1]
