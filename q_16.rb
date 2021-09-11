cnt = 0
answers_t = []
answers_i = []
(1..500).each do |total_length|
  next if total_length % 4 != 0
  next if total_length == 4
  square_area = (total_length / 4)**2
  rectangle_side_pattern = [*1..(total_length / 4 - 1)]
  rectangle_area_pattern = rectangle_side_pattern.map{|len| len * (total_length / 2 - len)}
  rectangle_area_pattern.each_with_index do |area, i|
    if square_area > area*2 && rectangle_area_pattern.include?(square_area - area)
      cnt += 1
      answer_1_side = rectangle_side_pattern[i]
      answer_1_area = area
      answer_2_side = rectangle_side_pattern[rectangle_area_pattern.index(square_area - area)]
      answer_2_area = square_area - area
      answer_3_side = total_length / 4
      answer_3_area = square_area
      answer_t = [
        "#{answer_1_side}x#{total_length / 2 - answer_1_side}=#{answer_1_area}",
        "#{answer_2_side}x#{total_length / 2 - answer_2_side}=#{answer_2_area}",
        "#{answer_3_side}x#{answer_3_side}=#{answer_3_area}"
      ]
      answer_i = [
        [answer_1_side,total_length / 2 - answer_1_side,answer_1_area],
        [answer_2_side,total_length / 2 - answer_2_side,answer_2_area],
        [answer_3_side,answer_3_side,answer_3_area]
      ]
      answers_t.push(answer_t)
      answers_i.push(answer_i)
    end
  end
end
answers_delete_index = []
answers_i.reverse.each_with_index do |answers, i|
  next if i == answers_i.size - 1
  answers_i[0..(answers_i.size - i - 2)].each do |ans|
    answers_delete_index.push(answers_i.size - i - 1) if answers[0][2] % ans[0][2] == 0 && answers[1][2] % ans[1][2] == 0 && answers[2][2] % ans[2][2] == 0 && answers[0][2].div(ans[0][2]) == answers[1][2].div(ans[1][2])
  end
end
answers_delete_index.uniq.each do |n|
  answers_i.delete_at(n)
  answers_t.delete_at(n)
end
cnt /= 2
answers_t.each do |answer|
  p answer
end

puts answers_t.count
