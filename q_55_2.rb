require "benchmark"
MIN, MAX = 1, 10

def soroban(remain_nums, nums_sum, count)
  return if @min < count
  if remain_nums.empty?
    @min = count
    return
  end
  prev_memo = @memo[nums_sum]
  remain_nums.each do |num|
    next_sum = nums_sum + num
    if !@memo.has_key?(next_sum)
      tamas = []
      instant_sum = [0, next_sum]
      @digit.times do |n|
        instant_sum = instant_sum[1].divmod(5 * 10 ** (@digit - n - 1))
        tamas.push(instant_sum[0])
        instant_sum = instant_sum[1].divmod(1 * 10 ** (@digit - n - 1))
        tamas.push(instant_sum[0])
      end
      @memo[next_sum] = tamas
    end
    instant_count = 0
    this_memo = @memo[next_sum]
    (@digit * 2).times do |i|
      instant_count += (prev_memo[i] - this_memo[i]).abs
    end
    remain_nums -= [num]
    count += instant_count
    if !@min_memo.has_key?(remain_nums) || @min_memo[remain_nums] > count
      @min_memo[remain_nums] = count
      soroban(remain_nums, next_sum, count)
    end
    remain_nums += [num]
    count -= instant_count
  end
end

@digit = [*MIN..MAX].sum.to_s.size

@memo = {}
@memo[0] = Array.new(@digit * 2, 0)

@min = @digit * 9 * (MAX - MIN + 1)

@min_memo = {}

result = Benchmark.realtime do
soroban([*MIN..MAX], 0, 0)
end

puts @min
puts "time: #{result}s"
