W = 6
H = 5

def tatami(posi, target_array)
  value = target_array[posi[0]][posi[1]]
  if !value.empty?
    if posi == [H-1, W-1]
      answer_array = Marshal.load(Marshal.dump(target_array))
      @answers.push(answer_array[0..(H-1)].map{|row| row[0..(W-1)]})
    elsif posi[1] == W-1
      tatami([posi[0]+1, 0], target_array)
    else
      tatami([posi[0], posi[1]+1], target_array)
    end
  else
    if target_array[posi[0]][posi[1]+1].empty?
      target_array[posi[0]][posi[1]] = "L"
      target_array[posi[0]][posi[1]+1] = "R"
      if posi[1] == W-1
        tatami([posi[0]+1, 0], target_array)
      else
        tatami([posi[0], posi[1]+1], target_array)
      end
      target_array[posi[0]][posi[1]] = target_array[posi[0]][posi[1]+1] = ""
    end
    if target_array[posi[0]+1][posi[1]].empty?
      target_array[posi[0]][posi[1]] = "U"
      target_array[posi[0]+1][posi[1]] = "D"
      if posi[1] == W-1
        tatami([posi[0]+1, 0], target_array)
      else
        tatami([posi[0], posi[1]+1], target_array)
      end
      target_array[posi[0]][posi[1]] = target_array[posi[0]+1][posi[1]] = ""
    end
  end
end

def unluck_lay(posi, target_array)
  if (
      (target_array[posi[0]][posi[1]] == "D" ||
      target_array[posi[0]][posi[1]] == "R") &&
      (target_array[posi[0]][posi[1]+1] == "D" ||
      target_array[posi[0]][posi[1]+1] == "L") &&
      (target_array[posi[0]+1][posi[1]] == "U" ||
      target_array[posi[0]+1][posi[1]] == "R") &&
      (target_array[posi[0]+1][posi[1]+1] == "U" ||
      target_array[posi[0]+1][posi[1]+1] == "L")
  )
    return true
  else
    return false
  end
end

@answers = []

target_array = Array.new(H+1){Array.new(W+1){""}}
target_array.map!{|array| array[0..W-1] + ["〇"]}
target_array[-1] = ["〇"]*(W+1)

tatami([0,0], target_array)

@answers.each do |answer_array|
  is_break = false
  0.upto(W-2) do |w|
    0.upto(H-2) do |h|
      is_break = unluck_lay([h, w], answer_array)
      break if is_break
    end
    break if is_break
  end
  @answers = @answers - [answer_array] if is_break
end

@answers.each do |answer_array|
  answer_array.each do |answer_row|
    answer_row.each do |answer|
      if answer == "R" || answer == "L"
        print "-"
      else
        print "|"
      end
    end
    puts ""
  end
  puts "～～～～～～～～～"
end
