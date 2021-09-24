require "pry"
N = 6

def dice(target_int, var_int)
  return if @memo.has_key?(var_int) && (@memo[var_int][1] != target_int || @memo[var_int][0] == true)
  if @memo.has_key?(var_int)
    @memo[var_int][0] = true
  else
    @memo[var_int] = [false, target_int]
  end
  pre_number = var_int / (10 ** (N - 1))
  target_number = var_int / (10 ** (N - pre_number))
  remain_number = var_int - target_number * (10 ** (N - pre_number))
  target_number = (["7"] * pre_number).inject(:+).to_i - target_number
  next_int = remain_number * (10 ** pre_number) + target_number
  dice(target_int, next_int)
end

@memo = {}
count = 0
["1","2","3","4","5","6"].repeated_permutation(N) do |ar|
  count += 1
  int = ar.inject(:+).to_i
  next if @memo.has_key?(int)
  dice(int, int)
end

puts @memo.flatten(2).count(false)

