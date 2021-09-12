def check(list)
  remain_list = [*1..@cake_num] - list
  if remain_list.size == 0 && @square_nums.include?(list[0] + list[-1])
    p list
    puts @cake_num
    return true
  else
    remain_list.each do |remain_num|
      if @square_nums.include?(list[-1] + remain_num)
        return true if check(list + [remain_num])
      end
    end
  end
  false
end

@cake_num = 1
list = [1]
@square_nums = []
while @cake_num += 1
  @square_nums.push((@cake_num-1)**2)
  break if check(list)
end
