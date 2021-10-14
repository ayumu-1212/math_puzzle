S = 14

def students_num_server(remain_num)

end

@memo = {}

@min = Float::INFINITY

1.up(S) do |from_teacher_num|
  students_num_server(S - from_teacher_num)
end
