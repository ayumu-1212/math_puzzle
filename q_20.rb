require "pry"
magic_circle = [
  [1,14,14,4],
  [11,7,6,9],
  [8,10,10,5],
  [13,2,3,15]
]
flatte_circle = magic_circle.flatten

def calc(remain_num, remain_circle)
  subtotal = 0
  except_nums = []
  remain_circle.each_with_index do |num, t|
    if remain_num == num
      subtotal += 1
      except_nums.push(num)
    elsif remain_num < num
      except_nums.push(num)
    else
      next_circle = Marshal.load(Marshal.dump(remain_circle))
      next_circle.delete_at(t)
      subtotal += calc(remain_num - num, next_circle - except_nums)
      except_nums.push(num)
    end
  end
  return subtotal
end


answers = Array.new(flatte_circle.sum + 1){0}
(answers.size).times do |i|
  answers[i] = calc(i, flatte_circle)
end

puts answers.index(answers.max)
p answers.max

