S = 14

def students_num_server(prev_array, remain_num, remain_size)
  if remain_size <= 0
    renraku(prev_array)
  else
    remain_num.downto(0) do |n|
      next_array = prev_array + [n]
      if remain_num == n
        next_array += Array.new(remain_size - 1, 0)
        students_num_server(next_array, 0, 0)
      else
        students_num_server(next_array, remain_num - n, remain_size - 1)
      end
    end
  end
end


def renraku(students_array)
  instant_array = Array.new(S, 0)
  teach_count = 0
  ss_index = @from_teacher_num
  while true
    instant_array.count{|v| v > 0}.times do |n|
      break if ss_index >= S
      if students_array[ss_index] == 0
        instant_array[ss_index] = -1
      else
        instant_array[ss_index] = students_array[ss_index]
      end
      ss_index += 1
    end
    if ss_index == S
      ss_index += 1
      teach_count = @from_teacher_num
      S.times do |i|
        if students_array[i] == instant_array[i]
          instant_array[i] = -1
        end
      end
    end
    if teach_count < @from_teacher_num
      if students_array[teach_count] == 0
        instant_array[teach_count] = -1
      else
        instant_array[teach_count] = students_array[teach_count]
      end
      teach_count += 1
    end
  end
end

@memo = {}

@min = Float::INFINITY

1.upto(S) do |from_teacher_num|
  @from_teacher_num = from_teacher_num
  students_num_server([], S - from_teacher_num, S)
end
